//
//  AppDelegate+init.h
//  ALFrameProject
//  该类是AppDelegate衍生类,搭配使用
//  Created by 张小明 on 2017/7/15.
//  Copyright © 2017年 张小明. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (init)


/**
 该方法用于在app中初始化你的各种类库
 */
-(void)appLibraryInit;


/**
 网络监测方法
 */
-(void)regiestNetworkListener;


/**
 app一些常用设置,比如状态栏,导航栏设置,根据需求实现
 */
-(void)appViewConfig;
@end
