//
//  SQLToolViewController.m
//  testSmartITOMiPhone
//
//  Created by Apple001 on 14-3-17.
//  Copyright (c) 2014年 Apple002. All rights reserved.
//

#import "SQLToolViewController.h"

@interface SQLToolViewController ()

@end

@implementation SQLToolViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.textView.text = @"SELECT * FROM table_name";
    self.textView.font = [UIFont boldSystemFontOfSize:30];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)perform:(id)sender
{
    self.label.text = self.textView.text;
    self.label.font = [UIFont boldSystemFontOfSize:30];
    [self.textView resignFirstResponder];
}
@end
