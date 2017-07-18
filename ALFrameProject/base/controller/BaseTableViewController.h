//
//  BaseTableViewController.h
//  ALFrameProject
//
//  Created by 张小明 on 2017/7/17.
//  Copyright © 2017年 张小明. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@interface BaseTableViewController :BaseViewController<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic)UITableView *tableView;



//-(void)itemSelectView;

@end
