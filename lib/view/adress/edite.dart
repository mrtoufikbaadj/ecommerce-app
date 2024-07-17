import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdressEdite extends StatelessWidget {
  const AdressEdite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Adress'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: Container(
        child: ListView(
          children: [],
        ),
      ),
    );
    ;
  }
}
