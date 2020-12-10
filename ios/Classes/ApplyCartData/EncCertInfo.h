//
//  EncCertInfo.h
//  Pods
//
//  Created by AHECA on 2020/10/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface enc_issuerDN : NSObject
@property (nonatomic, strong)NSString *C;
@property (nonatomic, strong)NSString *CN;
@property (nonatomic, strong)NSString *L;
@property (nonatomic, strong)NSString *O;
@property (nonatomic, strong)NSString *OU;
@property (nonatomic, strong)NSString *ST;
@end

@interface  enc_subjectDN : NSObject
@property (nonatomic, strong)NSString *C;
@property (nonatomic, strong)NSString *CN;
@property (nonatomic, strong)NSString *GIVENNAME;
@property (nonatomic, strong)NSString *O;
@property (nonatomic, strong)NSString *OU;
@property (nonatomic, strong)NSString *ST;
@property (nonatomic, strong)NSString *L;
@property (nonatomic, strong)NSString  *E;
@end

@interface enc_subjectEXT : NSObject
@property (nonatomic, strong)NSString *certExt2;
@property (nonatomic, strong)NSString *certExt4;
@property (nonatomic, strong)NSString *certExt3;
@property (nonatomic, strong)NSString *certExt9;
@end


@interface EncCertInfo : NSObject
@property (nonatomic, strong)NSString  *certAlgorithm;
@property (nonatomic, strong)NSString  *certSN;
@property (nonatomic, strong)NSString  *keyUsage;
@property (nonatomic, strong)NSString  *notAfter;
@property (nonatomic, strong)NSString  *notBefore;
@property (nonatomic, strong)NSString  *publicKey;
@property (nonatomic, strong)NSString  *version;
@property (nonatomic, strong)enc_issuerDN  *issuerDN;
@property (nonatomic, strong)enc_subjectDN  *subjectDN;
@property (nonatomic ,strong)enc_subjectEXT *subjectEXT;
@end

NS_ASSUME_NONNULL_END
