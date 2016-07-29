//
//  SQSubViewController.m
//  SQDetailTableView
//
//  Created by 小孩子 on 16/4/22.
//  Copyright © 2016年 com.shu. All rights reserved.
//


//第二个控制器

#import "SQSubViewController.h"
#import "ViewController.h"
#import "SQSuperViewController.h"

@interface SQSubViewController()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView* tableView;

@end

@implementation SQSubViewController

-(void)viewWillAppear:(BOOL)animated
{
   [super viewWillAppear:animated];
   
   self.navigationController.navigationBar.hidden = YES;
}
//-(void)viewDidDisappear:(BOOL)animated
//{
//   [super viewDidDisappear:animated];
//   
//   self.navigationController.navigationBar.hidden = NO;
//}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
   
   
   UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64)];
   [btn setTitle:@"返回" forState:UIControlStateNormal];
   btn.titleLabel.textAlignment = NSTextAlignmentLeft;
   [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
   [self.view addSubview:btn];
   btn.backgroundColor = [UIColor whiteColor];
   [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];

    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(btn.frame), CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor cyanColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    
    
    UIView* view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 100)];
    view.backgroundColor = [UIColor greenColor];
    UILabel* tLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    tLabel.text = @"下拉回到首页";
    [view addSubview:tLabel];
    self.tableView.tableHeaderView= view;
   
   
    
   
}
-(void)btnClick
{
   if (self.delegate !=nil && [self.delegate respondsToSelector:@selector(SubVC_popTopViewController:animated:)]) {
      [self.delegate SubVC_popTopViewController:self animated:YES];
   }
   
  
}


#pragma mark - UITableViewDataSource
// 一共多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//每组有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 40;
    
}
//创建cell
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell* cell = [[UITableViewCell alloc] init];
    cell.textLabel.text = [NSString stringWithFormat:@"====点击push第%ld行====",indexPath.row];
    cell.backgroundColor = [UIColor yellowColor];
    return cell;
    
    
}

//动态计算行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 40;
    
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    SQSuperViewController* suVC = [[SQSuperViewController alloc] init];
   [self.navigationController pushViewController:suVC animated:YES];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    
    CGFloat a= _tableView.contentSize.height;
    CGFloat b= _tableView.frame.size.height;
    CGFloat c= _tableView.contentOffset.y;
   
   
   NSLog(@"====a===%f=====",a);
    NSLog(@"====b===%f=====",b);
    NSLog(@"====c===%f=====",c);
   if ( _tableView.contentOffset.y < -50)
        
    {
        
      
        NSLog(@"滑到顶部");
       
       [self dismissViewControllerAnimated:YES completion:^{
          
       }];
        
    }
    
}

@end
