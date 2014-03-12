//
//  AddAttentionViewController.h
//  testSmartITOMiPhone
//
//  Created by Apple001 on 14-3-10.
//  Copyright (c) 2014年 Apple002. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol insertObject <NSObject>

-(void)setValue:(NSString *)object;

@end

@interface AddAttentionViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>

@property (retain,nonatomic) UITableView *mTableView;
@property (retain,nonatomic) UITableView *pMtableView;
@property (retain,nonatomic) UISearchBar *mSearchBar;
@property (retain,nonatomic) NSMutableArray *mArr1;
@property (retain,nonatomic) NSMutableArray *mArr2;




@property (assign,nonatomic) id<insertObject> delegate;

@end
