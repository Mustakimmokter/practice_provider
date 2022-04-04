import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemagement_last_time/screens/home_page.dart';
import 'package:statemagement_last_time/statemanages/statemanages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Statemanagement>(
      create: (context) => Statemanagement(),
      builder: (context, state) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePage(),
        );
      },
    );
  }
}
