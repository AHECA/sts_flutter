//
//  SubjectDNBean.h
//  sts_flutter
//
//  Created by AHECA on 2020/12/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SubjectDNBean : NSObject
@property (nonatomic, strong)NSString *E;
@property (nonatomic, strong)NSString *ST;
@property (nonatomic, strong)NSString *GIVENNAME;
@property (nonatomic, strong)NSString *C;
@property (nonatomic, strong)NSString *L;
@property (nonatomic, strong)NSString *OU;
@property (nonatomic, strong)NSString *O;
@property (nonatomic, strong)NSString *CN;
@end

NS_ASSUME_NONNULL_END
