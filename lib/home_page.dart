import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // late String stringResponse;
  late Map mapResponse = {};
  late List listResponse = [];

  Future apiCall() async {
    http.Response response;
    response = await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
    if (response.statusCode == 200) {
      setState(() {
        // stringResponse = response.body;
        print("connection success");
        mapResponse = json.decode(response.body);
        listResponse = mapResponse['data'];
      });
    }
  }

  @override
  void initState() {
    apiCall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API"),
      ),
      // body: Center(
      //   child: Container(
      //     // padding: EdgeInsets.all(30),
      //     height: 300,
      //     width: 350,
      //     decoration: BoxDecoration(
      //       color: Colors.deepPurple.shade300,
      //       borderRadius: BorderRadius.circular(20)
      //     ),
      //     // child: Padding(
      //     //   padding: const EdgeInsets.all(8.0),
      //     //     child: mapResponse == null ?Text("Data not found") : Text(mapResponse['data'].toString()),
      //     // ),
      //   ),
      // ),
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            child: listResponse == null
                ? Center(child: CircularProgressIndicator())
                : Column(
                    children: [

                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple.shade300,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                          Image.network(
                            listResponse[index]['avatar'],
                            width: 200,
                            height: 200,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(listResponse[index]['id'].toString()),
                          SizedBox(
                            height: 10,
                          ),
                          Text(listResponse[index]['first_name'].toString()),
                          SizedBox(
                            height: 10,
                          ),
                          Text(listResponse[index]['email'].toString()),
                          // Divider(),
                        ]),
                      ),
                      SizedBox()
                    ],
                  ),
          );
        },
        itemCount: listResponse == null ? 0 : listResponse.length,
      ),
    );
  }
}
