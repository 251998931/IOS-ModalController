//
//  ViewController.m
//  SQDetailTableView
//
//  Created by 小孩子 on 16/4/22.
//  Copyright © 2016年 com.shu. All rights reserved.
//

#import "ViewController.h"
#import "SQSuperViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 80, 100, 100)];
    [self.view addSubview:btn];
    btn.backgroundColor = [UIColor orangeColor];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)btnClick
{
    SQSuperViewController* suVC = [[SQSuperViewController alloc] init];
    [self.navigationController pushViewController:suVC animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
