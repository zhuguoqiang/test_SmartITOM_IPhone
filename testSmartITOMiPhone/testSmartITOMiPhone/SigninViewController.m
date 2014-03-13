//
//  BIDViewController.m
//  MyFirstArchiever
//
//  Created by Apple001 on 14-2-28.
//  Copyright (c) 2014年 SYM. All rights reserved.
//

#import "SigninViewController.h"
#import "MenuTabViewController.h"

@interface SigninViewController ()
{
    UIImageView *imageVBackground;
    UIImageView *imageVAutoSignin;
    UIImageView *imageVRmbPsw;
    
    BOOL autoSignin;
    BOOL remember;
    
    UITableView *userTableView;
    
    MenuTabViewController *tabBarController;
    
    NSString *userName;
    NSString *password;
}

@end

@implementation SigninViewController

@synthesize logo;
@synthesize backGround;
@synthesize tfPsw;
@synthesize tfUserName;
@synthesize btnUserHistory;
@synthesize btnCleanUp;
@synthesize btnSignin;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    tabBarController = [[MenuTabViewController alloc] init];
    
    self.tfUserName.delegate = self;
    self.tfPsw.delegate = self;
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"main_background.png"]]];
    
    [self.logo setImage:[UIImage imageNamed:@"logo@2x.png"]];
    
    //signin背景框
    imageVBackground = (UIImageView *)[self.view viewWithTag:4];
//    [imageVBackground setImage:[UIImage imageNamed:@"window_bg.png"]];
 
    
    //用户名历史
    [self.btnUserHistory setImage:[UIImage imageNamed:@"dropdown_normal@2x.png"] forState:UIControlStateNormal];
    [self.btnUserHistory setImage:[UIImage imageNamed:@"dropdown_active@2x.png"] forState:UIControlStateHighlighted];
    
    //自动登陆
    imageVAutoSignin = (UIImageView *)[self.view viewWithTag:1];
    
    [self refreshCheckBox:imageVAutoSignin andCheck:autoSignin];
    
    //记住密码
    imageVRmbPsw = (UIImageView *)[self.view viewWithTag:2];
    
    [self refreshCheckBox:imageVRmbPsw andCheck:remember];
    
    //登录
    [self.btnSignin setTitle:nil forState:UIControlStateNormal];
    [self.btnSignin setBackgroundImage:[UIImage imageNamed:@"btn_signin_normal.png"] forState:UIControlStateNormal];
    [self.btnSignin setBackgroundImage:[UIImage imageNamed:@"btn_signin_active"] forState:UIControlStateHighlighted];
    
    //清除
    [self.btnCleanUp setTitle:nil forState:UIControlStateNormal];
    [self.btnCleanUp setBackgroundImage:[UIImage imageNamed:@"btn_clean_normal.png"] forState:UIControlStateNormal];
    [self.btnCleanUp setBackgroundImage:[UIImage imageNamed:@"btn_clean_active.png"] forState:UIControlStateHighlighted];
    
    //下拉列表userName
    userTableView = [[UITableView alloc] initWithFrame:CGRectMake(522, 521, 319, 0)];
    userTableView.delegate = self;
    userTableView.dataSource = self;
    userTableView.tag = 100;
    userTableView.hidden = YES;
    [self.view addSubview:userTableView];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -ButtonAction
//登录用户历史
- (IBAction)signinHistory:(id)sender
{
    if (![self.view isExclusiveTouch])
    {
        if (![self.tfUserName resignFirstResponder])
        {
                [self.tfPsw resignFirstResponder];
            }
    }
    if (userTableView == nil)
    {
        return;
    }
    
    else
    {
        [UIView animateWithDuration:0.4 animations:^{
            if(userTableView.hidden)
            {
                userTableView.frame = CGRectMake(522, 521, 319, 174);
                userTableView.hidden = NO;
            }
            else
            {
                userTableView.frame = CGRectMake(522, 521, 319, 0);

            }
        }];
    }
    NSLog(@"%@",userTableView);
}
#pragma mark unarchieced
- (IBAction)willSignin:(id)sender
{
    if (![self.view isExclusiveTouch])
    {
        if (![self.tfUserName resignFirstResponder])
        {
            [self.tfPsw resignFirstResponder];
        }
    }
    
    if ([tfUserName.text isEqualToString:@"admin"]&&[tfPsw.text isEqualToString:@"admin"])
    {
        [self performSegueWithIdentifier:@"SiginIn" sender:self];
    }
    else
    {
        NSLog(@"登录失败！！！");
    }
    
}

- (IBAction)cleanUp:(id)sender
{
    self.tfPsw.text = nil;
    self.tfUserName.text = nil;
}



-(void)refreshCheckBox:(UIImageView *)imageV andCheck:(BOOL)checked
{
    if (checked)
    {
        [imageV setImage:[UIImage imageNamed:@"checkbox_checked.png"]];
    }
    else
    {
        [imageV setImage:[UIImage imageNamed:@"checkbox_unchecked.png"]];
    }
}

#pragma mark -UITextFieldDelegate

//关闭键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

//开始编辑时触发，文本字段将成为first responder
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField.tag == 40)
    {
        textField.secureTextEntry = YES;
    }
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    
}

//返回BOOL值，指定是否允许文本字段结束编辑，当编辑结束，文本字段会让出first responder
-(BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    return YES;
}

//返回一个BOOL值指明是否允许根据用户请求清除内容
-(BOOL)textFieldShouldClear:(UITextField *)textField
{
    self.tfPsw.text = @"";
    return YES;
}

#pragma mark -UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = @"admin";
    return cell;
}

#pragma mark -UITableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 42;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.tfUserName.text = @"admin";
    [UIView animateWithDuration:0.4
                     animations:^{
                         userTableView.frame = CGRectMake(522, 521, 319, 0);
                     }
                     completion:^(BOOL finished){
                         userTableView.hidden = YES;
                     }];

}

#pragma mark -touchMethod

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:[imageVAutoSignin superview]];
    CGRect validTouchArea = imageVAutoSignin.frame;
    if (CGRectContainsPoint(validTouchArea, point))
    {
        autoSignin = !autoSignin;
        [self refreshCheckBox:imageVAutoSignin andCheck:autoSignin];
    }
    
    CGRect validTouchArea1 = imageVRmbPsw.frame;
    if (CGRectContainsPoint(validTouchArea1, point))
    {        remember = !remember;
        [self refreshCheckBox:imageVRmbPsw andCheck:remember];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    //关闭软键盘
    if (![self.view isExclusiveTouch])
    {
        if (![self.tfUserName resignFirstResponder])
        {
            [self.tfPsw resignFirstResponder];
        }
    }
    
    userTableView.hidden = YES;
}

#pragma mark -Rotate

-(BOOL)shouldAutorotate
{
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender

{
//    MenuTabViewController *tabViewC = [segue destinationViewController];
    
    
}

@end
