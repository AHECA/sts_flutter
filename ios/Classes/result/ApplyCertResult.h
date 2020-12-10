//
//  ApplyCertResult.h
//  Pods
//
//  Created by AHECA on 2020/10/30.
//

#import <Foundation/Foundation.h>
#import "StsCertInfo.h"
#import "StsUserInfo.h"
#import "StsCompanyInfo.h"
NS_ASSUME_NONNULL_BEGIN

@interface ApplyCertResult : NSObject
@property (nonatomic ,assign)int  resultCode;
@property (nonatomic, strong)NSString *resultMsg;
@property (nonatomic, strong)NSString  *enCert;
@property (nonatomic, strong)NSString *signCert;
@property (nonatomic, strong)StsCertInfo  *stsCertInfo;
@property (nonatomic, strong)StsUserInfo *stsUserInfo;
@property (nonatomic, strong)StsCompanyInfo *stsCompanyInfo;

@end

NS_ASSUME_NONNULL_END
