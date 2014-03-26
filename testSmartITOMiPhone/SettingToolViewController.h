//
//  SettingToolViewController.h
//  testSmartITOMiPhone
//
//  Created by Apple001 on 14-3-17.
//  Copyright (c) 2014年 Apple002. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingToolViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) IBOutlet UILabel *label2;
@property (strong, nonatomic) IBOutlet UILabel *label3;
@property (strong, nonatomic) IBOutlet UILabel *label4;
@property (strong, nonatomic) IBOutlet UILabel *label5;
@property (strong, nonatomic) IBOutlet UILabel *label6;
@property (strong, nonatomic) IBOutlet UILabel *label7;
@property (strong, nonatomic) IBOutlet UILabel *label9;

@property (strong, nonatomic) IBOutlet UISegmentedControl *segment1;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segment2;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segment3;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segment4;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segment5;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segment6;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segment7;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segment8;

- (IBAction)change:(id)sender;

@end
