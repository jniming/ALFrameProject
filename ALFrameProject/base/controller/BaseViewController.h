//
//  BaseViewController.h
//  ALFrameProject
//
//  Created by 张小明 on 2017/7/15.
//  Copyright © 2017年 张小明. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 控制器的一些初始化方法
 */
@protocol initController <NSObject>
@required
/**
 初始化视图
 */
-(void)initView;


/**
 初始化数据
 */
-(void)initData;

/**
 初始化约束
 */
-(void)initMasrry;

@end

@interface BaseViewController : UIViewController<initController>



/**
 显示加载窗
 */
-(void)showProgess;

/**
 隐藏加载窗
 */
-(void)hidenProgess;
/**
 前往下一个页面
 */
-(void)goNextController:(UIViewController *)controller;


/**
 返回上一个页面
 */
-(void)forwordController;

@end
