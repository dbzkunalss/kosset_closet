import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:kosset_closet/constants/colors.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:google_fonts/google_fonts.dart';

import 'screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kossetLightPink,
        primarySwatch: Colors.pink,
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme,
        ),
    
      ),
      home: SplashScreen(),
    );
  }
}
