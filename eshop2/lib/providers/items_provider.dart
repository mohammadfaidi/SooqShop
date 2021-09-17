import 'package:eshop2/providers/items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TasksProvider with ChangeNotifier {
  ///fav=====================

  List<ItemModel> itemsFav = [];
  int _countFav = 0;
  void addCountFav() {
    _countFav++;
    notifyListeners();
  }

  void addFav(ItemModel item) {
    itemsFav.add(item);
    notifyListeners();
  }

  void removeFav(ItemModel item) {
    itemsFav.remove(item);
    notifyListeners();
  }

  int get countFav {
    return itemsFav.length;
  }

  List<ItemModel> get basketItemsFav {
    return itemsFav;
  }

  ///itemsShop==================
  List<ItemModel> itemsShop = [];
  int _countShop = 0;
  double price = 0;

  void addCountShop() {
    _countShop++;
    notifyListeners();
  }

  void addFShop(ItemModel item) {
    itemsShop.add(item);
    price += item.price;
    notifyListeners();
  }

  void removeShop(ItemModel item) {
    itemsShop.remove(item);
    price -= item.price;

    notifyListeners();
  }

  int get countShop {
    return itemsShop.length;
  }

  List<ItemModel> get basketItemsShop {
    return itemsShop;
  }
  //url launcher

  //Url Launcher
  Future<void> phone(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could Not Launch $url";
    }
  }

  Future<void> sms(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could Not Launch $url";
    }
  }

  Future<void> email(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could Not Launch $url";
    }
  }

  Future<void> gitHup(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could Not Launch $url";
    }
  }

  Future<void> faceBook(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could Not Launch $url";
    }
  }

  ThemeData _themeData;

  TasksProvider(
    this._themeData,
  );
  getTheme() => _themeData;

  setTheme(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }
}
