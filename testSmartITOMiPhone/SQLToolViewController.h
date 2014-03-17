//
//  SQLToolViewController.h
//  testSmartITOMiPhone
//
//  Created by Apple001 on 14-3-17.
//  Copyright (c) 2014年 Apple002. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SQLToolViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextView *textView;
- (IBAction)perform:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *label;

@end
