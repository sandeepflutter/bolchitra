import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:bolchitra/ui/json1.dart';
import 'package:linear_gradient/linear_gradient.dart';
//import 'package:http/http.dart' as http;

var globalContext;

class Lazy extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    globalContext = context;

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Lazy1(),
    );
  }
}

class Lazy1 extends StatefulWidget {
  Lazy1({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Lazy1 createState() => _Lazy1();
}

class _Lazy1 extends State<Lazy1> {
  @override
  Widget build(BuildContext context) {
    var spacecrafts = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"];

    final mediaQueryData = MediaQuery.of(context);
    if (mediaQueryData.orientation == Orientation.landscape) {
      //landscape
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              leading: IconButton(
                alignment: Alignment.centerLeft,
                icon: Icon(Icons.arrow_back),
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                color: Colors.black.withOpacity(0.5),
                onPressed: () {
                  Navigator.pop(globalContext);
                },
              ),
              expandedHeight: MediaQuery.of(context).size.height * 0.9,
              floating: true,
              pinned: true,
              snap: true,
              elevation: 50,
              backgroundColor: Colors.blue,
              flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                'assest/system/cover1.jpg',
                fit: BoxFit.cover,
              )),
            ),
            new SliverGrid(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200.0,
                ),
                delegate: new SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return new GestureDetector(
                      child: new Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 3.0,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradientStyle.linearGradient(
                                orientation:
                                    LinearGradientStyle.ORIENTATION_VERTICAL,
                                gradientType: LinearGradientStyle
                                    .GRADIENT_TYPE_LIGHT_ORANGE),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding: EdgeInsets.all(5.0),
                          child: Center(
                            child: GridTile(
                              footer: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text: "Dr. ",
                                      style: GoogleFonts.alegreya(
                                        textStyle: TextStyle(
                                          color: Colors.red,
                                          letterSpacing: .5,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          shadows: [
                                            Shadow(
                                                color: Colors.white,
                                                offset: Offset(1, 1),
                                                blurRadius: 1)
                                          ],
                                        ),
                                      ),
                                    ),
                                    TextSpan(
                                      text: "Lazy",
                                      style: GoogleFonts.alegreya(
                                        textStyle: TextStyle(
                                          color: Colors.blue,
                                          letterSpacing: .5,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          shadows: [
                                            Shadow(
                                                color: Colors.white,
                                                offset: Offset(1, 1),
                                                blurRadius: 1)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ])),
                              header: Text(
                                'Chapter ${index + 1}',
                                textAlign: TextAlign.center,
                              ),
                              child: Image.asset(
                                "assest/drlazy/face.png",
                                height: 88,
                              ),
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(globalContext).push(MaterialPageRoute(
                            builder: (BuildContext context) => Json1(index)));
                      },
                    );
                  },
                  childCount: spacecrafts.length,
                )),
          ],
        ),
      );
    }
    //portate
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: IconButton(
              alignment: Alignment.centerLeft,
              icon: Icon(Icons.arrow_back),
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              color: Colors.black.withOpacity(0.5),
              onPressed: () {
                Navigator.pop(globalContext);
              },
            ),
            expandedHeight: MediaQuery.of(context).size.height * 0.30,
            floating: true,
            pinned: true,
            snap: true,
            elevation: 5,
            backgroundColor: Colors.blue,
            flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
              'assest/system/cover1.jpg',
              fit: BoxFit.cover,
            )),
          ),
          new SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
              ),
              delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return new GestureDetector(
                    child: new Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 3.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradientStyle.linearGradient(
                              orientation:
                                  LinearGradientStyle.ORIENTATION_VERTICAL,
                              gradientType: LinearGradientStyle
                                  .GRADIENT_TYPE_LIGHT_ORANGE),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: EdgeInsets.all(5.0),
                        child: Center(
                          child: GridTile(
                            footer: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: "Dr. ",
                                    style: GoogleFonts.alegreya(
                                      textStyle: TextStyle(
                                        color: Colors.red,
                                        letterSpacing: .5,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        shadows: [
                                          Shadow(
                                              color: Colors.white,
                                              offset: Offset(1, 1),
                                              blurRadius: 1)
                                        ],
                                      ),
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Lazy",
                                    style: GoogleFonts.alegreya(
                                      textStyle: TextStyle(
                                        color: Colors.blue,
                                        letterSpacing: .5,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        shadows: [
                                          Shadow(
                                              color: Colors.white,
                                              offset: Offset(1, 1),
                                              blurRadius: 1)
                                        ],
                                      ),
                                    ),
                                  ),
                                ])),
                            header: Text(
                              'Chapter ${index + 1}',
                              textAlign: TextAlign.center,
                            ),
                            child: Image.asset(
                              "assest/drlazy/face.png",
                              height: 88,
                            ),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      // final int i == $index;
                      Navigator.of(globalContext).push(MaterialPageRoute(
                          builder: (BuildContext context) => Json1(index)));
                    },
                  );
                },
                childCount: spacecrafts.length,
              )),
        ],
      ),
    );
  }
}
