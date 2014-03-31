//
//  User.h
//  testSmartITOMiPhone
//
//  Created by Apple001 on 14-3-31.
//  Copyright (c) 2014年 Apple002. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject<NSCoding,NSCopying>

@property (nonatomic,strong) NSString *userName;

@property (nonatomic,strong) NSString *userPsw;

@property (nonatomic,assign) BOOL   rememberable;

@property (nonatomic,assign) BOOL   autoSignin;

@end
