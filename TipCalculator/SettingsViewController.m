//
//  SettingsViewController.m
//  TipCalculator
//
//  Created by Bruce Ng on 1/20/15.
//  Copyright (c) 2015 Yahoo. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController () <UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *tipPickerView1;
@property (nonatomic, strong) NSArray *tipValues;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Settings";
    
    self.tipPickerView1.delegate = self;
    self.tipPickerView1.dataSource = self;
    
    NSInteger tipValue1;
    NSInteger tipValue2;
    NSInteger tipValue3;

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    tipValue1 = [defaults integerForKey:@"firstTab"];
    tipValue2 = [defaults integerForKey:@"secondTab"];
    tipValue3 = [defaults integerForKey:@"thirdTab"];
    
    tipValue1 = tipValue1 == 0 ? 10 : tipValue1;
    tipValue2 = tipValue2 == 0 ? 15 : tipValue2;
    tipValue3 = tipValue3 == 0 ? 20 : tipValue3;
    
    [self.tipPickerView1 selectRow:[self getRowFromTipValue:tipValue1] inComponent:0 animated:YES];
    [self.tipPickerView1 selectRow:[self getRowFromTipValue:tipValue2] inComponent:1 animated:YES];
    [self.tipPickerView1 selectRow:[self getRowFromTipValue:tipValue3] inComponent:2 animated:YES];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 25;
//    return self.tipValues.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString *value = [NSString stringWithFormat:@"%%%ld",[self getTipValueFromRow:row]];
//    NSString *value = [NSString stringWithFormat:@"%0.2f",[self.tipValues[row] floatValue]];
   return value;
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSInteger tipValue = [self getTipValueFromRow:row];
//    NSString *value = [NSString stringWithFormat:@"%0.2f",[self.tipValues[row] floatValue]];
    NSString *key = @"firstTab";
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (component == 1) {
        key = @"secondTab";
    } else if (component == 2) {
        key = @"thirdTab";
    }

    [defaults setInteger:tipValue forKey:key];
    [defaults synchronize];
}

- (NSInteger)getRowFromTipValue:(NSInteger)tipValue {
    return tipValue - 1;
}

- (NSInteger)getTipValueFromRow:(NSInteger)row {
    return row+1;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
