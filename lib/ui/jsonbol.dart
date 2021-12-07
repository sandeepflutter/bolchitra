import 'package:bolchitra/lazy/Lazymodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Jsonbol extends StatefulWidget {
  final int force;
  const Jsonbol(this.force);

  @override
  _Jsonbol createState() => new _Jsonbol();
}

class _Jsonbol extends State<Jsonbol> {
  Future<List<Lazymodel>> getAllData() async {
    // int counter = 1;
    var api = "https://jsonplaceholder.typicode.com/photos/1";
    var data = await http.get(api);

    var jsonData = json.decode(data.body);
    List<Lazymodel> listOf = [];
    for (var i in jsonData) {
      Lazymodel data = new Lazymodel(
          i["albumId"], i["id"], i["title"], i["url"], i["thumbnailUrl"]);
      listOf.add(data);
    }
    return listOf;
  }

  @override
  Widget build(BuildContext context) {
    //final i = widget.force;
    final mediaQueryData = MediaQuery.of(context);
    if (mediaQueryData.orientation == Orientation.landscape) {
      //landscape
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(1.0), // here the desired height
          child: AppBar(
            backgroundColor: Colors.blue,
            automaticallyImplyLeading: false,
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: new ListView(
          children: <Widget>[
            new Container(
              margin: EdgeInsets.all(5),
              height: MediaQuery.of(context).size.height,
              child: new FutureBuilder(
                future: getAllData(),
                builder: (BuildContext c, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return Center(
                      child: new Text("Loading ......"),
                    );
                  } else {
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext c, int index) {
                        if (snapshot.data[index].id == 2) {
                          return new Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              AspectRatio(
                                aspectRatio: 16 / 8,
                                child: Container(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 5.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      child: Image.network(
                                        snapshot.data[index].url,
                                        fit: BoxFit.fill,
                                        width:
                                            MediaQuery.of(context).size.width,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return null;
                        }
                      },
                    );
                  }
                },
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          child: Icon(Icons.arrow_back_ios),
          backgroundColor: Colors.green,
        ),
      );
    }
    //porait
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(1.0), // here the desired height
        child: AppBar(
          backgroundColor: Colors.blue,
          automaticallyImplyLeading: false,
        ),
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            margin: EdgeInsets.all(5.0),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: new FutureBuilder(
              future: getAllData(),
              builder: (BuildContext c, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    //itemCount: snapshot.data.length,
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext c, int index) {
                      //  debugPrint("$index");
//                      if(snapshot.data[1].id == 2)
//                      //snapshot.data[index].albumId==1)
//                      {
                      debugPrint("$index");
                      debugPrint("${snapshot.data[60].albumId}");
                      debugPrint(snapshot.data[index].albumId.toString());
                      return GestureDetector(
                        child: new Column(
                          children: <Widget>[
                            AspectRatio(
                              aspectRatio: 16 / 9,
                              child: new Container(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0.0, 0, 0, 5),
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                    child: //Text(snapshot.data[index].url)
                                        Image.network(
                                      snapshot.data[index].url,
                                      fit: BoxFit.fill,
                                      width: MediaQuery.of(context).size.width,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            new SizedBox(
                              height: 7.0,
                            ),
                            new Container(
                              margin: EdgeInsets.all(6.0),
                              child: new Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: new CircleAvatar(
                                      backgroundColor: Colors.red,
                                      child: new Text(
                                          snapshot.data[index].id.toString()),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                      // );
//                      }else{
//                        return null;
//                      }
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context, true);
        },
        child: Icon(Icons.arrow_back_ios),
        backgroundColor: Colors.green,
      ),
    );
  }
}

//class _jsonbol extends State<jsonbol> {
//
//  Future<List<Lazymodel>> getAllData() async{
//    var api ="https://jsonplaceholder.typicode.com/users";
//    var data= await http.get(api);
//
//    var jsonData=json.decode(data.body);
//    List<Lazymodel>listOf=[];
//    for(var i in jsonData){
//      Lazymodel data=new Lazymodel(i["id"], i["name"], i["address"]);
//      listOf.add(data);
//    }
//    return listOf;
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    //final i = widget.force;
//    final mediaQueryData = MediaQuery.of(context);
//    if (mediaQueryData.orientation == Orientation.landscape) {
//      //landscape
//      return Scaffold(
//        appBar: PreferredSize(
//          preferredSize: Size.fromHeight(1.0), // here the desired height
//          child: AppBar(
//            backgroundColor: Colors.blue,
//            automaticallyImplyLeading: false,
//          ),),
//        resizeToAvoidBottomPadding: false,
//        body: new ListView(
//          children: <Widget>[
//            new Container(
//              margin: EdgeInsets.all(5),
//              height: MediaQuery.of(context).size.height,
//              child:  new FutureBuilder(
//                future: getAllData(),
//                builder: (BuildContext c,AsyncSnapshot snapshot){
//                  if(snapshot.data==null){
//                    return Center(
//                      child: new Text("Loading ......"),
//                    );
//                  }else{
//                    return ListView.builder(
//                      scrollDirection: Axis.vertical,
//                      itemCount: snapshot.data.length,
//                      itemBuilder: (BuildContext c, int index){
//                        if(snapshot.data[index].id== 2) {
//                          return new Column(
//                            crossAxisAlignment: CrossAxisAlignment.center,
//                            mainAxisAlignment: MainAxisAlignment.center,
//                            children: <Widget>[
//                              AspectRatio(
//                                aspectRatio: 16 / 8,
//                                child: Container(
//                                  child: Padding(
//                                    padding: const EdgeInsets.fromLTRB(0,0,0,5.0),
//                                    child: ClipRRect(
//                                      borderRadius: BorderRadius.all(
//                                          Radius.circular(5.0)),
//                                      child: Image.network(snapshot.data[index].url,
//                                        fit: BoxFit.fill,
//                                        width: MediaQuery.of(context).size.width,
//                                      ),
//                                    ),
//                                  ),
//                                ),
//                              ),
//                            ],
//                          );
//                        }else{
//                          return null;
//                        }
//                      },
//                    );
//                  }
//                },
//              ),
//            )
//          ],
//        ),
//
//        floatingActionButton: FloatingActionButton(
//          onPressed: () {
//            Navigator.pop(context, true);
//          },
//          child: Icon(Icons.arrow_back_ios),
//          backgroundColor: Colors.green,
//        ),
//
//      );
//    }
//    //porait
//    return Scaffold(
//      resizeToAvoidBottomPadding: false,
//      appBar: PreferredSize(
//        preferredSize: Size.fromHeight(1.0), // here the desired height
//        child: AppBar(
//          backgroundColor: Colors.blue,
//          automaticallyImplyLeading: false,
//        ),),
//      body: new ListView(
//        children: <Widget>[
//          new Container(
//            margin: EdgeInsets.all(5.0),
//            height: MediaQuery.of(context).size.height,
//            width: MediaQuery.of(context).size.width,
//            child:  new FutureBuilder(
//              future: getAllData(),
//              builder: (BuildContext c,AsyncSnapshot snapshot){
//                if(snapshot.data==null){
//                  return Center(
//                    child: new Text("Loading ......"),
//                  );
//                }else{
//                  return ListView.builder(
//                    scrollDirection: Axis.vertical,
//                    itemCount: snapshot.data.length,
//                    itemBuilder: (BuildContext c, int index){
//                      //if(snapshot.data[index].id==3) {
//                      return GestureDetector(
//                        child: new Column(
//                          children: <Widget>[
//                            AspectRatio(
//                              aspectRatio: 16 / 9,
//                              child: new Container(
//                                child: Padding(
//                                  padding: const EdgeInsets.fromLTRB(0.0,0,0,5),
//                                  child: ClipRRect(
//                                      borderRadius: BorderRadius.all(
//                                          Radius.circular(5.0)),
//                                      child: Text(snapshot.data[index].address)
//                                    //Image.network(snapshot.data[index].url,
//                                    // fit: BoxFit.fill,
//                                    //  width: MediaQuery.of(context).size.width,
//                                    // ),
//                                  ),
//                                ),
//                              ),
//                            ),
//                          ],
//                        ),
//                      );
//                      // );
////                      }else{
////                        return null;
////                      }
//                    },
//                  );
//                }
//              },
//            ),
//          )
//        ],
//      ),
//
//      floatingActionButton: FloatingActionButton(
//        onPressed: () {
//          Navigator.pop(context, true);
//        },
//        child: Icon(Icons.arrow_back_ios),
//        backgroundColor: Colors.green,
//      ),
//    );
//  }
//}

//import 'package:bolchitra/lazy/Lazymodel.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
//import 'dart:convert';
//import 'dart:async';
//
//class jsonbol extends StatefulWidget{
//
//  final int force;
//  const jsonbol(this.force);
//
//  @override
//  _jsonbol createState()=> new _jsonbol();
//}
//class _jsonbol extends State<jsonbol> {
//
//
//  Future<List<Lazymodel>> getAllData() async{
//   // int counter = 1;
//    var api ="https://jsonplaceholder.typicode.com/photos/1";
//    var data= await http.get(api);
//
//    var jsonData=json.decode(data.body);
//    List<Lazymodel>listOf=[];
//    for(var i in jsonData){
//      Lazymodel data=new Lazymodel(i["albumId"],i["id"], i["title"], i["url"], i["thumbnailUrl"]);
//      listOf.add(data);
//    }
//    return listOf;
//
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    //final i = widget.force;
//    final mediaQueryData = MediaQuery.of(context);
//    if (mediaQueryData.orientation == Orientation.landscape) {
//      //landscape
//      return Scaffold(
//        appBar: PreferredSize(
//          preferredSize: Size.fromHeight(1.0), // here the desired height
//          child: AppBar(
//            backgroundColor: Colors.blue,
//            automaticallyImplyLeading: false,
//          ),),
//        resizeToAvoidBottomPadding: false,
//        body: new ListView(
//          children: <Widget>[
//            new Container(
//              margin: EdgeInsets.all(5),
//              height: MediaQuery.of(context).size.height,
//              child:  new FutureBuilder(
//                future: getAllData(),
//                builder: (BuildContext c,AsyncSnapshot snapshot){
//                  if(snapshot.data==null){
//                    return Center(
//                      child: new Text("Loading ......"),
//                    );
//                  }else{
//                    return ListView.builder(
//                      scrollDirection: Axis.vertical,
//                      itemCount: snapshot.data.length,
//                      itemBuilder: (BuildContext c, int index){
//                        if(snapshot.data[index].id== 2) {
//                          return new Column(
//                              crossAxisAlignment: CrossAxisAlignment.center,
//                              mainAxisAlignment: MainAxisAlignment.center,
//                              children: <Widget>[
//                                AspectRatio(
//                                  aspectRatio: 16 / 8,
//                                    child: Container(
//                                      child: Padding(
//                                        padding: const EdgeInsets.fromLTRB(0,0,0,5.0),
//                                        child: ClipRRect(
//                                          borderRadius: BorderRadius.all(
//                                              Radius.circular(5.0)),
//                                          child: Image.network(snapshot.data[index].url,
//                                            fit: BoxFit.fill,
//                                            width: MediaQuery.of(context).size.width,
//                                          ),
//                                        ),
//                                      ),
//                                    ),
//                                ),
//                              ],
//                          );
//                        }else{
//                          return null;
//                        }
//                      },
//                    );
//                  }
//                },
//              ),
//            )
//          ],
//        ),
//
//        floatingActionButton: FloatingActionButton(
//          onPressed: () {
//            Navigator.pop(context, true);
//          },
//          child: Icon(Icons.arrow_back_ios),
//          backgroundColor: Colors.green,
//        ),
//
//      );
//    }
//    //porait
//    return Scaffold(
//      resizeToAvoidBottomPadding: false,
//      appBar: PreferredSize(
//          preferredSize: Size.fromHeight(1.0), // here the desired height
//          child: AppBar(
//            backgroundColor: Colors.blue,
//            automaticallyImplyLeading: false,
//          ),),
//      body: new ListView(
//        children: <Widget>[
//          new Container(
//            margin: EdgeInsets.all(5.0),
//            height: MediaQuery.of(context).size.height,
//            width: MediaQuery.of(context).size.width,
//            child:  new FutureBuilder(
//              future: getAllData(),
//              builder: (BuildContext c,AsyncSnapshot snapshot){
//                if(snapshot.data==null){
//                  return Center(
//                    child: CircularProgressIndicator(),
//                  );
//                }else{
//                  return ListView.builder(
//                    scrollDirection: Axis.vertical,
//                    //itemCount: snapshot.data.length,
//                    itemCount: snapshot.data.length,
//                    itemBuilder: (BuildContext c, int index){
//                    //  debugPrint("$index");
////                      if(snapshot.data[1].id == 2)
////                      //snapshot.data[index].albumId==1)
////                      {
//                        debugPrint("$index");
//                        debugPrint("${snapshot.data[60].albumId}");
//                        debugPrint(snapshot.data[index].albumId.toString());
//                        return GestureDetector(
//                          child: new Column(
//                            children: <Widget>[
//                              AspectRatio(
//                                aspectRatio: 16 / 9,
//                                child: new Container(
//                                  child: Padding(
//                                    padding: const EdgeInsets.fromLTRB(0.0,0,0,5),
//                                    child: ClipRRect(
//                                      borderRadius: BorderRadius.all(
//                                          Radius.circular(5.0)),
//                                      child: //Text(snapshot.data[index].url)
//                                      Image.network(snapshot.data[index].url,
//                                        fit: BoxFit.fill,
//                                        width: MediaQuery.of(context).size.width,
//                                      ),
//                                    ),
//                                  ),
//                                ),
//                              ),
//                              new SizedBox(height: 7.0,),
//                              new Container(
//                                margin: EdgeInsets.all(6.0),
//                                child: new Row(
//                                  children: <Widget>[
//                                    Expanded(
//                                      flex: 1,
//                                      child: new CircleAvatar(
//                                        backgroundColor: Colors.red,
//                                        child: new Text(snapshot.data[index].id.toString()),
//                                      ),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ],
//                          ),
//                        );
//                        // );
////                      }else{
////                        return null;
////                      }
//
//                    },
//                  );
//                }
//              },
//            ),
//          )
//        ],
//      ),
//
//      floatingActionButton: FloatingActionButton(
//        onPressed: () {
//          Navigator.pop(context, true);
//        },
//        child: Icon(Icons.arrow_back_ios),
//        backgroundColor: Colors.green,
//      ),
//    );
//  }
//}
//
//
////class _jsonbol extends State<jsonbol> {
////
////  Future<List<Lazymodel>> getAllData() async{
////    var api ="https://jsonplaceholder.typicode.com/users";
////    var data= await http.get(api);
////
////    var jsonData=json.decode(data.body);
////    List<Lazymodel>listOf=[];
////    for(var i in jsonData){
////      Lazymodel data=new Lazymodel(i["id"], i["name"], i["address"]);
////      listOf.add(data);
////    }
////    return listOf;
////  }
////
////  @override
////  Widget build(BuildContext context) {
////    //final i = widget.force;
////    final mediaQueryData = MediaQuery.of(context);
////    if (mediaQueryData.orientation == Orientation.landscape) {
////      //landscape
////      return Scaffold(
////        appBar: PreferredSize(
////          preferredSize: Size.fromHeight(1.0), // here the desired height
////          child: AppBar(
////            backgroundColor: Colors.blue,
////            automaticallyImplyLeading: false,
////          ),),
////        resizeToAvoidBottomPadding: false,
////        body: new ListView(
////          children: <Widget>[
////            new Container(
////              margin: EdgeInsets.all(5),
////              height: MediaQuery.of(context).size.height,
////              child:  new FutureBuilder(
////                future: getAllData(),
////                builder: (BuildContext c,AsyncSnapshot snapshot){
////                  if(snapshot.data==null){
////                    return Center(
////                      child: new Text("Loading ......"),
////                    );
////                  }else{
////                    return ListView.builder(
////                      scrollDirection: Axis.vertical,
////                      itemCount: snapshot.data.length,
////                      itemBuilder: (BuildContext c, int index){
////                        if(snapshot.data[index].id== 2) {
////                          return new Column(
////                            crossAxisAlignment: CrossAxisAlignment.center,
////                            mainAxisAlignment: MainAxisAlignment.center,
////                            children: <Widget>[
////                              AspectRatio(
////                                aspectRatio: 16 / 8,
////                                child: Container(
////                                  child: Padding(
////                                    padding: const EdgeInsets.fromLTRB(0,0,0,5.0),
////                                    child: ClipRRect(
////                                      borderRadius: BorderRadius.all(
////                                          Radius.circular(5.0)),
////                                      child: Image.network(snapshot.data[index].url,
////                                        fit: BoxFit.fill,
////                                        width: MediaQuery.of(context).size.width,
////                                      ),
////                                    ),
////                                  ),
////                                ),
////                              ),
////                            ],
////                          );
////                        }else{
////                          return null;
////                        }
////                      },
////                    );
////                  }
////                },
////              ),
////            )
////          ],
////        ),
////
////        floatingActionButton: FloatingActionButton(
////          onPressed: () {
////            Navigator.pop(context, true);
////          },
////          child: Icon(Icons.arrow_back_ios),
////          backgroundColor: Colors.green,
////        ),
////
////      );
////    }
////    //porait
////    return Scaffold(
////      resizeToAvoidBottomPadding: false,
////      appBar: PreferredSize(
////        preferredSize: Size.fromHeight(1.0), // here the desired height
////        child: AppBar(
////          backgroundColor: Colors.blue,
////          automaticallyImplyLeading: false,
////        ),),
////      body: new ListView(
////        children: <Widget>[
////          new Container(
////            margin: EdgeInsets.all(5.0),
////            height: MediaQuery.of(context).size.height,
////            width: MediaQuery.of(context).size.width,
////            child:  new FutureBuilder(
////              future: getAllData(),
////              builder: (BuildContext c,AsyncSnapshot snapshot){
////                if(snapshot.data==null){
////                  return Center(
////                    child: new Text("Loading ......"),
////                  );
////                }else{
////                  return ListView.builder(
////                    scrollDirection: Axis.vertical,
////                    itemCount: snapshot.data.length,
////                    itemBuilder: (BuildContext c, int index){
////                      //if(snapshot.data[index].id==3) {
////                      return GestureDetector(
////                        child: new Column(
////                          children: <Widget>[
////                            AspectRatio(
////                              aspectRatio: 16 / 9,
////                              child: new Container(
////                                child: Padding(
////                                  padding: const EdgeInsets.fromLTRB(0.0,0,0,5),
////                                  child: ClipRRect(
////                                      borderRadius: BorderRadius.all(
////                                          Radius.circular(5.0)),
////                                      child: Text(snapshot.data[index].address)
////                                    //Image.network(snapshot.data[index].url,
////                                    // fit: BoxFit.fill,
////                                    //  width: MediaQuery.of(context).size.width,
////                                    // ),
////                                  ),
////                                ),
////                              ),
////                            ),
////                          ],
////                        ),
////                      );
////                      // );
//////                      }else{
//////                        return null;
//////                      }
////                    },
////                  );
////                }
////              },
////            ),
////          )
////        ],
////      ),
////
////      floatingActionButton: FloatingActionButton(
////        onPressed: () {
////          Navigator.pop(context, true);
////        },
////        child: Icon(Icons.arrow_back_ios),
////        backgroundColor: Colors.green,
////      ),
////    );
////  }
////}
