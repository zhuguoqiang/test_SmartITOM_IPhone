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
    
    
    UIBarButtonItem *leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"删除" style:UIBarButtonItemStylePlain target:self action:@selector(deleteSomething:)];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;

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

- (void) deleteSomething:(id)send
{
    [self.tableView setEditing:!self.tableView.editing animated:YES];
    if (self.tableView.editing)
    {
        [self.navigationItem.leftBarButtonItem setTitle:@"完成"];
    }
    else
    {
        [self.navigationItem.leftBarButtonItem setTitle:@"删除"];
    }
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [device removeObjectAtIndex:indexPath.row];
    
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1)
    {
        [self performSegueWithIdentifier:@"FirstSection" sender:self];
    }
    else if (indexPath.section == 0)
    {
        [self performSegueWithIdentifier:@"SecondSection" sender:self];
    }
}

/*

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleNone;
}

// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    NSInteger fromRow = fromIndexPath.row;
    NSInteger toRow = toIndexPath.row;
    
    id object = [device objectAtIndex:fromRow];
    [device removeObjectAtIndex:fromRow];
    [device insertObject:object atIndex:toRow];
}



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
