import 'package:flutter/material.dart';
import 'package:gameon/Routes/routes.dart';


void main() {
  runApp( 
      
       const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}