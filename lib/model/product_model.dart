class ProductModel{

  String? name;
  String? price;
  String? mrp;
  String? discount;
  List<dynamic> details;
  List<dynamic> images;
  ProductModel({
    required this.name,
    required this.price,
    required this.mrp,
    required this.discount,
    required this.details,
    required this.images
  });

  factory ProductModel.fromJSON(Map<String,dynamic> json){
    return ProductModel(name: json["name"], price: json["Price"], mrp: json["MRP"], discount:json["discount"], details: json["details"],images: json["images"]);
  }

}