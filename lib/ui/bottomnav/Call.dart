import 'package:flutter/material.dart';
import 'package:profilebabavendor/widget/mycolor.dart';

class Call extends StatefulWidget {
  Call({Key key}) : super(key: key);
  @override
  _CallState createState() => _CallState();
}

class _CallState extends State<Call> {
  String _chosenValue, _chosenValue1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 120,
                height: 40,
                margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    )),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _chosenValue,
                    isExpanded: true,
                    //elevation: 5,
                    style: TextStyle(color: Colors.black),
                    items: <String>[
                      'Area',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    hint: Center(
                      child: Text(
                        "Area",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    onChanged: (String value) {
                      setState(() {
                        _chosenValue = value;
                      });
                    },
                  ),
                ),
              ),
              Container(
                  width: 120,
                  height: 40,
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      )),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _chosenValue1,
                      isExpanded: true,
                      //elevation: 5,
                      style: TextStyle(color: Colors.black),
                      items: <String>[
                        'Rank',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      hint: Center(
                        child: Text(
                          "Rank",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      onChanged: (String value) {
                        setState(() {
                          _chosenValue1 = value;
                        });
                      },
                    ),
                  )),
              Image.asset(
                "assets/icon/filteric.png",
                height: 50,
                width: 50,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
            child: Text(
              "Choose Your Plan",
              style: TextStyle(
                  color: MyColors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w800),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "1 Lead @ 10 Rs",
                          style: TextStyle(
                              color: MyColors.orange,
                              fontSize: 16,
                              fontWeight: FontWeight.w800),
                        ),
                        Text(
                          "Select Quad",
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Min 10",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        Icon(Icons.arrow_drop_down)
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              elevation: 8,
              margin: EdgeInsets.all(15),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "1 Lead @ 10 Rs",
                          style: TextStyle(
                              color: MyColors.orange,
                              fontSize: 16,
                              fontWeight: FontWeight.w800),
                        ),
                        Text(
                          "Select Quad",
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Min 10",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        Icon(Icons.arrow_drop_down)
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              elevation: 8,
              margin: EdgeInsets.all(15),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.all(10),
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Please call us for more plan",
                        style: TextStyle(
                            color: MyColors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 150,
                          child: RaisedButton(
                              child: Text("Call".toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white)),
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(18.0),
                              ),
                              color: MyColors.blue,
                              onPressed: () => null),
                        ),
                        Container(
                          width: 150,
                          child: RaisedButton(
                              child: Text("Message".toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white)),
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(18.0),
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
    );
  }
}
