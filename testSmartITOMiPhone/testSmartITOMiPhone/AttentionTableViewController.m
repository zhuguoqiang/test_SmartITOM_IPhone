//
//  AttentionTableViewController.m
//  MyFirstArchiever
//
//  Created by Apple001 on 14-3-3.
//  Copyright (c) 2014年 SYM. All rights reserved.
//

#import "AttentionTableViewController.h"
#import "AttentionTableViewCell.h"

@interface AttentionTableViewController ()
{
    NSMutableArray *device;
    NSMutableArray *report;
}

@end

@implementation AttentionTableViewController

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
    
 
    
    device = [[NSMutableArray alloc] initWithObjects:@"思科路由器MD131",@"联想主机E49",@"MySql",@"iMac",@"IBM服务器", nil];
    report = [[NSMutableArray alloc] initWithObjects:@"Mem Top10",@"Cpu Top10"@"告警 Top10", nil];

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
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return device.count;
    }
    else
        return report.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"AttentionTableViewCell";
    AttentionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.imageView.image = [UIImage imageNamed:@"alarm_lamp@2x.png"];
    if (indexPath.section == 0)
    {
        cell.detailLabel.text = [device objectAtIndex:indexPath.row];
    }
    else
    {
        cell.detailLabel.text = [report objectAtIndex:indexPath.row];
    }
    
    return cell;
}

#pragma mark -tableViewDelegate

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return @"设备";
    }
    else
        return @"报表";
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 80;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"AddAttentionViewController"])
    {
        AddAttentionViewController *addAttentionViewController = segue.destinationViewController;
        addAttentionViewController.delegate = self;
    }
}



#pragma mark -insertObject Delegate
-(void)setValue:(NSString *)object
{
    NSArray *array = [[NSArray alloc] initWithArray:device];
    int flag = 0;
    for (NSString *string in array)
    {
        if ([string isEqualToString:object])
            flag = 1;
    }
    if (flag == 0)
    {
        [device addObject:object];
    }
    [self.tableView reloadData];
//    NSLog(@"done");
}

@end
