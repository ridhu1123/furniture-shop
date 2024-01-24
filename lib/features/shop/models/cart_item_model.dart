class CartItemModel{
  String? productId;
   String? name;
   String? image;
   double? price;

   CartItemModel({required this.productId,required this.name,required this.image,required this.price});


  Map<String, dynamic> toJson(){
    return{
      "productId":productId,
      "name":name,
      "image":image,
      "price":price
    };
  } 
}