//
//  CertDecryptResult.h
//  Pods
//
//  Created by AHECA on 2020/11/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CertDecryptResult : NSObject
@property (nonatomic ,assign)int  resultCode;
@property (nonatomic, strong)NSString *resultMsg;
@property (nonatomic ,strong)NSString *decryptData;
@end

NS_ASSUME_NONNULL_END
/*
 int resultCode = 0;
  String resultMsg = "";
  String decryptData = "";
 */
