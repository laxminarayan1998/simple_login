import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:it_futurz/Utils/DatebaseHelper.dart';
import 'package:it_futurz/Widgets/default_btn.dart';
import 'package:it_futurz/Screens/home_screen.dart';
import 'package:it_futurz/Screens/sign_up.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({Key? key}) : super(key: key);

  final formKey = new GlobalKey<FormState>();

  final FirebaseMessaging messaging = FirebaseMessaging.instance;

  final TextEditingController passControler = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    messaging.getToken().then((value) {
      print(value);
    });
    return Scaffold(
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Spacer(),
              Image.asset(
                'assets/Logo-1.png',
                width: MediaQuery.of(context).size.width * .7,
              ),
              Spacer(),
              TextFormField(
                controller: emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'email cannt be empty!';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: passControler,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'password cannt be empty!';
                  }
                  return null;
                },
                // obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              Spacer(),
              DefaultButton(
                'LOG IN',
                onPress: () async {
                  if (formKey.currentState!.validate()) {
                    final users = await DatabaseHelper.instance.retrieveUsers();
                    // ignore: unused_local_variable
                    var message;
                    users.forEach(
                      (e) => {
                        if (e.email == emailController.text)
                          {
                            if (e.password == passControler.text)
                              {
                                message = 'Welcome!!',
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen(),
                                  ),
                                )
                              }
                            else
                              {
                                message = 'Wrong password',
                              }
                          }
                        else
                          {
                            message = 'Wrong email',
                          }
                      },
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: new Text(message),
                        backgroundColor: message == 'Wrong password' ||
                                message == 'Wrong email'
                            ? Colors.red
                            : Colors.green,
                      ),
                    );
                  }
                },
              ),
              SizedBox(height: 26),
              DefaultButton(
                'SIGN UP',
                onPress: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SignUpScreen(),
                    ),
                  );
                },
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
