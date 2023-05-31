import 'package:ecomm_designs/components/customAvator_component.dart';
import 'package:ecomm_designs/model/ListProduct_model.dart';
import 'package:ecomm_designs/model/ScreenArguments.dart';
import 'package:ecomm_designs/model/product_model.dart';
import 'package:ecomm_designs/model/search_model.dart';
import 'package:ecomm_designs/service/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:searchfield/searchfield.dart';
class HomePage extends StatefulWidget {
  static String routename = "home";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final focusNode = FocusNode();
  late Future _getProducts;
  final firebase_service fservice=new firebase_service();
  List<SearchFieldListItem<dynamic>> names=[];


  Widget _newAvatar(String title ,String image){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: 80,
      child: Column(
        children: [
          CircleAvatar(radius: 30,backgroundImage: NetworkImage(image),),
          SizedBox(height: 5,),
          Text(title,textAlign: TextAlign.center,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,wordSpacing: 3.9),softWrap: true,)
        ],
      ),
    );
  }


  Widget _customContainer(String title,String icon,double width){
    return Container(
      width: width*0.4,
      height: 65,
      decoration: BoxDecoration(
          color: Color(0xffF5F4F6),
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      padding: EdgeInsets.symmetric(horizontal: 18,vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(icon,),
          SizedBox(width: 5,),
          Expanded(child: Text(title,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,letterSpacing: 0.5),))
        ],
      ),
    );
  }

  @override
  void initState(){
    super.initState();
    _getProducts = fservice.getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return FutureBuilder(
        future: _getProducts,
        builder:(context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            print("here");
            return Scaffold(body: Center(child: CircularProgressIndicator(color: Colors.amber,),));
          }
          if(snapshot.hasData){
            List<ListProductModel> result=snapshot.data;
            return GestureDetector(
              onTap: (){
                focusNode.unfocus();
              },
              child: Scaffold(
                body: SingleChildScrollView(
                  child: Container(
                    width: width,
                    decoration: BoxDecoration(
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
                          padding: EdgeInsets.only(right: width*0.08,left:width*0.08,top: height*0.08),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 35,
                                    backgroundImage: NetworkImage('https://firebasestorage.googleapis.com/v0/b/fitnessapp-53d10.appspot.com/o/files%2Fuser_KXqoB5tSSOTLXYaZyKaYvLLy7On2?alt=media&token=e683001b-b038-4256-b5ab-132300b283d7'),
                                  ),
                                  SizedBox(width: 10,),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Soham Deb Majumder",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,letterSpacing: 1,color: Colors.white),),
                                        SizedBox(height: 5,),
                                        Text("sohamdebmajumder@gmail.com",style:TextStyle(color: Colors.white,fontWeight: FontWeight.w300)),
                                        Text("+91 8017098639",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w300),)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 15,),
                              SearchField(
                                focusNode: focusNode,
                                suggestions: result.map((e) => SearchFieldListItem<ListProductModel>(
                                  e.name.toString(),
                                  item:e,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                    child: Row(
                                      children: [
                                        CircleAvatar(backgroundImage: NetworkImage(e.imageUrl.toString()),),
                                        SizedBox(width: 5,),
                                        Text(e.name.toString())
                                      ],
                                    ),
                                  )
                                )).toList(),
                                onSuggestionTap: (value){
                                  print(value.item!.id);
                                  Navigator.pushNamed(context, 'product',arguments: ScreenArguments("uid", value.item!.id.toString()));
                                  focusNode.unfocus();
                                },
                                itemHeight: 50,
                                maxSuggestionsInViewPort: 4,
                                suggestionsDecoration: SuggestionDecoration(

                                      color: Colors.white,
                                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
                                  border: Border.all(color: Colors.black,width: 0.5)
                                ),
                                searchInputDecoration: InputDecoration(
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
                            ],
                          ),
                        ),
                        SizedBox(height: 15,),
                        Container(
                          width: width,
                          padding: EdgeInsets.symmetric(vertical: height*0.03,horizontal: width*0.07),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.vertical(top: Radius.circular(30))
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
                                    Text("My Wallet Balance",style: TextStyle(color:Color(0xffED8F03),fontWeight: FontWeight.w500,fontSize: 15),),
                                    SizedBox(height: 5,),
                                    Text("Rs. 2,500",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 35,letterSpacing: 1),)
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 12),
                                width: width,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    _customContainer("Add Money to Wallet", "assets/add.svg", width),
                                    _customContainer("My Wallet Statement", "assets/receipt.svg", width)
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 12),
                                width: width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("My Previous Orders",style: TextStyle(color:Color(0xffED8F03),fontWeight: FontWeight.w500,fontSize: 15)),
                                    SizedBox(height: 10,),
                                    SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: (snapshot.data as List<ListProductModel>).reversed.map((e) => customAvatar(e.name.toString(), e.imageUrl.toString(),e.id.toString(),context)).toList(),
                                        ))
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 12),
                                width: width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("My Previous Orders",style: TextStyle(color:Color(0xffED8F03),fontWeight: FontWeight.w500,fontSize: 15)),
                                    SizedBox(height: 10,),
                                    SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            _newAvatar("Spectacular Deals","https://s3-alpha-sig.figma.com/img/8923/6be4/941c0147df7a748415a604f5ce4d5a08?Expires=1686528000&Signature=JemH1NdBmeS26bmS-Qn7yXkW7r6PNtp8t2th6DXacKRx~rYTEWXyehxYGifdJUeAmhyMfrZ7UYOf~aODRDCLuBqLH0YQEGptXVUC1kW8kxO2zDZiP6hsuiZvfDY7~k0R-GhYDnMTGSzr2J-DT~2y5BMKfKhk5ZtDNHuRWYEnOKpN~VhdFgPSghWhKmxzJBfY6AZvg~N-7Pr7sE4DkBWWEsbR2Bz4EKO0i826CuOPBoqtpw96FwQdLnW~La64qv9UhZbYIz4s1wLh7JD0ofgpr0u71XqyO93gVLbORwxMmpuJplppkjB5bvjT4-O0W3CvK65tVkHpG7KUooA6Acuy6Q__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
                                            SizedBox(width: 20,),
                                            _newAvatar("Get Extra 5% Off","https://s3-alpha-sig.figma.com/img/e19a/8dfe/4786fee15db02c4849ca8f23ce7daad0?Expires=1686528000&Signature=cIXmyqGqPbS7WgwP~mFaY-ao4m9RFBTquiIMMkRWEDOvPbRjFLcoQri1fYtoQ7bmahR0d7p8-eNRi1MdzfkQMcNsSyfBjyt9mu~Zus5eRJKXrmx-gF4vGW~9pyo6xyrcKefmtO5QWiaFIf2Z4DclEDyZNpZF5sskgRbCfrAJJah8l4xfYOxgaGEFjjN7knUeZ~qv4eOJ0e-9y2rHva7uliFmzm8SJ01zPCJUPVQb~9GYTaUOJvEiQbX53DnBXMp4c7qnNWbQTqtdlpyQRXdWBQWTKoT5sdz0aJmnZbDHdn6LLd0aqmIQ6uxdzMP5UVIGwLjTycAsQ4HWybT1oP9ZMA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
                                            SizedBox(width: 20,),
                                            _newAvatar("Get Flat 20% Off","https://s3-alpha-sig.figma.com/img/2d7f/ee8a/a13c62edf648f1a7acf6efd094a62a5f?Expires=1686528000&Signature=fXEwpqsK1VKEeCGd7LscZzNViy7tPq5l9WPFAM4fNom2A3B6Xm4xOq5P4V2oIbfe~w7K2nmBKFB6hrg6sIqZSMRBBrwK~tF0ra8z0INflhZmigYoGePKnp9IDTH1qMvpXsUiRFZTqASZA4q2bIHUKOSFXL9DC6Hd4csSved69mK12tr0r9jbw50TEjj7jNBEugAcge-vzyV1DTwTeoqwuk4jNRIWNP48d1Q0e0-KsW8KWIUEhP-eq~LrGbxwyKUVKbOghPgT7Uj2COSzBKTFvcX~OhYYJZV02-2zShVFDZN8-Xj8LUplwzEIgE~8uDgiH0QQ1L4-PA28Qt5cqI8XmQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"),
                                            SizedBox(width: 20,),
                                            _newAvatar("Get Extra 10% off","https://s3-alpha-sig.figma.com/img/951a/3937/0f22838e46825ed335ca12a8c1cefa1a?Expires=1686528000&Signature=I3vSuw5wmUSfdFwxPmCvTpG5suoM8~-7roRdJIshosrsv6w59A387nLLXl7QbGEeSSpMknn4TBfrfghEh2~1QN1rlLpwaYqpf0W9u-aGsh~mTCLAwtjpmoaDcMmMTg~MNWROg8LmuDZaYLeuHPyGdTnSQKI0dQPaqogCkC6dTCX~gkwbtn1dFamk0PPB~womHtdlvmBUrmkI-O-OXUklw2tX64DbwcxBGgugR2ViduBBT-70oIRRMKoCN0M74TqZ0ixY6gLMxeaNqokypdqin7bpYfetWSo~iNFY01QZrSlkDjlEhQP-6vocH4MdoTqAZFIb22JJ4VvrKoc6faiHcw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4")
                                          ],
                                        ))
                                  ],
                                ),
                              ),
                              SizedBox(height: 15,),
                              Container(
                                width: width,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ClipPath(
                                      clipper:CustomClipPath1(),
                                      child: Container(
                                        height: 60,
                                        width: 110,
                                        decoration: BoxDecoration(
                                          color: Color(0xffF5F4F6),
                                          borderRadius: BorderRadius.horizontal(left: Radius.circular(30))
                                        ),
                                        child: SvgPicture.asset('assets/settings.svg',fit: BoxFit.scaleDown,height: 20,width: 20,)
                                      ),
                                    ),
                                    Container(
                                        width: 82,
                                        height: 82,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              Color(0xffED8F03),
                                              Color(0xffFFB75E)
                                            ],
                                          ),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(child: SvgPicture.asset('assets/qr_scan.svg'))
                                    ),
                                    ClipPath(
                                      clipper:CustomClipPath2(),
                                      child: Container(
                                          height: 60,
                                          width: 110,
                                          decoration: BoxDecoration(
                                              color: Color(0xffF5F4F6),
                                              borderRadius: BorderRadius.horizontal(right: Radius.circular(30))
                                          ),
                                          child: SvgPicture.asset('assets/cart.svg',fit: BoxFit.scaleDown,height: 20,width: 20,)
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          else{
            return Scaffold(
              body: Container(
                child: Center(
                  child: Text("There was a problem"),
                ),
              ),
            );
          }
        }
    );
  }
}

class CustomClipPath1 extends CustomClipper<Path>{
  @override
  Path getClip(Size size){
    double w = size.width;
    double h = size.height;
    print(h);
    final path=Path();

    path.lineTo(0,h);
    path.lineTo(w,h);
    path.quadraticBezierTo(
      w-20,
      h/2,
      w,
      0
    );
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper){
    return false;
  }
}

class CustomClipPath2 extends CustomClipper<Path>{
  @override
  Path getClip(Size size){
    double w = size.width;
    double h = size.height;
    print(h);
    final path=Path();

    path.quadraticBezierTo(
        20,
        h/2,
        0,
        h
    );
    path.lineTo(w,h);
    path.lineTo(w,0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper){
    return false;
  }
}
