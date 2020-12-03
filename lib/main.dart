import 'package:flutter/material.dart';
import 'app.dart';
import 'package:firebase_core/firebase_core.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//
//    final Firestoreservices = FirestoreServices();
//
//    return MultiProvider(
//      providers: [
//        ChangeNotifierProvider(create: (context)=> ProductProvider()),
//        StreamProvider(create: (context) => Firestoreservices.getProduct())
//      ],
//      child: MaterialApp(
//        home: Product(),
//      ),
//    );
//  }
//}
