import 'package:chat_app/utils/spaces.dart';
import 'package:chat_app/utils/textfield_styles.dart';
import 'package:chat_app/widgets/login_text_field.dart';
import 'package:flutter/material.dart';
import 'package:social_media_buttons/social_media_button.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:social_media_buttons/social_media_buttons.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _formkey = GlobalKey<FormState>();

  void loginUser(context) {
    if (_formkey.currentState != null && _formkey.currentState!.validate()) {
      print(userNameController.text);
      print(passwordController.text);

      Navigator.pushReplacementNamed(context, '/chat',
          arguments: '${userNameController.text}');
      print('login successful!');
    } else {
      print('not successful!');
    }
  }

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final _url = Uri.parse('https://www.linkedin.com/in/shubham-pandey-23b5201a5/');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Let\'s sign you in!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5),
                ),
                Text(
                  'Welcome back! \n You\'ve been missed!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.blueGrey),
                ),
                //TODO: Add correct asset file
                verticalSpacing(10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/illustration.png',
                    height: 200,
                  ),
                ),
                verticalSpacing(10),
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      LoginTextField(
                        hintText: "Enter your username",
                        validator: (value) {
                          if (value != null &&
                              value.isNotEmpty &&
                              value.length < 5) {
                            return "Your username should be more than 5 characters";
                          } else if (value != null && value.isEmpty) {
                            return "Please type your username";
                          }
                          return null;
                        },
                        controller: userNameController,
                      ),
                      verticalSpacing(24),
                      LoginTextField(
                        hasAsterisks: true,
                        controller: passwordController,
                        hintText: 'Enter your password',
                      ),
                    ],
                  ),
                ),
                verticalSpacing(24),
                ElevatedButton(
                    onPressed: () {
                      loginUser(context);
                    },
                    child: Text(
                      'Login',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
                    )),
                GestureDetector(
                  onTap: () async {
                    //todo: Navigate to browser
                    if (!await launchUrl(_url)) {
                      throw Exception('Could not launch $_url');
                      print('Link clicked!');
                    }
                  },
                  child: Column(
                    children: [
                      Text('Find us on'),
                      Text(
                          'link'),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialMediaButton.github(url: 'https://github.com/shubhampandey3008',size: 35),
                    SocialMediaButton.twitter(url: 'https://twitter.com/__Pandey_JI', size: 35)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
