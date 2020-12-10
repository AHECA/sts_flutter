//
//  StsDepartment.h
//  Pods
//
//  Created by AHECA on 2020/12/9.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface StsDepartment : NSObject
/** 单位编号*/
@property (nonatomic, strong)NSString *departmentNo;
 /** 单位名称*/
@property (nonatomic ,strong)NSArray *departmentName;
@end

NS_ASSUME_NONNULL_END
