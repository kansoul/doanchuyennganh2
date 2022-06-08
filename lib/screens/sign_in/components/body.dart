import 'package:flutter/material.dart';
import '../../../components/no_account_text.dart';
import '../../../components/socal_card.dart';
import '../../../size_config.dart';
import 'sign_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 220,
                      //color: Colors.blue,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/background.png'),
                              fit: BoxFit.fill)),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            left: 30,
                            width: 80,
                            height: 200,
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/light-1.png'))),
                            ),
                          ),
                          Positioned(
                            left: 140,
                            width: 80,
                            height: 150,
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/light-2.png'))),
                            ),
                          ),
                          Positioned(
                            right: 40,
                            top: 40,
                            width: 80,
                            height: 150,
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/clock.png'))),
                            ),
                          ),
                          // Positioned(
                          //   child: Container(
                          //     margin: EdgeInsets.only(top: 190),
                          //     child: Center(
                          //       child: Text(
                          //         "Login",
                          //         style: TextStyle(
                          //             color: Colors.blueGrey,
                          //             fontSize: 40,
                          //             fontWeight: FontWeight.bold),
                          //       ),
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Positioned(
                        child: Container(
                          //margin: EdgeInsets.only(top: 190),
                          child: Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: SizeConfig.screenHeight * 0.02),
                      //SizedBox(height: SizeConfig.screenHeight * 0.08),
                      SignForm(),
                      SizedBox(height: SizeConfig.screenHeight * 0.08),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocalCard(
                            icon: "assets/icons/google-icon.svg",
                            press: () {},
                          ),
                          SocalCard(
                            icon: "assets/icons/facebook-2.svg",
                            press: () {},
                          ),
                          SocalCard(
                            icon: "assets/icons/twitter.svg",
                            press: () {},
                          ),
                        ],
                      ),
                      SizedBox(height: getProportionateScreenHeight(20)),
                      NoAccountText(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
