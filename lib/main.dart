import 'package:flutter/material.dart';
import 'views/details_page.dart';
import 'views/home_page.dart';
import 'views/product_page.dart';
import 'views/singleProductView_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomePage.routename,
      routes: {
        HomePage.routename:(context)=>HomePage(),
        DetailsPage.routename:(context)=>DetailsPage(),
        ProductPage.routename:(context)=>ProductPage(),
        SingleProductViewPage.routename:(context)=>SingleProductViewPage()
      },
    );
  }
}

