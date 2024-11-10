import 'package:emobility/major_screen.dart';
import 'package:emobility/pages/about.dart';
import 'package:emobility/pages/appTheme/theme_class.dart';
import 'package:emobility/pages/industry_collab.dart';
import 'package:emobility/pages/our_achievements.dart';
import 'package:emobility/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:emobility/pages/contact_us.dart';
import '../models/shared_preferences/shared_preference_model.dart';
import '../pages/login_page.dart';

class HiddenDrawer extends StatefulWidget{
  const HiddenDrawer({super.key});

  @override
  HiddenDrawerState createState() => HiddenDrawerState();
}

class HiddenDrawerState extends State<HiddenDrawer>{
  List<ScreenHiddenDrawer> pageList = [];

  final Color primaryColor = ThemeClass().primaryAccent;
  final Color secondaryColor = ThemeClass().secondaryAccent;

  // base style of drawer items
  final baseStyle = TextStyle(
    color: ThemeClass().secondaryAccent,
    fontWeight: FontWeight.normal
  );

  // style of selected item in drawer menu
  final selectedStyle = TextStyle(
      color: ThemeClass().primaryAccent,
      fontWeight: FontWeight.bold,
      fontSize: 22
  );

  @override
  void initState(){
    super.initState();

    // Initialize the screens which will be shown in the custom drawer
    pageList = [
      // Home screen
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: 'Centre of Excellence E-mobility',
            baseStyle: baseStyle,
            selectedStyle: selectedStyle
          ),
          const MajorScreen()
      ),

      // About screen
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: 'About',
              baseStyle: baseStyle,
              selectedStyle: selectedStyle
          ),
          const About()
      ),

      // our achievements
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: 'our Achievements',
              baseStyle: baseStyle,
              selectedStyle: selectedStyle
          ),
          const OurAchievements()
      ),

      // Industry Collab screen
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: 'Industry Collaborations',
              baseStyle: baseStyle,
              selectedStyle: selectedStyle
          ),
          const IndustryCollab()
      ),

      // Contact us
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: 'Contact Us',
              baseStyle: baseStyle,
              selectedStyle: selectedStyle
          ),
          const ContactUs()
      ),

      // Settings screen
      ScreenHiddenDrawer(
        ItemHiddenMenu(
            name: 'Settings',
            baseStyle: baseStyle,
            selectedStyle: selectedStyle
        ),
        const Settings(),
      ),

    ];
  }

  @override
  Widget build(BuildContext context){

    TextStyle titleStyle = TextStyle(
        color: primaryColor,
        fontSize: 17,
        fontFamily: 'IBMPlexSansBold'
    );

    return HiddenDrawerMenu(
      styleAutoTittleName: titleStyle,
      backgroundColorAppBar: Colors.white,
      elevationAppBar: 0,
      isTitleCentered: true,
      actionsAppBar: [
        IconButton(
            onPressed: (){
              // Handle user logout here

              // Set userLogin sharedPref to false (user logged out)
              SharedPreferenceModel().setUserLoginStatus(false);

              // Take user to login page
              Navigator.of(context).popUntil((route)=> route.isFirst);
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => LoginPage()));

            },
            icon: const Icon(
              Icons.logout_sharp,
            ))
      ],
      screens: pageList,
      backgroundColorMenu: Colors.white,
      initPositionSelected: 0,
      slidePercent: 65,
    );
  }

}