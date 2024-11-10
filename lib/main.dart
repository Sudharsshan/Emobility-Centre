import 'package:emobility/components/hidden_drawer.dart';
import 'package:emobility/models/shared_preferences/shared_preference_model.dart';
import 'package:emobility/pages/appTheme/theme_class.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/login_page.dart';


void main() async {
  // Lock the orientation of the app to only portrait for all devices
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // pre-load all shared preferences data if the user is signing in for first time or has logged-out
  void preLoadSharedPreference() async{
    bool? sharedPreferenceData = await checkUserLogin();
    if (kDebugMode) {
      print('Shared preferences data initialized?= $sharedPreferenceData');
    }
    if(sharedPreferenceData == null){
      if(kDebugMode){
        print('User has not logged in, setting default status.');
      }
      // Default the status to true for all
      SharedPreferenceModel().setNewsAndUpdatesNotificationStatus(true);
      SharedPreferenceModel().setEmailNotificationStatus(true);
      SharedPreferenceModel().setPushNotificationStatus(true);
      SharedPreferenceModel().setUserLoginStatus(false);
      Future.delayed(const Duration(milliseconds: 200));

      // retrieve the status from cloud for user settings if implemented
      // and override the above initializations

      // restart the app
      main();
    }
  }

  final Color primaryColor = ThemeClass().primaryAccent;

  // check if user is logged in for first time
  Future<bool?> checkUserLogin() async {
    bool? userStatus = await SharedPreferenceModel().retrieveUserLoginStatus();
    return userStatus;
  }

  @override
  Widget build(BuildContext context) {
    // Check if user's first time initialization of app, if so initialize shared preferences
    preLoadSharedPreference();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder<bool?>(
        future: checkUserLogin(), // check if user has logged into the app
        builder: (BuildContext context, AsyncSnapshot<bool?> snapshot) {
          bool userStatus = true;
          try{
            if(snapshot.hasData){
              if(snapshot.data == userStatus){
                // User has signed in, return to home screen
                if(kDebugMode){
                  print("User has logged in");
                }
                return const HiddenDrawer();
              }
              else{
                // User has not signed in, return to login screen and
                // initialization of default values for shared preferences
                if(kDebugMode){
                  print("User has not logged in");
                }
                preLoadSharedPreference();
                return LoginPage();
              }
            }
            else {
              if (kDebugMode) {
                print('Snapshot has error');
              }
            }
          }
          catch(e){
            if (kDebugMode) {
              print(e);
            }
          }

          // show a loading icon till the data is fetched
          return Center(child: CircularProgressIndicator(color: primaryColor,));
        },
      ),
    );
  }
}