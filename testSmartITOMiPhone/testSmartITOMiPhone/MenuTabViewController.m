//
//  MenuTabViewController.m
//  MyFirstArchiever
//
//  Created by Apple001 on 14-2-28.
//  Copyright (c) 2014年 SYM. All rights reserved.
//

#import "MenuTabViewController.h"
#import "MessageTableViewController.h"
#import "AttentionTableViewController.h"
#import "SettingTableViewController.h"

@interface MenuTabViewController ()

@end

@implementation MenuTabViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
//    MessageTableViewController *messageTableViewController = [[MessageTableViewController alloc] init];
//    messageTableViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"消息" image:[UIImage imageNamed:@"menu_message_normal.png"] selectedImage:[UIImage imageNamed:@"menu_message_highlight.png"]];
//    
//    AttentionTableViewController *attentionTableViewController = [[AttentionTableViewController alloc] init];
//    attentionTableViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"关注" image:[UIImage imageNamed:@"marked_normal@2x.png"] selectedImage:[UIImage imageNamed:@"marked_highlight@2x.png"]];
//    
//    SettingTableViewController *settingTableViewController = [[SettingTableViewController alloc] initWithNibName:nil bundle:nil];
//    settingTableViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"设置" image:[UIImage imageNamed:@"menu_setting_normal.png"] selectedImage:[UIImage imageNamed:@"menu_setting_highlight.png"]];
//
//    
////    [self setSelectedIndex:2];
//    
////    self.viewControllers = @[messageTableViewController];
//    self.viewControllers = [NSArray arrayWithObjects:messageTableViewController,attentionTableViewController,settingTableViewController, nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
