import 'package:flutter/material.dart';
import 'package:flutter_key/pages/page_1.dart';
import 'package:flutter_key/pages/page_2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => Page1(),
        '/page2': (context) => Page2(),
      },
      builder: (context, navigator) {
        return FutureBuilder<String>(
          initialData: initializationData,
          future: initialize(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return navigator;
            }

            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        );
      },
    );
  }
}

String initializationData;
Future<String> initialize() async {
  if (initializationData != null) {
    return initializationData;
  }

  return await Future.delayed(Duration(seconds: 5), () {
    initializationData = 'Hello World';
    return initializationData;
  });
}
