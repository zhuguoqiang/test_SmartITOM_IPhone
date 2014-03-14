//
//  SettingTableViewController.m
//  MyFirstArchiever
//
//  Created by Apple001 on 14-3-3.
//  Copyright (c) 2014年 SYM. All rights reserved.
//

#import "SettingTableViewController.h"

@interface SettingTableViewController ()
{
    NSMutableArray *firstSection;
    NSMutableArray *secondSection;
}

@end

@implementation SettingTableViewController

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
    
    firstSection = [[NSMutableArray alloc] initWithObjects:@"Shell工具",@"SQL",@"telnet",@"设置", nil];
    
    secondSection = [[NSMutableArray alloc] initWithObjects:@"意见反馈",@"关于我们", nil];
    
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

    // Return the number of rows in the section.
    if (section == 0)
    {
        return firstSection.count;
    }
    else
    {
    return secondSection.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    if (indexPath.section == 0)
    {
        cell.textLabel.text = [firstSection objectAtIndex:indexPath.row];
    }
    else
    {
        cell.textLabel.text = [secondSection objectAtIndex:indexPath.row];
    }
    
    cell.textLabel.font = [UIFont boldSystemFontOfSize:30];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}


-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return @"   ";
    }
    else
    {;
        return @"   ";
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 126;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 40;
    }
    else
    {
        return 150;
    }
}

#pragma mark - tableview Delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0)
    {
        [self performSegueWithIdentifier:@"ShellTool" sender:self];
    }
    if (indexPath.section == 0 && indexPath.row == 2)
    {
        [self performSegueWithIdentifier:@"TelnetTool" sender:self];
    }
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

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
    if ([segue.identifier isEqualToString:@"ShellTool"])
    {
        UIViewController *viewController = (UIViewController *)segue.destinationViewController;
//        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 400, 400)];
//        [viewController.view addSubview:view];
        UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 65, 400, 400)];
        textView.text = @"SSH:ipad@10.10.152.18";
        textView.font = [UIFont boldSystemFontOfSize:30];
        [viewController.view addSubview:textView];
        
    }
    if ([segue.identifier isEqualToString:@"TelnetTool"])
    {
        UIViewController *viewController = (UIViewController *)segue.destinationViewController;
        UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 65, 400, 400)];
        textView.text = @"telnet 61.152.158.132.23";
        textView.font = [UIFont boldSystemFontOfSize:30];
        [viewController.view addSubview:textView];
        
    }

}


@end
