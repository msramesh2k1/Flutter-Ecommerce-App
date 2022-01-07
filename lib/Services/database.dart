import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:trendz/models/category_model.dart';

class DataBase extends ChangeNotifier {
  List<Categorymodel> categorylist = [];

  Database() {}
  initDatabseProvider() {
    FirebaseFirestore.instance
        .collection("category")
        .get()
        .then((value) => value.docs.forEach((element) {
              categorylist.add(Categorymodel(element.data()["name"]));
            }));
    notifyListeners();
   
  }
}
