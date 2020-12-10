//
//  CertSignResult.h
//  Pods
//
//  Created by AHECA on 2020/11/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CertSignResult : NSObject
@property (nonatomic ,assign)int  resultCode;
@property (nonatomic, strong)NSString *resultMsg;
@property (nonatomic ,strong)NSString *signData;
@property (nonatomic ,strong)NSString *signCert;
@property (nonatomic ,strong)NSString *token;

@end

NS_ASSUME_NONNULL_END
