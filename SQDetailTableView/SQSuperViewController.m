//
//  SQSuperViewController.m
//  SQDetailTableView
//
//  Created by _CZ on 16/4/25.
//  Copyright © 2016年 com.shu. All rights reserved.
//

//第一个控制器


#import "SQSuperViewController.h"
#import "SQSubViewController.h"

@interface SQSuperViewController()<UITableViewDataSource,UITableViewDelegate,SQSubViewControllerDelegate>
@property(nonatomic,strong)UITableView* tableView;

@end

@implementation SQSuperViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationController.navigationBar.hidden = NO;
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor cyanColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    
    
    UIView* view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 100)];
    view.backgroundColor = [UIColor greenColor];
    UILabel* tLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    tLabel.text = @"上拉查看详情";
    [view addSubview:tLabel];
    self.tableView.tableFooterView = view;
    
    
    
}

#pragma mark - SQSubViewControllerDelegate
-(void)SubVC_popTopViewController:(SQSubViewController *)subVC animated:(BOOL)animated
{
    [subVC dismissViewControllerAnimated:NO completion:^{
          [self.navigationController popViewControllerAnimated:animated];
    }];
  
    
   
    
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
    
    return 10;
    
}
//创建cell
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell* cell = [[UITableViewCell alloc] init];
    if (indexPath.row%2==0) {
        cell.backgroundColor = [UIColor orangeColor];
    }else
    {
        cell.backgroundColor = [UIColor yellowColor];
    }
    return cell;
    
    
}

//动态计算行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 80;
    
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    
    
    CGPoint contentOffsetPoint = _tableView.contentOffset;
    
    CGRect frame = _tableView.frame;
    
    
    
    
    //    if ( _tableView.contentSize.height - _tableView.contentOffset.y <=_tableView.frame.size.height)
    //
    //    {
    //
    //        NSLog(@"scroll to the end");
    //
    //
    //    }
    
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    
    
    
    
    if ( _tableView.contentSize.height - _tableView.contentOffset.y +80<=_tableView.frame.size.height)
        
    {
        
        NSLog(@"scroll to the end");
        
        SQSubViewController* vc = [[SQSubViewController alloc] init];
        vc.delegate = self;
//        [self.navigationController presentViewController:vc animated:YES completion:^{
//            
//        }];
        
        UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:vc];
        [self presentViewController:nav animated:YES completion:^{
            
        }];
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
