import 'dart:collection';
import 'package:animation/models/information.dart';
import 'package:flutter/cupertino.dart';

class InformationData extends ChangeNotifier {
  List<Information> _informations = [];

  UnmodifiableListView<Information> get informations {
    return UnmodifiableListView(_informations);
  }

  int get informationLength {
    return _informations.length;
  }

  void addNewInformation(String newLoc, int newNumofTra, String newNote,
      List newchecking, List newshoot) {
    final information = Information(
        location: newLoc,
        numoftrack: newNumofTra,
        note: newNote,
        checking: newchecking,
        shoot: newshoot);
    _informations.add(information);
    notifyListeners();
  }

  void deleteInformation(Information information) {
    _informations.remove(information);
    notifyListeners();
  }
}
