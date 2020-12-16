#import "StsFlutterPlugin.h"
#import <AnXinSDK/AnXinSDK.h>
#import "FaceParameterConfig.h"
#import "MJExtension.h"
#import "ApplyCertModel.h"
#import "ApplyCertResult.h"
#import "GetCertResult.h"
#import "StsCertInfo.h"
#import "CommonResult.h"
#import "CertLoginResult.h"
#import "CertSignResult.h"
#import "CertEncryptResult.h"
#import "GetDepartmentNoResult.h"
#import "CertDecryptResult.h"
#import "CertSealResult.h"
#import "PKCacheResult.h"
#import "SignImgResult.h"
#import "StsCertInfo.h"
#import "SubjectEXTBean.h"

@implementation StsFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel* channel = [FlutterMethodChannel
                                     methodChannelWithName:@"sts_flutter"
                                     binaryMessenger:[registrar messenger]];
    StsFlutterPlugin* instance = [[StsFlutterPlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
    
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {

    if ([@"init" isEqualToString:call.method])  //项目配置
    {
        NSString * baseUrl = call.arguments[@"baseUrl"];
        NSString * stsAppKey = call.arguments[@"stsAppKey"];
        NSString * stsSecretKey = call.arguments[@"stsSecretKey"];
        
        [[AXUserInfo sharedInstance] AppWithApp_key:stsAppKey SecretKey:stsSecretKey baseURL:baseUrl];
        result(@"");
    }
    
    else if ([@"initUseId" isEqualToString:call.method])  //用户唯一标识
    {
        NSString * useId = call.arguments[@"useId"];
        
        [[AXUserInfo sharedInstance]ApplyWithPersonUser_ID:useId];
        result(@"");
    }
    
    else if ([@"initFace" isEqualToString:call.method])  //身份认证人脸识别配置信息
    {
        NSString * fileId = call.arguments[@"id"];
        NSString * fileName = call.arguments[@"fileName"];
        
        [[AXUserInfo sharedInstance] faceWithFileName:fileName LicenseId:fileId];
        result(@"");
    }
    
    else if ([@"initThemeColor" isEqualToString:call.method]) //深色模式
    {
        // NSNumber * color = call.arguments[@"color"];
        result(@"");
    }
    
    else if ([@"getDeviceID" isEqualToString:call.method]) //设备唯一标识
    {
        result([AXUserInfo GetPhone_IDFV]);
    }
    
    else if ([@"isLocalCertExist" isEqualToString:call.method])  //证书是否存在
    {
        BOOL isBool = [[AXUserInfo sharedInstance] isExistCertWithUserID];
        result([NSNumber numberWithBool:isBool]);
    }
    
    else if ([@"checkCert" isEqualToString:call.method])  //检查证书
    {
        [[AXUserInfo sharedInstance]CheckCertWithSuccess:^(id response) {
            
            NSDictionary *dic = (NSDictionary *)response;
            CommonResult *model = [[CommonResult alloc]init];
            
            model.resultCode = [[dic objectForKey:@"rtnCode"] intValue];
            model.resultMsg =  [dic objectForKey:@"rtnMsg"];
            
            NSString *jsonString = [model mj_JSONString];
            result(jsonString);
            
        } error:^(NSError *error) {
            
        }];
        
    }
    
    else if ([@"clearCert" isEqualToString:call.method])  //注销清除本地证书
    {
        
        BOOL isBool =  [[AXUserInfo sharedInstance] clearCertinfoWithUserID];
        NSNumber *Bool = [NSNumber numberWithInt:isBool];
        CommonResult *model = [[CommonResult alloc]init];
        model.resultCode = [Bool intValue];
        if (model.resultCode == 1)  {
            model.resultMsg = @"本地证书已清除";
        }
        
        NSString *jsonString = [model mj_JSONString];
        result(jsonString);// CommonResult => JsonString {"resultCode": int, "resultMsg": NSString}
    }
    
    else if ([@"applyPersonalCert" isEqualToString:call.method]) //申请个人证书
    {
        
        NSString  * stsUserInfo = call.arguments[@"stsUserInfo"];
        NSDictionary *stsUserInfo_dic = [stsUserInfo  mj_JSONObject];
        
        NSString  *userName  = [stsUserInfo_dic objectForKey:@"userName"];
        NSString  *cardNum   = [stsUserInfo_dic objectForKey:@"cardNum"];
        NSString  *phoneNum  = [stsUserInfo_dic objectForKey:@"phoneNum"];
        NSString  *userCity  = [stsUserInfo_dic objectForKey:@"userCity"];
        NSString  *userEmail  = [stsUserInfo_dic objectForKey:@"userEmail"];
        NSString  *departmentNo = [stsUserInfo_dic objectForKey:@"departmentNo"];
        NSString  *certExt2  = [stsUserInfo_dic objectForKey:@"certExt2"];
        NSString  *certExt3  = [stsUserInfo_dic objectForKey:@"certExt3"];
        NSString  *certExt4  = [stsUserInfo_dic objectForKey:@"certExt4"];
        NSString  *cardtype  = [stsUserInfo_dic objectForKey:@"cardType"];
        
        NSUInteger  card = 0;
        if  ([cardtype isEqualToString:@"00"]) {
            card = IDCard;
            
        }else if ([cardtype isEqualToString:@"01"]){
            card = InterimIDCard;
            
        }else if ([cardtype isEqualToString:@"02"]){
            card = HouseholdRegister;
            
        }else if ([cardtype isEqualToString:@"03"]){
            card = Passport;
            
        }else if ([cardtype isEqualToString:@"04"]){
            card = SoldierIDCard;
            
        }else if ([cardtype isEqualToString:@"05"]){
            card = SoldierIDCard;
            
        }
        
        
        [[AXUserInfo sharedInstance]ApplyWithPersonUser_name:userName card_num:cardNum phone_num:phoneNum card_type:card user_city:userCity user_email:userEmail dept_no:departmentNo cert_ext2:certExt2 cert_ext3:certExt3 cert_ext4:certExt4 success:^(id response) {
            
            ApplyCertModel *model = [ApplyCertModel mj_objectWithKeyValues:response];
            
            ApplyCertResult *modleCart = [[ApplyCertResult alloc]init];
            modleCart.enCert   = model.encCert;
            modleCart.signCert = model.signCert;
            
            modleCart.stsCertInfo = (id) model.signCertInfo;
            
            if ([model.rtnCode intValue] == 1) {
                modleCart.resultCode  = 1;
                modleCart.resultMsg  = [self nullToString:@"成功"];
            }else{
                modleCart.resultCode  = [model.rtnCode intValue];
                modleCart.resultMsg  = [self nullToString:model.rtnMsg];
            }
            
            NSString *jsonStr = [modleCart mj_JSONString];
            result(jsonStr);
            
        } err:^(NSError *error) {
            
            
        }];
        
    }
    else if ([@"applyCompanyCert" isEqualToString:call.method])  //企业申请证书
    {
        // NSString * stsCompanyInfo = call.arguments[@"stsCompanyInfo"];   // NullAble
        
        // JsonString => StsCompanyInfo
        result(@"");// ApplyCertResult => JsonString
    }
    
    else if ([@"getUntieEquipmentQRCode" isEqualToString:call.method])
    {
        //解绑设备二维码
        result(@"");// GetQRCodeResult => JsonString
    }
    
    else if ([@"untieEquipment" isEqualToString:call.method])   // 解绑设备
    {
        // NSString * qrData = call.arguments[@"qrData"];
        result(@"");// ApplyCertResult => JsonString
    }
    
    else if ([@"updatePersonalCert" isEqualToString:call.method])   //更新个人证书
    {
        
        NSString * stsUserInfo = call.arguments[@"stsUserInfo"];      // NullAble
        NSDictionary *stsUserInfo_dic = [stsUserInfo  mj_JSONObject];
        
        NSString  *userName  = [stsUserInfo_dic objectForKey:@"userName"];
        NSString  *phoneNum  = [stsUserInfo_dic objectForKey:@"phoneNum"];
        NSString  *userCity  = [stsUserInfo_dic objectForKey:@"userCity"];
        NSString  *userEmail  = [stsUserInfo_dic objectForKey:@"userEmail"];
        
        [[AXUserInfo sharedInstance] CertUpdateWithuser_name:userName phone_num:phoneNum user_city:userCity user_email:userEmail  success:^(id response) {
            
            NSDictionary *dic = (NSDictionary *)response;
            CommonResult *model = [[CommonResult alloc]init];
            
            model.resultCode = [[dic objectForKey:@"rtnCode"] intValue];
            model.resultMsg  = [dic objectForKey:@"rtnMsg"];
            
            NSString *jsonString = [model mj_JSONString];
            result(jsonString);
            
        } error:^(NSError *error) {
            NSLog(@"%@", error);
        }];
    }
    
    else if ([@"updateCompanyCert" isEqualToString:call.method]) //更新企业证书
    {
        
        NSString * stsCompanyInfo = call.arguments[@"stsCompanyInfo"];     // NullAble
        NSDictionary *stsUserInfo_dic = [stsCompanyInfo  mj_JSONObject];
        
        NSString  *userName  = [stsUserInfo_dic objectForKey:@"userName"];
        NSString  *phoneNum  = [stsUserInfo_dic objectForKey:@"phoneNum"];
        NSString  *userCity  = [stsUserInfo_dic objectForKey:@"userCity"];
        NSString  *userEmail  = [stsUserInfo_dic objectForKey:@"userEmail"];
        
        
        [[AXUserInfo sharedInstance] CertUpdateWithuser_name:userName phone_num:phoneNum user_city:userCity user_email:userEmail  success:^(id response) {
            
            NSDictionary *dic = (NSDictionary *)response;
            CommonResult *model = [[CommonResult alloc]init];
            
            model.resultCode = [[dic objectForKey:@"rtnCode"] intValue];
            model.resultMsg  = [dic objectForKey:@"rtnMsg"];
            
            NSString *jsonString = [model mj_JSONString];
            result(jsonString);
            
        } error:^(NSError *error) {
            NSLog(@"%@", error);
        }];
        
    }
    
    else if ([@"resetPersonalPIN" isEqualToString:call.method])  //个人 重置PIN码
    {
        
        
        NSString * stsUserInfo = call.arguments[@"stsUserInfo"];     // NullAble
        NSDictionary *stsUserInfo_dic = [stsUserInfo  mj_JSONObject];
        
        NSString  *userName  = [stsUserInfo_dic objectForKey:@"userName"];
        NSString  *cardNum   = [stsUserInfo_dic objectForKey:@"cardNum"];
        NSString  *phoneNum  = [stsUserInfo_dic objectForKey:@"phoneNum"];
        NSString  *cardtype  = [stsUserInfo_dic objectForKey:@"cardType"];
        
        NSUInteger  card = 0;
        if  ([cardtype isEqualToString:@"00"]) {
            card = IDCard;
            
        }else if ([cardtype isEqualToString:@"01"]){
            card = InterimIDCard;
            
        }else if ([cardtype isEqualToString:@"02"]){
            card = HouseholdRegister;
            
        }else if ([cardtype isEqualToString:@"03"]){
            card = Passport;
            
        }else if ([cardtype isEqualToString:@"04"]){
            card = SoldierIDCard;
            
        }else if ([cardtype isEqualToString:@"05"]){
            card = SoldierIDCard;
            
        }
        
        [[AXUserInfo sharedInstance] PINRestWithuser_name:userName ent_register_no:nil card_type:card card_num:cardNum phone_num:phoneNum];
        
        CommonResult *model = [[CommonResult alloc]init];
        
        model.resultCode = 1;
        model.resultMsg  = [self nullToString:@"成功"];
        
        NSString *jsonString = [model mj_JSONString];
        result(jsonString);
    }
    
    else if ([@"resetCompanyPIN" isEqualToString:call.method])   // 企业 重置PIN码
    {
        
        NSString * stsCompanyInfo = call.arguments[@"stsCompanyInfo"];     // NullAble
        NSDictionary *stsUserInfo_dic = [stsCompanyInfo  mj_JSONObject];
        
        NSString  *userName  = [stsUserInfo_dic objectForKey:@"userName"];
        NSString  *cardNum   = [stsUserInfo_dic objectForKey:@"cardNum"];
        NSString  *phoneNum  = [stsUserInfo_dic objectForKey:@"phoneNum"];
        NSString  *cardtype  = [stsUserInfo_dic objectForKey:@"cardType"];
        
        NSUInteger  card = 0;
        if  ([cardtype isEqualToString:@"00"]) {
            card = IDCard;
            
        }else if ([cardtype isEqualToString:@"01"]){
            card = InterimIDCard;
            
        }else if ([cardtype isEqualToString:@"02"]){
            card = HouseholdRegister;
            
        }else if ([cardtype isEqualToString:@"03"]){
            card = Passport;
            
        }else if ([cardtype isEqualToString:@"04"]){
            card = SoldierIDCard;
            
        }else if ([cardtype isEqualToString:@"05"]){
            card = SoldierIDCard;
            
        }
        
        [[AXUserInfo sharedInstance] PINRestWithuser_name:userName ent_register_no:nil card_type:card card_num:cardNum phone_num:phoneNum];
        
        CommonResult *model = [[CommonResult alloc]init];
        model.resultCode = 1;
        model.resultMsg  = [self nullToString:@"成功"];
        
        NSString *jsonString = [model mj_JSONString];
        result(jsonString);
    }
    
    else if ([@"modifyPIN" isEqualToString:call.method]) //修改  PIN
    {
        
        [[AXUserInfo sharedInstance]ChangePasswordWithsuccess:^(id response) {
            
            NSDictionary *dic = (NSDictionary *)response;
            CommonResult *model = [[CommonResult alloc]init];
            
            model.resultCode = [[dic objectForKey:@"rtnCode"] intValue];
            model.resultMsg  = [dic objectForKey:@"rtnMsg"];
            
            NSString *jsonString = [model mj_JSONString];
            result(jsonString);  // CommonResult => JsonString
            
        }];
        
    }
    
    else if ([@"scanLogin" isEqualToString:call.method]) //扫码登录
    {
        // NSString * stsScanInfo = call.arguments[@"stsScanInfo"];
        
        // JsonString => StsScanInfo
        result(@"");// CommonResult => JsonString
    }
    
    else if ([@"scanSign" isEqualToString:call.method])    //扫码签名
    {
        // NSString * stsScanInfo = call.arguments[@"stsScanInfo"];

        // JsonString => StsScanInfo
        result(@"");// CommonResult => JsonString
    }
    
    else if ([@"certLogin" isEqualToString:call.method]) //证书登录
    {
        NSString * data = call.arguments[@"data"];
        NSString * dataFormat = call.arguments[@"dataFormat"];
        NSString * dataType = call.arguments[@"dataType"];
        int dataTypes = [dataType intValue];
        NSString * pn = call.arguments[@"pn"];
        
        NSUInteger datatype = 0;
        switch (dataTypes) {
            case 0:
                datatype = Data16System;
                break;
            case 1:
                datatype = DataByte;
                break;
            case 2:
                datatype = Data16CN;
                break;
            case 3:
                datatype = DataInitial;
                break;
            case 4:
                datatype = DataBase64;
                break;
        }
        
        
        [[AXUserInfo sharedInstance] PassLoginMobileWithdata:data pn:pn data_type:datatype data_Format:dataFormat success:^(id response) {
            
            NSDictionary *dic = (NSDictionary *)response;
            CertLoginResult *model = [[CertLoginResult alloc]init];
            
            model.resultCode = [[dic objectForKey:@"rtnCode"] intValue];
            model.resultMsg =  [dic objectForKey:@"rtnMsg"];
            model.signCert =   [dic objectForKey:@"signCert"];
            model.signData =   [dic objectForKey:@"signData"];
            model.token =      [dic objectForKey:@"token2"];
            
            NSString *jsonString = [model mj_JSONString];
            result(jsonString);
            
        } error:^(NSError *error) {
            NSLog(@"%@", error);
        }];
        
        
    }
    else if ([@"certSeal" isEqualToString:call.method])  //证书签章
    {
        
        NSString * pn = call.arguments[@"pn"];
        [[AXUserInfo sharedInstance] passCertSealAndPicOrSignWithpn:pn success:^(id response) {
            
            
            NSDictionary *dic = (NSDictionary *)response;
            CertSealResult *model = [[CertSealResult alloc]init];
            
            model.resultCode = [[dic objectForKey:@"rtnCode"] intValue];
            model.resultMsg =  [dic objectForKey:@"rtnMsg"];
            model.token =      [dic objectForKey:@"tokens"];
            
            NSString *jsonString = [model mj_JSONString];
            result(jsonString);
            
        } error:^(NSError *error) {
            NSLog(@"%@", error);
        }];
    }
    else if ([@"certSign" isEqualToString:call.method])   //原文签名
    {
        
        NSString * data = call.arguments[@"data"];
        NSString * dataFormat = call.arguments[@"dataFormat"];
        NSString * dataType = call.arguments[@"dataType"];
        int dataTypes = [dataType intValue];
        NSString * pn = call.arguments[@"pn"];
        
        NSUInteger datatype = 0;
        switch (dataTypes) {
            case 0:
                datatype = Data16System;
                break;
            case 1:
                datatype = DataByte;
                break;
            case 2:
                datatype = Data16CN;
                break;
            case 3:
                datatype = DataInitial;
                break;
            case 4:
                datatype = DataBase64;
                break;
        }
        
        [[AXUserInfo sharedInstance] passSignWithdata:data pn:pn data_type:datatype data_Format:dataFormat success:^(id response) {
            
            
            NSDictionary *dic = (NSDictionary *)response;
            CertSignResult *model = [[CertSignResult alloc]init];
            
            model.resultCode = [[dic objectForKey:@"rtnCode"] intValue];
            model.resultMsg =  [dic objectForKey:@"rtnMsg"];
            model.signCert =   [dic objectForKey:@"signCert"];
            model.signData =   [dic objectForKey:@"signData"];
            model.token =      [dic objectForKey:@"token2"];
            
            NSString *jsonString = [model mj_JSONString];
            result(jsonString);
            
        } error:^(NSError *error) {
            NSLog(@"%@", error);
        }];
    }
    
    else if ([@"certVerifySign" isEqualToString:call.method]) //证书验签
    {
        
        NSString * data = call.arguments[@"data"];
        NSString * dataFormat = call.arguments[@"dataFormat"];
        NSString * signData = call.arguments[@"signData"];
        NSString * dataType = call.arguments[@"dataType"];
        int dataTypes = [dataType intValue];
        
        NSUInteger datatype = 0;
        switch (dataTypes) {
            case 0:
                datatype = Data16System;
                break;
            case 1:
                datatype = DataByte;
                break;
            case 2:
                datatype = Data16CN;
                break;
            case 3:
                datatype = DataInitial;
                break;
            case 4:
                datatype = DataBase64;
                break;
        }
        
        [[AXUserInfo sharedInstance] VerifyWithdata:data sign_data:signData data_type:datatype data_Format:dataFormat success:^(id response) {
            
            
            NSDictionary *dic = (NSDictionary *)response;
            CommonResult *model = [[CommonResult alloc]init];
            
            model.resultCode = [[dic objectForKey:@"rtnCode"] intValue];
            model.resultMsg = [dic objectForKey:@"rtnMsg"];
            
            NSString *jsonString = [model mj_JSONString];
            result(jsonString);
            
        } error:^(NSError *error) {
            NSLog(@"%@", error);
        }];
        
    }
    
    else if ([@"certEncrypt" isEqualToString:call.method]) //证书加密
    {
        
        NSString * data = call.arguments[@"data"];
        NSString * dataFormat = call.arguments[@"dataFormat"];
        NSString * dataType = call.arguments[@"dataType"];
        int dataTypes = [dataType intValue];
        
        NSUInteger datatype = 0;
        switch (dataTypes) {
            case 0:
                datatype = Data16System;
                break;
            case 1:
                datatype = DataByte;
                break;
            case 2:
                datatype = Data16CN;
                break;
            case 3:
                datatype = DataInitial;
                break;
            case 4:
                datatype = DataBase64;
                break;
        }
        [[AXUserInfo sharedInstance] EncryptWithdata:data data_type:datatype data_Format:dataFormat  success:^(id response) {
            
            
            NSDictionary *dic = (NSDictionary *)response;
            CertEncryptResult *model = [[CertEncryptResult alloc]init];
            
            model.resultCode = [[dic objectForKey:@"rtnCode"] intValue];
            model.resultMsg = [dic objectForKey:@"rtnMsg"];
            model.encryptData = [dic objectForKey:@"encData"];
            
            NSString *jsonString = [model mj_JSONString];
            result(jsonString);
            
        } error:^(NSError *error) {
            NSLog(@"%@", error);
        }];
    }
    
    else if ([@"certDecrypt" isEqualToString:call.method])  //证书解密
    {
        
        NSString * data = call.arguments[@"data"];
        NSString * dataFormat = call.arguments[@"dataFormat"];
        NSString * dataType = call.arguments[@"dataType"];
        // NSString * pn = call.arguments[@"pn"];
        int dataTypes = [dataType intValue];
        
        NSUInteger datatype = 0;
        switch (dataTypes) {
            case 0:
                datatype = Data16System;
                break;
            case 1:
                datatype = DataByte;
                break;
            case 2:
                datatype = Data16CN;
                break;
            case 3:
                datatype = DataInitial;
                break;
            case 4:
                datatype = DataBase64;
                break;
        }
        
        [[AXUserInfo sharedInstance] passDecryptWithdata:data data_type:datatype data_Format:dataFormat success:^(id response) {
            
            NSDictionary *dic = (NSDictionary *)response;
            CertDecryptResult *model = [[CertDecryptResult alloc]init];
            
            model.resultCode = [[dic objectForKey:@"rtnCode"] intValue];
            model.resultMsg = [dic objectForKey:@"rtnMsg"];
            model.decryptData = [dic objectForKey:@"decData"];
            
            NSString *jsonString = [model mj_JSONString];
            result(jsonString);
            
        } error:^(NSError *error) {
            NSLog(@"%@", error);
        }];
    }
    
    else if ([@"changeCertStatus" isEqualToString:call.method])  //证书状态
    {
        
        NSNumber * statusTypeN = call.arguments[@"statusType"];
        int statusType = [statusTypeN intValue];
        
        NSUInteger updatetype = 0;
        switch (statusType) {
            case 1:
                updatetype = Freeze;
                break;
            case 2:
                updatetype = Unfreeze;
                break;
            case 3:
                updatetype = Revoke;
                break;
        }
        
        [[AXUserInfo sharedInstance] CertStatusUpdateWithupdate_type:updatetype success:^(id response) {
            
            NSDictionary *dic = (NSDictionary *)response;
            CommonResult *model = [[CommonResult alloc]init];
            
            model.resultCode = [[dic objectForKey:@"rtnCode"] intValue];
            model.resultMsg  = [dic objectForKey:@"rtnMsg"];
            
            NSString *jsonString = [model mj_JSONString];
            result(jsonString);
            
            
        } error:^(NSError *error) {
            NSLog(@"%@", error);
        }];
        
    }
    
    else if ([@"postponeCert" isEqualToString:call.method])  //延期证书
    {
        
        [[AXUserInfo sharedInstance] certPostponeWithsuccess:^(id response) {
            
            NSDictionary *dic = (NSDictionary *)response;
            CommonResult *model = [[CommonResult alloc]init];
            
            model.resultCode = [[dic objectForKey:@"rtnCode"] intValue];
            model.resultMsg = [dic objectForKey:@"rtnMsg"];
            
            NSString *jsonString = [model mj_JSONString];
            result(jsonString);
            
        } error:^(NSError *error) {
            NSLog(@"%@", error);
        }];
        
    }
    
    else if ([@"setPKCacheTime" isEqualToString:call.method])  //设置缓存密钥时间
    {
        
        NSString * pn = call.arguments[@"pn"];
        [[AXUserInfo sharedInstance]passCachePriKeyWithpn:pn success:^(id response) {
            
            NSDictionary *dic = (NSDictionary *)response;
            PKCacheResult *model = [[PKCacheResult alloc]init];
            
            model.resultCode = [[dic objectForKey:@"rtnCode"] intValue];
            model.resultMsg =  [dic objectForKey:@"rtnMsg"];
            model.token =      [dic objectForKey:@"token"];
            
            NSString *jsonString = [model mj_JSONString];
            result(jsonString);
            
        } error:^(NSError *error) {
            NSLog(@"%@",error);
            
        }];
    }
    
    else if ([@"clearPKCacheTime" isEqualToString:call.method])  //清除密钥缓存时间
    {
        
        NSString * pn = call.arguments[@"pn"];
        [[AXUserInfo sharedInstance]CancleCachePriKeyWithpn:pn success:^(id response) {
            
            NSDictionary *dic = (NSDictionary *)response;
            PKCacheResult *model = [[PKCacheResult alloc]init];
            
            model.resultCode = [[dic objectForKey:@"rtnCode"] intValue];
            model.resultMsg =  [dic objectForKey:@"rtnMsg"];
            model.token =      [dic objectForKey:@"token"];
            NSString *jsonString = [model mj_JSONString];
            result(jsonString);
            
        } error:^(NSError *error) {
            NSLog(@"%@", error);
        }];
        
    }
    
    else if ([@"getCert" isEqualToString:call.method])  //获取证书信息 从服务器获取
    {
        
        NSNumber * certTypeN = call.arguments[@"certType"];
        int certType = [certTypeN intValue];
        
        [[AXUserInfo sharedInstance] QueryCertInfoWithsuccess:^(id response) {
            
            //判读从服务器获取重要的字段信息为空，走本地获取信息字段
            if (![[response objectForKey:@"encCert"] isEqualToString:@""]&&[[response objectForKey:@"signCert"] isEqualToString:@""]) {
                
                NSDictionary *dic = (NSDictionary *)response;
                ApplyCertModel *model = [ApplyCertModel mj_objectWithKeyValues:dic];
                GetCertResult *modleCart = [[GetCertResult alloc]init];
                
                modleCart.resultCode = [model.rtnCode intValue];
                modleCart.resultMsg  = [self nullToString:model.rtnMsg];
                modleCart.enCert = model.encCert;
                modleCart.signCert = model.signCert;
                
                if (certType == 1) {
                    
                    modleCart.stsCertInfo = (id) model.signCertInfo;
                    [self Sign_GetCertResult:modleCart ApplyCertModel:model];
                }else{
                    modleCart.stsCertInfo = (id) model.encCertInfo;
                    [self Sign_GetCertResult:modleCart ApplyCertModel:model];
                }
                
                SubjectEXTBean *modelEXT = [[SubjectEXTBean alloc]init];
                modelEXT.certExt2 = @"";
                modelEXT.certExt3 = @"";
                modelEXT.certExt4 = @"";
                modelEXT.certExt9 = @"";
                modleCart.stsCertInfo.subjectEXT = modelEXT;
                
                
                
                NSString *jsonString = [modleCart mj_JSONString];
                
                result(jsonString);
                
            }else{
                
                NSDictionary *dic = [[AXUserInfo sharedInstance] GetCertificateInformation];
                ApplyCertModel *model = [ApplyCertModel mj_objectWithKeyValues:dic];
                
                GetCertResult *modleCart = [[GetCertResult alloc]init];
                modleCart.resultCode = [model.rtnCode intValue];
                modleCart.resultMsg  = [self nullToString:model.rtnMsg];
                modleCart.enCert = model.encCert;
                modleCart.signCert = model.signCert;
                
                if (certType == 1) {
                    
                    modleCart.stsCertInfo = (id) model.signCertInfo;
                    [self Sign_GetCertResult:modleCart ApplyCertModel:model];
                    
                }else{
                    
                    modleCart.stsCertInfo = (id) model.encCertInfo;
                    [self enc_GetCertResult:modleCart ApplyCertModel:model];
                }
                
                SubjectEXTBean *modelEXT = [[SubjectEXTBean alloc]init];
                modelEXT.certExt2 = @"";
                modelEXT.certExt3 = @"";
                modelEXT.certExt4 = @"";
                modelEXT.certExt9 = @"";
                modleCart.stsCertInfo.subjectEXT = modelEXT;
                
                
                
                NSString *jsonString = [modleCart mj_JSONString];
                result(jsonString);
                
            }
            
        } error:^(NSError *error) {
            NSLog(@"%@", error);
            
        }];
        
        
    }
    else if ([@"getLocalCert" isEqualToString:call.method])   //获取本地沙盒证书数据
    {
        NSNumber * certTypeN = call.arguments[@"certType"];
        int certType = [certTypeN intValue];
        
        NSDictionary *dictionary = [[AXUserInfo sharedInstance] GetCertificateInformation];
        ApplyCertModel *model = [ApplyCertModel mj_objectWithKeyValues:dictionary];
        
        GetCertResult *modleCart = [[GetCertResult alloc]init];
        modleCart.resultCode = [model.rtnCode intValue];
        modleCart.resultMsg  = [self nullToString:model.rtnMsg];
        modleCart.enCert = model.encCert;
        modleCart.signCert = model.signCert;
        
        if (certType == 1) {
            modleCart.stsCertInfo = (id) model.signCertInfo;
            [self Sign_GetCertResult:modleCart ApplyCertModel:model];
            
        }else{
            
            modleCart.stsCertInfo = (id) model.encCertInfo;
            [self enc_GetCertResult:modleCart ApplyCertModel:model];
        }
        
        SubjectEXTBean *modelEXT = [[SubjectEXTBean alloc]init];
        modelEXT.certExt2 = @"";
        modelEXT.certExt3 = @"";
        modelEXT.certExt4 = @"";
        modelEXT.certExt9 = @"";
        modleCart.stsCertInfo.subjectEXT = modelEXT;
        
        
        
        NSString *jsonString = [modleCart mj_JSONString];
        result(jsonString);
        
        
    }
    else if ([@"downloadCert" isEqualToString:call.method])    //预支证书
    {
        // NSString * phoneNum = call.arguments[@"phoneNum"];
        NSString * departmentNo = call.arguments[@"departmentNo"];
        NSNumber * certTypeN = call.arguments[@"certType"];
        int certType = [certTypeN intValue];
        
        [[AXUserInfo sharedInstance]GetAdvanceDownloadCertificatewhitdeptNo:departmentNo Success:^(id response) {
            
            ApplyCertModel *model = [ApplyCertModel mj_objectWithKeyValues:response];
            
            GetCertResult *modleCart = [[GetCertResult alloc]init];
            modleCart.resultCode = [model.rtnCode intValue];
            modleCart.resultMsg  = [self nullToString:model.rtnMsg];
            modleCart.enCert = model.encCert;
            modleCart.signCert = model.signCert;
            
            if (certType == 1) {
                modleCart.stsCertInfo = (id) model.signCertInfo;
                [self Sign_GetCertResult:modleCart ApplyCertModel:model];
            }else{
                modleCart.stsCertInfo = (id) model.encCertInfo;
                [self enc_GetCertResult:modleCart ApplyCertModel:model];
            }
            
            SubjectEXTBean *modelEXT = [[SubjectEXTBean alloc]init];
            modelEXT.certExt2 = @"";
            modelEXT.certExt3 = @"";
            modelEXT.certExt4 = @"";
            modelEXT.certExt9 = @"";
            modleCart.stsCertInfo.subjectEXT = modelEXT;
            
            NSString *jsonString = [modleCart mj_JSONString];
            result(jsonString); // GetCertResult => JsonString
            
        }];
        
    }
    
    else if ([@"getDepartmentNo" isEqualToString:call.method])  //单位编号
    {
        
        [[AXUserInfo sharedInstance] GetDeptInfoWithCompletion:^(id response) {
            if ([[response objectForKey:@"rtnCode"] isEqualToString:@"1"]) {
                
                NSDictionary *dic = (NSDictionary *)response;
                GetDepartmentNoResult *model = [[GetDepartmentNoResult alloc]init];
                model.resultCode = [[dic objectForKey:@"rtnCode"] intValue];
                model.resultMsg =  [dic objectForKey:@"rtnMsg"];
                model.departmentList = [dic objectForKey:@"deptList"];
                
                NSString *jsonString = [model mj_JSONString];
                result(jsonString);  // GetDepartmentNoResult => JsonString
                
            }
            
        } error:^(NSError *error) {
            NSLog(@"%@", error);
        }];
    }
    
    else if ([@"setSignImgWithDrawingBoard" isEqualToString:call.method])   //打开手写签名面板，保存图片至服务器
    {
        // NSString * stsSignImgSetting = call.arguments[@"stsSignImgSetting"];// NullAble
        [[AXUserInfo sharedInstance] ReturnServerSignatureImageWithsuccess:^(id response) {
            
            if ([[response objectForKey:@"rtnCode"] isEqualToString:@"1"]) {
                
                NSDictionary *dic = (NSDictionary *)response;
                SignImgResult *model = [[SignImgResult alloc]init];
                model.resultCode = [[dic objectForKey:@"rtnCode"] intValue];
                model.resultMsg =  [dic objectForKey:@"rtnMsg"];
                NSString *imageStr = [self deleteSpecialCodeWithStr:[dic objectForKey:@"base64"]];
                model.signImg = imageStr;
                
                NSString *jsonString = [model mj_JSONString];
                result(jsonString);   // SignImgResult => JsonString
            }
            
        } error:^(NSError *error) {
            NSLog(@"%@", error);
        }];
        
    }
    
    else if ([@"setSignImgBase64Str" isEqualToString:call.method]) //将图片base64数据保存服务器
    {
        NSString * imgBase64 = call.arguments[@"imgBase64"];
        [[AXUserInfo sharedInstance] passCertSignAndPicOrSignWithData_base64:imgBase64 success:^(id response) {
            
            
            if ([[response objectForKey:@"rtnCode"] isEqualToString:@"1"]) {
                
                NSDictionary *dic = (NSDictionary *)response;
                SignImgResult *model = [[SignImgResult alloc]init];
                model.resultCode = [[dic objectForKey:@"rtnCode"] intValue];
                model.resultMsg =  [dic objectForKey:@"rtnMsg"];
                model.signImg = [dic objectForKey:@"base64"];
                
                NSString *jsonString = [model mj_JSONString];
                result(jsonString);   // SignImgResult => JsonString
                
            }
            
        } error:^(NSError *error) {
            NSLog(@"%@", error);
        }];
        
    }
    
    else if ([@"getSignImgFromService" isEqualToString:call.method]) //获取服务器的签名图片
    {
        [[AXUserInfo sharedInstance] GetCertSignAndPicOrSignWithsuccess:^(id response) {  //获取签名图片数据
            
            if ( [[response objectForKey:@"rtnCode"] isEqualToString:@"1"]) {
                
                NSDictionary *dic = (NSDictionary *)response;
                SignImgResult *model = [[SignImgResult alloc]init];
                
                model.resultCode = [[dic objectForKey:@"rtnCode"] intValue];
                model.resultMsg =  [dic objectForKey:@"rtnMsg"];
                model.signImg = [dic objectForKey:@"data"][@"data_base64"];
                
                NSString *jsonString = [model mj_JSONString];
                result(jsonString);  // SignImgResult => JsonString
                
            }
            
        } error:^(NSError *error) {
            NSLog(@"%@", error);
        }];
    }
    
    else if ([@"getSignImgAndSetItIfNotExist" isEqualToString:call.method])   // getSignImgFromService & setSignImgWithDrawingBoard  组合
    {
        // NSString * stsSignImgSetting = call.arguments[@"stsSignImgSetting"];// NullAble
        [[AXUserInfo sharedInstance] GetCertSignAndPicOrSignWithsuccess:^(id response) {  //设置手写签名从服务台领取签名
            
            if ( [[response objectForKey:@"rtnCode"] isEqualToString:@"1"]) {
                
                NSString *imgBase64  = [[response objectForKey:@"data"] objectForKey:@"data_base64"];
                NSDictionary *dic = (NSDictionary *)response;
                SignImgResult *model = [[SignImgResult alloc]init];
                model.resultCode = [[dic objectForKey:@"rtnCode"] intValue];
                model.resultMsg =  [dic objectForKey:@"rtnMsg"];
                model.signImg = imgBase64;
                
                NSString *jsonString = [model mj_JSONString];
                result(jsonString);  // SignImgResult => JsonString
                
            }
            
        } error:^(NSError *error) {
            NSLog(@"%@", error);
        }];
        
        
    }
    
    else if ([@"getSignImgWithDrawingBoard" isEqualToString:call.method])    // 使用手写采集板返回 app端
    {
        // NSString * stsSignImgSetting = call.arguments[@"stsSignImgSetting"];// NullAble
        
        [[AXUserInfo sharedInstance]ReturnSignImage:^(UIImage *Image) {
            
            NSData* data = UIImagePNGRepresentation(Image);
            NSString *imgBase64 = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
            NSString *imageStr = [self deleteSpecialCodeWithStr:imgBase64];
            
            
            NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
            [dic setValue:imageStr forKey:@"signImg"];
            [dic setValue:[NSNumber numberWithInt:1] forKey:@"resultCode"];
            
            SignImgResult *model = [[SignImgResult alloc]init];
            model.resultCode  = [[dic objectForKey:@"resultCode"] intValue];
            model.signImg = [dic objectForKey:@"signImg"];
            
            NSString *jsonString = [model mj_JSONString];
            result(jsonString);  // SignImgResult => JsonString
            
        }];
        
    }
    
    else if ([@"getFingerprintStatus" isEqualToString:call.method])  //指纹状态
    {
        
        BOOL isBool = [AXUserInfo sharedInstance].touchBool;
        NSNumber *Bool =  [NSNumber numberWithBool:isBool];
        result(Bool);// Bool
        
    }
    
    else if ([@"openFingerprint" isEqualToString:call.method])  //指纹开启
    {
        NSNumber * openN = call.arguments[@"open"];
        BOOL open = [openN boolValue];
        if (open) {
            
            [[AXUserInfo sharedInstance]FingerprinSwtitchWithisbool:open Success:^(id response) {
                
                CommonResult *model = [[CommonResult alloc]init];
                NSDictionary *dic = (NSDictionary *)response;
                model.resultCode = [[dic objectForKey:@"rtnCode"] intValue];
                model.resultMsg =  [dic objectForKey:@"rtnMsg"];
                
                NSString *jsonString = [model mj_JSONString];
                result(jsonString); // CommonResult => JsonString
                
            }];
            
        }else{
            
            [[AXUserInfo sharedInstance]FingerprinSwtitchWithisbool:open Success:^(id response) {
                
                CommonResult *model = [[CommonResult alloc]init];
                NSDictionary *dic = (NSDictionary *)response;
                model.resultCode = [[dic objectForKey:@"rtnCode"] intValue];
                model.resultMsg =  [dic objectForKey:@"rtnMsg"];
                
                NSString *jsonString = [model mj_JSONString];
                result(jsonString); // CommonResult => JsonString
                
            }];
            
        }
        
    }
    else
    {
        result(FlutterMethodNotImplemented);
    }
    
}
#pragma mark - 处理json格式的字符串中有换行符的函数方法
- (NSString *)deleteSpecialCodeWithStr:(NSString *)str {
    
    NSString *string = [str stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    
    string = [string stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    return string;
    
}
#pragma mark - 处理返回字符串值是否为空或null并转换为空字符串的函数方法
- (NSString *)nullToString:(id)string {
    
    if ([string isEqual:@"NULL"] || [string isKindOfClass:[NSNull class]] || [string isEqual:[NSNull null]] || [string isEqual:NULL] || [[string class] isSubclassOfClass:[NSNull class]] || string == nil || string == NULL || [string isKindOfClass:[NSNull class]] || [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0 || [string isEqualToString:@"<null>"] || [string isEqualToString:@"(null)"]) {
        
        return @"";
    } else {
        
        return (NSString *)string;
    }
}
#pragma mark - sign_处理返回字符串值是否为nil
-(void)Sign_GetCertResult:(GetCertResult *)modleCart  ApplyCertModel:(ApplyCertModel *)model{
    
    modleCart.stsCertInfo.subjectDN.C = [self nullToString:model.signCertInfo.subjectDN.C];
    modleCart.stsCertInfo.subjectDN.CN = [self nullToString:model.signCertInfo.subjectDN.CN];
    modleCart.stsCertInfo.subjectDN.GIVENNAME = [self nullToString:model.signCertInfo.subjectDN.GIVENNAME];
    modleCart.stsCertInfo.subjectDN.O = [self nullToString:model.signCertInfo.subjectDN.O];
    modleCart.stsCertInfo.subjectDN.L = [self nullToString:model.signCertInfo.subjectDN.L];
    modleCart.stsCertInfo.subjectDN.OU = [self nullToString:model.signCertInfo.subjectDN.OU];
    modleCart.stsCertInfo.subjectDN.ST = [self nullToString:model.signCertInfo.subjectDN.ST];
    modleCart.stsCertInfo.subjectDN.E = [self nullToString:model.signCertInfo.subjectDN.E];
    
    
    modleCart.stsCertInfo.issuerDN.C = [self nullToString:model.signCertInfo.issuerDN.C];
    modleCart.stsCertInfo.issuerDN.CN = [self nullToString:model.signCertInfo.issuerDN.CN];
    modleCart.stsCertInfo.issuerDN.O = [self nullToString:model.signCertInfo.issuerDN.O];
    modleCart.stsCertInfo.issuerDN.L = [self nullToString:model.signCertInfo.issuerDN.L];
    modleCart.stsCertInfo.issuerDN.OU = [self nullToString:model.signCertInfo.issuerDN.OU];
    modleCart.stsCertInfo.issuerDN.ST = [self nullToString:model.signCertInfo.issuerDN.ST];
    
}
#pragma mark - enc_处理返回字符串值是否为nil
-(void)enc_GetCertResult:(GetCertResult *)modleCart  ApplyCertModel:(ApplyCertModel *)model{
    
    modleCart.stsCertInfo.subjectDN.C = [self nullToString:model.encCertInfo.subjectDN.C];
    modleCart.stsCertInfo.subjectDN.CN = [self nullToString:model.encCertInfo.subjectDN.CN];
    modleCart.stsCertInfo.subjectDN.GIVENNAME = [self nullToString:model.encCertInfo.subjectDN.GIVENNAME];
    modleCart.stsCertInfo.subjectDN.O = [self nullToString:model.encCertInfo.subjectDN.O];
    modleCart.stsCertInfo.subjectDN.L = [self nullToString:model.encCertInfo.subjectDN.L];
    modleCart.stsCertInfo.subjectDN.OU = [self nullToString:model.encCertInfo.subjectDN.OU];
    modleCart.stsCertInfo.subjectDN.ST = [self nullToString:model.encCertInfo.subjectDN.ST];
    modleCart.stsCertInfo.subjectDN.E = [self nullToString:model.encCertInfo.subjectDN.E];
    
    
    modleCart.stsCertInfo.issuerDN.C = [self nullToString:model.encCertInfo.issuerDN.C];
    modleCart.stsCertInfo.issuerDN.CN = [self nullToString:model.encCertInfo.issuerDN.CN];
    modleCart.stsCertInfo.issuerDN.O = [self nullToString:model.encCertInfo.issuerDN.O];
    modleCart.stsCertInfo.issuerDN.L = [self nullToString:model.encCertInfo.issuerDN.L];
    modleCart.stsCertInfo.issuerDN.OU = [self nullToString:model.encCertInfo.issuerDN.OU];
    modleCart.stsCertInfo.issuerDN.ST = [self nullToString:model.encCertInfo.issuerDN.ST];
    
}
@end

