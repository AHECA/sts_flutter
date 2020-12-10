//
//  SignImgResult.h
//  Pods
//
//  Created by AHECA on 2020/11/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SignImgResult : NSObject
@property (nonatomic ,assign)int  resultCode;
@property (nonatomic, strong)NSString *resultMsg;
@property (nonatomic ,strong)NSString *signImg;

@end
/*
 int resultCode = 0;
 String resultMsg = "";
 List<int> signImg;
 */

/*
 [
 @" ",
 @" ",
 @" ",
 @" ",
 @" ",
 @" ",
 ]
 
 */
NS_ASSUME_NONNULL_END
