//
//  AddAttentionViewController.m
//  testSmartITOMiPhone
//
//  Created by Apple001 on 14-3-10.
//  Copyright (c) 2014年 Apple002. All rights reserved.
//

#import "AddAttentionViewController.h"

@interface AddAttentionViewController ()

@end

@implementation AddAttentionViewController

@synthesize mArr1;
@synthesize mArr2;
@synthesize mTableView;
@synthesize pMtableView;
@synthesize mSearchBar;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    UITableView *pTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 65, self.view.frame.size.width,self.view.frame.size.height) style:UITableViewStylePlain];
    
    self.mTableView = pTable;
    
    self.mSearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
    //将表视图的表头设为搜索框
    self.mTableView.tableHeaderView = self.mSearchBar;
    
    self.mTableView.delegate = self;
    self.mTableView.dataSource = self;
    self.mSearchBar.delegate = self;
    
    [self.view addSubview:self.mTableView];
    
    self.mArr1 = [[NSMutableArray alloc] initWithCapacity:60];
    self.mArr2 = [[NSMutableArray alloc] initWithCapacity:60];
    
    for (int i =1 ; i<10; i++)
    {
        NSString *pstr = [NSString stringWithFormat:@"设备%d",i];
        
        [self.mArr1 addObject:pstr];
        
        [self.mArr2 addObject:pstr];
    }
    

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - DataSource Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 20;
}

#pragma mark UITableView Delegate

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.mArr2.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *pstr = @"hellow";
    UITableViewCell *pCell = [tableView dequeueReusableCellWithIdentifier:pstr];
    if (pCell == nil)
    {
        pCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:pstr];
    }
    
    NSUInteger cellRow = [indexPath row];
    
    pCell.textLabel.text = [self.mArr2 objectAtIndex:cellRow];
    pCell.textLabel.textColor = [UIColor greenColor];
    pCell.detailTextLabel.textColor = [UIColor blackColor];
    pCell.detailTextLabel.text = @"detailTextField";
    
    return pCell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//设置表头标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"所有设备：";
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.delegate setValue:[mArr2 objectAtIndex:indexPath.row]];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"通知" message:[NSString stringWithFormat:@"You have add %@",[self.mArr2 objectAtIndex:indexPath.row]] delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alert show];
    
}

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.mSearchBar resignFirstResponder];
    return indexPath;
}

////设置表尾标题
//-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
//{
//    return @"Footer";
//}

#pragma mark -UISearcherBar Delegate
//在搜索框内搜索内容，并展示搜索结果
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    //移除mArr2中所有元素，来存放搜索结果
    [self.mArr2 removeAllObjects];
    //对数组mArr1遍历，看数组中是否包含搜索框里的内容
    for(NSString *pstrin in self.mArr1)
    {
        //如果包含搜索框里的内容，就把数组中的元素添加到mArr2中
        if([pstrin isEqualToString:searchBar.text])
        {
            [self.mArr2 addObject:pstrin];
        }
    }
//    NSLog(@"%@",self.mArr2);
    [self.mSearchBar resignFirstResponder];
    //展示搜索结果
    [self.mTableView reloadData];
}
     
//- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
//{
//    if (searchBar.text == nil)
//    {
//        mArr2 = mArr1;
//
//    }
//    [self.mTableView reloadData];
//    NSLog(@"23");
//}

//-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    if (self.mSearchBar.text == nil)
//   {
//       mArr2 = mArr1;
//
//    }
//   [self.mTableView reloadData];
//    NSLog(@"%@",mArr2);
//    [self.mSearchBar resignFirstResponder];
//}


@end
