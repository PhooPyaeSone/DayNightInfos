import 'package:animation/models/checking_entry.dart';
import 'package:animation/models/information_data.dart';
import 'package:animation/models/shoot_entry.dart';
import 'package:animation/screens/info_list.dart';
import 'package:animation/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => InformationData()),
        Provider(create: (context) => CheckingEntry()),
        Provider(create: (context) => ShootEntry()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: LoginScreen(),
          routes: {
            InformationList.id: (context) => InformationList(),
          }),
    );
  }
}
