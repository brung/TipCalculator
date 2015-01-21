//
//  SettingsViewController.m
//  TipCalculator
//
//  Created by Bruce Ng on 1/20/15.
//  Copyright (c) 2015 Yahoo. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *tipPickerView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (nonatomic, strong) NSArray *tipValues;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Settings";
    self.tipValues = @[@(0.1),@(0.15),@(0.2)];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
