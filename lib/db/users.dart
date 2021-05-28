import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_look_good_assignment/models/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_look_good_assignment/models/cart_item.dart';




class UserServices {
  Firestore _firestore = Firestore.instance;
  String collection = "users";

  void createUser(Map data) {
    _firestore.collection(collection).document(data["userId"]).setData(data);
  }

  Future <UserModel> getUserByID(String id) =>
      _firestore.collection(collection).document(id).get().then((doc) {
        return UserModel.fromSnapshot(doc);
      });

  Future<UserModel> getUserById(String id) =>
      _firestore.collection(collection).document(id).get().then((doc) {
        print("==========id is $id=============");
        debugPrint("==========NAME is ${doc.data['name']}=============");
        debugPrint("==========NAME is ${doc.data['name']}=============");
        debugPrint("==========NAME is ${doc.data['name']}=============");
        debugPrint("==========NAME is ${doc.data['name']}=============");

        print("==========NAME is ${doc.data['name']}=============");
        print("==========NAME is ${doc.data['name']}=============");
        print("==========NAME is ${doc.data['name']}=============");


        return UserModel.fromSnapshot(doc);
      });

  void addToCart({String userId, CartItemModel cartItem}) {
    _firestore.collection(collection).document(userId).updateData({
      "cart": FieldValue.arrayUnion([cartItem.toMap()])
    });
  }

  void removeFromCart({String userId, CartItemModel cartItem}) {
    _firestore.collection(collection).document(userId).updateData({
      "cart": FieldValue.arrayRemove([cartItem.toMap()])
    });
  }
}


