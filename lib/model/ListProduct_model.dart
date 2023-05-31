class ListProductModel{
  String? id;
  String? name;
  String? imageUrl;
  ListProductModel({
    required this.id,
    required this.name,
    required this.imageUrl
  });
 factory ListProductModel.fromJSON(Map<String,dynamic> json){
  return ListProductModel(id:json["id"],name: json["name"], imageUrl:json["imageUrl"]);
 }
}