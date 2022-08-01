import 'package:flutter/material.dart';
import 'package:gameon/Logic/service/service.dart';
import 'package:gameon/Routes/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( MultiProvider(
      providers : [
         StreamProvider.value(
          value: FetchJsonFile().fetchGround(),
          initialData: null,
        ),
      ],
      child: const MyApp(),
    ),);
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