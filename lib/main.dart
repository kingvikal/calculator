import 'package:flutter/material.dart';

import 'InputField.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Calculator'),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Simple Interest",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
            child: const InputField(),
          ),
        ],
      ),
    );
  }
}
