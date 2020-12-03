import 'package:fooadapp/model/product.dart';
import 'package:fooadapp/services/firestore_services.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:toast/toast.dart';
import 'package:uuid/uuid.dart';

class ProductProvider extends ChangeNotifier{

  FirestoerServices _firestoerServices=FirestoerServices();

  DateTime _date;
  String _productName;
  String _entryId;
  var uuid=Uuid();

  Stream<List<ProductModel>> get getProduct => _firestoerServices.getProduct();

  String get name => _productName;
  DateTime get date => _date;

 setChangeDate(DateTime datetime) {
    _date=datetime;
    notifyListeners();
  }

 setChangeNameProduct(String productName){
     _productName=productName;
     notifyListeners();
  }


  loadAll(ProductModel productModel){
   if(productModel != null){
     _date=DateTime.parse(productModel.date);
     _productName=productModel.productName;
     _entryId=productModel.productID;
   }else{
     _date=DateTime.now();
     _productName=null;
     _entryId=null;
   }
  }

  saveProduct(ProductModel namee,BuildContext context){

   if(_entryId==null){

       return _firestoerServices.setEntry(ProductModel(productID:uuid.v1(),productName: name,date: date.toIso8601String()));
   }else if(_entryId == _entryId) {
       return _firestoerServices.setEntry(ProductModel(productID:_entryId,productName: name,date: date.toIso8601String()));
   }
  }

  removeProductId(ProductModel id){
    return _firestoerServices.removeProduct(id);
  }

}
//class ProductProvider extends ChangeNotifier {
//  FirestoreServices _firestoreServices=FirestoreServices();
//  String _productID;
//  String _productName;
//  double _price;
//  var uuid=Uuid();
//
//  changeProductName(String value){
//    _productName=value;
//    notifyListeners();
//  }
//
//  changePrice(String value){
//    _price=double.parse(value);
//    notifyListeners();
//  }
//
//  String get name => _productName;
//
//  double get prices => _price;
//
//
//  loadedUpdate(ProductModel productModel){
//    _productName=productModel.productName;
//    _price=productModel.price;
//    _productID=productModel.productID;
//  }
//
//  saveProduct(){
//    print(_productID);
//    if(_productID==null){
//      _firestoreServices.saveproduct(ProductModel(productID: uuid.v4(),productName: name,price: prices));
//    }else{
//      _firestoreServices.saveproduct(ProductModel(productID: _productID,productName: name,price: prices));
//    }
//  }
//
//
//
//}