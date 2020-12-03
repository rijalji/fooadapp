

class ProductModel{

  String productID;
  String date;
  String productName;

  ProductModel({this.productName,this.date,this.productID});


  Map<String,dynamic> toMap(){
     return {
       'productID':productID,
       'date': date,
       'productName': productName,
     };
   }

  factory ProductModel.fromJson(Map<String,dynamic>json){
    return ProductModel(
      date:json['date'],
      productName:json['productName'],
      productID:json['productID']
    );
  }
}