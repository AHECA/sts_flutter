//
//  ApplyCertModel.h
//  Pods
//
//  Created by AHECA on 2020/10/30.
//

#import <Foundation/Foundation.h>
#import "SignCertInfo.h"
#import "EncCertInfo.h"
NS_ASSUME_NONNULL_BEGIN

@interface ApplyCertModel : NSObject
@property (nonatomic, strong)NSString  *PINValue;
@property (nonatomic, strong)NSString  *encCert;
@property (nonatomic, strong)NSString *encPrivateKey;
@property (nonatomic, strong)NSString *lraInfo;
@property (nonatomic, strong)NSString *rtnCode;
@property (nonatomic,strong)NSString  *rtnMsg;
@property (nonatomic, strong)NSString *signCert;
@property (nonatomic, strong)NSString *signPrivateKey;
@property (nonatomic, strong)NSString*uniqueId;
@property (nonatomic, strong)SignCertInfo *signCertInfo;
@property (nonatomic, strong)EncCertInfo  *encCertInfo;
@end

NS_ASSUME_NONNULL_END
