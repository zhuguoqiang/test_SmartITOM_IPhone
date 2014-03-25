//
//  DetailAttentionController.h
//  testSmartITOMiPhone
//
//  Created by Apple001 on 14-3-24.
//  Copyright (c) 2014年 Apple002. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailAttentionTableViewCell.h"
#import "ELineChart.h"

@interface DetailAttentionController : UITableViewController<ELineChartDataSource>

@property (strong, nonatomic) ELineChart *eLineChart;

@property (strong, nonatomic) NSArray *eLineChartData;

@property (nonatomic) float eLineChartScale;
@end
