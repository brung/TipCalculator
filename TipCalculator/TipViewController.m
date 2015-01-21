//
//  TipViewController.m
//  TipCalculator
//
//  Created by Bruce Ng on 1/20/15.
//  Copyright (c) 2015 Yahoo. All rights reserved.
//

#import "TipViewController.h"
#import "SettingsViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;
@property (nonatomic,strong) NSArray *tipValues;

- (IBAction)onTap:(id)sender;
- (void)updateValues;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Tip Calculator";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
    // Do any additional setup after loading the view from its nib.
    [self updateTipValues];
    [self updateValues];
}

- (void)viewWillAppear:(BOOL)animated {
    [self updateTipValues];
}

- (void) viewDidAppear:(BOOL)animated {
    [self updateValues];
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

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (void)updateTipValues {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *tipValue1 = [defaults stringForKey:@"firstTab"];
    NSString *tipValue2 = [defaults stringForKey:@"secondTab"];
    NSString *tipValue3 = [defaults stringForKey:@"thirdTab"];
    
    if (tipValue1 == nil && tipValue2 == nil && tipValue3 == nil) {
        self.tipValues = @[@(10),@(15),@(20)];
    } else {
        self.tipValues = @[tipValue1,tipValue2,tipValue3];
    }
    
    for (NSInteger i = 0; i < self.tipControl.numberOfSegments; i++) {
        [self.tipControl setTitle:[NSString stringWithFormat:@"%%%@", self.tipValues[i]] forSegmentAtIndex:i];
    }
    
}

- (void)updateValues {
    float billAmount = [self.billTextField.text floatValue];
    
    float tipAmount = billAmount * [self.tipValues[self.tipControl.selectedSegmentIndex] floatValue] / 100;
    float totalAmount = billAmount + tipAmount;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
}

- (void)onSettingsButton{
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
    
}
@end
