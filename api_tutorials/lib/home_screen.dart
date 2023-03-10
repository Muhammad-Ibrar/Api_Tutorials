import 'dart:convert';
import 'package:api_tutorials/Models/posts_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<PostsModel> postList = [];
  Future<List<PostsModel>> getPostApi ()async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200){
      postList.clear();
      for (Map i in data){
        postList.add(PostsModel.fromJson(i));
      }
      return postList;
    }
    else{

      return postList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api Course'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPostApi(),
                builder: (context , snapshot){
                if(!snapshot.hasData){
                  return Text('Loading');
                }
                else{
                  return ListView.builder(
                    itemCount: postList.length,
                      itemBuilder: (context , index){

                        return Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Title' , style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold),),
                               Text(postList[index].title.toString()),
                              Text('Description ' , style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold)),
                                  Text(postList[index].body.toString())
                            ],
                          ),
                        );
                      }
                  );
                }
                }
            ),
          )
        ],
      ),
    );
  }
}
