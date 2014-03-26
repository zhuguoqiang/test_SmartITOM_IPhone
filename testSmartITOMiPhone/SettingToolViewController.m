//
//  SettingToolViewController.m
//  testSmartITOMiPhone
//
//  Created by Apple001 on 14-3-17.
//  Copyright (c) 2014年 Apple002. All rights reserved.
//

#import "SettingToolViewController.h"

@interface SettingToolViewController ()
{
    NSUserDefaults *defaults;
}

@end

@implementation SettingToolViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    defaults = [NSUserDefaults standardUserDefaults];
    
    self.segment1.selectedSegmentIndex = [defaults boolForKey:@"firstSwitch"];
    self.segment2.selectedSegmentIndex = [defaults boolForKey:@"secondSwitch"];
    self.segment3.selectedSegmentIndex = [defaults boolForKey:@"thirdSwitch"];
    self.segment4.selectedSegmentIndex = [defaults boolForKey:@"forthSwitch"];
    self.segment5.selectedSegmentIndex = [defaults boolForKey:@"fifthSwitch"];
    self.segment6.selectedSegmentIndex = [defaults boolForKey:@"sixthSwitch"];
    self.segment7.selectedSegmentIndex = [defaults boolForKey:@"seventhSwitch"];
    self.segment8.selectedSegmentIndex = [defaults boolForKey:@"eighthSwitch"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)change:(id)sender
{
    UISegmentedControl *control = (UISegmentedControl *)sender;
    if ([control selectedSegmentIndex] == 0)
    {
       self.label.text = @"On button";
    }
    else
    {
        self.label.text = @"Off button";
    }
    [defaults setBool:control.selectedSegmentIndex forKey:@"firstSwitch"];
    [defaults synchronize];
    
}
- (IBAction)change1:(id)sender
{
    UISegmentedControl *control = (UISegmentedControl *)sender;
    if ([control selectedSegmentIndex] == 0)
    {
        self.label2.text = @"On button";
    }
    else
    {
        self.label2.text = @"Off button";
    }
    [defaults setBool:control.selectedSegmentIndex forKey:@"secondSwitch"];
    [defaults synchronize];

}
- (IBAction)change2:(id)sender
{
    UISegmentedControl *control = (UISegmentedControl *)sender;
    if ([control selectedSegmentIndex] == 0)
    {
        self.label3.text = @"On button";
    }
    else
    {
        self.label3.text = @"Off button";
    }
    [defaults setBool:control.selectedSegmentIndex forKey:@"thirdSwitch"];
    [defaults synchronize];


}
- (IBAction)change3:(id)sender
{
    UISegmentedControl *control = (UISegmentedControl *)sender;
    if ([control selectedSegmentIndex] == 0)
    {
        self.label4.text = @"On button";
    }
    else
    {
        self.label4.text = @"Off button";
    }
    [defaults setBool:control.selectedSegmentIndex forKey:@"forthSwitch"];
    [defaults synchronize];


}
- (IBAction)change4:(id)sender
{
    UISegmentedControl *control = (UISegmentedControl *)sender;
    if ([control selectedSegmentIndex] == 0)
    {
        self.label5.text = @"On button";
    }
    else
    {
        self.label5.text = @"Off button";
    }
    [defaults setBool:control.selectedSegmentIndex forKey:@"fifthSwitch"];
    [defaults synchronize];


}
- (IBAction)change5:(id)sender
{
    UISegmentedControl *control = (UISegmentedControl *)sender;
    if ([control selectedSegmentIndex] == 0)
    {
        self.label6.text = @"On button";
    }
    else
    {
        self.label6.text = @"Off button";
    }
    [defaults setBool:control.selectedSegmentIndex forKey:@"sixthSwitch"];
    [defaults synchronize];


}
- (IBAction)change6:(id)sender
{
    UISegmentedControl *control = (UISegmentedControl *)sender;
    if ([control selectedSegmentIndex] == 0)
    {
        self.label7.text = @"On button";
    }
    else
    {
        self.label7.text = @"Off button";
    }
    [defaults setBool:control.selectedSegmentIndex forKey:@"seventhSwitch"];
    [defaults synchronize];


}
- (IBAction)change7:(id)sender
{
    UISegmentedControl *control = (UISegmentedControl *)sender;
    if ([control selectedSegmentIndex] == 0)
    {
        self.label9.text = @"On button";
    }
    else
    {
        self.label9.text = @"Off button";
    }
    [defaults setBool:control.selectedSegmentIndex forKey:@"eighthSwitch"];
    [defaults synchronize];


}


@end
