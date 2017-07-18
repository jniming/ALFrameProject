//
//  UIImage+AL.h
//  ALFrameProject
//
//  Created by 张小明 on 2017/7/17.
//  Copyright © 2017年 张小明. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <Accelerate/Accelerate.h>
@interface UIImage (AL)

/**
 根据图片尺寸压缩图片

 @param source_image nil
 @param maxSize nil
 @return nil
 */
+ (NSData *)resetSizeOfImageData:(UIImage *)source_image maxSize:(NSInteger)maxSize;


/**
 根据视频url获取第一帧图像

 @param videoURL 视频url
 @param time 时间
 @return nil
 */
+ (UIImage*) thumbnailImageForVideo:(NSURL *)videoURL atTime:(NSTimeInterval)time;
//高斯模糊效果
/**
 图片的高斯模糊

 @param image nil
 @param blur nil
 @return nil
 */
+(UIImage *)boxblurImage:(UIImage *)image withBlurNumber:(CGFloat)blur;

@end
