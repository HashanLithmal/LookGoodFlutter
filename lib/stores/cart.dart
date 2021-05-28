import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_look_good_assignment/Config/config.dart';
import 'package:flutter_look_good_assignment/Address/address.dart';
import 'package:flutter_look_good_assignment/Widgets/customAppBar.dart';
import 'package:flutter_look_good_assignment/Widgets/loadingWidget.dart';
import 'package:flutter_look_good_assignment/models/item.dart';
import 'package:flutter_look_good_assignment/Counters/cartitemcounter.dart';
import 'package:flutter_look_good_assignment/counters/totalMoney.dart';
import 'package:flutter_look_good_assignment/Widgets/myDrawer.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_look_good_assignment/stores/storehome.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage>
{

  double totalAmount;

  @override
  void initState() {
    super.initState();

    totalAmount = 0;
    Provider.of<TotalAmount>(context, listen: false).display(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: ()
        {
          if(EcomApp.sharedPreferences.getStringList(EcomApp.userCartList).length == 1)
            {
              Fluttertoast.showToast(msg: "Your Cart is empty");
            }
          else
            {
              Route route = MaterialPageRoute(builder: (c) => Address(totalAmount: totalAmount));
              Navigator.pushReplacement(context, route);
          }
        },
        label: Text("Check out"),
        backgroundColor: Colors.pinkAccent,
        icon: Icon(Icons.navigate_next),
      ),
      appBar: MyAppBar(),
        drawer: MyDrawer(),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Consumer2<TotalAmount, CartItemCounter>(builder: (context, amountProvider, cartProvider, c)
              {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: cartProvider.count == 0
                        ? Container()
                        : Text(
                      "Total Price: LKR ${amountProvider.totalAmount.toString()}",
                      style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.w500),
                    ),
                  ),
                );
              },),
            ),



          ],
        ),
    );
  }

  beginbuildingCart()
  {
    return SliverToBoxAdapter(
      child: Card(
       /* color: Theme.of(context).primaryColor.withOpacity(0.5),
        child: Container(
          height: 100.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.insert_emoticon, color: Colors.white,),
              Text("Cart is empty"),
              Text("Start adding items to your Cart."),
            ],
          ),
        ),*/
      ),
    );
  }

  removeItemFromUserCart(String shortInfoAsId)
  {
    List tempCartList = EcomApp.sharedPreferences.getStringList(EcomApp.userCartList);
    tempCartList.remove(shortInfoAsId);

    EcomApp.firestore.collection(EcomApp.collectionUser)
        .document(EcomApp.sharedPreferences.getString(EcomApp.userUID))
        .updateData({
      EcomApp.userCartList: tempCartList,
    }).then((v){

      Fluttertoast.showToast(msg: "Item Removed Successfully");
      EcomApp.sharedPreferences.setStringList(EcomApp.userCartList, tempCartList);

      Provider.of<CartItemCounter>(context, listen: false).displayResult();

      totalAmount =0;

    });
  }
}
