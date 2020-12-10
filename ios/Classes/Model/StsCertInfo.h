//
//  StsCertInfo.h
//  Pods
//
//  Created by AHECA on 2020/10/30.
//

#import <Foundation/Foundation.h>
#import "SubjectDNBean.h"
#import "IssuerDNBean.h"
#import "SubjectEXTBean.h"
NS_ASSUME_NONNULL_BEGIN
//// subjectDN
//@interface  SubjectDNBean : NSObject
//@property (nonatomic, strong)NSString *E;
//@property (nonatomic, strong)NSString *ST;
//@property (nonatomic, strong)NSString *GIVENNAME;
//@property (nonatomic, strong)NSString *C;
//@property (nonatomic, strong)NSString *L;
//@property (nonatomic, strong)NSString *OU;
//@property (nonatomic, strong)NSString *O;
//@property (nonatomic, strong)NSString *CN;
//@end
//
//// issuerDN
//@interface IssuerDNBean : NSObject
//@property (nonatomic, strong)NSString *ST;
//@property (nonatomic, strong)NSString *C;
//@property (nonatomic, strong)NSString *L;
//@property (nonatomic, strong)NSString *OU;
//@property (nonatomic, strong)NSString *O;
//@property (nonatomic, strong)NSString *CN;
//@end
//
//
//// subjectEXT
//@interface SubjectEXTBean : NSObject
//@property (nonatomic, strong)NSString *certExt2;
//@property (nonatomic, strong)NSString *certExt4;
//@property (nonatomic, strong)NSString *certExt3;
//@property (nonatomic, strong)NSString *certExt9;
//
//@end

@interface StsCertInfo : NSObject
@property (nonatomic, strong)NSString  *publicKey;
@property (nonatomic, strong)NSString  *notBefore;
@property (nonatomic, strong)NSString  *certAlgorithm;
@property (nonatomic, strong)NSString  *certSN;
@property (nonatomic, strong)NSString  *notAfter;
@property (nonatomic, strong)NSString  *keyUsage;
@property (nonatomic, strong)NSString  *version;
@property (nonatomic, strong)SubjectDNBean *subjectDN;
@property (nonatomic, strong)IssuerDNBean  *issuerDN;
@property (nonatomic, strong)SubjectEXTBean *subjectEXT;
@end

NS_ASSUME_NONNULL_END
