//
//  BluetoothTool.m
//  CSDNBLE4.0
//
//  Created by 王刚锋 on 2020/10/14.
//  Copyright © 2020 hensen. All rights reserved.
//

#import "BluetoothTool.h"
@interface BluetoothTool () <CBCentralManagerDelegate, CBPeripheralDelegate>
@property (nonatomic, copy) SuccessBlock successBlock;
@property (nonatomic, copy) FailureBlock failureBlock;

@end
@implementation BluetoothTool

+(instancetype)initWithUUIDs:(NSArray *)uuids characteristicUUID:(NSString *)characteristicUUID{
   
    static BluetoothTool *tool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tool = [[BluetoothTool alloc] init];
    });
    NSMutableArray *array = @[].mutableCopy;
    for (NSString *uuid in uuids) {
        CBUUID *uid = [CBUUID UUIDWithString:uuid];
        [array addObject:uid];
    }
    tool.characteristicUUID = characteristicUUID;
    tool.uuids = array;
    return tool;
}

-(void)cancelPeripheralConnection:(CBPeripheral *)Peripheral{
    [self.Central cancelPeripheralConnection:Peripheral];
    [self.dataArray removeAllObjects];
    [self.Central scanForPeripheralsWithServices:self.uuids // 通过某些服务筛选外设
                                          options:nil]; // dict,条件
}
-(void)connectPeripheral:(CBPeripheral *)Peripheral{
    self.Peripheral = Peripheral;
    self.Peripheral.delegate = self;
    [self.Central connectPeripheral:Peripheral options:nil];
    [self.dataArray removeAllObjects];
    [self.Central scanForPeripheralsWithServices:self.uuids // 通过某些服务筛选外设
                                          options:nil]; // dict,条件
}
-(void)searcherScan{
    self.dataArray = @[].mutableCopy;
    [self.Central scanForPeripheralsWithServices:self.uuids // 通过某些服务筛选外设
                                          options:nil]; // dict,条件
}

- (CBCentralManager *)Central
{
    if (!_Central) {
        _Central = [[CBCentralManager alloc] initWithDelegate:self
                                                         queue:dispatch_get_main_queue()
                                                       options:nil];
    }
    return _Central;
}
//只要中心管理者初始化,就会触发此代理方法
- (void)centralManagerDidUpdateState:(CBCentralManager *)central
{
    
            if (central.state == CBManagerStatePoweredOn ) {
           
            NSLog(@"CBManagerStatePoweredOn");
            //搜索外设
            [self.Central scanForPeripheralsWithServices:self.uuids // 通过某些服务筛选外设
                                                  options:nil]; // dict,条件
            }else if(central.state == CBManagerStatePoweredOff){
                if (self.delegate && [self.delegate respondsToSelector:@selector(BluetoothStatus:forPeripherals:)]) {
                    [self.delegate BluetoothStatus:BluetoothStatuNotOn forPeripherals:nil] ;
                }
            }else{
                if (self.delegate && [self.delegate respondsToSelector:@selector(BluetoothStatus:forPeripherals:)]) {
                    [self.delegate BluetoothStatus:BluetoothStatuUnknown forPeripherals:nil] ;
                }
            }
           
    
}
//发现外设后调用的方法
- (void)centralManager:(CBCentralManager *)central // 中心管理者
 didDiscoverPeripheral:(CBPeripheral *)peripheral // 外设
     advertisementData:(NSDictionary *)advertisementData // 外设携带的数据
                  RSSI:(NSNumber *)RSSI // 外设发出的蓝牙信号强度
{
    NSLog(@"搜索到设备名：%@，设备ID：%@",peripheral.name,peripheral.identifier);
    //(ABS(RSSI.integerValue) > 35)
    for (int i = 0; i<self.dataArray.count; i++) {
        CBPeripheral *p = self.dataArray[i];
        if ([p.identifier isEqual:peripheral.identifier]) {
            self.dataArray[i] = peripheral;
            return;
        }
    }
    [self.dataArray addObject:peripheral];
    //发现完之后就是进行连接
    if (self.delegate && [self.delegate respondsToSelector:@selector(BluetoothSearcherScanForPeripherals:)]) {
        [self.delegate BluetoothSearcherScanForPeripherals:peripheral];
    }
}




//中心管理者连接外设成功
- (void)centralManager:(CBCentralManager *)central // 中心管理者
  didConnectPeripheral:(CBPeripheral *)peripheral // 外设
{
    NSLog(@"设备连接成功，设备名：%@", peripheral.name);
    self.Peripheral = peripheral;
//    [self.Peripheral writeValue:[NSData new] // 写入的数据
//               forCharacteristic:self.Characteristic // 写给哪个特征
//                            type:CBCharacteristicWriteWithResponse];// 通过此响应记录是否成功写入
    [peripheral discoverServices:self.uuids];
    if (self.delegate && [self.delegate respondsToSelector:@selector(BluetoothStatus:forPeripherals:)]) {
        [self.delegate BluetoothStatus:BluetoothStatuConnection forPeripherals:peripheral] ;
    }
}

// 外设连接失败
- (void)centralManager:(CBCentralManager *)central didFailToConnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error
{
    NSLog(@"设备连接失败，设备名：%@", peripheral.name);
    if (self.delegate && [self.delegate respondsToSelector:@selector(BluetoothStatus:forPeripherals:)]) {
        [self.delegate BluetoothStatus:BluetoothStatuDisconnect forPeripherals:peripheral] ;
    }
}

// 丢失连接
- (void)centralManager:(CBCentralManager *)central didDisconnectPeripheral:(CBPeripheral *)peripheral error:(NSError *)error
{
    NSLog(@"设备丢失连接，设备名：%@", peripheral.name);
    if (self.delegate && [self.delegate respondsToSelector:@selector(BluetoothStatus:forPeripherals:)]) {
        [self.delegate BluetoothStatus:BluetoothStatuDisconnect forPeripherals:peripheral] ;
    }
}




//发现外设的服务后调用的方法
- (void)peripheral:(CBPeripheral *)peripheral didDiscoverServices:(NSError *)error
{
    // 是否获取失败
    if (error) {
        NSLog(@"设备获取服务失败，设备名：%@", peripheral.name);
        if (self.delegate && [self.delegate respondsToSelector:@selector(BluetoothStatus:forPeripherals:)]) {
            [self.delegate BluetoothStatus:BluetoothStatuUnknown forPeripherals:nil] ;
        }
        return;
    }
    for (CBService *service in peripheral.services) {
        self.Service = service;
        NSLog(@"设备获取服务成功，服务名：%@，服务UUID：%@，服务数量：%lu",service,service.UUID,peripheral.services.count);
        //外设发现特征
        [peripheral discoverCharacteristics:nil forService:service];
    }
}




//从服务中发现外设特征的时候调用的代理方法
- (void)peripheral:(CBPeripheral *)peripheral didDiscoverCharacteristicsForService:(CBService *)service error:(NSError *)error
{
    if(error){
        NSLog(@"设备获取特征失败，设备名：%@", peripheral.name);
        if (self.delegate && [self.delegate respondsToSelector:@selector(BluetoothStatus:forPeripherals:)]) {
            [self.delegate BluetoothStatus:BluetoothStatuUnknown forPeripherals:nil] ;
        }
        return;
    }
    /**
    CBCharacteristicPropertyRead                                                    = 0x02,
    CBCharacteristicPropertyWriteWithoutResponse                                    = 0x04,
    CBCharacteristicPropertyWrite                                                    = 0x08,
    CBCharacteristicPropertyNotify                                                    = 0x10,
     */
    for (CBCharacteristic *cha in service.characteristics) {
        if(cha.properties & CBCharacteristicPropertyWrite){
            NSLog(@"UUID%@",cha.UUID);
            self.Characteristic = cha;
        }else if(cha.properties & CBCharacteristicPropertyWriteWithoutResponse){
            NSLog(@"CBCharacteristicPropertyWriteWithoutResponse");
        }else if(cha.properties & CBCharacteristicPropertyRead){
            NSLog(@"CBCharacteristicPropertyRead");
        }else if(cha.properties & CBCharacteristicPropertyNotify){
            NSLog(@"CBCharacteristicPropertyNotify");
        }else if(cha.properties & CBCharacteristicPropertyIndicate){
            NSLog(@"CBCharacteristicPropertyIndicate");
        }
        [peripheral discoverDescriptorsForCharacteristic:cha];
        [peripheral setNotifyValue:YES forCharacteristic:cha];
        if (self.Characteristic) {
            [self sendDataToBLE:@"55AA0500FB"];//心电仪专用注册ID
        }
        

    }
}




//更新特征值的时候调用，可以理解为获取蓝牙发回的数据
- (void)peripheral:(CBPeripheral *)peripheral didUpdateValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error
{
    if ([characteristic.UUID isEqual:[CBUUID UUIDWithString:self.characteristicUUID]]) {
        
        NSString *value = [self dataToString:characteristic.value];
        NSLog(@"特征名：%@，特征值：%@",characteristic,value);
        if (self.delegate &&[self.delegate respondsToSelector:@selector(BluetoothMeasurementData:Error:)]) {
            [self.delegate BluetoothMeasurementData:characteristic.value Error:error];
        }
        
    }
}
- (NSString *)dataToString:(NSData *)data {
    Byte *bytes = (Byte *)[data bytes];
    NSMutableString *string = [[NSMutableString alloc] init];
    for(int i = 0; i< [data length]; i++) {
        if (i == 0) {
            [string appendString:[NSString stringWithFormat:@"%hhu",bytes[i]]];
        }else {
            [string appendString:[NSString stringWithFormat:@",%hhu",bytes[i]]];
        }
    }
    return string;
}



//发现外设的特征的描述数组
- (void)peripheral:(CBPeripheral *)peripheral didDiscoverDescriptorsForCharacteristic:(nonnull CBCharacteristic *)characteristic error:(nullable NSError *)error
{
    if(error){
        NSLog(@"设备获取描述失败，设备名：%@", peripheral.name);
        return;
    }
    for (CBDescriptor *descriptor in characteristic.descriptors) {
        self.Descriptor = descriptor;
        [peripheral readValueForDescriptor:descriptor];
        NSLog(@"设备获取描述成功，描述名：%@",descriptor);
    }
}

//更新描述值的时候会调用
- (void)peripheral:(CBPeripheral *)peripheral didUpdateValueForDescriptor:(CBDescriptor *)descriptor error:(NSError *)error
{
    NSLog(@"描述名：%@,描述值：%@",descriptor,descriptor.description);
}






//通知状态改变时调用
-(void)peripheral:(CBPeripheral *)peripheral didUpdateNotificationStateForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error{
    if(error){
        NSLog(@"特征名：%@，改变通知状态失败",characteristic);
    }
    NSLog(@"特征名：%@，改变了通知状态",characteristic);
//    if (characteristic.isNotifying) {
//        [peripheral readValueForCharacteristic:characteristic];
//    } else {
//        NSLog(@"Notification stopped on %@.  Disconnecting", characteristic);
//        NSLog(@"%@", characteristic);
//        [self.mCentral cancelPeripheralConnection:peripheral];
//    }
}

- (NSData *)convertHexStrToData:(NSString *)str {
    if (!str || [str length] == 0) {
        return nil;
    }
    
    NSMutableData *hexData = [[NSMutableData alloc] initWithCapacity:8];
    NSRange range;
    if ([str length] % 2 == 0) {
        range = NSMakeRange(0, 2);
    } else {
        range = NSMakeRange(0, 1);
    }
    for (NSInteger i = range.location; i < [str length]; i += 2) {
        unsigned int anInt;
        NSString *hexCharStr = [str substringWithRange:range];
        NSScanner *scanner = [[NSScanner alloc] initWithString:hexCharStr];
        
        [scanner scanHexInt:&anInt];
        NSData *entity = [[NSData alloc] initWithBytes:&anInt length:1];
        [hexData appendData:entity];
        
        range.location += range.length;
        range.length = 2;
    }
    
    NSLog(@"hexdata: %@", hexData);
    return hexData;
}
//发送数据
-(void)sendDataToBLE:(NSString *)data{
    //将十六进制转为NSData
    NSData* myData = [self convertHexStrToData:data];
    [self.Peripheral writeValue:myData // 写入的数据
               forCharacteristic:self.Characteristic // 写给哪个特征
                            type:CBCharacteristicWriteWithResponse];// 通过此响应记录是否成功写入
    NSLog(@"send data pd and is：%@",myData);
    //is no write bluetooth data
    if(_Characteristic.properties & CBCharacteristicPropertyWriteWithoutResponse){
        //send phone on bluetooth data
        [self.Peripheral writeValue:myData forCharacteristic:_Characteristic type:CBCharacteristicWriteWithoutResponse];
    }else{
        [self.Peripheral writeValue:myData forCharacteristic:_Characteristic type:CBCharacteristicWriteWithResponse];
    }

}

-(void)peripheral:(CBPeripheral *)peripheral didWriteValueForCharacteristic:(CBCharacteristic *)characteristic error:(NSError *)error{
    NSLog(@"数据发送成功");
}
@end

