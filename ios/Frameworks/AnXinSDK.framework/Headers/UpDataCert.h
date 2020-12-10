//
//  UpDataCert.h
//  AnXinSDK
//
//  Created by 安徽省电子认证管理中心 on 2018/7/3.
//  Copyright © 2018年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UpDataCert : NSObject
/**签名证书*/
@property (nonatomic, copy) NSString *signCert;
/**签名证书序列号*/
@property (nonatomic, copy) NSString *signCertSerial;
/**加密证书序列号*/
@property (nonatomic, copy) NSString *encCertSerial;
/**证书生效日期*/
@property (nonatomic, copy) NSString *startDate;
/**证书失效日期*/
@property (nonatomic, copy) NSString *endDate;
/**证书状态*/
@property (nonatomic, copy) NSString *certStatus;
/**证书算法标识*/
@property (nonatomic, copy) NSString *algorithm;
/**主题*/
@property (nonatomic, copy) NSString *subjectDN;
/**扩展项*/
@property (nonatomic, copy) NSString *extensions;
/**颁发者信息*/
@property (nonatomic, copy) NSString *issuerDN;
/**版本号*/
@property (nonatomic, copy) NSString *version;
/**公钥*/
@property (nonatomic, copy) NSString *pubKey;
/**证书唯一标识*/
@property(nonatomic, strong)NSString *uniqueId;
/**加密证书*/
@property(nonatomic, strong)NSString *encCert;
/**加密证书私钥*/
@property(nonatomic, strong)NSString *encPrivateKey;
/**签名证书私钥*/
@property(nonatomic, strong)NSString *signPrivateKey;
/**证书安装码*/
@property(nonatomic, strong)NSString *lraInfo;
/**PIN*/
@property(nonatomic, strong)NSString *PINValue;
/**签名图片*/
@property(nonatomic, strong)NSString *signatureImage;

+(NSDictionary *)dictionary:(id)responseObject userID:(NSString *)userID;
@end
