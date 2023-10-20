import 'package:flutter/material.dart';
import 'package:mysql_connection/database/mysql_db_config.dart';



void main() async {
  var conn = await MySqlDBConfiguration().connection;
  //runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
