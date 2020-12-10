//
//  GetCertResult.h
//  Pods
//
//  Created by AHECA on 2020/10/30.
//

#import <Foundation/Foundation.h>
#import "StsCertInfo.h"
NS_ASSUME_NONNULL_BEGIN

@interface GetCertResult : NSObject
@property (nonatomic ,assign)int  resultCode;
@property (nonatomic, strong)NSString *resultMsg;
@property (nonatomic, strong)NSString  *enCert;
@property (nonatomic, strong)NSString *signCert;
@property (nonatomic, strong)StsCertInfo  *stsCertInfo;

@end

NS_ASSUME_NONNULL_END
