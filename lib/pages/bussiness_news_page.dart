import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Bussiness extends StatefulWidget {
  const Bussiness({super.key});

  @override
  State<Bussiness> createState() => _BussinessState();
}

class _BussinessState extends State<Bussiness> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Bussiness",style: TextStyle(color: Colors.black54),),
            Text("News",style: TextStyle(color: Colors.blue.shade300,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
