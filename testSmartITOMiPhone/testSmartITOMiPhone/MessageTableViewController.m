//
//  MessageTableViewController.m
//  MyFirstArchiever
//
//  Created by Apple001 on 14-3-3.
//  Copyright (c) 2014年 SYM. All rights reserved.
//

#import "MessageTableViewController.h"
#import "LineChartView.h"
#import "MessageTableViewCell.h"
#import "HostViewController.h"
#import "AlarmViewController.h"

@class cell;

@interface MessageTableViewController ()
{
    NSMutableArray *views;
    NSMutableArray *times;
    NSMutableArray *enterpriseNames;
    NSMutableArray *secondViewControllers;
    
    UIView *secondView;
    UIView *thirdView;
    
 

}

@end

@implementation MessageTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    secondViewControllers = [[NSMutableArray alloc] init];
    
    views = [[NSMutableArray alloc] init];
    times = [[NSMutableArray alloc] initWithObjects:@"9:12",@"8:30",@"7:00", nil];
    enterpriseNames = [[NSMutableArray alloc] initWithObjects:@"host_dhcc",@"alarm_flows",@"msg_itsm", nil];
    
    //建立第一个UIView
    LineChartView *lineChartView = [[LineChartView alloc]initWithFrame:CGRectMake(0, 0,471, 480)];
    
    
    NSMutableArray *pointArr = [[NSMutableArray alloc]init];
    
    //生成随机点
    [pointArr addObject:[NSValue valueWithCGPoint:CGPointMake(50*0, 0)]];
    [pointArr addObject:[NSValue valueWithCGPoint:CGPointMake(50*1, 40)]];
    [pointArr addObject:[NSValue valueWithCGPoint:CGPointMake(50*2, 70)]];
    [pointArr addObject:[NSValue valueWithCGPoint:CGPointMake(50*3, 30)]];
    [pointArr addObject:[NSValue valueWithCGPoint:CGPointMake(50*4, 20)]];
    [pointArr addObject:[NSValue valueWithCGPoint:CGPointMake(50*5, 55)]];
    [pointArr addObject:[NSValue valueWithCGPoint:CGPointMake(50*6, 80)]];
    [pointArr addObject:[NSValue valueWithCGPoint:CGPointMake(50*7, 100)]];
    [pointArr addObject:[NSValue valueWithCGPoint:CGPointMake(50*8, 43)]];
    [pointArr addObject:[NSValue valueWithCGPoint:CGPointMake(50*9, 59)]];
    [pointArr addObject:[NSValue valueWithCGPoint:CGPointMake(50*10, 23)]];
    
    //竖轴
    NSMutableArray *vArr = [[NSMutableArray alloc]initWithCapacity:pointArr.count-1];
    for (int i=0; i<9; i++) {
        [vArr addObject:[NSString stringWithFormat:@"%d",i*20]];
    }
    
    //横轴
    NSMutableArray *hArr = [[NSMutableArray alloc]initWithCapacity:pointArr.count-1];
    
    [hArr addObject:@"05-26"];
    [hArr addObject:@"05-27"];
    [hArr addObject:@"05-28"];
    [hArr addObject:@"05-29"];
    [hArr addObject:@"05-30"];
    [hArr addObject:@"06-01"];
    [hArr addObject:@"06-02"];
    [hArr addObject:@"06-03"];
    [hArr addObject:@"06-04"];
    [hArr addObject:@"06-05"];
    
    
    [lineChartView setHDesc:hArr];
    [lineChartView setVDesc:vArr];
    [lineChartView setArray:pointArr];
    
    [views addObject:lineChartView];
    
    //建立第二个UIView
    secondView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 400, 200)];
    UILabel *fLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 400, 100)];
    fLabel.text = @"Flowserve";
    fLabel.textColor = [UIColor redColor];
    fLabel.font = [UIFont fontWithName:nil size:60];
    UILabel *ffLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 400, 100)];
    ffLabel.text = @"内存利用率阀值越界";
    ffLabel.font = [UIFont fontWithName:nil size:40];
    
    [secondView addSubview:fLabel];
    [secondView addSubview:ffLabel];
    
    [views addObject:secondView];
    
    //第三个UIView
    thirdView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 400, 200)];
    UILabel *sLabel = [[UILabel alloc] initWithFrame:thirdView.frame];
    sLabel.text = @"故障通知";
    sLabel.textColor = [UIColor redColor];
    sLabel.font = [UIFont fontWithName:nil size:60];    [thirdView addSubview:sLabel];
    
    [views addObject:thirdView];
    
    
    }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return views.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MessageTableViewCell";
    MessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
//    if (cell == nil)
//    {
//        cell = [[MessageTableViewCell alloc ] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//    }
    
//    NSDate *date = [NSDate date];
//    cell.nowTime.text = [NSString stringWithFormat:@"%@", date];
    cell.nowTime.text = [times objectAtIndex:indexPath.row];
//    cell.enterpriseName.text = @"DHCC";
    cell.enterpriseName.text = [enterpriseNames objectAtIndex:indexPath.row];
    [cell.chartView addSubview:[views objectAtIndex:indexPath.row]];
//    [cell.imageView setImage:[UIImage imageNamed:@"liuyifei.jpg"]];
    [cell.imageView setImage:[UIImage imageNamed:@"user@2x.png"]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
        
        [self performSegueWithIdentifier:@"host" sender:self];
    
    else if(indexPath.row == 1)
        
        [self performSegueWithIdentifier:@"alarm" sender:self];
    
    else
        
        [self performSegueWithIdentifier:@"itsm" sender:self];
}


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
//    NSLog(@"%d",[segue.identifier isEqualToString:@"host"]);
    if ([segue.identifier isEqualToString:@"host"])
    {
        UIViewController *viewController = segue.destinationViewController;
        HostViewController *hostViewController = (HostViewController *)viewController;
        hostViewController.ipLabelText = @"10.10.152.18";
        hostViewController.categoryLabelText = @"主机";
        hostViewController.manufactotyLabelText = @"华为";
        hostViewController.informationView = [views objectAtIndex:0];
    }
    else if ([segue.identifier isEqualToString: @"alarm"])
    {
        UIViewController *viewController = segue.destinationViewController;
        AlarmViewController *alarmViewController = (AlarmViewController *)viewController;
        alarmViewController.IPLabelText = @"10.10.152.20";
        alarmViewController.categoryLabelText = @"服务器";
        alarmViewController.manufactoryLabeltext = @"IBM";
    }
}




@end
