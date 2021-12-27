import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:profilebabavendor/widget/Popover.dart';
import 'package:profilebabavendor/widget/mycolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Shop extends StatefulWidget {
  Shop({Key key}) : super(key: key);
  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  File _image;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  bool isLoading = false;

  SharedPreferences prefs;
  List data, dataonline, datachat, datacall;
  String one;
  var map, maponline, mapchat, mapcall;
  bool _isSelected = false;
  var result;
  final double _borderRadius = 24;
  var selected = [];
  String a = "0";
  String id;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
          child: Scaffold(
            appBar: TabBar(
                unselectedLabelColor: MyColors.blue,
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                    gradient:
                        LinearGradient(colors: [MyColors.blue, MyColors.blue]),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.redAccent),
                tabs: [
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("This week"),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("ALL"),
                    ),
                  ),
                ]),
            body: TabBarView(children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Plumber",
                                    style: TextStyle(
                                        color: MyColors.orange,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        _bottomdilog();
                                      },
                                      child: Image.asset(
                                          "assets/icon/threedot.png")),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Delhi, laxmi nagar",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "2 Nov 2021",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "10:30 am",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Water supply not working...",
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Ravi Verma",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 150,
                                    child: RaisedButton(
                                        child: Text("Call".toUpperCase(),
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white)),
                                        shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(18.0),
                                        ),
                                        color: MyColors.blue,
                                        onPressed: () {
                                          showDialog(
                                              barrierDismissible: false,
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Dialog(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                  elevation: 0.0,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  child: dialogCall(context),
                                                );
                                              });
                                        }),
                                  ),
                                  Container(
                                    width: 150,
                                    child: RaisedButton(
                                        child: Text("Message".toUpperCase(),
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white)),
                                        shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(18.0),
                                        ),
                                        color: MyColors.orange,
                                        onPressed: () {
                                          showDialog(
                                              barrierDismissible: false,
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Dialog(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                  elevation: 0.0,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  child: dialogmssg(context),
                                                );
                                              });
                                        }),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        elevation: 8,
                        margin: EdgeInsets.all(5),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Plumber",
                                    style: TextStyle(
                                        color: MyColors.orange,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        _bottomdilog();
                                      },
                                      child: Image.asset(
                                          "assets/icon/threedot.png")),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Delhi, laxmi nagar",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "2 Nov 2021",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "10:30 am",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Water supply not working...",
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Ravi Verma",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 150,
                                    child: RaisedButton(
                                        child: Text("Call".toUpperCase(),
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white)),
                                        shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(18.0),
                                        ),
                                        color: MyColors.blue,
                                        onPressed: () => null),
                                  ),
                                  Container(
                                    width: 150,
                                    child: RaisedButton(
                                        child: Text("Message".toUpperCase(),
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white)),
                                        shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(18.0),
                                        ),
                                        color: MyColors.orange,
                                        onPressed: () => null),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        elevation: 8,
                        margin: EdgeInsets.all(5),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Plumber",
                                    style: TextStyle(
                                        color: MyColors.orange,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        _bottomdilog();
                                      },
                                      child: Image.asset(
                                          "assets/icon/threedot.png")),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Delhi, laxmi nagar",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "2 Nov 2021",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "10:30 am",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Water supply not working...",
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Ravi Verma",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 150,
                                    child: RaisedButton(
                                        child: Text("Call".toUpperCase(),
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white)),
                                        shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(18.0),
                                        ),
                                        color: MyColors.blue,
                                        onPressed: () => null),
                                  ),
                                  Container(
                                    width: 150,
                                    child: RaisedButton(
                                        child: Text("Message".toUpperCase(),
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white)),
                                        shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(18.0),
                                        ),
                                        color: MyColors.orange,
                                        onPressed: () => null),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        elevation: 8,
                        margin: EdgeInsets.all(5),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Plumber",
                                    style: TextStyle(
                                        color: MyColors.orange,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        _bottomdilog();
                                      },
                                      child: Image.asset(
                                          "assets/icon/threedot.png")),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Delhi, laxmi nagar",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "2 Nov 2021",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "10:30 am",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Water supply not working...",
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Ravi Verma",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 150,
                                    child: RaisedButton(
                                        child: Text("Call".toUpperCase(),
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white)),
                                        shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(18.0),
                                        ),
                                        color: MyColors.blue,
                                        onPressed: () => null),
                                  ),
                                  Container(
                                    width: 150,
                                    child: RaisedButton(
                                        child: Text("Message".toUpperCase(),
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white)),
                                        shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(18.0),
                                        ),
                                        color: MyColors.orange,
                                        onPressed: () => null),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        elevation: 8,
                        margin: EdgeInsets.all(5),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Plumber",
                                    style: TextStyle(
                                        color: MyColors.orange,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        _bottomdilog();
                                      },
                                      child: Image.asset(
                                          "assets/icon/threedot.png")),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Delhi, laxmi nagar",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "2 Nov 2021",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "10:30 am",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Water supply not working...",
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Ravi Verma",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 150,
                                    child: RaisedButton(
                                        child: Text("Call".toUpperCase(),
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white)),
                                        shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(18.0),
                                        ),
                                        color: MyColors.blue,
                                        onPressed: () => null),
                                  ),
                                  Container(
                                    width: 150,
                                    child: RaisedButton(
                                        child: Text("Message".toUpperCase(),
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white)),
                                        shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(18.0),
                                        ),
                                        color: MyColors.orange,
                                        onPressed: () => null),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        elevation: 8,
                        margin: EdgeInsets.all(5),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Plumber",
                                    style: TextStyle(
                                        color: MyColors.orange,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        _bottomdilog();
                                      },
                                      child: Image.asset(
                                          "assets/icon/threedot.png")),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Delhi, laxmi nagar",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "2 Nov 2021",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "10:30 am",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Water supply not working...",
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Ravi Verma",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 150,
                                    child: RaisedButton(
                                        child: Text("Call".toUpperCase(),
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white)),
                                        shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(18.0),
                                        ),
                                        color: MyColors.blue,
                                        onPressed: () => null),
                                  ),
                                  Container(
                                    width: 150,
                                    child: RaisedButton(
                                        child: Text("Message".toUpperCase(),
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white)),
                                        shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(18.0),
                                        ),
                                        color: MyColors.orange,
                                        onPressed: () => null),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        elevation: 8,
                        margin: EdgeInsets.all(5),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ));
  }

  void _bottomdilog() {
    showModalBottomSheet<int>(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Popover(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              _buildListItem(
                context,
                title: Text('Follow Up'),
              ),
              _buildListItem(
                context,
                title: Text('Deal Completed'),
              ),
              _buildListItem(
                context,
                title: Text('Not Intersted'),
              ),
              _buildListItem(
                context,
                title: Text('Not Reachable'),
              ),
              _buildListItem(
                context,
                title: Text('Contacted'),
              ),
              _buildListItem(
                context,
                title: Text('Read'),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildListItem(
    BuildContext context, {
    Widget title,
  }) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 16.0,
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: theme.dividerColor,
                width: 0.5,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: DefaultTextStyle(
                child: title,
                style: TextStyle(
                    color: MyColors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600)),
          ),
        )
      ],
    );
  }

  dialogmssg(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 319,
            height: 230,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                shape: BoxShape.rectangle,
                color: Colors.white),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Stack(
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text('Message Via',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black87,
                                  decoration: TextDecoration.none)),
                        ),
                        Divider(color: Colors.black),
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Image.asset(
                              "assets/icon/whatsapp.png",
                              height: 35,
                              width: 35,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Whatsapp",
                              style: TextStyle(color: Colors.black87),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Image.asset(
                              "assets/icon/sms.png",
                              height: 35,
                              width: 35,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "SMS",
                              style: TextStyle(color: Colors.black87),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Image.asset(
                              "assets/icon/logobaba.png",
                              height: 35,
                              width: 35,
                            ),
                            SizedBox(width: 10),
                            Flexible(
                              child: Text(
                                "Profile Baba - All Communication at one place",
                                style: TextStyle(color: Colors.black87),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
                margin: EdgeInsets.only(top: 30),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Image.asset(
                  "assets/icon/window_close.png",
                  width: 35,
                  height: 35,
                )),
          )
        ],
      ),
    );
  }

  dialogCall(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 319,
            height: 180,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                shape: BoxShape.rectangle,
                color: Colors.white),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Stack(
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text('Contact Via',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black87,
                                  decoration: TextDecoration.none)),
                        ),
                        Divider(color: Colors.black),
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Image.asset(
                              "assets/icon/callv.png",
                              height: 35,
                              width: 35,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Internat Call",
                              style: TextStyle(color: Colors.black87),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Image.asset(
                              "assets/icon/dialv.png",
                              height: 35,
                              width: 35,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Dial Pad",
                              style: TextStyle(color: Colors.black87),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
                margin: EdgeInsets.only(top: 30),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: Image.asset(
                  "assets/icon/window_close.png",
                  width: 35,
                  height: 35,
                )),
          )
        ],
      ),
    );
  }
}
