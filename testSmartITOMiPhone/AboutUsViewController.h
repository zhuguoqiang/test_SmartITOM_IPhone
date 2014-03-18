//
//  AboutUsViewController.h
//  testSmartITOMiPhone
//
//  Created by Apple001 on 14-3-17.
//  Copyright (c) 2014年 Apple002. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutUsViewController : UIViewController<UIWebViewDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentControl;
@property (strong, nonatomic) IBOutlet UIWebView *webView;
- (IBAction)introduceFunction:(id)sender;

@end
