//
//  BIDViewController.h
//  MyFirstArchiever
//
//  Created by Apple001 on 14-2-28.
//  Copyright (c) 2014年 SYM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BIDAppDelegate.h"
#import "MenuTabViewController.h"


@interface SigninViewController : UIViewController<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *logo;

@property (strong, nonatomic) IBOutlet UIImageView *backGround;

@property (strong, nonatomic) IBOutlet UITextField *tfUserName;

@property (strong, nonatomic) IBOutlet UITextField *tfPsw;

@property (strong, nonatomic) IBOutlet UIButton *btnUserHistory;

@property (strong, nonatomic) IBOutlet UIButton *btnSignin;

@property (strong, nonatomic) IBOutlet UIButton *btnCleanUp;







@end
