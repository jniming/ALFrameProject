//
//  HttpManager.m
//  ALFrameProject
//
//  Created by 张小明 on 2017/7/17.
//  Copyright © 2017年 张小明. All rights reserved.
//

#import "HttpManager.h"
static NSString * const AFAppDotNetAPIBaseURLString = @"http://qs.mgonb.com:9901/mfd";

@implementation HttpManager
+(instancetype)sharedClient{
    
    static HttpManager *_sharedClient = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedClient = [[HttpManager alloc] initWithBaseURL:[NSURL URLWithString:AFAppDotNetAPIBaseURLString]];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        _sharedClient.requestSerializer=[AFHTTPRequestSerializer serializer];
        _sharedClient.responseSerializer=[AFHTTPResponseSerializer serializer];
        
    });
    
    
    
    return _sharedClient;
}

-(void)post:(NSString *)url parameters:(NSDictionary *)parameters actionBlock:(void (^)(NSDictionary *, NSError *))block{
    
    [self POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * __unused task, id JSON) {   //json 其实是NSdata 类型,, 如果我们数据没有加密的话,我们可以直接jiangjson转为字典对象,而不用先转为字符串再转nsdata对象了s
        NSDictionary * dict=[NSJSONSerialization JSONObjectWithData:JSON options:NSJSONReadingAllowFragments error:nil];  //将结果转为地点数据
        
        if (block) {
            block(dict, nil);
        }
        
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        NSLog(@"返回失败--%@",error);
        if (block) {
            block(nil, error);
        }
    }];
    
    
    
}
-(void)get:(NSString *)url parameters:(NSDictionary *)parameters actionBlock:(void (^)(NSDictionary *, NSError *))block{
    
    [self GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * __unused task, id JSON) {
        NSDictionary * dict=[NSJSONSerialization JSONObjectWithData:JSON options:NSJSONReadingAllowFragments error:nil];
        if (block) {
            block(dict, nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        NSLog(@"返回失败--%@",error);
        if (block) {
            block(nil, error);
        }
    }];
}



-(void)uploadImageFile:(UIImage *)image parameters:(NSDictionary *)parameters path:(NSString *)url actionBlock:(void (^)(NSDictionary *, NSError *))block{
    [self POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSData *imageData =UIImageJPEGRepresentation(image,1);//图片对象转为nsdata
        [formData appendPartWithFileData:imageData
                                    name:@"file"
                                fileName:@"file.jpg"
                                mimeType:@"image/jpeg"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSString *res=[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];   //将结果转为字符串
//        
//        res= [res stringByReplacingOccurrencesOfString:@"\"" withString:@""];
//        NSString * str= [LanAES aes256_decrypt:res];
//        
//        NSData* xmlData = [str dataUsingEncoding:NSUTF8StringEncoding];  //string 转nsdata
        NSDictionary * dict=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];  //将json'字符串转为字典
        if(block){
            block(dict, nil);
        }
     
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"上传失败%@",error);
        if(block){
            block(nil, error);
            
        }
    }];
    
}

-(void)uploadVideoFile:(NSData *)data path:(NSString *)url parameters:(NSDictionary *)parameters actionBlock:(void (^)(NSDictionary *, NSError *))block{
    
    
    [self POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSData *imageData =data;//图片对象转为nsdata
        [formData appendPartWithFileData:imageData
                                    name:@"file"
                                fileName:@"file.mp4"
                                mimeType:@"video/quicktime"
         ];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSString *res=[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];   //将结果转为字符串
//        
//        res= [res stringByReplacingOccurrencesOfString:@"\"" withString:@""];
//        NSString * str= [LanAES aes256_decrypt:res];
//        
//        NSData* xmlData = [str dataUsingEncoding:NSUTF8StringEncoding];  //string 转nsdata
        NSDictionary * dict=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];  //将json'字符串转为字典
        if(block){
            block(dict, nil);
        }
     
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"上传失败%@",error);
        if(block){
            block(nil, error);
            
        }
    }];
    
}
-(void)UploadAudioFile:(NSData *)data path:(NSString *)url parameters:(NSDictionary *)parameters actionBlock:(void (^)(NSDictionary *, NSError *))block{
    
    
    [self POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSData *imageData =data;//图片对象转为nsdata
        [formData appendPartWithFileData:imageData
                                    name:@"file"
                                fileName:@"file.amr"
                                mimeType:@"audio/AMR"
         ];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
      

        NSDictionary * dict=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];  //将json'字符串转为字典
        if(block){
            block(dict, nil);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"上传失败%@",error);
        if(block){
            block(nil, error);
            
        }
    }];
    
}



-(void)downFilepath:(NSString *)url parameters:(NSDictionary *)parameters actionBlock:(void (^)(NSDictionary *, NSError *))block{
    //创建请求,
    NSMutableURLRequest *req = [[AFJSONRequestSerializer serializer] requestWithMethod:@"get" URLString:url parameters: nil error:nil];
    
    //设置请求头,并设置body参数
    req.timeoutInterval= [[[NSUserDefaults standardUserDefaults] valueForKey:@"timeoutInterval"] longValue];
 
    
    [[self downloadTaskWithRequest:req progress:^(NSProgress * _Nonnull downloadProgress) {
        
        NSLog(@"下载进度：%.0f％", downloadProgress.fractionCompleted * 100);
        
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        
        
        /* 下载路径 */
        NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
        
        NSString *filename=url.lastPathComponent;
        
        NSString *filePath = [path stringByAppendingPathComponent:filename];
        
     
        return [NSURL fileURLWithPath:filePath];
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        if(!error){
            if(block){
                NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];
                [dict setObject:filePath forKey:@"filePath"];
             
                block(dict,nil);
            }
        }else{
            if(block){
                block(nil,error);
            }
        }
        
        
    }] resume];;
    
}


@end
