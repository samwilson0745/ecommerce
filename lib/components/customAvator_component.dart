import 'package:flutter/material.dart';
import 'package:ecomm_designs/model/ScreenArguments.dart';
Widget customAvatar(String title ,String image,String uid,BuildContext context){
  return GestureDetector(
    onTap: (){
      Navigator.pushNamed(context, "product",arguments: ScreenArguments("uid",uid));
    },
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: 80,
      child: Column(
        children: [
          CircleAvatar(radius: 30,backgroundImage: NetworkImage(image),),
          SizedBox(height: 5,),
          Text(title,textAlign: TextAlign.center,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,wordSpacing: 3.9),softWrap: true,)
        ],
      ),
    ),
  );
}