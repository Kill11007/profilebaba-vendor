import 'package:flutter/material.dart';
import 'package:profilebabavendor/model/step_model.dart';
import 'package:profilebabavendor/ui/bottomnav/bottommain.dart';
import 'package:profilebabavendor/widget/mycolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  List<StepModel> list = StepModel.list;
  var _controller = PageController();
  var initialPage = 0;

  @override
  Widget build(BuildContext context) {
    _controller.addListener(() {
      setState(() {
        initialPage = _controller.page.round();
      });
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          _appBar(),
          _body(_controller),
          _indicator(),
        ],
      ),
    );
  }

  _appBar() {
    return Container(
      margin: EdgeInsets.only(top: 25),
      padding: EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              if (initialPage > 0)
                _controller.animateToPage(initialPage - 1,
                    duration: Duration(microseconds: 500),
                    curve: Curves.easeIn);
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
            ),
          ),
          FlatButton(
            onPressed: () {
              if (initialPage < list.length)
                _controller.animateToPage(list.length,
                    duration: Duration(microseconds: 500),
                    curve: Curves.easeInOut);
            },
            child: Text(
              "Skip",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future checkFirstSeen() async {
    SharedPreferences prefsr = await SharedPreferences.getInstance();
    String aa;
    setState(() {
      aa = prefsr.getString('mid');
    });
    //
    // ss = prefss.getString('mid');

    // if (aa == null) {
    //   Navigator.of(context).pushReplacement(
    //       new MaterialPageRoute(builder: (context) => new Loginscreen()));
    // } else {
    Navigator.of(context).pushReplacement(
        new MaterialPageRoute(builder: (context) => new BottomDas()));
    // }
  }

  _body(PageController controller) {
    return Expanded(
      child: PageView.builder(
        controller: controller,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              index == 1
                  ? _displayText(list[index].text)
                  : _displayImage(list[index].id),
              SizedBox(
                height: 25,
              ),
              index == 1
                  ? _displayImage(list[index].id)
                  : _displayText(list[index].text),
            ],
          );
        },
      ),
    );
  }

  _indicator() {
    return Container(
      width: 90,
      height: 90,
      margin: EdgeInsets.symmetric(vertical: 12),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 90,
              height: 90,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(
                  MyColors.primaryColor,
                ),
                value: (initialPage + 1) / (list.length + 1),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                print(list.length);
                print(initialPage);
                if (initialPage < list.length && initialPage < 2) {
                  _controller.animateToPage(initialPage + 1,
                      duration: Duration(microseconds: 500),
                      curve: Curves.easeIn);
                } else if (initialPage == 2) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => BottomDas()));
                }
              },
              child: Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  color: MyColors.primaryColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(100),
                  ),
                ),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _displayText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      textAlign: TextAlign.center,
    );
  }

  _displayImage(int path) {
    return Image.asset(
      "assets/$path.jpeg",
      height: MediaQuery.of(context).size.height * .5,
    );
  }
}
