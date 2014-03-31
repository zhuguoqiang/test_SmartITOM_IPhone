//
//  User.m
//  testSmartITOMiPhone
//
//  Created by Apple001 on 14-3-31.
//  Copyright (c) 2014年 Apple002. All rights reserved.
//

#import "User.h"

#define kUserName           @"userName"
#define kUserPsw            @"userPsw"
#define kRememberable       @"rememberable"
#define kAutoSignIn         @"autoSignIn"

@implementation User


#pragma mark NSCoding
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.userName forKey:kUserName];
    [aCoder encodeObject:self.userPsw forKey:kUserPsw];
    [aCoder encodeObject:[NSNumber numberWithBool:self.rememberable] forKey:kRememberable];
    [aCoder encodeObject:[NSNumber numberWithBool:self.autoSignin] forKey:kAutoSignIn];
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init])
    {
        self.userName = [aDecoder decodeObjectForKey:kUserName];
        self.userPsw = [aDecoder decodeObjectForKey:kUserPsw];
        self.rememberable = [[aDecoder decodeObjectForKey:kRememberable] boolValue];
        self.autoSignin = [[aDecoder decodeObjectForKey:kAutoSignIn] boolValue];
    }
    
    return self;
}

#pragma mark NSCoping

//-(id)copyWithZone:(NSZone *)zone
//{
//    User *copy = [[[self class] allocWithZone:zone] init];
//    
//    copy.userName = [self.userName copyWithZone:zone];
//    copy.userPsw = [self.userPsw copyWithZone:zone];
//    copy.rememberable = self.rememberable;
//    copy.autoSignin = self.autoSignin;
//    
//    return self;
//}

@end
