import 'package:flutter/material.dart';
import 'package:fooadapp/model/product.dart';
import 'package:fooadapp/provider/product_provider.dart';
import 'package:provider/provider.dart';
import 'package:date_format/date_format.dart';
import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:toast/toast.dart';


class AddAndEditProduct extends StatefulWidget {

  ProductModel productModel;

  AddAndEditProduct({this.productModel});

  @override
  _AddAndEditProductState createState() => _AddAndEditProductState();
}

class _AddAndEditProductState extends State<AddAndEditProduct> {




  Future<DateTime> _pickdate(BuildContext context,ProductProvider productProvider)async{
    final DateTime _picked=await showDatePicker(
        context: context,
        initialDate: productProvider.date,
        firstDate: DateTime(2020),
        lastDate: DateTime(2021));
    if(_picked!=null){
      return _picked;
    }
  }

  final nameproduct=TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    nameproduct.dispose();
    super.dispose();
  }

  @override
  void initState() {
    final providerfromproductprovider=Provider.of<ProductProvider>(context,listen: false);
    if(widget.productModel != null){
      nameproduct.text=widget.productModel.productName;
      providerfromproductprovider.loadAll(widget.productModel);
    }else{
      providerfromproductprovider.loadAll(null);
    }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var providerproduct=Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(formatDate(providerproduct.date, [d,' ',MM,' ',yyyy])),
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: (){
             _pickdate(context,providerproduct).then((value) {
               if (value != null) {
                 providerproduct.setChangeDate(value);
               }
             } );
          })
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameproduct,
              onChanged: (value){
                providerproduct.setChangeNameProduct(value);
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(13),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                )
              ),
            ),
            FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              color: Colors.blue,
                onPressed:(){
              providerproduct.saveProduct(widget.productModel,context);
            }, child: Text('Add'))
          ],
        )
      ),
    );
  }

}
