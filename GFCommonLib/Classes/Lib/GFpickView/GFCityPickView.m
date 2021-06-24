//
//  GFCityPickView.m
//  NLKJ_App
//
//  Created by 王刚锋 on 2018/8/16.
//  Copyright © 2018年 王刚锋. All rights reserved.
//

#import "GFCityPickView.h"
#import "addressModel.h"
@interface GFCityPickView () <UIPickerViewDataSource, UIPickerViewDelegate>
{
    NSInteger _selectRow0;//记录第0个轮子的选择行
    NSInteger _selectRow1;
    NSInteger _selectRow2;
    NSString *_areaString;//最后要传回的详细地址拼接字符串
    citieModel *_proModel;//记录下选中省的数据
    cityModel *_cityModel;
    NSString *titleOne;
    NSString *titleTwo;
    NSString *titleThree;
    
}
@property (strong, nonatomic) UIPickerView *pickerView;
@property (nonatomic, strong)UIButton *groundV;
//@property (strong, nonatomic) addressModel    *provBridge;
//@property (strong, nonatomic) addressModel    *cityBridge;
//@property (strong, nonatomic) addressModel    *areaBridge;
@property (copy, nonatomic) NSArray *provDataArr;//省数组
@property (copy, nonatomic) NSArray *cityDataArr;//市数组
@property (copy, nonatomic) NSArray *areaDataArr;//区数组


@end
@implementation GFCityPickView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    [self addSubview:self.groundV];
    _selectRow0 = 0;
    _selectRow1 = 0;
//    _selectRow2 = 0;
    _provDataArr = [self getPlistArrayByplistName];
    self.backgroundColor    = [UIColor clearColor];
    
    UIView *toolbar = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-180, [UIScreen mainScreen].bounds.size.width, 30)];
    toolbar.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    
    
    UIButton *leftBtn = [UIButton buttonWithType: UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 100, 30);
    [leftBtn setTitle:@"取消" forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(selectAddressClose) forControlEvents:UIControlEventTouchUpInside];
    [leftBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    UIButton *rightBtn = [UIButton buttonWithType: UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(SCREEN_WIDTH-100, 0, 100, 30);
    [rightBtn setTitle:@"确定" forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(selectAddressComplete) forControlEvents:UIControlEventTouchUpInside];
    [rightBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    [toolbar addSubview:leftBtn];
    [toolbar addSubview:rightBtn];

    
    [self addSubview:toolbar];
    
    self.pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-150, SCREEN_WIDTH, 150)];
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    self.pickerView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.pickerView];
    [self downloadProv];
}
- (UIButton *)groundV {
    if (!_groundV) {
        _groundV = [[UIButton alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _groundV.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
        [_groundV addTarget:self action:@selector(handleDateTopViewLeft) forControlEvents:UIControlEventTouchUpInside];
    }
    return _groundV;
}
-(void)handleDateTopViewLeft{
    [self end];
}

- (void)end{
    [self removeFromSuperview];
}
-(NSArray *)getPlistArrayByplistName{
    
//    NSString *path= [[NSBundle mainBundle] pathForResource:@"city" ofType:@"plist"];
//    NSArray * array=[[NSArray alloc] initWithContentsOfFile:path];
    // 获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"province" ofType:@"json"];
    // 将文件数据化
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    // 对数据进行JSON格式化并返回字典形式
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
  
//    return array;
}
#pragma mark - http methods

/*省*/
- (void)downloadProv {

//    NSMutableDictionary  *params = [NSMutableDictionary dictionaryWithDictionary:  @{@"id":@(0)} ];
//    
//    [HTTPTool POST:api_common_getCity parameters:params success:^(id responseObject) {
//        [self.provDataArr addObjectsFromArray:responseObject];
        [self pickerView:self.pickerView didSelectRow:0 inComponent:0 ];//联动轮子1 必须得本轮有数据后才能触发didselect
        [self.pickerView reloadAllComponents];
//    } failure:^(NSError *error) {
//        
//    }];
}
/*市*/
- (void)downloadCityWithId:(NSInteger)provId {

    _proModel = [citieModel mj_objectWithKeyValues:self.provDataArr[provId]];
    self.cityDataArr = _proModel.city;

    [self.pickerView reloadComponent:1];

    [self.pickerView selectRow:0 inComponent:1 animated:YES];//默认选择row0


    if (self.cityDataArr.count>0) {
        _cityModel =  [cityModel mj_objectWithKeyValues:self.cityDataArr[0]];
        self.areaDataArr = _cityModel.area;
         [self.pickerView reloadComponent:2];
        [self pickerView:self.pickerView didSelectRow:0 inComponent:2 ];//联动轮子2 必须得本轮有数据后才能触发didselect
  
    }
    


}
/*区*/
- (void)downloadAreaWithId:(NSInteger)cityId {
//
//    NSMutableDictionary  *dic = [NSMutableDictionary dictionaryWithDictionary:  @{@"id":@(cityId)} ];
//
//    [AFHttpUtils sendPostTaskWithUrl:[NSString stringWithFormat:@"%@/app/member/area",BASE_DOMAIN_URL] paramenters:dic successHandle:^(NSURLSessionDataTask *task, id responseObject) {
//
//        NSLog(@"AREA:%@",responseObject);
//
//        self.areaBridge = [AreaModel mj_objectWithKeyValues:responseObject];
//
//        if (self.areaBridge.error_code==0&&self.areaBridge.data.count>0) {
//
//            self.areaDataArr=self.areaBridge.data;
//
//        }else{
//
//            self.areaDataArr=nil;
//
//        }
    
        [self.pickerView reloadComponent:2];

        [self.pickerView selectRow:0 inComponent:2 animated:YES];

        [self pickerView:self.pickerView didSelectRow:0 inComponent:2 ];
//
//    } errorHandle:^(NSError *error) {
//
//    }];
//
}
#pragma mark - events response
- (void)selectAddressComplete {
    [self.delegate addressPickerViewDidSelected:_areaString ];
    [self remove];
  
}
-(void)remove{
    
    [self removeFromSuperview];
}
-(void)show{
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
}
- (void)selectAddressClose {
    [self remove];
}

#pragma mark - UIPickerViewDataSource

//确定picker的轮子个数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    if (_cityModel.area.count>0) {
        return 3;
    }
    return 3;
}

//确定picker的每个轮子的item数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component==0) {
        return self.provDataArr.count;
        
    }else if(component==1){
        return _proModel.city.count;
        
    }else{
        return _cityModel.area.count;
        
    }
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 36;
}

//确定每个轮子的每一项显示什么内容
- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    NSDictionary * attrDic = @{NSForegroundColorAttributeName:[UIColor blackColor],
                               NSFontAttributeName:[UIFont systemFontOfSize:12]};
//    Area *area;
    NSString *str;
    if (component==0) {
        citieModel *model =[citieModel mj_objectWithKeyValues:self.provDataArr[row]];
        str = model.name;
        
    }else if(component==1){
//        NSLog(@"%@",_proModel.cities[row]);
        cityModel *model = [cityModel mj_objectWithKeyValues:_proModel.city[row]];
        str = model.name;
    }else{
        str = _cityModel.area[row];
    }
    NSAttributedString * attrString = [[NSAttributedString alloc] initWithString:str
                                                                      attributes:attrDic];
    return attrString;
}

//监听轮子的移动
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    if (component==0) {
        
        _selectRow0 = [pickerView selectedRowInComponent:0];
        
        _selectRow1 = 0;
        
        _selectRow2 = 0;
        _proModel   = [citieModel mj_objectWithKeyValues:self.provDataArr[_selectRow0]];
        self.cityDataArr = _proModel.city;
        _cityModel   = [cityModel mj_objectWithKeyValues:self.cityDataArr[_selectRow1]];
//        [self.pickerView reloadComponent:1];
        [self.pickerView selectRow:0 inComponent:1 animated:YES];//默认选择row0
        if(_cityModel.area.count>0){
            [self.pickerView reloadAllComponents];
            [self pickerView:self.pickerView didSelectRow:0 inComponent:2 ];//联动轮子2 必须得本轮有数据后才能触发didselect
        }
         [self.pickerView reloadAllComponents];
    }else if(component==1){
        _selectRow1 = [pickerView    selectedRowInComponent:1];
        _selectRow2 = 0;
        _cityModel   = [cityModel mj_objectWithKeyValues:self.cityDataArr[_selectRow1]];
        if(_cityModel.area.count>0){
//            [self.pickerView reloadComponent:2];
            [self pickerView:self.pickerView didSelectRow:0 inComponent:2 ];//联动轮子2 必须得本轮有数据后才能触发didselect
        }
         [self.pickerView reloadAllComponents];
    }else if(component==2){

        _selectRow2 = [pickerView selectedRowInComponent:2];
        if (_selectRow2 >= _cityModel.area.count) {
            _selectRow2 = 0;
        }
        [self.pickerView reloadAllComponents];
    }
    if(_cityModel.area.count>0 && _selectRow2 < _cityModel.area.count){
        citieModel *modelone =[citieModel mj_objectWithKeyValues:self.provDataArr[_selectRow0]];
        cityModel *modeltwo = [cityModel mj_objectWithKeyValues:_proModel.city[_selectRow1]];
        titleOne = modelone.name;
        titleTwo = modeltwo.name;
        titleThree = _cityModel.area[_selectRow2];
       _areaString = [NSString stringWithFormat:@"%@/%@/%@",titleOne,titleTwo,titleThree];
    }else{
        citieModel *modelone =[citieModel mj_objectWithKeyValues:self.provDataArr[_selectRow0]];
        cityModel *modeltwo = [cityModel mj_objectWithKeyValues:_proModel.city[_selectRow1]];
        titleOne = modelone.name;
        titleTwo = modeltwo.name;
       _areaString = [NSString stringWithFormat:@"%@/%@",titleOne,titleTwo];
        
    }
}

#pragma mark - getters and setters
- (UIPickerView *)pickerView {
    if (_pickerView == nil) {
        _pickerView = [[UIPickerView alloc] init];
        _pickerView.delegate   = self;
        _pickerView.dataSource = self;
        
    }
    return _pickerView;
}

@end
