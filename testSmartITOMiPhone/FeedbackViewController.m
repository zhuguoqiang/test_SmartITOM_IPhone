//
//  FeedbackViewController.m
//  testSmartITOMiPhone
//
//  Created by Apple001 on 14-3-17.
//  Copyright (c) 2014年 Apple002. All rights reserved.
//

#import "FeedbackViewController.h"
#import "DetailFeedbackViewController.h"

@interface FeedbackViewController ()

@end

@implementation FeedbackViewController

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
	self.textView.delegate = self;
    self.textView.font = [UIFont boldSystemFontOfSize:30];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextView Delegate

-(void)textViewDidBeginEditing:(UITextView *)textView
{
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithTitle:@"发送" style:UIBarButtonItemStyleBordered target:self action:@selector(sendMessage)];
    
    self.navigationItem.rightBarButtonItem = right;
}

-(void)textViewDidEndEditing:(UITextView *)textView
{
    self.navigationItem.rightBarButtonItem = nil;
}



-(void)sendMessage
{
    [self performSegueWithIdentifier:@"Detail" sender:self];
    [self.textView resignFirstResponder];
}

#pragma mark -Navigation

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString: @"Detail"])
    {
        DetailFeedbackViewController *vc = segue.destinationViewController;
        vc.labelText = self.textView.text;
    }
}

@end
