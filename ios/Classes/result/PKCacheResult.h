//
//  PKCacheResult.h
//  Pods
//
//  Created by AHECA on 2020/11/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PKCacheResult : NSObject
@property (nonatomic ,assign)int  resultCode;
@property (nonatomic, strong)NSString *resultMsg;
@property (nonatomic ,strong)NSString *token;
@end

NS_ASSUME_NONNULL_END
/*
int resultCode = 0;
String resultMsg = "";
String token = "";
*/
