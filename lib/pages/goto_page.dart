import 'package:flutter/material.dart';

class GotoPage extends StatefulWidget {
  String urlToPage;

  GotoPage({super.key,required this.urlToPage});

  @override
  State<GotoPage> createState() => _GotoPageState();
}

class _GotoPageState extends State<GotoPage> {
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
            Text("Flutter",style: TextStyle(color: Colors.black54),),
            Text("News",style: TextStyle(color: Colors.blue.shade300,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
      body: Text("No data found"),
    );
  }
}
