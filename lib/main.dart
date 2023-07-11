import 'package:blocdemoapp/routes/app_routes_config.dart';
import 'package:flutter/material.dart';


void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routerConfig: AppRouteConfig().goRouter,
        theme: ThemeData(primaryColor: Colors.teal),
        debugShowCheckedModeBanner: false,
      );
}
