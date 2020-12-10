//
//  CommonResult.h
//  Pods
//
//  Created by AHECA on 2020/11/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CommonResult : NSObject
@property (nonatomic ,assign)int  resultCode;
@property (nonatomic, strong)NSString *resultMsg;
@end

NS_ASSUME_NONNULL_END
