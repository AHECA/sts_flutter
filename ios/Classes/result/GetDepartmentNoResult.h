//
//  GetDepartmentNoResult.h
//  Pods
//
//  Created by AHECA on 2020/12/9.
//

#import <Foundation/Foundation.h>
#import "StsDepartment.h"

NS_ASSUME_NONNULL_BEGIN
@interface GetDepartmentNoResult : NSObject
 /** 状态码*/
@property (nonatomic ,assign)int  resultCode;
/** 状态码信息*/
@property (nonatomic, strong)NSString *resultMsg;
 /** Token*/
@property (nonatomic ,strong)NSArray <StsDepartment*> *departmentList;
@end

NS_ASSUME_NONNULL_END
