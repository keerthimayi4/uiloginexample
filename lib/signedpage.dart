import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Signedin extends StatefulWidget {
  const Signedin({super.key});

  @override
  State<Signedin> createState() => _SignedinState();
}

class _SignedinState extends State<Signedin> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(' welcome '),
      ),
      body: Center(
        child: Text('You are successfully signed in'),
      ),
    );;
  }
}