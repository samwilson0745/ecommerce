import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomm_designs/model/ListProduct_model.dart';
import 'package:ecomm_designs/model/product_model.dart';

class firebase_service{
  late CollectionReference products;
  firebase_service(){
    products=FirebaseFirestore.instance.collection('products');
  }

  Future getAllProducts()async{
    List<ListProductModel> datas=[] ;
    try{
      QuerySnapshot querySnapshot = await products.get();
      List<DocumentSnapshot> documents = querySnapshot.docs;

      for(DocumentSnapshot document in documents){
        Map<String,dynamic> data = document.data() as Map<String,dynamic>;
        Map<String,dynamic> newData = {
          "id":document.id,
          "name":data["name"],
          "imageUrl":data["images"][0]
        };
        ListProductModel product= ListProductModel.fromJSON(newData);
        datas.add(product);
      }
      return datas;
    }catch(e){
      print('Error getting documents:$e');
    }
  }
  Future getSingleProduct(String id)async{
    try{
      DocumentSnapshot documentSnapshot = await products.doc(id).get();
      if(documentSnapshot.exists) {
       Map<String,dynamic> data = documentSnapshot.data() as Map<String,dynamic>;
       ProductModel prod = ProductModel.fromJSON(data);
       print(prod.name);
       return prod;
      }
    }catch(e){
      print('Error getting document:$e');
    }
  }
}
