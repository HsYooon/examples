import 'dart:collection';

import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';

class Item {
  Item(this.name, this.color);
  Key key = UniqueKey();
  Color color;
  String name;
}

class CartModel extends ChangeNotifier {
  static final instance = CartModel._();
  CartModel._();

  final List<Item> _list = [];

  get items => UnmodifiableListView(_list);

  void add(Item item) {
    _list.add(item);
    Fimber.d("CartModel's add method is called");
    notifyListeners();
  }

  void remove(Item item) {
    _list.remove(_list.where((e) => e.key == item.key).first);
    notifyListeners();
  }

  void removeAll() {
    _list.clear();
    Fimber.d("CartModel's clear method is called");
    notifyListeners();
  }
}
