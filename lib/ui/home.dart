import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:news_app/ui/jobs_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late Map mapResponse= {};

  Future apiCall()async{
    http.Response response;
    response = await http.get(Uri.parse("https://newsapi.org/v2/everything?q=latest&apiKey=f365421aab2845f384155f2249cc2513"));
    if(response.statusCode==200){
      setState(() {
        mapResponse = json.decode(response.body);
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
        title: Text("Latest News"),
        elevation: 0,
      ),
      drawer: const Drawer(
        child: Column(
          children: [
            SizedBox(height: 100,),
            ListTile(
              // onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>JobScreen()))},
              leading: Icon(Icons.home,size: 30,),
              title: Text("Home",style: TextStyle(fontSize: 20),)
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text("Search",style: TextStyle(fontSize: 20),),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text("Select Location",style: TextStyle(fontSize: 20),),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings",style: TextStyle(fontSize: 20),),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Exit",style: TextStyle(fontSize: 20),),
            ),

          ],
        ),
      ),
      body: mapResponse == null ? CircularProgressIndicator() :ListView.builder(
          itemBuilder: (context,index){
            return Container(
              // width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10,),
                  Center(
                    child: Container(
                        child: Image.network(mapResponse['articles'][index]['urlToImage'].toString()),
                      width: MediaQuery.of(context).size.width-30,
                      height: 200,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                      padding: EdgeInsets.only(left:20,right: 6),
                      child: Text(mapResponse['articles'][index]['title'].toString(),style: TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),)
                  ),
                  Container(
                      padding: EdgeInsets.only(left:20,right: 5),
                      child: Text(mapResponse['articles'][index]['description'].toString(),style: TextStyle(fontSize: 17),),
                  ),
                ],
              ),
            );
          },
          itemCount: 200,
      //   f365421aab2845f384155f2249cc2513
      ),
    );
  }

}
