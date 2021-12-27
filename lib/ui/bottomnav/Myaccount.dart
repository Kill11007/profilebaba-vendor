import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:profilebabavendor/model/ChatMessage.dart';
import 'package:profilebabavendor/widget/ChatBubble.dart';
import 'package:profilebabavendor/widget/DefaultGrabbing.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snapping_sheet/snapping_sheet.dart';

class Myaccount extends StatefulWidget {
  Myaccount({Key key}) : super(key: key);
  @override
  _MyaccountState createState() => _MyaccountState();
}

enum MessageType {
  Sender,
  Receiver,
}

class _MyaccountState extends State<Myaccount> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  ScrollController _scrollController;
  final PageStorageBucket bucket = PageStorageBucket();
  SnappingSheetController snappingSheetController;

  double _height;
  double _width;
  bool isExpanded = false;

  List<ChatMessage> chatMessage = [
    ChatMessage(message: "Hi John", type: MessageType.Receiver),
    ChatMessage(message: "Hope you are doin good", type: MessageType.Receiver),
    ChatMessage(
        message: "Hello Jane, I'm good what about you",
        type: MessageType.Sender),
    ChatMessage(
        message: "I'm fine, Working from home", type: MessageType.Receiver),
    ChatMessage(message: "Oh! Nice. Same here man", type: MessageType.Sender),
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    snappingSheetController = SnappingSheetController();
    // snappingSheetController.setSnappingSheetPosition(500);
  }

  void _expand() {
    setState(() {
      isExpanded ? isExpanded = false : isExpanded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        key: scaffoldKey,
        body: SnappingSheet(
          controller: snappingSheetController,
          lockOverflowDrag: true,
          // initialSnappingPosition: snappingSheetController.currentPosition,
          snappingPositions: [
            SnappingPosition.factor(
              positionFactor: 0.0,
              grabbingContentOffset: GrabbingContentOffset.top,
            ),
            SnappingPosition.factor(
              snappingCurve: Curves.elasticOut,
              snappingDuration: Duration(milliseconds: 1750),
              positionFactor: 0.5,
            ),
            SnappingPosition.factor(positionFactor: 0.9),
          ],
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 4,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            // snappingSheetController
                            //     .setSnappingSheetPosition(100);
                            snappingSheetController.snapToPosition(
                              SnappingPosition.factor(positionFactor: 0.90),
                            );
                          },
                          child: Card(
                            elevation: 8,
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Colors.blueAccent, width: 1)),
                            child: Container(
                              height: 60,
                              width: 60,
                              child: Image.asset(
                                'assets/images/plumber.png',
                                height: _height / 10,
                                width: _width / 10,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Flexible(
                          child: Text(
                            "Plumber",
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            _scrollController.position.maxScrollExtent;
                            // _scrollController.snapToPosition(
                            //   SnappingPosition.factor(positionFactor: 0.75),
                            // );
                          },
                          child: Card(
                            elevation: 8,
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Colors.blueAccent, width: 1)),
                            child: Container(
                              height: 60,
                              width: 60,
                              child: Image.asset(
                                'assets/images/doctor.png',
                                height: _height / 10,
                                width: _width / 10,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Flexible(
                          child: Text(
                            "Doctor",
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {},
                          child: Card(
                            elevation: 8,
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Colors.blueAccent, width: 1)),
                            child: Container(
                              height: 60,
                              width: 60,
                              child: Image.asset(
                                'assets/images/teacher.png',
                                height: _height / 10,
                                width: _width / 10,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Flexible(
                          child: Text(
                            "Teacher",
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {},
                          child: Card(
                            elevation: 8,
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Colors.blueAccent, width: 1)),
                            child: Container(
                              height: 60,
                              width: 60,
                              child: Image.asset(
                                'assets/images/maid.png',
                                height: _height / 10,
                                width: _width / 10,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Flexible(
                          child: Text(
                            "Maid",
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {},
                          child: Card(
                            elevation: 8,
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Colors.blueAccent, width: 1)),
                            child: Container(
                              height: 60,
                              width: 60,
                              child: Image.asset(
                                'assets/images/realestate.png',
                                height: _height / 10,
                                width: _width / 10,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Flexible(
                          child: Text(
                            "Real State",
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {},
                          child: Card(
                            elevation: 8,
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Colors.blueAccent, width: 1)),
                            child: Container(
                              height: 60,
                              width: 60,
                              child: Image.asset(
                                'assets/images/carpenter.png',
                                height: _height / 10,
                                width: _width / 10,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Flexible(
                          child: Text(
                            "Carpenter",
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {},
                          child: Card(
                            elevation: 8,
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Colors.blueAccent, width: 1)),
                            child: Container(
                              height: 60,
                              width: 60,
                              child: Image.asset(
                                'assets/images/whitewash.png',
                                height: _height / 10,
                                width: _width / 10,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Flexible(
                          child: Text(
                            "White Wash",
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {},
                          child: Card(
                            elevation: 8,
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Colors.blueAccent, width: 1)),
                            child: Container(
                              height: 60,
                              width: 60,
                              child: Image.asset(
                                'assets/images/packermover.png',
                                height: _height / 10,
                                width: _width / 10,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Flexible(
                          child: Text(
                            "Packer & mover",
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {},
                          child: Card(
                            elevation: 8,
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Colors.blueAccent, width: 1)),
                            child: Container(
                              height: 60,
                              width: 60,
                              child: Image.asset(
                                'assets/images/beauty.png',
                                height: _height / 10,
                                width: _width / 10,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Flexible(
                          child: Text(
                            "Beautication",
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {},
                          child: Card(
                            elevation: 8,
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Colors.blueAccent, width: 1)),
                            child: Container(
                              height: 60,
                              width: 60,
                              child: Image.asset(
                                'assets/images/electrician.png',
                                height: _height / 10,
                                width: _width / 10,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Flexible(
                          child: Text(
                            "Electrician",
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {},
                          child: Card(
                            elevation: 8,
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Colors.blueAccent, width: 1)),
                            child: Container(
                              height: 60,
                              width: 60,
                              child: Image.asset(
                                'assets/images/internet.png',
                                height: _height / 10,
                                width: _width / 10,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Flexible(
                          child: Text(
                            "Internet Provider",
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {},
                          child: Card(
                            elevation: 8,
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Colors.blueAccent, width: 1)),
                            child: Container(
                              height: 60,
                              width: 60,
                              child: Image.asset(
                                'assets/images/other.png',
                                height: _height / 10,
                                width: _width / 10,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Flexible(
                          child: Text(
                            "Other",
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Colors.deepOrangeAccent,
                            Colors.orangeAccent,
                          ],
                          begin:
                              Alignment.topLeft, //begin of the gradient color
                          end:
                              Alignment.bottomRight, //end of the gradient color
                          stops: [0, 0.5] //stops for individual color
                          //set the stops number equal to numbers of color
                          ),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Text(
                          "Grow your Business",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 40,
                                child: RaisedButton(
                                  onPressed: () {},
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  color: Colors.white,
                                  child: Center(
                                    child: Text(
                                      "Sign up for Free",
                                      style:
                                          TextStyle(color: Colors.blueAccent),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 40,
                                child: RaisedButton(
                                  onPressed: () {},
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  color: Colors.white,
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(Icons.call,
                                            color: Colors.blueAccent),
                                        SizedBox(width: 10),
                                        Text(
                                          "Call Us",
                                          style: TextStyle(
                                              color: Colors.blueAccent),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          grabbingHeight: 75,
          grabbing: DefaultGrabbing(),
          sheetBelow: SnappingSheetContent(
            childScrollController: _scrollController,
            draggable: true,
            child: Container(
              color: Colors.white,
              child: Stack(
                children: <Widget>[
                  ListView.builder(
                    itemCount: chatMessage.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ChatBubble(
                        chatMessage: chatMessage[index],
                      );
                    },
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      padding: EdgeInsets.only(left: 16, bottom: 10, right: 70),
                      height: 60,
                      width: double.infinity,
                      color: Colors.white,
                      child: TextFormField(
                        decoration: new InputDecoration(
                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(20.0),
                              ),
                            ),
                            filled: true,
                            hintStyle: new TextStyle(color: Colors.grey[800]),
                            hintText: "Type your message",
                            fillColor: Colors.white70),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ClipRRect(
                      child: Container(
                        padding: EdgeInsets.only(bottom: 10, right: 10),
                        height: 60,
                        width: 60,
                        child: FloatingActionButton(
                          onPressed: () {},
                          child: Icon(
                            Icons.call,
                            color: Colors.white,
                          ),
                          backgroundColor: Colors.blueAccent,
                          elevation: 0,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
