//
//  ViewController.m
//  ALFrameProject
//
//  Created by 张小明 on 2017/7/15.
//  Copyright © 2017年 张小明. All rights reserved.
//

#import "ViewController.h"

#import "TestViewController.h"
@interface ViewController ()

@end

@implementation ViewController

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    
//    [LogUtil log:self logString:@"viewDidLoad"];
//    self.title=@"第一个界面";
//    // Do any additional setup after loading the view, typically from a nib.
//    UIImageView* img=[[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 50, 50)];
//    img.image=ALDEFALUT_IMAGE;
//    [self.view addSubview:img];
//    
//    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
////        [self goNextController:[[TestViewController alloc]init]];
//    });
//    
//    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(action)];
//    
//    img.userInteractionEnabled=YES;
//    [img addGestureRecognizer:tap];
//    
//}

-(void)initView{
    [LogUtil log:self logString:@"iniview"];
    UIImageView* img=[[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 50, 50)];
    img.image=ALDEFALUT_IMAGE;
    [self.view addSubview:img];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self goNextController:[[TestViewController alloc]init]];
    });
    
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(action)];
    
    img.userInteractionEnabled=YES;
    [img addGestureRecognizer:tap];
}

-(void)initData{
    [LogUtil log:self logString:@"initdata"];
}
-(void)initMasrry{
    [LogUtil log:self logString:@"initMasrry"];
}
-(void)action{
    
    [self goNextController:[[TestViewController alloc]init]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
