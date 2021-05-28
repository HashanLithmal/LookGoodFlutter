import 'dart:ffi';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel
{

  static const ID ="id";
  static const CATEGORY ="category";
  static const NAME ="name";
  static const PRICE ="price";
  static const BRAND ="brand";
  static const DESCRIPTION ="description";
  static const FEATURED ="featured";
  static const IMAGE ="image";


  String _id;
  String _category;
  String _name;
  String _brand;
  String _image;
  int _price;
  bool   _featured;
  String _description;


  //getters

String get id=>_id;
String get category=>_category;
String get name=>_name;
String get brand=>_brand;
String get imageUrl=>_image;
int get price=>_price;
bool get featured => _featured;
String get description=>_description;



//constructor

ProductModel.fromSnapshot(DocumentSnapshot snapshot){
Map data= snapshot.data;
_id=data[ID];
_category=data[CATEGORY];
_name=data[NAME];
_brand=data[BRAND];
_price=data[PRICE];
_description=data[DESCRIPTION];
_featured=data[FEATURED];
_image=data[IMAGE];



}




}