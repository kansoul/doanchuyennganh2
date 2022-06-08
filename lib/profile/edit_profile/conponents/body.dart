import 'dart:ffi';

import 'package:chatapp/firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
// import 'package:ms_free/firestore.dart';

import '../../../components/custom_surfix_icon.dart';
import '../../../components/default_button.dart';
import '../../../components/form_error.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import '../../profile/conponents/profile_pic.dart';
// import 'package:intl/intl.dart';
import 'package:select_form_field/select_form_field.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var value1;
  String value2 = "";

  String uid = FirebaseAuth.instance.currentUser!.uid.toString();
  Future<Map<String, dynamic>?> getData() async {
    var collection = FirebaseFirestore.instance.collection('Users');
    var docSnapshot = await collection.doc(uid).get();
    Map<String, dynamic>? data;

    data = docSnapshot.data();
    //value2 = data?['gender']; // <-- The value you want to retrieve.
    // Call setState if needed.
    //print(value2);
    // setState(() {
    //   value2 = data?['gender']; // <-- The value you want to retrieve.
    // });
    return data;
  }

  @override
  void initState() {
    super.initState();
    //getData();
    //print(value2);
  }

  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  late String firstName;
  late String lastName;
  late String Sex;
  late String phoneNumber;
  late String address;
  late String img;
  late TextEditingController fullnameController = TextEditingController();
  late TextEditingController birthdayController = TextEditingController();
  late TextEditingController phoneController = TextEditingController();
  late TextEditingController addressController = TextEditingController();
  late TextEditingController sexController = TextEditingController();
  final List<Map<String, dynamic>> _items = [
    {
      'value': 'Male',
      'label': 'Male',
      'icon': Icon(Icons.male),
    },
    {
      'value': 'Female',
      'label': 'Female',
      'icon': Icon(Icons.female),
    },
    {
      'value': 'No',
      'label': 'No',
      //'enable': false,
      'icon': Icon(Icons.not_interested),
    },
  ];
  String? selectedValue = null;
  var collection = FirebaseFirestore.instance.collection('Users');
  void addError({required String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({required String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      future: collection.doc("User").get(),
      builder: (BuildContext context, snapshot) {
        //print(snapshot.data?[uid]["0"]["img"]);
        if (snapshot.data != null) {
          fullnameController.text = snapshot.data?[uid]["0"]["fullname"];
          addressController.text = snapshot.data?[uid]["0"]["address"];
          sexController.text = snapshot.data?[uid]["0"]["gender"];
          phoneController.text = snapshot.data?[uid]["0"]["phone"];
          birthdayController.text = snapshot.data?[uid]["0"]["birthday"];
        }

        // print(snapshot.data);
        //print(snapshot.data?['gender']);
        return Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 27),
            child: Column(
              children: [
                SizedBox(height: getProportionateScreenHeight(45)),
                ProfilePic(),
                SizedBox(height: getProportionateScreenHeight(70)),
                SizedBox(height: getProportionateScreenHeight(17)),
                TextFormField(
                  controller: fullnameController,
                  onSaved: (newValue) => firstName = newValue!,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      removeError(error: kNamelNullError);
                    }
                    return null;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      addError(error: kNamelNullError);
                      return "";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Full Name",
                    hintText: snapshot.data?[uid]["0"]['fullname'],

                    // If  you are using latest version of flutter then lable text and hint text shown like this
                    // if you r using flutter less then 1.20.* then maybe this is not working properly
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon:
                        CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(17)),
                SelectFormField(
                  type: SelectFormFieldType.dropdown, // or can be dialog
                  //initialValue: snapshot.data?["gender"],
                  //icon: Icon(Icons.format_shapes),
                  //labelText: 'Gender',
                  controller: sexController,
                  items: _items,
                  onChanged: (val) => selectedValue = val,
                  decoration: InputDecoration(
                    labelText: "Gender",
                    hintText: snapshot.data?[uid]["0"]['gender'],
                    //hintText: "SEX",

                    // If  you are using latest version of flutter then lable text and hint text shown like this
                    // if you r using flutter less then 1.20.* then maybe this is not working properly
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon:
                        CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
                  ),
                  //onSaved: (val) => print(val),
                ),
                SizedBox(height: getProportionateScreenHeight(17)),
                // DropdownButtonFormField(
                //   value: selectedValue,
                //   icon: Icon(
                //     Icons.abc,
                //     color: Colors.white,
                //   ),
                //   onChanged: (String? newValue) {
                //     setState(() {
                //       selectedValue = newValue;
                //     });
                //   },
                //   items: <String>['No', 'Male', 'FeMale']
                //       .map<DropdownMenuItem<String>>((String value) {
                //     return DropdownMenuItem<String>(
                //       value: value,
                //       child: Text(value),
                //     );
                //   }).toList(),
                //   decoration: InputDecoration(
                //     labelText: "Gender",
                //     //hintText: sex,
                //     // If  you are using latest version of flutter then lable text and hint text shown like this
                //     // if you r using flutter less then 1.20.* then maybe this is not working properly
                //     floatingLabelBehavior: FloatingLabelBehavior.always,
                //     suffixIcon:
                //         CustomSurffixIcon(svgIcon: "assets/icons/Heart Icon.svg"),
                //   ),
                // ),
                // SizedBox(height: getProportionateScreenHeight(17)),
                TextFormField(
                  controller: birthdayController,
                  onSaved: (newValue) => lastName = newValue!,
                  // initialValue: "ass",

                  decoration: InputDecoration(
                    labelText: "Birthday",
                    hintText: "dd/mm/yy",

                    // If  you are using latest version of flutter then lable text and hint text shown like this
                    // if you r using flutter less then 1.20.* then maybe this is not working properly
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon: CustomSurffixIcon(
                        svgIcon: "assets/icons/Gift Icon.svg"),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(17)),
                TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  onSaved: (newValue) => phoneNumber = newValue!,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      removeError(error: kPhoneNumberNullError);
                    }
                    return null;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      addError(error: kPhoneNumberNullError);
                      return "";
                    }
                    return null;
                  },
                  //initialValue: phone,
                  decoration: InputDecoration(
                    labelText: "Phone Number",
                    hintText: snapshot.data?[uid]["0"]['phone'],
                    //hintText: "0000",
                    // If  you are using latest version of flutter then lable text and hint text shown like this
                    // if you r using flutter less then 1.20.* then maybe this is not working properly
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon:
                        CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(17)),
                TextFormField(
                  controller: addressController,
                  onSaved: (newValue) => address = newValue!,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      removeError(error: kAddressNullError);
                    }
                    return null;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      addError(error: kAddressNullError);
                      return "";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Address",
                    //hintText: address,
                    // If  you are using latest version of flutter then lable text and hint text shown like this
                    // if you r using flutter less then 1.20.* then maybe this is not working properly
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon: CustomSurffixIcon(
                        svgIcon: "assets/icons/Location point.svg"),
                  ),
                ),
                FormError(errors: errors),
                SizedBox(height: getProportionateScreenHeight(25)),
                DefaultButton(
                  text: "Update Profile",
                  press: () {
                    if (_formKey.currentState!.validate()) {
                      try {
                        dynamic result = updateuser(
                          snapshot.data?[uid]["0"]['email'],
                          fullnameController.text,
                          sexController.text,
                          birthdayController.text,
                          phoneController.text,
                          addressController.text,
                        );
                        dynamic re = editUserDetail(fullnameController.text);
                        print(selectedValue);
                        if (result != null && re != null) {
                          _showMyDialog(context);
                        }
                      } catch (e) {
                        print(e);
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // DropdownButtonFormField buildSexFormFielda(String sex) {
  //   return DropdownButtonFormField(
  //     value: sex,
  //     icon: Icon(
  //       Icons.abc,
  //       color: Colors.white,
  //     ),
  //     onChanged: (value) {
  //       setState(() {
  //         selectedValue = value;
  //       });
  //     },
  //     items: <String>['No', 'Male', 'FeMale']
  //         .map<DropdownMenuItem<String>>((String value) {
  //       return DropdownMenuItem<String>(
  //         value: value,
  //         child: Text(value),
  //       );
  //     }).toList(),
  //     decoration: InputDecoration(
  //       labelText: "Gender",
  //       hintText: sex,
  //       // If  you are using latest version of flutter then lable text and hint text shown like this
  //       // if you r using flutter less then 1.20.* then maybe this is not working properly
  //       floatingLabelBehavior: FloatingLabelBehavior.always,
  //       suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Heart Icon.svg"),
  //     ),
  //   );
  // }

  // TextFormField buildAddressFormField(String address) {
  //   return TextFormField(
  //     controller: addressController,
  //     onSaved: (newValue) => address = newValue!,
  //     onChanged: (value) {
  //       if (value.isNotEmpty) {
  //         removeError(error: kAddressNullError);
  //       }
  //       return null;
  //     },
  //     validator: (value) {
  //       if (value!.isEmpty) {
  //         addError(error: kAddressNullError);
  //         return "";
  //       }
  //       return null;
  //     },
  //     // initialValue: address,
  //     decoration: InputDecoration(
  //       labelText: "Address",
  //       //hintText: address,
  //       // If  you are using latest version of flutter then lable text and hint text shown like this
  //       // if you r using flutter less then 1.20.* then maybe this is not working properly
  //       floatingLabelBehavior: FloatingLabelBehavior.always,
  //       suffixIcon:
  //           CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
  //     ),
  //   );
  // }

  // TextFormField buildPhoneNumberFormField(String phone) {
  //   return TextFormField(
  //     controller: phoneController,
  //     keyboardType: TextInputType.phone,
  //     onSaved: (newValue) => phoneNumber = newValue!,
  //     onChanged: (value) {
  //       if (value.isNotEmpty) {
  //         removeError(error: kPhoneNumberNullError);
  //       }
  //       return null;
  //     },
  //     validator: (value) {
  //       if (value!.isEmpty) {
  //         addError(error: kPhoneNumberNullError);
  //         return "";
  //       }
  //       return null;
  //     },
  //     //initialValue: phone,
  //     decoration: InputDecoration(
  //       labelText: "Phone Number",
  //       //hintText: phone,
  //       // If  you are using latest version of flutter then lable text and hint text shown like this
  //       // if you r using flutter less then 1.20.* then maybe this is not working properly
  //       floatingLabelBehavior: FloatingLabelBehavior.always,
  //       suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
  //     ),
  //   );
  // }

  // TextFormField buildBirthDayFormField(String birthday) {
  //   String birthDateInString;
  //   DateTime birthDate;
  //   return TextFormField(
  //     controller: birthdayController,
  //     onSaved: (newValue) => lastName = newValue!,
  //     // initialValue: "ass",
  //     onTap: () async {
  //       DateTime date = DateTime(1900);
  //       FocusScope.of(context).requestFocus(new FocusNode());

  //       date = (await showDatePicker(
  //           context: context,
  //           initialDate: DateTime.now(),
  //           firstDate: DateTime(1900),
  //           lastDate: DateTime(2100)))!;

  //       birthdayController.text = DateFormat('yyyy-MM-dd').format(date);
  //       ;
  //     },
  //     decoration: InputDecoration(
  //       labelText: "Birthday",
  //       // hintText: birthday,

  //       // If  you are using latest version of flutter then lable text and hint text shown like this
  //       // if you r using flutter less then 1.20.* then maybe this is not working properly
  //       floatingLabelBehavior: FloatingLabelBehavior.always,
  //       suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Gift Icon.svg"),
  //     ),
  //   );
  // }

  // TextFormField buildFullNameFormField(String fullname) {
  //   return TextFormField(
  //     controller: fullnameController,
  //     onSaved: (newValue) => firstName = newValue!,
  //     onChanged: (value) {
  //       if (value.isNotEmpty) {
  //         removeError(error: kNamelNullError);
  //       }
  //       return null;
  //     },
  //     validator: (value) {
  //       if (value!.isEmpty) {
  //         addError(error: kNamelNullError);
  //         return "";
  //       }
  //       return null;
  //     },
  //     decoration: InputDecoration(
  //       labelText: "Full Name",
  //       //hintText: fullname,

  //       // If  you are using latest version of flutter then lable text and hint text shown like this
  //       // if you r using flutter less then 1.20.* then maybe this is not working properly
  //       floatingLabelBehavior: FloatingLabelBehavior.always,
  //       suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
  //     ),
  //   );
  // }
}

Future<void> _showMyDialog(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          'Update thành công',
          style: TextStyle(color: Colors.red),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('Đừng chỉnh sưa nữa mệt lắm rồi'),
            ],
          ),
        ),
      );
    },
  );
}
