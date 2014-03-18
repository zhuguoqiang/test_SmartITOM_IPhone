//
//  AboutUsViewController.m
//  testSmartITOMiPhone
//
//  Created by Apple001 on 14-3-17.
//  Copyright (c) 2014年 Apple002. All rights reserved.
//

#import "AboutUsViewController.h"

@interface AboutUsViewController ()
{
    UIActivityIndicatorView *activityIndicator;
}

@end

@implementation AboutUsViewController

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
	self.imageView.image = [UIImage imageNamed:@"logo.png"];
    self.imageView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"main_background.png"]];
    self.webView.hidden = YES;
    self.webView.delegate = self;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)segmentAction:(id)sender
{
    UISegmentedControl *control = (UISegmentedControl *)sender;
    if ([control selectedSegmentIndex] == 0)
    {
        NSURL *url = [NSURL URLWithString:@"http://dhcc.com.cn/"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:request];
        self.webView.hidden = NO;
    }
    if ([control selectedSegmentIndex] == 1)
    {
        NSURL *url = [NSURL URLWithString:@"http://www.dhcc.com.cn/main-c1-36-c2-61.html"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:request];
        self.webView.hidden = NO;
    }
    if ([control selectedSegmentIndex] == 2)
    {
        NSURL *url = [NSURL URLWithString:@"http://www.dhcc.com.cn/main-c1-37-c2-49.html"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:request];
        self.webView.hidden = NO;
    }
    if ([control selectedSegmentIndex] == 3)
    {
        NSURL *url = [NSURL URLWithString:@"http://weibo.com/"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:request];
        self.webView.hidden = NO;
    }


    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStyleBordered target:self action:@selector(theActionOfShutDown)];
    
    self.navigationItem.rightBarButtonItem = rightItem;
}

-(void)theActionOfShutDown
{
    self.webView.hidden = YES;
    self.navigationItem.rightBarButtonItem = nil;
}

#pragma mark - WebView Delegate

-(void)webViewDidStartLoad:(UIWebView *)webView
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    [view setTag:108];
    [view setAlpha:1];
    [self.webView addSubview:view];
    
    activityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 32.0f, 32.0f)];
    
    [activityIndicator setCenter:self.webView.center];
    
    [activityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    
    activityIndicator.hidden = NO;
    
    [view addSubview:activityIndicator];
    
//    NSLog(@"%@",activityIndicator);
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [activityIndicator stopAnimating];
    UIView *view = (UIView *)[self.webView viewWithTag:108];
    [view removeFromSuperview];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [activityIndicator stopAnimating];
    UIView *view = (UIView *)[self.webView viewWithTag:108];
    [view removeFromSuperview];
    
    NSLog(@"there is a error");
}

#pragma mark -Button Action
- (IBAction)introduceFunction:(id)sender
{
    NSURL *url = [NSURL URLWithString:@"http://news.163.com/"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    self.webView.hidden = NO;
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:self action:@selector(theActionOfShutDown)];
    
    self.navigationItem.rightBarButtonItem = rightItem;
}
@end
