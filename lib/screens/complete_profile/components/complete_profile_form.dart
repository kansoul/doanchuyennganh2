import 'package:chatapp/screens/chats_screen/chats_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../components/custom_surfix_icon.dart';
import '../../../components/default_button.dart';
import '../../../components/form_error.dart';
import '../../../constants.dart';
import '../../../firestore.dart';
import '../../../size_config.dart';
import '../../sign_up/components/sign_up_form.dart';
import 'package:intl/intl.dart';

class CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  late String firstName;
  late String lastName;
  late String Sex;
  late String phoneNumber;
  late String address;
  late String img;
  final fullnameController = TextEditingController();
  final birthdayController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final sexController = TextEditingController();
  String? selectedValue = null;
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
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildFullNameFormField(),
          SizedBox(height: getProportionateScreenHeight(17)),
          buildSexFormFielda(),
          SizedBox(height: getProportionateScreenHeight(17)),
          buildBirthDayFormField(),
          SizedBox(height: getProportionateScreenHeight(17)),
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(17)),
          buildAddressFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(25)),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState!.validate()) {
                try {
                  if (selectedValue == 'Male') {
                    img =
                        "https://cdn.icon-icons.com/icons2/2643/PNG/512/male_boy_person_people_avatar_icon_159358.png";
                  }
                  ;
                  if (selectedValue == 'FeMale') {
                    img =
                        "https://cdn1.iconfinder.com/data/icons/avatars-1-5/136/87-512.png";
                  }
                  ;

                  if (selectedValue == 'No') {
                    img =
                        "https://as1.ftcdn.net/v2/jpg/02/85/50/62/1000_F_285506285_DGnMLGrB08BLIIVHEE4gywoDyzHYqnYt.jpg";
                  }
                  ;
                  dynamic result = addusernc(
                    SignUpForm.suemailController.text,
                    fullnameController.text,
                    selectedValue!,
                    birthdayController.text,
                    phoneController.text,
                    addressController.text,
                    //img,
                  );
                  dynamic re = UserDetail(fullnameController.text, img);
                  dynamic res = addimg(img);
                  dynamic cchat = createchat(
                      FirebaseAuth.instance.currentUser!.uid.toString());
                  dynamic cfriend = createfriend(
                      FirebaseAuth.instance.currentUser!.uid.toString());
                  dynamic cfriendreq = createfriendreq(
                      FirebaseAuth.instance.currentUser!.email.toString());
                  print(selectedValue);
                  if (result != null &&
                      res != null &&
                      re != null &&
                      cchat != null &&
                      cfriend != null &&
                      cfriendreq != null) {
                    Navigator.pushNamed(context, ChatsScreen.routeName);
                  }
                } catch (e) {
                  setState(() {
                    addError(error: kEmailError);
                  });
                }
              }
            },
          ),
        ],
      ),
    );
  }

  DropdownButtonFormField buildSexFormFielda() {
    return DropdownButtonFormField(
      value: selectedValue,
      icon: Icon(
        Icons.abc,
        color: Colors.white,
      ),
      onChanged: (value) {
        setState(() {
          selectedValue = value;
        });
      },
      items: <String>['No', 'Male', 'FeMale']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      decoration: InputDecoration(
        labelText: "Sex",
        hintText: "Enter your sex",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Heart Icon.svg"),
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
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
        hintText: "Enter your address",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
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
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildBirthDayFormField() {
    String birthDateInString;
    DateTime birthDate;
    return TextFormField(
      controller: birthdayController,
      onSaved: (newValue) => lastName = newValue!,
      onTap: () async {
        DateTime date = DateTime(1900);
        FocusScope.of(context).requestFocus(new FocusNode());

        date = (await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2100)))!;

        birthdayController.text = DateFormat('yyyy-MM-dd').format(date);
        ;
      },
      decoration: InputDecoration(
        labelText: "Birthday",
        hintText: "Enter your Birthday",

        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Gift Icon.svg"),
      ),
    );
  }

  TextFormField buildFullNameFormField() {
    return TextFormField(
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
        hintText: "Enter your full name",

        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }
}
