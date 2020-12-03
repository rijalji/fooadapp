import 'package:flutter/material.dart';
import 'package:fooadapp/provider/product_provider.dart';
import 'package:fooadapp/screens/addandeditproduct.dart';
import 'package:fooadapp/screens/homescreen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
       providers: [
         ChangeNotifierProvider(create: (_)=>ProductProvider())
       ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            // ... app-specific localization delegate[s] here
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
          const Locale('id', ''), // English, no country coderabic, no country code
      ],
      // ... other lo
          home: HomeScreen(),
      ),
    );
  }
}
