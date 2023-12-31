import 'package:flutter/material.dart';
import 'package:login_app/provider/internet_provider.dart';
import 'package:login_app/provider/sign_in_provider.dart';
import 'package:login_app/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context){
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(create: ((context)=>SignInProvider())),
        ChangeNotifierProvider(create: ((context)=>InternetProvider())),
      ],
      child: const MaterialApp(
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      )
      
    );
  }

}

