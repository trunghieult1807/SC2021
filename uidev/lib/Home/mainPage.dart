import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uidev/Main/constants.dart';
import 'package:uidev/Main/popularProduct.dart';
import 'package:animated_drawer/views/animated_drawer.dart';
import 'package:get/get.dart';
import 'package:uidev/Main/customButtons.dart';
import 'package:uidev/Main/textStyles.dart';

//import 'package:uidev/Externnal Login/googleSignIn.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedDrawer(
        homePageXValue: 170,
        homePageYValue: 80,
        homePageAngle: -0.2,
        homePageSpeed: 250,
        shadowXValue: 122,
        shadowYValue: 110,
        shadowAngle: -0.275,
        shadowSpeed: 550,
        shadowColor: Color.fromRGBO(0, 0, 0, 0.05),
        openIcon: Icon(Icons.menu, color: Colors.white),
        closeIcon: Icon(Icons.arrow_back_ios, color: Colors.white),
        backgroundGradient: LinearGradient(
          colors: [
            Colors.white,
            Colors.white,
          ],
        ),
        menuPageContent: Padding(
          padding: EdgeInsets.only(top: 50.0, left: 20),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white)),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                      'assets/profile.png',
                    ),
                    maxRadius: 35,
                  ),
                ),
                const SizedBox(height: 5),
                Text("Hello,", style: regularTxtStyle),
                Text(
                  "Hieu Le",
                  style: medBoldStyle,
                ),
                const SizedBox(height: 15),
                Container(
                  width: 140,
                  height: 2,
                  color: Colors.grey[200],
                ),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "Home Screen",
                    style: smallTxtStyle.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(0, 0, 0, 0.60),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "Notification",
                    style: smallTxtStyle.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(0, 0, 0, 0.60),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "Dash Board",
                    style: smallTxtStyle.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(0, 0, 0, 0.60),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "Account",
                    style: smallTxtStyle.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(0, 0, 0, 0.60),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "Settings",
                    style: smallTxtStyle.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(0, 0, 0, 0.60),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                InkWell(
                  onTap: () {},
                  child: Text(
                    "Support",
                    style: smallTxtStyle.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(0, 0, 0, 0.60),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  width: 140,
                  height: 2,
                  color: Colors.grey[200],
                ),
                const SizedBox(height: 20),
                FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  onPressed: () {},
                  color: Colors.black26,
                  child: Text(
                    "Log Out",
                    style: smallTxtStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        homePageContent: Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
          color: Colors.white,
          //child: Container(color: Colors.yellow,)
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top, bottom: 10),
                width: Get.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xffa58fd2), Color(0xffddc3fc)],
                  ),
                  //color: Colors.yellow,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  children: [
                    buildAppBar(),
                    buildSearchBar(),
                    buildCollectionWidget(),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Upcoming Tasks",
                      style: medBoldStyle,
                    ),
                    Text(
                      "View All",
                      style: smallBoldTxtStyle.copyWith(color: Colors.black54),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Container(
                height: 140,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Product(
                        //product: [index],
                        );
                  },
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  buildCollectionWidget() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Best Collections",
            style: medBoldStyle.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 15),
          Container(
            height: 90,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: collectionList.length,
              itemBuilder: (BuildContext context, int index) {
                return CustomButton(
                  icon: collectionList[index].imgUrl,
                  name: collectionList[index].name,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: appRecentColor,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
      child: TextFormField(
        controller: new TextEditingController(),
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Color(0xFF98A0A6),
              size: 20,
            ),
            hintText: "what you are looking at",
            contentPadding: const EdgeInsets.only(top: 13),
            hintStyle: regularTxtStyle,
            labelStyle: regularBoldTxtStyle,
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            suffixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.camera_alt,
                  color: const Color(0xFF98A0A6),
                  size: 20,
                ),
                SizedBox(width: 15),
                Icon(
                  Icons.mic,
                  color: const Color(0xFF98A0A6),
                  size: 20,
                ),
                SizedBox(width: 15),
              ],
            )),
      ),
    );
  }

  buildAppBar() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 0),
          // Image.asset(
          //   'assets/logo.png',
          //   height: 25,
          // ),
          CircleAvatar(
            backgroundColor: appRecentColor,
            backgroundImage: AssetImage(
              'assets/profile.png',
            ),
          ),
        ],
      ),
    );
  }
}
