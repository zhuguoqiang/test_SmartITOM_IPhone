//
//  MessageTableViewCell.h
//  MyFirstArchiever
//
//  Created by Apple001 on 14-3-4.
//  Copyright (c) 2014年 SYM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *enterpriseName;
@property (strong, nonatomic) IBOutlet UILabel *nowTime;

@property (strong, nonatomic) IBOutlet UIView *chartView;

@end
