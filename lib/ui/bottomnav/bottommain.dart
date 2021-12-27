import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:profilebabavendor/ui/bottomnav/Call.dart';
import 'package:profilebabavendor/ui/bottomnav/Chat.dart';
import 'package:profilebabavendor/ui/bottomnav/Home.dart';
import 'package:profilebabavendor/ui/bottomnav/Myaccount.dart';
import 'package:profilebabavendor/ui/bottomnav/Shop.dart';
import 'package:profilebabavendor/widget/drawer_link_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snapping_sheet/snapping_sheet.dart';

class BottomDas extends StatefulWidget {
  @override
  BottomDasState createState() => BottomDasState();
}

class BottomDasState extends State<BottomDas> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  ScrollController _scrollController;
  final PageStorageBucket bucket = PageStorageBucket();
  SnappingSheetController snappingSheetController;

  double _height;
  double _width;

  final Key keyOne = PageStorageKey('pageOne');
  final Key keyTwo = PageStorageKey('pageTwo');
  final Key keyFour = PageStorageKey('pageFour');
  final Key keyThree = PageStorageKey('pageThree');
  final Key keyFive = PageStorageKey('pagefive');

  int currentTab = 0;
  Home one;
  Call two;
  Chat four;
  Myaccount three;
  Shop five;
  List<Widget> pages;
  Widget currentPage;
  SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    //checkFirstSeen();
    one = Home(
      key: keyOne,
    );
    two = Call(
      key: keyTwo,
    );
    four = Chat(
      key: keyFour,
    );

    three = Myaccount(
      key: keyThree,
    );

    five = Shop(
      key: keyFive,
    );

    pages = [one, five, two, four, three];

    currentPage = one;
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        key: scaffoldKey,
        appBar: AppBar(
          centerTitle: false,
          elevation: 0,
          flexibleSpace: Container(
              decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: [
                  Colors.white,
                  Colors.white,
                ]),
          )),
          iconTheme: IconThemeData(color: Colors.deepOrangeAccent),
          // leading: IconButton(
          //   icon: new Icon(Icons.sort, color: Colors.black87),
          //   onPressed: () => {},
          // ),
          // like this!
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 35,
              ),
              SizedBox(
                width: 20,
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "Profile",
                      style: TextStyle(
                          fontFamily: 'SFUIDisplay',
                          color: Colors.blueAccent,
                          fontSize: 18,
                          fontWeight: FontWeight.w800)),
                  TextSpan(
                      text: " Baba",
                      style: TextStyle(
                          fontFamily: 'SFUIDisplay',
                          color: Colors.deepOrangeAccent,
                          fontSize: 18,
                          fontWeight: FontWeight.w800))
                ]),
              ),
            ],
          ),
          actions: [
            Padding(
                padding: const EdgeInsets.all(7),
                child: Icon(Icons.account_circle)),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
                  decoration: BoxDecoration(
                    color: Theme.of(context).hintColor.withOpacity(0.1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Welcome".tr,
                          style: Get.textTheme.headline5.merge(
                              TextStyle(color: Theme.of(context).accentColor))),
                      SizedBox(height: 5),
                      Text("Login account or create new one for free".tr,
                          style: Get.textTheme.bodyText1),
                      SizedBox(height: 15),
                      Wrap(
                        spacing: 10,
                        children: <Widget>[
                          MaterialButton(
                            onPressed: () {
                              // Get.toNamed(Routes.LOGIN);
                            },
                            color: Get.theme.accentColor,
                            height: 40,
                            elevation: 0,
                            child: Wrap(
                              runAlignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: 9,
                              children: [
                                Icon(Icons.exit_to_app_outlined,
                                    color: Get.theme.primaryColor, size: 24),
                                Text(
                                  "Login".tr,
                                  style: Get.textTheme.subtitle1
                                      .merge(TextStyle(color: Colors.white)),
                                ),
                              ],
                            ),
                            shape: StadiumBorder(),
                          ),
                          MaterialButton(
                            color: Get.theme.focusColor.withOpacity(0.2),
                            height: 40,
                            elevation: 0,
                            onPressed: () {
                              // Get.toNamed(Routes.REGISTER);
                            },
                            child: Wrap(
                              runAlignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: 9,
                              children: [
                                Icon(Icons.person_add_outlined,
                                    color: Get.theme.hintColor, size: 24),
                                Text(
                                  "Register".tr,
                                  style: Get.textTheme.subtitle1.merge(
                                      TextStyle(color: Get.theme.hintColor)),
                                ),
                              ],
                            ),
                            shape: StadiumBorder(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              DrawerLinkWidget(
                icon: Icons.assignment_outlined,
                text: "Bookings",
                onTap: (e) {},
              ),
              DrawerLinkWidget(
                icon: Icons.folder_special_outlined,
                text: "My Services",
                onTap: (e) {},
              ),
              DrawerLinkWidget(
                icon: Icons.notifications_none_outlined,
                text: "Notifications",
                onTap: (e) {},
              ),
              DrawerLinkWidget(
                icon: Icons.chat_outlined,
                text: "Messages",
                onTap: (e) {},
              ),
              ListTile(
                dense: true,
                title: Text(
                  "Application preferences".tr,
                  style: Get.textTheme.caption,
                ),
                trailing: Icon(
                  Icons.remove,
                  color: Get.theme.focusColor.withOpacity(0.3),
                ),
              ),
              DrawerLinkWidget(
                icon: Icons.person_outline,
                text: "Account",
                onTap: (e) {},
              ),
              DrawerLinkWidget(
                icon: Icons.settings_outlined,
                text: "Settings",
                onTap: (e) {},
              ),
              DrawerLinkWidget(
                icon: Icons.translate_outlined,
                text: "Languages",
                onTap: (e) {},
              ),
              DrawerLinkWidget(
                icon: Icons.brightness_6_outlined,
                text: Get.isDarkMode ? "Light Theme" : "Dark Theme",
                onTap: (e) {},
              ),
              ListTile(
                dense: true,
                title: Text(
                  "Help & Privacy",
                  style: Get.textTheme.caption,
                ),
                trailing: Icon(
                  Icons.remove,
                  color: Get.theme.focusColor.withOpacity(0.3),
                ),
              ),
              DrawerLinkWidget(
                icon: Icons.help_outline,
                text: "Help & FAQ",
                onTap: (e) {},
              ),
              DrawerLinkWidget(
                icon: Icons.privacy_tip_outlined,
                text: "Privacy Policy",
                onTap: (e) async {},
              ),
              DrawerLinkWidget(
                icon: Icons.article_outlined,
                text: "Terms & Condition",
                onTap: (e) async {},
              ),
              DrawerLinkWidget(
                icon: Icons.logout,
                text: "Logout",
                onTap: (e) async {},
              ),
              ListTile(
                dense: true,
                title: Text(
                  "Version".tr,
                  style: Get.textTheme.caption,
                ),
                trailing: Icon(
                  Icons.remove,
                  color: Get.theme.focusColor.withOpacity(0.3),
                ),
              )
            ],
          ),
        ),
        body: PageStorage(
          child: currentPage,
          bucket: bucket,
        ),
        bottomNavigationBar: BottomNavigationBar(
          // selectedItemColor: FitnessAppTheme.finablue,
          // unselectedItemColor: Colors.black54,
          currentIndex: currentTab,
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            setState(() {
              currentTab = index;
              currentPage = pages[index];
            });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset("assets/icon/chat.png"),
              activeIcon: Image.asset("assets/icon/chat.png"),
              title: Text(
                'Chat',
                style: TextStyle(fontSize: 10),
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/icon/lead.png"),
              activeIcon: Image.asset("assets/icon/lead.png"),
              title: Text(
                "Lead",
                style: TextStyle(fontSize: 10),
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/icon/offer.png"),
              activeIcon: Image.asset("assets/icon/offer.png"),
              title: Text(
                "Offer",
                style: TextStyle(fontSize: 10),
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/icon/accountant.png"),
              activeIcon: Image.asset("assets/icon/accountant.png"),
              title: Text(
                "Account",
                style: TextStyle(fontSize: 10),
              ),
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/icon/search.png"),
              activeIcon: Image.asset("assets/icon/search.png"),
              title: Text(
                'Search',
                style: TextStyle(fontSize: 10),
              ),
            ),
          ],
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
