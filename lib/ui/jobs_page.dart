import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class JobScreen extends StatefulWidget {
  const JobScreen({super.key});

  @override
  State<JobScreen> createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {

  late Map mapResponse= {};

  Future apiCall()async{
    http.Response response;
    response = await http.get(Uri.parse("https://newsapi.org/v2/everything?q=jobs&apiKey=f365421aab2845f384155f2249cc2513"));
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
        title: Text("Jobs"),
        elevation: 0,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(height: 100,),
            ListTile(
              leading: Icon(Icons.home,size: 30,),
              title: Text("Home",style: TextStyle(fontSize: 20),),
              // trailing: Icon(CupertinoIcons.arrow_right_circle,size: 30,),
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
                    // decoration: BoxDecoration(
                    //   color: Colors.grey,
                    //   borderRadius: BorderRadius.circular(20),
                    // ),
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
                )


              ],
            ),
          );
        },
        itemCount: mapResponse.length,
        //   f365421aab2845f384155f2249cc2513
      ),
    );
  }
}
