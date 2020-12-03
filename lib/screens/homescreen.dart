import 'package:flutter/material.dart';
import 'package:fooadapp/model/product.dart';
import 'package:fooadapp/provider/product_provider.dart';
import 'package:fooadapp/screens/addandeditproduct.dart';
import 'package:provider/provider.dart';
import 'package:date_format/date_format.dart';
import 'package:toast/toast.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void shwotoast(String msg,{int duration,int gravity}){
      Toast.show(msg, context,duration: duration,gravity: gravity,);
    }
    var prov=Provider.of<ProductProvider>(context);
    return Scaffold(
      body:StreamBuilder<List<ProductModel>>(
          stream: prov.getProduct,
          builder: (context,snapshot){
            return Container(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context,i){
                        final list=snapshot.data[i];
                        return InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return AddAndEditProduct(productModel: list);
                            }));
                          },
                          child: ListTile(
                            title: Text('${formatDate(DateTime.parse(list.date), [d,'',MM,'',yyyy])}'),
                            subtitle: Text('${list.productID}'),
                            trailing: IconButton(
                              onPressed: (){
                                prov.removeProductId(list);
                              },
                              icon: Icon(Icons.delete),),
                          ),
                        );
                      },
                    )
                  ),
                  FlatButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return AddAndEditProduct();
                    }));
                  }, child: Text('add'))
                ],
              )
            );
          },
      )
    );
  }
}
