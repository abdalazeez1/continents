import 'package:delete/helper/repo.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/services.dart';

class ProviderData extends ChangeNotifier {
  Map data;
  List<Repo> prefer = [];
  List<Repo> favorite = [];
  bool isDark = false;
  List<Repo> search = [];
  List extract = [];//contain name of country
  List city = [];

  searchF(String s) {
    search = [];
    String d = s.toLowerCase();
    prefer.forEach((element) {
      if (element.name.toLowerCase().contains(d)) {
        search.add(element);
      }
    });

    notifyListeners();
  }

  List<Repo> getSearch() => search;

  addRepoToFavorite() {
    favorite = prefer.where((element) => element.favo == true).toList();
  }

  deleteFromFavorite(int i, String name) {
    favorite.removeAt(i);
    print(name);
    prefer.forEach((element) {
      if (element.name == name) {
        print(element.name);
        element.favo = false;
        notifyListeners();
      }
    });
    notifyListeners();
  }

  addRepoToPrefer(Repo repo) {

    prefer.add(repo);
    // notifyListeners();
  }
List<Repo> getPrefer()=>prefer;
  setValueOfFavorite(bool val, int i) {
    prefer[i].favo = val;
    notifyListeners();
  }

  void setDark(bool g) {
    isDark = g;
    notifyListeners();
  }

  Future<void> loadJsonData() async {
    var jsonText = await rootBundle.loadString('assets/data.json');
    data = json.decode(jsonText);
    notifyListeners();
  }
}
