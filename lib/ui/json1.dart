import 'package:bolchitra/lazy/Lazymodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class json1 extends StatefulWidget {
  final int force;
  const json1(this.force);
  @override
  _json1 createState() => new _json1();
}

class _json1 extends State<json1> {
  Future<Lazymodel1> fetchAlbum() async {
    int counter = widget.force + 1;
    final response = await http
        .get('https://bolchitra-api.firebaseio.com/students/$counter.json');

    if (response.statusCode == 200) {
      return Lazymodel1.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<Lazymodel1> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    if (mediaQueryData.orientation == Orientation.landscape) {
      //landscape
      return Scaffold(
        resizeToAvoidBottomPadding: false,
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
                child: FutureBuilder<Lazymodel1>(
                  future: futureAlbum,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return GestureDetector(
                        child: new ListView(
                          children: <Widget>[
                            AspectRatio(
                              aspectRatio: 16 / 8,
                              child: new Container(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0.0, 0, 0, 5),
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                    child: //Text(snapshot.data[index].url)
                                        Image.network(
                                      snapshot.data.a,
                                      fit: BoxFit.fill,
                                      width: MediaQuery.of(context).size.width,
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent loadingProgress) {
                                        if (loadingProgress == null)
                                          return child;
                                        return Center(
                                          child: CircularProgressIndicator(
                                            value: loadingProgress
                                                        .expectedTotalBytes !=
                                                    null
                                                ? loadingProgress
                                                        .cumulativeBytesLoaded /
                                                    loadingProgress
                                                        .expectedTotalBytes
                                                : null,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            AspectRatio(
                              aspectRatio: 16 / 8,
                              child: new Container(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0.0, 0, 0, 5),
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                    child: //Text(snapshot.data[index].url)
                                        Image.network(
                                      snapshot.data.b,
                                      fit: BoxFit.fill,
                                      width: MediaQuery.of(context).size.width,
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent loadingProgress) {
                                        if (loadingProgress == null)
                                          return child;
                                        return Center(
                                          child: CircularProgressIndicator(
                                            value: loadingProgress
                                                        .expectedTotalBytes !=
                                                    null
                                                ? loadingProgress
                                                        .cumulativeBytesLoaded /
                                                    loadingProgress
                                                        .expectedTotalBytes
                                                : null,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            AspectRatio(
                              aspectRatio: 16 / 8,
                              child: new Container(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0.0, 0, 0, 5),
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                    child: //Text(snapshot.data[index].url)
                                        Image.network(
                                      snapshot.data.c,
                                      fit: BoxFit.fill,
                                      width: MediaQuery.of(context).size.width,
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent loadingProgress) {
                                        if (loadingProgress == null)
                                          return child;
                                        return Center(
                                          child: CircularProgressIndicator(
                                            value: loadingProgress
                                                        .expectedTotalBytes !=
                                                    null
                                                ? loadingProgress
                                                        .cumulativeBytesLoaded /
                                                    loadingProgress
                                                        .expectedTotalBytes
                                                : null,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            AspectRatio(
                              aspectRatio: 16 / 8,
                              child: new Container(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0.0, 0, 0, 5),
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                    child: //Text(snapshot.data[index].url)
                                        Image.network(
                                      snapshot.data.d,
                                      fit: BoxFit.fill,
                                      width: MediaQuery.of(context).size.width,
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent loadingProgress) {
                                        if (loadingProgress == null)
                                          return child;
                                        return Center(
                                          child: CircularProgressIndicator(
                                            value: loadingProgress
                                                        .expectedTotalBytes !=
                                                    null
                                                ? loadingProgress
                                                        .cumulativeBytesLoaded /
                                                    loadingProgress
                                                        .expectedTotalBytes
                                                : null,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            AspectRatio(
                              aspectRatio: 16 / 8,
                              child: new Container(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0.0, 0, 0, 5),
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                    child: //Text(snapshot.data[index].url)
                                        Image.network(
                                      snapshot.data.e,
                                      fit: BoxFit.fill,
                                      width: MediaQuery.of(context).size.width,
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent loadingProgress) {
                                        if (loadingProgress == null)
                                          return child;
                                        return Center(
                                          child: CircularProgressIndicator(
                                            value: loadingProgress
                                                        .expectedTotalBytes !=
                                                    null
                                                ? loadingProgress
                                                        .cumulativeBytesLoaded /
                                                    loadingProgress
                                                        .expectedTotalBytes
                                                : null,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            AspectRatio(
                              aspectRatio: 16 / 8,
                              child: new Container(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0.0, 0, 0, 5),
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                    child: //Text(snapshot.data[index].url)
                                        Image.network(
                                      snapshot.data.f,
                                      fit: BoxFit.fill,
                                      width: MediaQuery.of(context).size.width,
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent loadingProgress) {
                                        if (loadingProgress == null)
                                          return child;
                                        return Center(
                                          child: CircularProgressIndicator(
                                            value: loadingProgress
                                                        .expectedTotalBytes !=
                                                    null
                                                ? loadingProgress
                                                        .cumulativeBytesLoaded /
                                                    loadingProgress
                                                        .expectedTotalBytes
                                                : null,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            new SizedBox(
                              height: 30.0,
                            ),
                          ],
                        ),
                      );

                      //Text(snapshot.data.title);
                    } else if (snapshot.hasError) {
                      return Center(
                          child: Text("Check your Internet Connection"));
                      //return Text("${snapshot.error}");
                    }
                    // By default, show a loading spinner.
                    return CircularProgressIndicator();
                  },
                ))
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
      resizeToAvoidBottomPadding: false,
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
              child: FutureBuilder<Lazymodel1>(
                future: futureAlbum,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // debugPrint("${snapshot.hasData}");
                    return GestureDetector(
                      child: new ListView(
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
                                    snapshot.data.a,
                                    fit: BoxFit.fill,
                                    width: MediaQuery.of(context).size.width,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes
                                              : null,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
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
                                    snapshot.data.b,
                                    fit: BoxFit.fill,
                                    width: MediaQuery.of(context).size.width,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes
                                              : null,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
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
                                    snapshot.data.c,
                                    fit: BoxFit.fill,
                                    width: MediaQuery.of(context).size.width,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes
                                              : null,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
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
                                    snapshot.data.d,
                                    fit: BoxFit.fill,
                                    width: MediaQuery.of(context).size.width,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes
                                              : null,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
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
                                    snapshot.data.e,
                                    fit: BoxFit.fill,
                                    width: MediaQuery.of(context).size.width,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes
                                              : null,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
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
                                    snapshot.data.f,
                                    fit: BoxFit.fill,
                                    width: MediaQuery.of(context).size.width,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes
                                              : null,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          new SizedBox(
                            height: 30.0,
                          ),
                        ],
                      ),
                    );

                    //Text(snapshot.data.title);
                  } else if (snapshot.hasError) {
                    return Center(
                        child: Text("Check your Internet Connection"));
                    // "//${snapshot.error}");
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ))
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
