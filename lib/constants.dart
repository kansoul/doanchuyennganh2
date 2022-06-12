import 'package:flutter/material.dart';

import 'size_config.dart';

const kPrimaryColor = Color(0xFF00BF6D);
const kSecondaryColor = Color(0xFFFE9901);
const kContentColorLightTheme = Color(0xFF1D1D35);
const kContentColorDarkTheme = Color(0xFFF5FCF9);
const kWarninngColor = Color(0xFFF3BB1C);
const kErrorColor = Color(0xFFF03738);

const kBackgoundColor = Color(0xFF091C40);
const kSecondaryColor1 = Color(0xFF606060);
const kRedColor = Color(0xFFFF1E46);

const kDefaultPadding = 20.0;

//const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
//const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Vui lòng nhập email của bạn";
const String kInvalidEmailError = "Vui lòng nhập email hợp lệ";
const String kPassNullError = "Vui lòng nhập mật khẩu của bạn";
const String kShortPassError = "Mật khẩu quá ngắn";
const String kMatchPassError = "Mật khẩu không khớp";
const String kNamelNullError = "Xin hãy nhập tên của bạn";
const String kPhoneNumberNullError = "Xin vui lòng điền số điện thoại của bạn";
const String kAddressNullError = "Vui lòng nhập địa chỉ của bạn";
const String kPassError = "Sai Email hoặc mật khẩu";
const String kEmailError = "Email đã tồn tại";
const String loiketnoi = "Lỗi kết nối";
final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}

const String APP_ID = "23d01a92efcb436c95df9e87bf846f44";
const String CHANNEL_NAME = "callvideo";
const String TEMPTOKEN =
    "00623d01a92efcb436c95df9e87bf846f44IABRgbeT7Ig0GpJ5V+imKipKnmN/aiTAVV6m27dJAj5S7GvNYxYAAAAAIgBF5qhUA+ulYgQAAQAC66ViAgAC66ViAwAC66ViBAAC66Vi";

const String TIMESTAMP_FIELD = "timestamp";
const String EMAIL_FIELD = "email";

const String MESSAGE_TYPE_IMAGE = "image";
