class StsCodeTable {
  static const rtnCode_success = 1;
  static const rtnMsg_success = "成功";
  static const rtnCode_failure = 10102;
  static const rtnMsg_failure = "失败";

  // 网络请求错误
  static const rtnCode_service = 10201;
  static const rtnMsg_service = "服务异常";
  static const rtnCode_network = 10202;
  static const rtnMsg_network = "网络异常";
  static const rtnCode_error = 10203;
  static const rtnMsg_error = "服务返回参数为空";
  static const rtnCode_service_data_empty = 10204;
  static const rtnMsg_service_data_empty = "服务返回数据为空";

  // 键盘或指纹错误
  static const rtnCode_vertical_screen_only = 10301;
  static const rtnMsg_vertical_screen_only = "失败，键盘只支持竖屏";
  static const rtnCode_pin_error = 10302;
  static const rtnMsg_pin_error = "失败，PIN错误";
  static const rtnCode_user_canceled = 10303;
  static const rtnMsg_user_canceled = "失败，用户点击取消";
  static const rtnCode_repeated = 10304;
  static const rtnMsg_repeated = "状态未更改，传入标识与之前重复";
  static const rtnCode_fingerprint_init_failed = 10305;
  static const rtnMsg_fingerprint_init_failed = "指纹异常";
  static const rtnCode_canceled = 10306;
  static const rtnMsg_canceled = "用户取消";
  static const rtnCode_not_set_pin = 10307;
  static const rtnMsg_not_set_pin = "未设置PIN码";

  // 逻辑错误
  static const rtnCode_no_data = 10501;
  static const rtnMsg_no_data = "参数不全或为空";
  static const rtnCode_cert_not_exist = 10502;
  static const rtnMsg_cert_not_exist = "证书不存在或已损坏";
  static const rtnCode_cert_exist = 10503;
  static const rtnMsg_cert_exist = "证书已存在";
  static const rtnCode_user_info_incomplete = 10504;
  static const rtnMsg_user_info_incomplete = "用户信息不全";
  static const rtnCode_sign_img_error = 10505;
  static const rtnMsg_sign_img_error = "签名图片生成失败";
  static const rtnCode_reviewing = 10506;
  static const rtnMsg_reviewing = "请完成PIN码的重置";
  static const rtnCode_parameter_error = 10507;
  static const rtnMsg_parameter_error = "参数有误";
  static const rtnCode_url_not_init = 10508;
  static const rtnMsg_url_not_init = "未初始化服务地址";
  static const rtnCode_url_error = 10509;
  static const rtnMsg_url_error = "服务器地址格式有误";
  static const rtnCode_sdk_data_error = 10510;
  static const rtnMsg_sdk_data_error = "SDK内部数据传输错误";
  static const rtnCode_face_not_init_error = 10511;
  static const rtnMsg_face_not_init_error = "未初始化人脸识别参数";
  static const rtnCode_qr_code_error = 10512;
  static const rtnMsg_qr_code_error = "二维码错误";
  static const rtnCode_pn_is_empty = 10513;
  static const rtnMsg_pn_is_empty = "项目编号为空";
  static const rtnCode_user_refused = 10514;
  static const rtnMsg_user_refused = "用户拒绝";
  static const rtnCode_pin_num_error = 10515;
  static const rtnMsg_pin_num_error = "PIN码格式错误";
  static const rtnCode_pin_old_mismatch = 10516;
  static const rtnMsg_pin_old_mismatch = "旧PIN码不匹配";
  static const rtnCode_useid_is_empty = 10517;
  static const rtnMsg_useid_is_empty = "用户唯一标识为空";
  static const rtnCode_key_is_empty = 10518;
  static const rtnMsg_key_is_empty = "授权码为空";
}
