//
//  MessageTableViewCell.m
//  MyFirstArchiever
//
//  Created by Apple001 on 14-3-4.
//  Copyright (c) 2014年 SYM. All rights reserved.
//

#import "MessageTableViewCell.h"

@implementation MessageTableViewCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
