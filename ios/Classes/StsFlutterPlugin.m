#import "StsFlutterPlugin.h"

@implementation StsFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel* channel = [FlutterMethodChannel
                                     methodChannelWithName:@"sts_flutter"
                                     binaryMessenger:[registrar messenger]];
    StsFlutterPlugin* instance = [[StsFlutterPlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([@"init" isEqualToString:call.method])
    {
        NSString * baseUrl = call.arguments[@"baseUrl"];
        NSString * stsAppKey = call.arguments[@"stsAppKey"];
        NSString * stsSecretKey = call.arguments[@"stsSecretKey"];
        result(@"");
    }
    
    else if ([@"initUseId" isEqualToString:call.method])
    {
        NSString * useId = call.arguments[@"useId"];
        result(@"");
    }
    
    else if ([@"initFace" isEqualToString:call.method])
    {
        NSString * fileId = call.arguments[@"id"];
        NSString * fileName = call.arguments[@"fileName"];
        result(@"");
    }
    
    else if ([@"initThemeColor" isEqualToString:call.method])
    {
        NSNumber * color = call.arguments[@"color"];
        result(@"");
    }
    
    else if ([@"getDeviceID" isEqualToString:call.method])
    {
        result(@"");// NSString
    }
    
    else if ([@"isLocalCertExist" isEqualToString:call.method])
    {
        result(@"");// BOOL
    }
    
    else if ([@"checkCert" isEqualToString:call.method])
    {
        result(@"");// CommonResult => JsonString {"resultCode": int, "resultMsg": NSString}
    }
    
    else if ([@"clearCert" isEqualToString:call.method])
    {
        result(@"");// CommonResult => JsonString {"resultCode": int, "resultMsg": NSString}
    }
    
    else if ([@"applyPersonalCert" isEqualToString:call.method])
    {
        NSString * stsUserInfo = call.arguments[@"stsUserInfo"];
        // JsonString => StsUserInfo
        result(@"");// ApplyCertResult => JsonString
    }
    
    else if ([@"applyCompanyCert" isEqualToString:call.method])
    {
        NSString * stsCompanyInfo = call.arguments[@"stsCompanyInfo"];
        // JsonString => StsCompanyInfo
        result(@"");// ApplyCertResult => JsonString
    }
    
    else if ([@"getUntieEquipmentQRCode" isEqualToString:call.method])
    {
        result(@"");// GetQRCodeResult => JsonString
    }
    
    else if ([@"untieEquipment" isEqualToString:call.method])
    {
        NSString * qrData = call.arguments[@"qrData"];
        result(@"");// ApplyCertResult => JsonString
    }
    
    else if ([@"updatePersonalCert" isEqualToString:call.method])
    {
        NSString * stsUserInfo = call.arguments[@"stsUserInfo"];
        // JsonString => StsUserInfo
        result(@"");// CommonResult => JsonString
    }
    
    else if ([@"updateCompanyCert" isEqualToString:call.method])
    {
        NSString * stsCompanyInfo = call.arguments[@"stsCompanyInfo"];
        // JsonString => StsCompanyInfo
        result(@"");// CommonResult => JsonString
    }
    
    else if ([@"resetPersonalPIN" isEqualToString:call.method])
    {
        NSString * stsUserInfo = call.arguments[@"stsUserInfo"];
        // JsonString => StsUserInfo
        result(@"");// CommonResult => JsonString
    }
    
    else if ([@"resetCompanyPIN" isEqualToString:call.method])
    {
        NSString * stsCompanyInfo = call.arguments[@"stsCompanyInfo"];
        // JsonString => StsCompanyInfo
        result(@"");// CommonResult => JsonString
    }
    
    else if ([@"modifyPIN" isEqualToString:call.method])
    {
        result(@"");// CommonResult => JsonString
    }
    
    else if ([@"scanLogin" isEqualToString:call.method])
    {
        NSString * stsScanInfo = call.arguments[@"stsScanInfo"];
        // JsonString => StsScanInfo
        result(@"");// CommonResult => JsonString
    }
    
    else if ([@"scanSign" isEqualToString:call.method])
    {
        NSString * stsScanInfo = call.arguments[@"stsScanInfo"];
        // JsonString => StsScanInfo
        result(@"");// CommonResult => JsonString
    }
    
    else if ([@"certLogin" isEqualToString:call.method])
    {
        NSString * data = call.arguments[@"data"];
        NSString * dataFormat = call.arguments[@"dataFormat"];
        NSString * dataType = call.arguments[@"dataType"];
        NSString * pn = call.arguments[@"pn"];
        result(@"");// CertLoginResult => JsonString
    }
    
    else if ([@"certSeal" isEqualToString:call.method])
    {
        NSString * pn = call.arguments[@"pn"];
        result(@"");// CertSealResult => JsonString
    }
    
    else if ([@"certSign" isEqualToString:call.method])
    {
        NSString * data = call.arguments[@"data"];
        NSString * dataFormat = call.arguments[@"dataFormat"];
        NSString * dataType = call.arguments[@"dataType"];
        NSString * pn = call.arguments[@"pn"];
        result(@"");// CertSignResult => JsonString
    }
    
    else if ([@"certVerifySign" isEqualToString:call.method])
    {
        NSString * data = call.arguments[@"data"];
        NSString * dataFormat = call.arguments[@"dataFormat"];
        NSString * signData = call.arguments[@"signData"];
        NSString * dataType = call.arguments[@"dataType"];
        result(@"");// CommonResult => JsonString
    }
    
    else if ([@"certEncrypt" isEqualToString:call.method])
    {
        NSString * data = call.arguments[@"data"];
        NSString * dataFormat = call.arguments[@"dataFormat"];
        NSString * dataType = call.arguments[@"dataType"];
        result(@"");// CertEncryptResult => JsonString
    }
    
    else if ([@"certDecrypt" isEqualToString:call.method])
    {
        NSString * data = call.arguments[@"data"];
        NSString * dataFormat = call.arguments[@"dataFormat"];
        NSString * dataType = call.arguments[@"dataType"];
        NSString * pn = call.arguments[@"pn"];
        result(@"");// CertDecryptResult => JsonString
    }
    
    else if ([@"changeCertStatus" isEqualToString:call.method])
    {
        NSNumber * statusTypeN = call.arguments[@"statusType"];
        int statusType = [statusTypeN intValue];
        result(@"");// CommonResult => JsonString
    }
    
    else if ([@"postponeCert" isEqualToString:call.method])
    {
        result(@"");// CommonResult => JsonString
    }
    
    else if ([@"setPKCacheTime" isEqualToString:call.method])
    {
        NSString * pn = call.arguments[@"pn"];
        result(@"");// PKCacheResult => JsonString
    }
    
    else if ([@"clearPKCacheTime" isEqualToString:call.method])
    {
        NSString * pn = call.arguments[@"pn"];
        result(@"");// PKCacheResult => JsonString
    }
    
    else if ([@"getCert" isEqualToString:call.method])
    {
        NSNumber * certTypeN = call.arguments[@"certType"];
        int certType = [certTypeN intValue];
        result(@"");// GetCertResult => JsonString
    }
    
    else if ([@"getLocalCert" isEqualToString:call.method])
    {
        NSNumber * certTypeN = call.arguments[@"certType"];
        int certType = [certTypeN intValue];
        result(@"");// GetCertResult => JsonString
    }
    
    else if ([@"downloadCert" isEqualToString:call.method])
    {
        NSString * phoneNum = call.arguments[@"phoneNum"];
        NSString * departmentNo = call.arguments[@"departmentNo"];
        NSNumber * certTypeN = call.arguments[@"certType"];
        int certType = [certTypeN intValue];
        result(@"");// GetCertResult => JsonString
    }
    
    else if ([@"getDepartmentNo" isEqualToString:call.method])
    {
        result(@"");// GetDepartmentNoResult => JsonString
    }
    
    else if ([@"setSignImgWithDrawingBoard" isEqualToString:call.method])
    {
        NSString * stsSignImgSetting = call.arguments[@"stsSignImgSetting"];// NullAble
        result(@"");// SignImgResult => JsonString
    }
    
    else if ([@"setSignImgBase64Str" isEqualToString:call.method])
    {
        NSString * imgBase64 = call.arguments[@"imgBase64"];
        result(@"");// SignImgResult => JsonString
    }
    
    else if ([@"getSignImgFromService" isEqualToString:call.method])
    {
        result(@"");// SignImgResult => JsonString
    }
    
    else if ([@"getSignImgAndSetItIfNotExist" isEqualToString:call.method])
    {
        NSString * stsSignImgSetting = call.arguments[@"stsSignImgSetting"];// NullAble
        result(@"");// SignImgResult => JsonString
    }
    
    else if ([@"getSignImgWithDrawingBoard" isEqualToString:call.method])
    {
        NSString * stsSignImgSetting = call.arguments[@"stsSignImgSetting"];// NullAble
        result(@"");// SignImgResult => JsonString
    }
    
    else if ([@"getFingerprintStatus" isEqualToString:call.method])
    {
        result(@"");// Bool
    }
    
    else if ([@"openFingerprint" isEqualToString:call.method])
    {
        NSNumber * openN = call.arguments[@"open"];
        BOOL open = [openN boolValue];
        result(@"");// CommonResult => JsonString
    }
    
    else
    {
        result(FlutterMethodNotImplemented);
    }
    
}

@end
