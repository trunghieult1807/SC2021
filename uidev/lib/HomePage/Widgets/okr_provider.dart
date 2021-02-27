import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uidev/Theme/Color/light_colors.dart';

//Everything the user adds to the list is a task.
//Task provider is self explanatory and its job is being the provider for the project.

class OKR {
  final String id;
  Color cardColor;
  double loadingPercent;
  String title;
  String subtitle;

  OKR({
    @required this.id,
    this.cardColor,
    this.loadingPercent,
    this.title,
    this.subtitle,
  });
}

class OKRProvider with ChangeNotifier {
  List<OKR> get okrList {
    return _okrList;
  }

  final List<OKR> _okrList = [
    OKR(
        id: 'okr#1',
        cardColor: LightColors.kDarkYellow,
        loadingPercent: 0.90,
        title: "PPL",
        subtitle: "Nguyen Hua Phung"),
    OKR(
        id: 'okr#2',
        cardColor: LightColors.kRed,
        loadingPercent: 0.80,
        title: "Sports App",
        subtitle: "20 hours progress"),
    OKR(
        id: 'okr#3',
        cardColor: LightColors.kGreen,
        loadingPercent: 0.30,
        title: "Making History Notes",
        subtitle: "Medical App"),
    OKR(
      id: 'okr#4',
      cardColor: LightColors.kBlue,
      loadingPercent: 0.9,
      title: 'Online Flutter Course',
      subtitle: '23 hours progress',
    ),
    OKR(
      id: 'okr#5',
      cardColor: LightColors.kDarkYellow,
      loadingPercent: 0.45,
      title: 'Sports App',
      subtitle: '5 hours progress',
    ),
  ];

  OKR getById(String id) {
    return _okrList.firstWhere((okr) => okr.id == id);
  }

  void createNewOKR(OKR okr) {
    final newOKR = OKR(
      id: okr.id,
      cardColor: okr.cardColor,
      loadingPercent: okr.loadingPercent,
      title: okr.title,
      subtitle: okr.subtitle,
    );
    _okrList.add(newOKR);
    notifyListeners();
  }

  void editOKR(OKR okr) {
    int index = _okrList.indexWhere((_okr) => _okr.id == okr.id);
    _okrList[index].subtitle = okr.subtitle;
    _okrList[index].title = okr.title;
    _okrList[index].cardColor = okr.cardColor;
    notifyListeners();
  }

  void removeOKR(String id) {
    _okrList.removeWhere((okr) => okr.id == id);
    notifyListeners();
  }
}
