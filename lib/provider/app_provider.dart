import 'package:flutter_look_good_assignment/db/products.dart';
import 'package:flutter_look_good_assignment/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class AppProvider with ChangeNotifier{
  bool isLoading = false;

  void changeIsLoading(){
    isLoading = !isLoading;
    notifyListeners();
  }
}