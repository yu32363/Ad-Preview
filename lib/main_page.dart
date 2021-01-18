import 'package:flutter/material.dart';

import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/rendering.dart';

import 'banner_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int reward = 0;
  AdmobInterstitial _admobInterstitial;
  AdmobReward _admobReward;

  @override
  void initState() {
    _admobInterstitial = createAdvert();
    _admobReward = createReward();
    super.initState();
  }

  AdmobReward createReward() {
    return AdmobReward(
        adUnitId: 'ca-app-pub-3940256099942544/5224354917',
        listener: (AdmobAdEvent event, Map<String, dynamic> args) {
          if (event == AdmobAdEvent.loaded) {
            _admobReward.show();
          } else if (event == AdmobAdEvent.closed) {
            _admobReward.dispose();
          } else if (event == AdmobAdEvent.rewarded) {
            setState(() {
              reward++;
            });
          }
        });
  }

  AdmobInterstitial createAdvert() {
    return AdmobInterstitial(
        adUnitId: 'ca-app-pub-3940256099942544/8691691433',
        listener: (AdmobAdEvent event, Map<String, dynamic> args) {
          if (event == AdmobAdEvent.loaded) {
            _admobInterstitial.show();
          } else if (event == AdmobAdEvent.closed) {
            _admobInterstitial.dispose();
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ad Preview',
          style: TextStyle(
            color: Color(0xFFEEEEEE),
          ),
        ),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 15.0),
            child: Image.asset(
              'images/yuWM.png',
            ),
            height: 15.0,
            width: 15.0,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 50.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Color(0xFFFD7014),
              ),
              margin: EdgeInsets.only(left: 50, right: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.dashboard,
                    color: Color(0xFFEEEEEE),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BannerPage(),
                        ),
                      );
                    },
                    child: Text(
                      'Banner Ads',
                      style: TextStyle(
                          color: Color(0xFFEEEEEE),
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Color(0xFFFD7014),
              ),
              margin: EdgeInsets.only(left: 50, right: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.video_library,
                    color: Color(0xFFEEEEEE),
                  ),
                  FlatButton(
                    onPressed: () {
                      _admobInterstitial.load();
                    },
                    child: Text(
                      'Interstitial Ads',
                      style: TextStyle(
                          color: Color(0xFFEEEEEE),
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Color(0xFFFD7014),
              ),
              margin: EdgeInsets.only(left: 50, right: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.stars,
                    color: Color(0xFFEEEEEE),
                  ),
                  FlatButton(
                    onPressed: () {
                      _admobReward.load();
                    },
                    child: Text(
                      'Rewarded Ads',
                      style: TextStyle(
                          color: Color(0xFFEEEEEE),
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 80.0),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Reward Amount',
                    style: TextStyle(
                        color: Color(0xFFEEEEEE),
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    reward.toString(),
                    style: TextStyle(
                        color: Color(0xFFEEEEEE),
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20.0),
                  Icon(
                    Icons.stars,
                    size: 50.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
