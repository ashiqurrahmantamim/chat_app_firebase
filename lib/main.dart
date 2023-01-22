import 'package:chatapp_firebase/helper/helper_function.dart';
import 'package:chatapp_firebase/pages/home_page.dart';
import 'package:chatapp_firebase/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:chatapp_firebase/shared/constast.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();

  if(kIsWeb){
 await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: Constanst.apiKey,
       appId: Constanst.appId, 
       messagingSenderId: Constanst.messagingSenderId, 
       projectId: Constanst.projectId
       )
       );
  }
  else{
    await Firebase.initializeApp();
  }
 
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSignin =false;

  @override
  void initState() {
    getUserLoggedInStatus();
    super.initState();
  }

      getUserLoggedInStatus()async{
      await HelperFunctions.getUserLoggedInStatus().then((value){
        if( value !=null ){
          setState(() {
            _isSignin=value;
          });
        }
      }
      );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Constanst.primaryColor,
      ),
      debugShowCheckedModeBanner: false,
      home: _isSignin ? HomePage(): LoginPage(),
     
    );
  }
}
