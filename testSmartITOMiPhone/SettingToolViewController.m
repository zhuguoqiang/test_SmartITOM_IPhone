//
//  SettingToolViewController.m
//  testSmartITOMiPhone
//
//  Created by Apple001 on 14-3-17.
//  Copyright (c) 2014年 Apple002. All rights reserved.
//

#import "SettingToolViewController.h"

@interface SettingToolViewController ()

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

}


@end
