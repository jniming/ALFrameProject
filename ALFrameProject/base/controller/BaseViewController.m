
//
//  BaseViewController.m
//  ALFrameProject
//
//  Created by 张小明 on 2017/7/15.
//  Copyright © 2017年 张小明. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    
    //设置返回按钮,由于放在BaseNavigationController中无效,所以放在此处
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = item;
    
    
    
    [self initView];
    [self initMasrry];
    
    [self initData];
  
}

-(void)initData{}
-(void)initView{};
-(void)initMasrry{}


-(void)showProgess{
   [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
}
-(void)hidenProgess{
    [MBProgressHUD hideHUDForView:self.view animated:YES];

}



-(void)goNextController:(UIViewController *)controller{
    
    
    [self.navigationController pushViewController:controller animated:YES];
    
    
    
}


-(void)forwordController{
    
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
