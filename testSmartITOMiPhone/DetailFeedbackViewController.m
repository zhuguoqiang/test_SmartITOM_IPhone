//
//  DetailFeedbackViewController.m
//  testSmartITOMiPhone
//
//  Created by Apple001 on 14-3-17.
//  Copyright (c) 2014年 Apple002. All rights reserved.
//

#import "DetailFeedbackViewController.h"

@interface DetailFeedbackViewController ()

@end

@implementation DetailFeedbackViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.label.text = self.labelText;
    UIAlertView *view = [[UIAlertView alloc] initWithTitle:@"已收到反馈意见" message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [view show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
