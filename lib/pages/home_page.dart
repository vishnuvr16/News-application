import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/data.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/models/slider_model.dart';
import 'package:news_app/pages/bussiness_news_page.dart';
import 'package:news_app/services/slider_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CategoryModel> categories = [];
  List<SliderModel> sliders = [];
  late Map mapResponse = {};

  void apiCall()async{
    http.Response response;
    response = await http.get(Uri.parse("https://newsapi.org/v2/everything?q=trending&apiKey=f365421aab2845f384155f2249cc2513"));
    if(response.statusCode==200){
      setState(() {
        mapResponse = json.decode(response.body);
      });
    }
  }

  @override
  void initState() {
    categories = getCategories();
    sliders = getSliders();
    apiCall();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Daily",style: TextStyle(color: Colors.black,fontSize: 22),),
            Text("News",style: TextStyle(color: Colors.blue,fontSize: 27,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
      body: Column(
        children: [
          // Container(
          //   margin: EdgeInsets.only(left: 10),
          //   height: 70,
          //   child: ListView.builder(
          //     scrollDirection: Axis.horizontal,
          //     shrinkWrap: true,
          //     itemCount: categories.length,
          //     itemBuilder: (context, index) {
          //       return GestureDetector(
          //         onTap: () {
          //           Navigator.of(context).push(MaterialPageRoute(
          //             builder: (context) => categories[index].destination,
          //           ));
          //         },
          //         child: CategoryTile(
          //           image: categories[index].image,
          //           categoryName: categories[index].categoryName,
          //         ),
          //       );
          //
          //     },
          //   ),
          // ),
          // Heading
          //main Conentnt of the body
          Container(
              margin: EdgeInsets.only(left:10,top: 10,bottom: 10),
              alignment: Alignment.topLeft,
              child: Text("Trending News",style: TextStyle(color: Colors.black38,fontSize: 24,fontWeight: FontWeight.bold),),
          ),

          mapResponse==null? Text("No data found") :Expanded(
            child: Container(
              child: mapResponse == null
                  ? Center(
                child: CircularProgressIndicator(),
              )
                  : ListView.builder(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context)=> Center(child: Text("No more news to read"))
                      ));
                    },
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 10),
                          Row(
                            children: [
                              SizedBox(width: 10,),
                              Container(
                                  child: Icon(Icons.person,size: 30,color: Colors.white,),
                                  width: 40,
                                  height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade300,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              Column(
                                children: [
                                  Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text(mapResponse['articles'][index]['author'].split(' ')[0],style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20),)
                                  ),
                                  // Text(mapResponse['articles'][index]['publishedAt'],style: TextStyle(color: Colors.blueAccent,fontSize: 15,fontWeight: FontWeight.w300),),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 10,),
                          Center(
                            child: Container(
                                child: Image.network(
                                    mapResponse['articles'][index]['urlToImage']
                                        .toString(),),
                              width: MediaQuery.of(context).size.width - 30,
                              height: 200,
                            ),
                          ),
                          // SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.only(left: 17, right: 5),
                            child: Text(
                              mapResponse['articles'][index]['title'].toString(),
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 18, right: 5),
                            child: Text(
                              mapResponse['articles'][index]['description'].toString(),
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                          Divider(color: Colors.blue,),
                          // SizedBox(height: 1,),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: 200,
              ),
            ),
          ),
        ],
      ),
      drawer: const Drawer(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 50),
          child: Column(
            children: [
              ListTile(
                leading: Icon(CupertinoIcons.home),
                title: Text("Home",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
              ),
              ListTile(
                leading: Icon(CupertinoIcons.home),
                title: Text("Bussiness",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
              ),
              ListTile(
                leading: Icon(CupertinoIcons.home),
                title: Text("Politics",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
              ),
              ListTile(
                leading: Icon(CupertinoIcons.home),
                title: Text("Sports",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget buildImage(String urlImage,int index,String name)=>Container(
    child: Image.asset(urlImage,fit: BoxFit.cover,width: MediaQuery.of(context).size.width,),
  );
}



class CategoryTile extends StatelessWidget {
  final image,categoryName,destination;

  CategoryTile({this.categoryName,this.image,this.destination});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(image,
              width: 120,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: 120,
            height: 60,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:Colors.black26),
            child: Center(child: Text(categoryName,style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500),)),
          ),
        ],
      ),
    );
  }
}

