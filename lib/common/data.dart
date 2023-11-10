import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const storage = FlutterSecureStorage();
const test =
    'https://www.adobe.com/content/dam/cc/us/en/creative-cloud/photography/discover/landscape-photography/CODERED_B1_landscape_P2d_714x348.jpg.img.jpg';

List<BannerModel> listBanners = [
  BannerModel(imagePath: test, id: "1"),
  BannerModel(imagePath: test, id: "2"),
  BannerModel(imagePath: test, id: "3"),
  BannerModel(imagePath: test, id: "4"),
];
