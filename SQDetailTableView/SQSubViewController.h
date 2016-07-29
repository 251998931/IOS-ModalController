//
//  SQSubViewController.h
//  SQDetailTableView
//
//  Created by 小孩子 on 16/4/22.
//  Copyright © 2016年 com.shu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SQSubViewController;
@protocol SQSubViewControllerDelegate <NSObject>

//@optional
-(void)SubVC_popTopViewController:(SQSubViewController*)subVC animated:(BOOL)animated;

@end

@interface SQSubViewController : UIViewController

@property(nonatomic,assign)id<SQSubViewControllerDelegate>delegate;
@end
