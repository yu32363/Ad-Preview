import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:admob_flutter/admob_flutter.dart';

class BannerPage extends StatefulWidget {
  @override
  _BannerPageState createState() => _BannerPageState();
}

class _BannerPageState extends State<BannerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Banner Ads',
          style: TextStyle(
            color: Color(0xFFEEEEEE),
          ),
        ),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 15.0),
            child: IconButton(
                icon: Icon(
                  Icons.home,
                  color: Color(0xFFEEEEEE),
                ),
                iconSize: 24.0,
                onPressed: () {
                  Navigator.pop(context);
                }),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Text(
                'Banner',
                style: TextStyle(color: Color(0xFFEEEEEE), fontSize: 16.0),
              ),
              AdmobBanner(
                  adUnitId: 'ca-app-pub-3940256099942544/6300978111',
                  adSize: AdmobBannerSize.BANNER),
              SizedBox(
                height: 40,
              ),
              Text(
                'Large Banner',
                style: TextStyle(color: Color(0xFFEEEEEE), fontSize: 16.0),
              ),
              AdmobBanner(
                  adUnitId: 'ca-app-pub-3940256099942544/6300978111',
                  adSize: AdmobBannerSize.LARGE_BANNER),
              SizedBox(
                height: 40,
              ),
              Text(
                'Medium Rectangle',
                style: TextStyle(color: Color(0xFFEEEEEE), fontSize: 16.0),
              ),
              AdmobBanner(
                  adUnitId: 'ca-app-pub-3940256099942544/6300978111',
                  adSize: AdmobBannerSize.MEDIUM_RECTANGLE),
            ],
          ),
        ),
      ),
    );
  }
}
