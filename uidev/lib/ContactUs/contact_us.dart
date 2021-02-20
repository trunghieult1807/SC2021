import 'package:uidev/ContactUs/contact_us_lib.dart';
import 'package:flutter/material.dart';
import 'package:uidev/Theme/Color/light_colors.dart';
import 'package:uidev/Theme/BackButton/back_button.dart';

class ContactUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.kLightYellow,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              20,
              20,
              20,
              0,
            ),
            child: Column(
              children: [
                Row(
                  //mainAxisAlignment:,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.ideographic,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyBackButton(),
                    Text(
                      "Contact us",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                ContactUs(
                  cardColor: Colors.white,
                  textColor: Colors.teal.shade900,
                  logo: AssetImage('assets/company.png'),
                  email: 'trunghieult1807@gmail.com',
                  companyName: 'DSC',
                  companyColor: LightColors.kDarkBlue,
                  phoneNumber: '+84703799116',
                  website: 'https://github.com/trunghieult1807',
                  githubUserName: 'trunghieult1807',
                  linkedinURL: 'https://github.com/trunghieult1807',
                  tagLine: 'Solution Challenge 2021',
                  taglineColor: LightColors.kDarkBlue,
                  twitterHandle: 'trunghieult1807',
                  instagram: 'trunghieult1807',
                ),
                SizedBox(
                  height: 35,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
