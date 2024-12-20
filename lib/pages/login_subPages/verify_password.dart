import 'package:emobility/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:emobility/components/custom_button.dart';
import 'package:emobility/components/my_textfield.dart';

// ignore: camel_case_types
class verifyPassword extends StatelessWidget {
  verifyPassword({super.key});

  // text editing controllers
  final passwordController = TextEditingController();
  final conformPasswordController = TextEditingController();

  // send OTP method
  void sendOTP() {}

  // sign user in method
  void verifyOTP() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Reset password
              const Text(
                'Enter new Password',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 38,
                    fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 25),

              // Enter new password textfield
              MyTextField(
                controller: passwordController,
                hintText: 'password',
                obscureText: true,
              ),

              const SizedBox(height: 10),

              // Re-enter new textfield
              MyTextField(
                controller: conformPasswordController,
                hintText: 'confirm password',
                obscureText: true,
              ),

              const SizedBox(height: 10),

              CustomButton(
                  buttonData: "Create password",
                  onTap: () {
                    // Handle password update here

                    // Then navigate the user to login screen
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => LoginPage()));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
