//
//  AXUserInfo.h
//  AnXinSDK
//
//  Created by AHECA on 2020/10/9.
//  Copyright © 2020 AHECA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AXSignatureVC.h"
#import "AXEnumType.h"


typedef void (^CallBack)(id response);
typedef void (^ErrorBack)(NSError *error);

@interface AXUserInfo : NSObject

+ (AXUserInfo*) sharedInstance;

@property(nonatomic, assign)BOOL touchBool;

@property(nonatomic, copy)CallBack success;

@property(nonatomic, copy)ErrorBack err;

/**
 项目配置

 @param app_key app_key
 @param secretKey secretKey
 */
-(void)AppWithApp_key:(NSString *)app_key
            SecretKey:(NSString *)secretKey
              baseURL:(NSString *)baseURL;

/**
获取用户唯一标识
 @param user_ID  User_ID
*/
-(void)ApplyWithPersonUser_ID:(NSString *)user_ID;

/**
 获取设备唯一标识
 @return 返回设备唯一标识
 */
+(NSString *)GetPhone_IDFV;

/**
 获取证书信息（本地）
 @return 证书信息
 
 */
-(NSDictionary *)GetCertificateInformation;

/**
 判断证书是否存在
 @return 返回信息
 
 */
-(BOOL)isExistCertWithUserID;


/**
 清除本地证书信息
 
 */
-(BOOL)clearCertinfoWithUserID;

/**
修改PIN密码
@param success success

*/
-(void)ChangePasswordWithsuccess:(CallBack)success;


/**
  查询指纹状态
 */
- (void)QueryFingerprintisStatus:(void (^)(BOOL isBool))status;
 
/**
指纹开关
@param isbool 开关
@param success success

*/
- (void)FingerprinSwtitchWithisbool:(BOOL )isbool
                            Success:(CallBack)success;


/**
个人证书申请
@param user_name 用户名（必传）
@param card_num 证件号（必传）
@param phone_num 手机号
@param card_type 证件类型（必传）
@param user_city 城市
@param user_email 邮箱

*/
-(void)ApplyWithPersonUser_name:(NSString *)user_name
                       card_num:(NSString *)card_num
                      phone_num:(NSString *)phone_num
                      card_type:(CardType)card_type
                      user_city:(NSString *)user_city
                     user_email:(NSString *)user_email
                        dept_no:(NSString *)dept_no
                      cert_ext2:(NSString *)cert_ext2
                      cert_ext3:(NSString *)cert_ext3
                      cert_ext4:(NSString *)cert_ext4
                        success:(void(^)(id response))success
                        err:(void(^)(NSError *error))err;


/**
企业证书申请
@param user_name 企业名称（必传）
@param legal_person 法人姓名
@param ent_register_no 统一社会代码号
@param card_num 法人身份证号
@param phone_num 法人联系电话
@param user_email 企业邮箱

*/
-(void)ApplyWithENTUser_name:(NSString *)user_name
                legal_person:(NSString *)legal_person
             ent_register_no:(NSString *)ent_register_no
                    card_num:(NSString *)card_num
                   phone_num:(NSString *)phone_num
                  user_email:(NSString *)user_email
                     dept_no:(NSString *)dept_no cert_ext2:(NSString *)cert_ext2
                   cert_ext3:(NSString *)cert_ext3 cert_ext4:(NSString *)cert_ext4
                     success:(void(^)(id response))success
                      err:(void(^)(NSError *error))err;


/**
虚拟证书申请
@param user_name 用户名（必传）
@param cert_ou nil
@param cert_o nil
@param cert_s nil
@param cert_l nil
@param cert_e nil

*/
-(void)ApplyWithVHUser_name:(NSString *)user_name
                    cert_ou:(NSString *)cert_ou
                     cert_o:(NSString *)cert_o
                     cert_s:(NSString *)cert_s
                     cert_l:(NSString *)cert_l
                     cert_e:(NSString *)cert_e
                  cert_ext2:(NSString *)cert_ext2
                  cert_ext3:(NSString *)cert_ext3
                  cert_ext4:(NSString *)cert_ext4
                success:(void(^)(id response))success
                err:(void(^)(NSError *error))err;

/**
 原文签名
 @param data 原文数据
 @param pn 项目编号
 @param data_type 签名数据类型
 @param success success
 @param error error
 
 */
-(void)passSignWithdata:(NSString *)data
                       pn:(NSString *)pn
                   data_type:(DataType)data_type
                  data_Format:(NSString *)data_Format
                  success:(CallBack)success
                    error:(ErrorBack)error;

/**
 原文验签
 @param data 原文数据
 @param sign_data 签名结果数据
 @param data_type 数据类型
 @param success success
 @param err err

 */
-(void)VerifyWithdata:(NSString *)data
                 sign_data:(NSString *)sign_data
                 data_type:(DataType)data_type
                data_Format:(NSString *)data_Format
                success:(CallBack)success
                  error:(ErrorBack)err;


/**
 原文加密

 @param data 加密数据
 @param data_type 数据类型
 @param success success
 @param err err
 
 */
-(void)EncryptWithdata:(NSString *)data
                  data_type:(DataType)data_type
                data_Format:(NSString *)data_Format
                 success:(CallBack)success
                   error:(ErrorBack)err;

/**
 原文解密
 @param data 解密数据
 @param data_type 数据类型
 @param success success
 @param err err
 
 */
-(void)passDecryptWithdata:(NSString *)data
                      data_type:(DataType)data_type
                    data_Format:(NSString *)data_Format
                     success:(CallBack)success
                       error:(ErrorBack)err;

/**
 重置PIN码 -->  企业&个人
 @param user_name 用户名/企业名
 @param ent_register_no 企业税号
 @param card_type 证件类型
 @param card_num 证件号码
 @param phone_num 手机号码
 
 */
-(void)PINRestWithuser_name:(NSString *)user_name
           ent_register_no:(NSString *)ent_register_no
                 card_type:(CardType)card_type
                  card_num:(NSString *)card_num
                 phone_num:(NSString *)phone_num;




/**
 重置PIN码证书密码
 @param user_name 用户名/企业名
 @param ent_register_no 企业税号
 @param card_type 证件类型
 @param card_num 证件号码
 @param phone_num 手机号码
 
*/
-(void)PasswordResetWithuser_name:(NSString *)user_name
                  ent_register_no:(NSString *)ent_register_no
                        card_type:(CardType)card_type
                         card_num:(NSString *)card_num
                        phone_num:(NSString *)phone_num
                           handle:(id)handle
                         callback:(SEL)callback
                            error:(SEL)err;


/**
重置PIN码审核结果查询
 
*/
-(void)PasswordResetResultWithunique_reset:(NSString *)unique_reset
                                 handle:(id)handle
                               callback:(SEL)callback
                                  error:(SEL)err;


/**
 PIN码重置审核结果102短信验证码
 @param verify_code  短信验证码
 @param success success
 @param err err
 
 */
-(void)Password102ResetWithunique_reset:(NSString *)unique_reset
                      verify_code:(NSString *)verify_code
                          success:(CallBack)success
                            error:(ErrorBack)err;
/**
 更新证书  --> 企业 &个人
 @param user_name 用户名
 @param phone_num 手机号码
 @param success success
 @param err err
 
 */
-(void)CertUpdateWithuser_name:(NSString *)user_name
                     phone_num:(NSString *)phone_num
                     user_city:(NSString *)user_city
                    user_email:(NSString *)user_email
                    success:(CallBack)success
                      error:(ErrorBack)err;

/**
 变更证书状态
 @param update_type 变更类型
 @param success success
 @param err err
 
 */
-(void)CertStatusUpdateWithupdate_type:(CertStatus)update_type
                          success:(CallBack)success
                            error:(ErrorBack)err;

/**
 延期证书
 @param success success
 @param err err
 
 */
-(void)certPostponeWithsuccess:(CallBack)success
                        error:(ErrorBack)err;


/**
 查询证书
 @param success success
 @param err err
 
 */
-(void)QueryCertInfoWithsuccess:(CallBack)success
                         error:(ErrorBack)err;


/**
 检查证书
 @param success success
 @param  err  error
 
*/
-(void)CheckCertWithSuccess:(CallBack)success
                      error:(ErrorBack)err;


/**
 取消密钥缓存
 @param pn 项目编号
 @param success success
 @param err err
 
 */
-(void)CancleCachePriKeyWithpn:(NSString *)pn
                           success:(CallBack)success
                             error:(ErrorBack)err;

/**
 设置密钥缓存
 @param pn 项目编号
 @param success success
 @param err err
*/
-(void)passCachePriKeyWithpn:(NSString *)pn
                     success:(CallBack)success
                       error:(ErrorBack)err;

/**
 人脸配置信息

@param fileName FileName
@param LicenseId ID
*/
-(void)faceWithFileName:(NSString *)fileName
              LicenseId:(NSString *)LicenseId;




/**
 登录
 @param data 数据
 @param pn 项目编号
 @param data_type 数据类型
 @param success success
 @param err err
 */
-(void)PassLoginMobileWithdata:(NSString *)data
                              pn:(NSString *)pn
                      data_type:(DataType)data_type
                      data_Format:(NSString *)data_Format
                         success:(CallBack)success
                           error:(ErrorBack)err;


/**
 签章
 @param pn 项目编号
 @param success success
 @param err err
 
 */
-(void)PassCertSealWithdata:(NSString *)data
                           pn:(NSString *)pn
                    data_type:(DataType)data_type
                      success:(CallBack)success
                        error:(ErrorBack)err;

/**
 签章数据存储
 @param pn 项目编号
 @param success success
 @param err err
 
 */
-(void)passCertSealAndPicOrSignWithpn:(NSString *)pn
                              success:(CallBack)success
                                error:(ErrorBack)err;




/**
 获取解绑二维码
 @param success success
 @param err err
 
 */
-(void)GetQrcodeWithsuccess:(CallBack)success
                     error:(ErrorBack)err;


/**
 解绑
 @param QCCodeString 二维码数据
 @param success success
 @param err err
 
*/
-(void)UntiePhoneWithQCCode:(NSString *)QCCodeString
                           success:(CallBack)success
                           error:(ErrorBack)err;



/**
 
 签名面板（设置后存储到服务器）
 @param success success
 @param err err
 
 */
-(void)ReturnServerSignatureImageWithsuccess:(CallBack)success
                                error:(ErrorBack)err;


/**
 签名面板（本地设置返回签名图片）
 
 */
-(void)ReturnSignImage:(void (^)(UIImage *Image))Image;
  
/**
 签名图片 数据存储 data_base64图片
 @param data_base64 签名图片base64编码字符串
 @param success success
 @param err err
 */
-(void)passCertSignAndPicOrSignWithData_base64:(NSString *)data_base64
                          success:(CallBack)success
                            error:(ErrorBack)err;

/**
 签名图片数据获取
 @param success success
 
 */
-(void)GetCertSignAndPicOrSignWithsuccess:(CallBack)success
                                error:(ErrorBack)err;

/**
 签名数据删除
 @param type 类型数据
 @param data_id 数据ID
 @param success success
 @param err err
 */
-(void)ConformGetByIDWithType:(NSString *)type
                      data_id:(NSString *)data_id
                      success:(CallBack)success
                        error:(ErrorBack)err;
  


/**
 二维码登录
 @param QCCodeString 二维码数据
 @param success success
 @param err err
 
 */
-(void)PassQRCodeLoginWithQCCode:(NSString *)QCCodeString
                         success:(CallBack)success
                           error:(ErrorBack)err;

/**
 扫码签名
 @param success success
 @param err err

 */
-(void)passQRCodeSignWtihQCCode:(NSString *)QCCodeString
                        success:(CallBack)success
                          error:(ErrorBack)err;


/**
 @ 获取单位信息
 @param success success
 @param  err  error
 
*/
-(void)GetDeptInfoWithCompletion:(CallBack)success
                           error:(ErrorBack)err;

 /**
  预支下载证书
 @param success success
 @param deptNo 单位编号
 */
- (void)GetAdvanceDownloadCertificatewhitdeptNo:(NSString *)deptNo
                                        Success:(CallBack)success;


@end

