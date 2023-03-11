import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final list = ['', 'A', 'B', 'C', 'D'];
  String item = '';

  @override
  Widget build(BuildContext context) {
    final itemList = list.map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dropdown demo"),
      ),
      body: DropdownButton<String>(
        value: item,
        items: itemList,
        onChanged: (value) => setState(() {
          item = value ?? '';
        }),
      ),
    );
  }
}
