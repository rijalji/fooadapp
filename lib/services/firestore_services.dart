import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fooadapp/model/product.dart';
import 'package:flutter/material.dart';
import 'package:fooadapp/snack.dart';



class FirestoerServices {

    FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

    Stream<List<ProductModel>> getProduct(){
        return _firebaseFirestore.collection('products').
            snapshots().map((snapshot) =>
            snapshot.docs.map((doc)=>ProductModel.fromJson(doc.data())).toList());
    }

    Future<void> setEntry(ProductModel productModel)async{
            var options=SetOptions(merge: true);
            return _firebaseFirestore.collection('products').doc(productModel.productID).set(productModel.toMap());
    }


    Future<void>removeProduct(ProductModel productModel){
        return _firebaseFirestore.collection('products').doc(productModel.productID).delete();
    }


}


//class FirestoreServices {
//
//    Firestore _db = Firestore.instance;
//
//    Future<void> saveproduct(ProductModel product){
//        return _db.collection('products').document(product.productID).setData(product.toMap());
//    }
//
//    Stream<List<ProductModel>> getProduct(){
//        return _db.collection('products').snapshots().map((snapshot) =>
//            snapshot.documents.map((document) =>ProductModel.fromFirestore(document.data)).toList());
//    }
//
//}