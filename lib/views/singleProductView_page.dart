import 'package:ecomm_designs/components/customAvator_component.dart';
import 'package:ecomm_designs/model/product_model.dart';
import 'package:ecomm_designs/service/firebase_services.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:ecomm_designs/model/ScreenArguments.dart';
import 'package:flutter_svg/svg.dart';
import 'package:bulleted_list/bulleted_list.dart';
import 'package:ecomm_designs/model/ListProduct_model.dart';

class SingleProductViewPage extends StatefulWidget {
  static String routename = "product";

  @override
  State<SingleProductViewPage> createState() => _SingleProductViewPageState();
}

class _SingleProductViewPageState extends State<SingleProductViewPage> {
  int _quantity=1;
  final firebase_service fservice = new firebase_service();
  TextEditingController _searchController = new TextEditingController();

  Widget _buildPlayerModelListWithArrays(String title,List<dynamic> data){
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
        side: BorderSide(
          color: Colors.black,
          width: 0.2
        )
      ),
      child: title=="View Supply Details"?GestureDetector(
        onTap: (){
          print("hello");
        },
        child: ExpansionTile(
          onExpansionChanged: (value){
            if(value)Navigator.pushNamed(context, 'details');
          },
          textColor: Color(0xffED8F03),
          collapsedTextColor: Color(0xffED8F03),
          iconColor: Color(0xffED8F03),
          collapsedIconColor: Color(0xffED8F03),
          title: Text(
            title,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
          ),

        ),
      ):ExpansionTile(
        textColor: Color(0xffED8F03),
        collapsedTextColor: Color(0xffED8F03),
        iconColor: Color(0xffED8F03),
        collapsedIconColor: Color(0xffED8F03),
        title: Text(
          title,
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
        ),
        children: <Widget>[
          BulletedList(
            listItems: data,
            bullet: Container(
              width: 5,
              height: 5,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black
              ),
            ),
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400
            ),
          ),
          SizedBox(
            height: 13,
          )
        ],
      ),
    );
  }
  Widget _customContainer(String image){
    return  Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 94,height: 100,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.fitHeight
        ),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    print(args.message);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return FutureBuilder(
        future: fservice.getSingleProduct(args.message),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            print("here");
            return Scaffold(
              body:Center(
                child: CircularProgressIndicator(color: Colors.amber,),
              )
            );
          }
          if(snapshot.hasData){
            ProductModel product = snapshot.data;
            print(product.name);
            double save = double.parse(product.mrp.toString())-double.parse(product.price.toString());
            return Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  width: width,
                  decoration:  BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xffED8F03),
                            Color(0xffFFB75E)
                          ]
                      )
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: width,
                        height: 140,
                        padding: EdgeInsets.only(right: width*0.06,left:width*0.06,top: height*0.08),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              radius: 23,
                              backgroundImage: NetworkImage('https://firebasestorage.googleapis.com/v0/b/fitnessapp-53d10.appspot.com/o/files%2Fuser_KXqoB5tSSOTLXYaZyKaYvLLy7On2?alt=media&token=e683001b-b038-4256-b5ab-132300b283d7'),
                            ),
                            Container(
                              width: width/1.5,
                              child: TextFormField(
                                controller: _searchController,
                                decoration: InputDecoration(
                                  suffixIcon: Container( decoration:BoxDecoration(shape: BoxShape.circle,color: Color(0xff6C757D59)),child: SvgPicture.asset('assets/small_qr.svg',color: Colors.black,width: 5,height: 5,fit: BoxFit.scaleDown,),),
                                  prefixIcon:SvgPicture.asset("assets/Vector.svg",width: 10,height: 10,fit: BoxFit.scaleDown,),
                                  fillColor: Color(0xffF6F6F6),
                                  filled: true,
                                  isDense: true,
                                  hintText: "Search your product",
                                  hintStyle: TextStyle(color: Color(0xff6C757D),fontSize: 13),
                                  contentPadding: EdgeInsets.symmetric(horizontal: width*0.025,vertical: height*0.02),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Color(
                                          0xFFD9D9D9),width:0.5),
                                      borderRadius: BorderRadius.all(Radius.circular(30))
                                  ),
                                  focusedBorder:  OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black,width: 0.5),
                                      borderRadius: BorderRadius.all(Radius.circular(30))
                                  ),),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15,),
                      Container(
                        width: width,
                        padding: EdgeInsets.symmetric(vertical: height*0.03,horizontal: width*0.07),
                        decoration: BoxDecoration(
                            color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              width: width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Product",style: TextStyle(color:Color(0xffED8F03),fontWeight: FontWeight.w500,fontSize: 15),),
                                  SizedBox(height: 5,),
                                  Text(product.name.toString(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30,letterSpacing: 1),),
                                  SizedBox(height: 15,),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: product.images.map((e) => _customContainer(e)).toList()
                                    ),
                                  ),

                                ],
                              ),
                            ),
                            SizedBox(height: 15,),
                            Container(
                              width: width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("Deal Price",style: TextStyle(color:Color(0xffED8F03),fontWeight: FontWeight.w500,fontSize: 15),),
                                  SizedBox(height: 8,),
                                  Row(
                                    children: [
                                      Text('-${product.discount}%',style: TextStyle(color: Colors.red,fontSize: 30),),
                                      SizedBox(width: 10,),
                                      Text('Rs. ${product.price}',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),)
                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  Row(
                                    children: [
                                      Text("M.R.P : ",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18),),
                                      Text(product.mrp.toString(),style: TextStyle(decoration: TextDecoration.lineThrough,fontWeight: FontWeight.w400,fontSize: 18),)
                                    ],
                                  ),
                                  Text("(You are saving Rs.${save.round()})",style: TextStyle(color: Colors.green,fontSize: 15),),
                                  SizedBox(height: 15,),
                                  _buildPlayerModelListWithArrays("Product Details", product.details),
                                  SizedBox(height: 15,),
                                  _buildPlayerModelListWithArrays("Product Reviews", product.details),
                                  SizedBox(height: 15,),
                                  _buildPlayerModelListWithArrays("View Supply Details", product.details),
                                  SizedBox(height: 20,),
                                  Container(
                                    width: width,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Select Quantity",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),),
                                            SizedBox(height: 5,),
                                            Text("(Maximum 10 Quantity Per Order)",style: TextStyle(color: Color(0xff6C757D),fontSize: 8),)
                                          ],
                                        ),
                                        Container(
                                          width: 166,
                                          height: 48,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.black,width: 0.1)
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              GestureDetector(
                                                  onTap:(){

                                                  },
                                                  child: SvgPicture.asset("assets/minussquare.svg")),
                                              Text("$_quantity",style: TextStyle(fontSize: 15),),
                                              GestureDetector(
                                                  onTap: (){},
                                                  child: SvgPicture.asset("assets/addsquare.svg"))
                                            ],
                                          ),
                                        ),


                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 18,),
                                  Container(
                                    width: width,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 146,
                                          height: 48,
                                          decoration: BoxDecoration(
                                              border: Border.all(color:Color(0xffED8F03),width: 2 ),
                                              borderRadius: BorderRadius.all(Radius.circular(5))
                                          ),
                                          child: Center(child: Text("Add to Cart",style:TextStyle(color: Color(0xffED8F03),fontWeight: FontWeight.w500)),),
                                        ),
                                        GestureDetector(
                                          onTap: (){
                                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Order placed successfully")));
                                          },
                                          child: Container(
                                            width: 146,
                                            height: 48,
                                            decoration: BoxDecoration(
                                              color: Color(0xffED8F03),
                                              borderRadius: BorderRadius.all(Radius.circular(5))
                                            ),
                                            child: Center(child: Text("Buy Now",style:TextStyle(color: Colors.white,fontWeight: FontWeight.w500)),),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 15,),
                            FutureBuilder(
                                future: fservice.getAllProducts(),
                                builder:(context,snapshot){
                                  if(snapshot.connectionState == ConnectionState.waiting){
                                    return CircularProgressIndicator(color: Color(0xffED8F03),);
                                  }
                                  if(snapshot.hasData){
                                    return Container(
                                      margin: EdgeInsets.symmetric(vertical: 12),
                                      width: width,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Recommended Products",style: TextStyle(color:Color(0xffED8F03),fontWeight: FontWeight.w500,fontSize: 15)),
                                          SizedBox(height: 10,),
                                          SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                children: (snapshot.data as List<ListProductModel>).reversed.map((e) => customAvatar(e.name.toString(), e.imageUrl.toString(),e.id.toString(),context)).toList(),
                                              ))
                                        ],
                                      ),
                                    );
                                  }else{
                                    return Container();
                                  }
                                }
                            )
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              bottomNavigationBar: Container(
                height: 80,
                width: width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff6C757D40),
                      blurRadius: 40.0,

                      offset: Offset(0.0, 15), // shadow direction: bottom right
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset("assets/back.svg")),
                    SvgPicture.asset("assets/home.svg"),
                    SvgPicture.asset("assets/cart.svg")
                  ],
                ),
              ),
            );
          }else{
            return Container();
          }
        }
        );
  }
}
