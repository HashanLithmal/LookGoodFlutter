
class CartItemModel {
  static const ID = "id";
  static const NAME = "name";
  static const IMAGE = "image";
  static const PRODUCT_ID = "productId";
  static const PRICE = "price";


  String _id;
  String _name;
  String _image;
  String _productId;
  int _price;

  //  getters
  String get id => _id;

  String get name => _name;

  String get image => _image;

  String get productId => _productId;


  int get price => _price;



  CartItemModel.fromMap(Map data){
    _id = data[ID];
    _name =  data[NAME];
    _image =  data[IMAGE];
    _productId = data[PRODUCT_ID];
    _price = data[PRICE];

  }

  Map toMap() => {
    ID: _id,
    IMAGE: _image,
    NAME: _name,
    PRODUCT_ID: _productId,
    PRICE: _price,

  };
}
