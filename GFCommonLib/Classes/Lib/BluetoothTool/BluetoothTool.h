//
//  BluetoothTool.h
//  CSDNBLE4.0
//
//  Created by 王刚锋 on 2020/10/14.
//  Copyright © 2020 hensen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>
typedef NS_ENUM(NSUInteger, BluetoothStatus)
{
    BluetoothStatuConnection = 0,//连接
    BluetoothStatuDisconnect,    //断开
    BluetoothStatuNotOn,         //未开启蓝牙
    BluetoothStatuUnknown        //未知
};
typedef void (^SuccessBlock)(NSDictionary *data);
typedef void (^FailureBlock)(NSError *error);


@protocol BluetoothToolDelegate <NSObject>
/// 蓝牙搜索结果
/// @param peripheral 蓝牙外设
-(void)BluetoothSearcherScanForPeripherals:(CBPeripheral *)peripheral;
/// 蓝牙返回数据
/// @param data 成功数据返回
/// @param error 返回错误
-(void)BluetoothMeasurementData:(NSData *)data Error:(NSError *)error;
/// 蓝牙链接状态
/// @param status 枚举类型
-(void)BluetoothStatus:(BluetoothStatus)status forPeripherals:(CBPeripheral *)peripheral;

@end
@interface BluetoothTool : NSObject
//搜索相关服务UUID
@property (nonatomic, strong)NSArray <CBUUID *>*uuids;
//接受服务通知UUID
@property (nonatomic, strong)NSString *characteristicUUID;

@property (nonatomic, strong)NSMutableArray <CBPeripheral *>*dataArray;
//手机设备
@property (nonatomic, strong) CBCentralManager *Central;
//外设设备
@property (nonatomic, strong) CBPeripheral *Peripheral;
//特征值
@property (nonatomic, strong) CBCharacteristic *Characteristic;
//服务
@property (nonatomic, strong) CBService *Service;
//描述
@property (nonatomic, strong) CBDescriptor *Descriptor;
@property (nonatomic, weak) id<BluetoothToolDelegate>delegate;

-(void)sendDataToBLE:(NSString *)data;

+(instancetype)initWithUUIDs:(NSArray *)uuids characteristicUUID:(NSString *)characteristicUUID;
/// data转string
/// @param data bit
- (NSString *)dataToString:(NSData *)data;
-(void)searcherScan;
-(void)cancelPeripheralConnection:(CBPeripheral *)Peripheral;
-(void)connectPeripheral:(CBPeripheral *)Peripheral;

@end


