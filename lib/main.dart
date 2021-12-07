import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:firebase_admob/firebase_admob.dart';
import 'package:getflutter/getflutter.dart';
import 'package:share/share.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:package_info/package_info.dart';
import 'package:bolchitra/lazy/lazy.dart';

const String testDevice = '';

final List<String> imageList = [
//  "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
//  "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg",
  "assest/system/cover.jpg",
  "assest/drlazy/lazy.jpg",
  "assest/drlazy/haddi.jpg",
];

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static final MobileAdTargetingInfo targetInfo = new MobileAdTargetingInfo(
    testDevices: <String>[],
    keywords: <String>[
      'comic',
      'cartoon',
      'manga',
      'child',
      'funny',
      'love',
      'flutter',
      'information',
      'movie',
      'series',
      'doctor',
      'beautiful',
      'teen',
      'baby',
      'million',
      'billion',
      'trillion',
      'nepal',
      'India',
      'pakistan',
      'bhutan',
      'sri lanka',
      'bangladesh'
    ],
    //birthday: new DateTime.now(),
    //childDirected: true,
  );
  _launchUrl(String url) {
    canLaunch(url).then((bool success) {
      if (success) {
        launch(url);
      }
    });
  }

  BannerAd _bannerAd;
  BannerAd createBannerAd() {
    return new BannerAd(
        adUnitId: "ca-app-pub-3904733641536823/9484389349",
        size: AdSize.banner,
        targetingInfo: targetInfo,
        listener: (MobileAdEvent event) {
          print("Banner event : $event");
        });
  }

  InterstitialAd createInterstitialAd() {
    return new InterstitialAd(
        adUnitId: "ca-app-pub-3904733641536823/8223278561",
        targetingInfo: targetInfo,
        listener: (MobileAdEvent event) {
          print("InterstitialAd event : $event");
        });
  }

  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance
        .initialize(appId: "ca-app-pub-3904733641536823~9771329807");
    _bannerAd = createBannerAd()
      ..load()
      ..show();
    super.initState();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  final igp = "assest/system/bl1.svg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new Drawer(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
                // ignore: missing_required_param
                child: DrawerHeader(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assest/system/logo.png"),
                          fit: BoxFit.scaleDown)),
                ),
              ),
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                text: "Bol",
                style: GoogleFonts.alegreya(
                  textStyle: TextStyle(
                    color: Colors.red,
                    letterSpacing: .5,
                    fontWeight: FontWeight.bold,
                    fontSize: 45,
                  ),
                ),
              ),
              TextSpan(
                text: "Chitra",
                style: GoogleFonts.alegreya(
                  textStyle: TextStyle(
                    color: Colors.blue,
                    letterSpacing: .5,
                    fontWeight: FontWeight.bold,
                    fontSize: 45,
                  ),
                ),
              ),
            ])),
            Expanded(
              flex: 2,
              child: ListView(children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                  child: Text(
                    "Bolchitra Application bring Stories from around the world in animated Comics/Manga form.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.alegreya(
                      textStyle: TextStyle(
                        //   color: Colors.red,
                        letterSpacing: .5,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.warning,
                    color: Colors.red,
                    size: 40,
                  ),
                  title: Text(
                    "Disclaimers",
                    style: TextStyle(
                      color: Colors.blue,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    showAboutDialog(
                        context: context,
                        applicationVersion: '1.0.0',
                        applicationIcon: Image.asset(
                          "assest/system/logo1.png",
                          fit: BoxFit.contain,
                          height: 65,
                          width: 65,
                        ),
                        applicationName: 'BolChitra',
                        children: <Widget>[
                          Text(
                              "BolChitra application do not take responsibility for decisions taken by the reader based solely on this app."),
                        ]);
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.share,
                    color: Colors.red,
                    size: 40,
                  ),
                  title: Text(
                    "Share",
                    style: TextStyle(
                      color: Colors.blue,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Share.share("Check out BolChitra\n" +
                        ("https://www.facebook.com/pg/BolChitra/"));
                  },
                ),
                Divider(),
                ListTile(
                  title: Text("Developer"),
                  subtitle: Text("Sandeep Budha"),
                ),
                Divider(),
                Column(
                  children: <Widget>[
                    Text(
                      "Media Platform",
                      style: TextStyle(
                        color: Colors.red,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Wrap(spacing: 10.0, children: <Widget>[
                        GFIconButton(
                          onPressed: () =>
                              _launchUrl("https://www.facebook.com/BolChitra/"),
                          icon: Icon(FontAwesomeIcons.facebookF),
                          shape: GFIconButtonShape.standard,
                          type: GFButtonType.solid,
                          size: GFSize.LARGE,
                          color: const Color(0xff4267b2),
                        ),
                        GFIconButton(
                          onPressed: () => _launchUrl(
                              "https://www.youtube.com/channel/UCkY_yhQyeDHHWbPAimpuppw"),
                          icon: Icon(FontAwesomeIcons.youtube),
                          shape: GFIconButtonShape.standard,
                          type: GFButtonType.solid,
                          size: GFSize.LARGE,
                          color: const Color(0xffED3833),
                        ),
                        GFIconButton(
                          onPressed: () =>
                              _launchUrl("https://twitter.com/bolchitra"),
                          icon: Icon(FontAwesomeIcons.twitter),
                          shape: GFIconButtonShape.standard,
                          type: GFButtonType.solid,
                          size: GFSize.LARGE,
                          color: const Color(0xff38A1F3),
                        ),
                      ]),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 0, 5, 15.0),
                        child: Text(
                          "Built With",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.alegreya(
                            textStyle: TextStyle(
                              color: Colors.blue,
                              letterSpacing: .5,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 10, 15.0),
                        child: SpinKitPumpingHeart(
                          color: Colors.red,
                          size: 35,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 15.0),
                        child: Text(
                          "For You",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.alegreya(
                            textStyle: TextStyle(
                              color: Colors.blue,
                              letterSpacing: .5,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Divider(),
                ListTile(
                  enabled: false,
                  title: Text("Version", textAlign: TextAlign.center),
                  subtitle: FutureBuilder(
                    future: getVersionNumber(),
                    builder: (BuildContext context,
                            AsyncSnapshot<String> snapshot) =>
                        Text(
                      snapshot.hasData ? snapshot.data : "Loading ...",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black38),
                    ),
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.0),
        child: AppBar(
          iconTheme: new IconThemeData(color: Colors.redAccent),
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Container(
            child: Align(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 0.0, bottom: 0),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  child: Image.asset(
                                    "assest/system/logo1.png",
                                    height: 70,
                                    width: 70,
                                  ),
                                ),
                                RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                    text: "Bol",
                                    style: GoogleFonts.alegreya(
                                      textStyle: TextStyle(
                                        color: Colors.red,
                                        letterSpacing: .5,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 45,
                                      ),
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Chitra",
                                    style: GoogleFonts.alegreya(
                                      textStyle: TextStyle(
                                        color: Colors.blue,
                                        letterSpacing: .5,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 45,
                                      ),
                                    ),
                                  ),
                                ])),
                              ],
                            ),
                          )
                        ]),
                  ),
                ],
              ),
            ),
            height: 55,
          ),
        ),
      ),
      body: Center(
        child: Container(
            padding: const EdgeInsets.only(top: 8.0),
            child: ListView(
              children: <Widget>[
                GFCarousel(
                  autoPlay: true,
                  enlargeMainPage: true,
                  viewportFraction: 0.85,
                  pagination: true,
                  pagerSize: 12.0,
                  activeIndicator: Colors.red,
                  passiveIndicator: Colors.red.withOpacity(0.4),
                  items: imageList.map(
                    (url) {
                      return Container(
                        margin: const EdgeInsets.only(
                          left: 2,
                          right: 2,
                          bottom: 28,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          child: Image.asset(
                            url,
                            fit: BoxFit.fitWidth,
                            width: 1000.0,
                            // color: Colors.yellow,
                          ),
                        ),
                      );
                    },
                  ).toList(),
                  onPageChanged: (index) {
                    setState(() {
                      // index;
                    });
                  },
                ),
                Card(
                  elevation: 3.0,
                  margin: EdgeInsets.all(6.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: new InkWell(
                    onTap: () => {
                      createInterstitialAd()
                        ..load()
                        ..show(),
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => Lazy()))
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              colorFilter: new ColorFilter.mode(
                                  Colors.black.withOpacity(0.2),
                                  BlendMode.dstATop),
                              image: AssetImage("assest/drlazy/main.jpg"),
                              fit: BoxFit.fitWidth,
                            ),
                            borderRadius: new BorderRadius.circular(10.0),
                            border: Border.all(
                              color: Colors.blueAccent.withOpacity(0.4),
                              width: 2,
                            ),
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(9, 0.0, 0, 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Image.asset(
                                        "assest/drlazy/face.png",
                                        height: 88,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            4, 0, 0, 0),
                                        child: RichText(
                                            text: TextSpan(children: [
                                          TextSpan(
                                            text: "Dr. ",
                                            style: GoogleFonts.alegreya(
                                              textStyle: TextStyle(
                                                color: Colors.red,
                                                letterSpacing: .5,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 55,
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
                                                fontSize: 55,
                                              ),
                                            ),
                                          ),
                                        ])),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Text(
                    "More Stories Coming Soon",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent.withOpacity(0.5)),
                  ),
                ),

//              children: <Widget>[
//                Stack(
//                  children: <Widget>[
//                    SizedBox.fromSize(
//                      child: SvgPicture.asset(igp),
//                      size: Size(100.0, 100.0),
//                    ),
//                  ],
//                ),
//              ],
              ],
            )
//                   decoration: BoxDecoration(color: Colors.red,image: DecorationImage(
//                     image: AssetImage("assest/system/logo.png"),
//                     fit: BoxFit.scaleDown,
//                     alignment: Alignment.center,),
            ),
      ),
    );
  }

  Future<String> getVersionNumber() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;

    return version;
  }
}
