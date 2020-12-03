
import 'package:flutter/material.dart';

class Snack{

  final GlobalKey<ScaffoldState> scafoldState= GlobalKey<ScaffoldState>();
  void snackCart(){
    scafoldState.currentState.showSnackBar(
        SnackBar(
          backgroundColor: Colors.pinkAccent,
          content: Text('Di Tambahkan Ke Keranjang',),
          duration: Duration(seconds: 3),
        )
    );
  }

  void snackdeleteitem(){
    scafoldState.currentState.showSnackBar(
        SnackBar(
          backgroundColor: Colors.pinkAccent,
          content: Text('Item Telah Di Hapus'),
          duration: Duration(seconds: 3),
        )
    );
  }

}