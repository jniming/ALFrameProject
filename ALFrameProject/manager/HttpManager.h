//
//  HttpManager.h
//  ALFrameProject
//
//  Created by 张小明 on 2017/7/17.
//  Copyright © 2017年 张小明. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"
@interface HttpManager : AFHTTPSessionManager

/**
 post 请求,

 @param url 请求地址
 @param parameters 请求参数,字典类型
 @param block 回调block
 */
- (void)post:(NSString *) url parameters:(NSDictionary *)parameters actionBlock:(void (^)(NSDictionary *posts, NSError *error))block;

/**
 get请求

 @param url 请求地址
 @param parameters 请求参数,字典类型
 @param block 回调block
 */
- (void)get:(NSString *) url parameters:(NSDictionary *)parameters actionBlock:(void (^)(NSDictionary *posts, NSError *error))block;


/**
 文件下载

 @param url 下载地址
 @param parameters 下载参数
 @param block nil
 */
-(void)downFilepath:(NSString *)url parameters:(NSDictionary *)parameters actionBlock:(void (^)(NSDictionary *, NSError *))block;



/**
 图片上传

 @param image 上传的图片对象
 @param parameters 上传的参数
 @param url 上传服务器地址
 @param block 回调block
 */
-(void)uploadImageFile:(UIImage *) image parameters:(NSDictionary *)parameters path:(NSString *) url actionBlock:(void (^)(NSDictionary *posts, NSError *error))block;


/**
 视频上传,MP4格式

 @param data 上传的音频数据
 @param url 上传的服务器地址
 @param parameters 参数
 @param block 回调block
 */
-(void)uploadVideoFile:(NSData *)data path:(NSString *)url parameters:(NSDictionary *)parameters actionBlock:(void (^)(NSDictionary *posts, NSError *error))block;

/**
 音频上传,amr格式
 
 @param data 上传的音频数据
 @param url 上传的服务器地址
 @param parameters 参数
 @param block 回调block
 */
-(void)uploadAudioFile:(NSData *)data path:(NSString *)url parameters:(NSDictionary *)parameters actionBlock:(void (^)(NSDictionary *, NSError *))block;
@end
