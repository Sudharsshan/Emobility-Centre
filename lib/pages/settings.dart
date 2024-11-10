import 'package:emobility/pages/appTheme/theme_class.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:emobility/models/shared_preferences/shared_preference_model.dart';

import 'login_page.dart';
import 'login_subPages/forget_password.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  SettingsState createState() => SettingsState();
}

class SettingsState extends State<Settings> {
  bool? pushNotifications, emailNotifications, newsAndUpdates;

  @override
  void initState() {
    super.initState();
  }

  // retrieve push notification status
  Future<bool?> checkPushNotificationStatus() async {
    bool? pushNotificationStatus =
        await SharedPreferenceModel().retrievePushNotificationStatus();
    return pushNotificationStatus ?? true;
  }

  // retrieve email notification status
  Future<bool?> checkEmailNotificationStatus() async {
    bool? emailNotificationStatus =
        await SharedPreferenceModel().retrieveEmailNotificationStatus();
    return emailNotificationStatus ?? true;
  }

  // retrieve newsAndUpdates notification status
  Future<bool?> checkNewsAndUpdatesStatus() async {
    bool? newsAndUpdatesNotificationStatus = await SharedPreferenceModel()
        .retrieveNewsAndUpdatesNotificationStatus();
    return newsAndUpdatesNotificationStatus ?? true;
  }

  // Handle sign out here
  void signOut() {
    // Set userLogin sharedPref to false (user logged out)
    SharedPreferenceModel().setUserLoginStatus(false);

    // Take user to login page
    Navigator.of(context).popUntil((route) => route.isFirst);
    Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
  }

  // Handle reset password here
  void resetPassword() {
    // Handle credentials update session flag

    // Set userLogin sharedPref to false (user logged out)
    SharedPreferenceModel().setUserLoginStatus(false);

    // Take user to login page
    Navigator.of(context).popUntil((route) => route.isFirst);
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => forget_password()));
  }

  // Handle unlink google account here
  void unlinkGoogleAccount() {}

  // Handle user data modification here
  void modifyUserInfo() {}

  // Handle user bug reports here
  void userBugReports() {}

  // Handle user suggestions here
  void userSuggestions() {
    if (kDebugMode) {
      print('Navigating user to website');
    }
  }

  @override
  Widget build(BuildContext context) {
    Color primaryColor = ThemeClass().primaryAccent;
    Color secondaryColor = ThemeClass().secondaryAccent;

    final TextStyle headingTextStyle = TextStyle(
        color: primaryColor, fontSize: 24, fontWeight: FontWeight.bold);

    final TextStyle optionTextStyle = TextStyle(
        fontSize: 18, color: secondaryColor, fontWeight: FontWeight.bold);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        children: [
          // Account Management
          Text("Account Management", style: headingTextStyle),
          const SizedBox(
            height: 10,
          ),

          // Divider
          Divider(
            color: primaryColor,
            thickness: 1.75,
          ),
          const SizedBox(
            height: 10,
          ),

          // Accounts option
          // Sign out button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  child: Text(
                "Sign out",
                style: optionTextStyle,
              )),
              IconButton(
                  onPressed: signOut, icon: const Icon(Icons.logout_sharp))
            ],
          ),

          // Reset password
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  child: Text(
                "Reset password",
                style: optionTextStyle,
              )),
              IconButton(
                  onPressed: resetPassword, icon: const Icon(Icons.lock_reset))
            ],
          ),

          // Unlink google account
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "Unlink Google account",
                  style: optionTextStyle,
                ),
              ),
              IconButton(
                  onPressed: unlinkGoogleAccount,
                  icon: const Icon(Icons.close_outlined))
            ],
          ),

          // Notifications
          const SizedBox(
            height: 10,
          ),
          Text(
            'Notifications',
            style: headingTextStyle,
          ),
          const SizedBox(
            height: 10,
          ),

          // Divider
          Divider(
            color: primaryColor,
            thickness: 1.75,
          ),
          const SizedBox(
            height: 10,
          ),

          // Push notifications
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // send push notification status
              Flexible(
                child: Text(
                  "Send Push notifications",
                  style: optionTextStyle,
                ),
              ),

              // switch button
              FutureBuilder<bool?>(
                  future: checkPushNotificationStatus(),
                  builder:
                      (BuildContext context, AsyncSnapshot<bool?> snapshot) {
                    try {
                      if (snapshot.hasData) {
                        return Switch(
                            activeColor: primaryColor,
                            inactiveThumbColor: Colors.grey,
                            value: snapshot.data!,
                            onChanged: (bool newValue) {
                              setState(() {
                                // Handle sending push notification settings here
                                SharedPreferenceModel()
                                    .setPushNotificationStatus(newValue);
                                pushNotifications = newValue;
                              });
                            });
                      } else {
                        if (kDebugMode) {
                          print('Snapshot has error');
                        }
                      }
                    } catch (e) {
                      if (kDebugMode) {
                        print(e);
                      }
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        color: primaryColor,
                      ),
                    );
                  })
            ],
          ),

          // Email notifications
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // send email notification
              Flexible(
                child: Text(
                  "Send Email notifications",
                  style: optionTextStyle,
                ),
              ),

              // switch button
              FutureBuilder<bool?>(
                  future: checkEmailNotificationStatus(),
                  builder:
                      (BuildContext context, AsyncSnapshot<bool?> snapshot) {
                    try {
                      if (snapshot.hasData) {
                        return Switch(
                            activeColor: primaryColor,
                            inactiveThumbColor: Colors.grey,
                            value: snapshot.data!,
                            onChanged: (bool newValue) {
                              setState(() {
                                // Handle sending push notification settings here
                                SharedPreferenceModel()
                                    .setEmailNotificationStatus(newValue);
                                emailNotifications = newValue;
                              });
                            });
                      } else {
                        if (kDebugMode) {
                          print('Snapshot has error');
                        }
                      }
                    } catch (e) {
                      if (kDebugMode) {
                        print(e);
                      }
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        color: primaryColor,
                      ),
                    );
                  })
            ],
          ),

          // news and updates notifications
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // send newsAndUpdates notification
              Flexible(
                child: Text(
                  "Send News & Updates notifications",
                  style: optionTextStyle,
                ),
              ),

              // switch button
              FutureBuilder<bool?>(
                  future: checkNewsAndUpdatesStatus(),
                  builder:
                      (BuildContext context, AsyncSnapshot<bool?> snapshot) {
                    try {
                      if (snapshot.hasData) {
                        return Switch(
                            activeColor: primaryColor,
                            inactiveThumbColor: Colors.grey,
                            value: snapshot.data!,
                            onChanged: (bool newValue) {
                              setState(() {
                                // Handle sending push notification settings here
                                SharedPreferenceModel()
                                    .setNewsAndUpdatesNotificationStatus(
                                        newValue);
                                newsAndUpdates = newValue;
                              });
                            });
                      } else {
                        if (kDebugMode) {
                          print('Snapshot has error');
                        }
                      }
                    } catch (e) {
                      if (kDebugMode) {
                        print(e);
                      }
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        color: primaryColor,
                      ),
                    );
                  })
            ],
          ),

          // User info
          const SizedBox(
            height: 10,
          ),
          Text(
            'User Info',
            style: headingTextStyle,
          ),
          const SizedBox(
            height: 10,
          ),

          // Divider
          Divider(
            color: primaryColor,
            thickness: 1.75,
          ),
          const SizedBox(
            height: 10,
          ),

          // Manage user info account
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "Modify user info",
                  style: optionTextStyle,
                ),
              ),
              IconButton(
                  onPressed: modifyUserInfo,
                  icon: const Icon(Icons.account_box_outlined))
            ],
          ),

          // Contact us
          const SizedBox(
            height: 10,
          ),
          Text(
            'Contact us',
            style: headingTextStyle,
          ),
          const SizedBox(
            height: 10,
          ),

          // Divider
          Divider(
            color: primaryColor,
            thickness: 1.75,
          ),
          const SizedBox(
            height: 10,
          ),

          // caught a bug?
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "Caught a bug? Let us know! -->>",
                  style: optionTextStyle,
                ),
              ),
              IconButton(
                  onPressed: userBugReports,
                  icon: const Icon(Icons.bug_report_outlined))
            ],
          ),

          //user suggestions
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "Have suggestions? Contact us here -->>",
                  style: optionTextStyle,
                ),
              ),
              IconButton(
                  onPressed: userSuggestions,
                  icon: const Icon(Icons.code_outlined))
            ],
          ),
        ],
      ),
    );
  }
}
