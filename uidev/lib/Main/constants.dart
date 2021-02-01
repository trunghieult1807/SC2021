import 'package:uidev/Main/collection.dart';
import 'package:flutter/material.dart';

Color appThemeColor = Color(0xFF08090C);
const Color appRecentColor = Color(0xFFE4E5E5);

const int purple = 0xff3c1361;
const int red = 0xffff2525;
const int brightYellow = 0xffffe03d;
const int midYellow = 0xffffd03d;
const int yellow = 0xffffc03d;
const int silver = 0xfff2f5fc;
const int darkSilver = 0xffe7eefb;

var slideShowList = [
  "https://images-eu.ssl-images-amazon.com/images/G/31/img20/Wireless/Xiaomi/Redmi_9Power/LP/D19338206_WLM_Redmi_9Power_Launch__PC.gif",
  "https://images-eu.ssl-images-amazon.com/images/G/31/img20/Fashion/EVENT/WRS_Dec/Teaser/BankstripesTopBanner/12-Top-banner-PC-new.gif",
  "https://images-eu.ssl-images-amazon.com/images/G/31/img20/Books/102020/Editorial/bookbazar_header_Pc_1500x300-revised.jpg",
  "https://images-eu.ssl-images-amazon.com/images/G/31/Symbol/2020/GatewayNK/slide8/09/PL_Slide8_GWPC_1500x600_1-men._CB405247109_.jpg",
];

var collectionList = [
  Collection(
    name: "Mobile",
    imgUrl: "assets/collections/mobile.png",
  ),
  Collection(
    name: "Fashion",
    imgUrl: "assets/collections/fashion.png",
  ),
  Collection(
    name: "Electronics",
    imgUrl: "assets/collections/electronics.png",
  ),
  Collection(
    name: "Home",
    imgUrl: "assets/collections/house.png",
  ),
  Collection(
    name: "Toys",
    imgUrl: "assets/collections/toys.png",
  ),
];
