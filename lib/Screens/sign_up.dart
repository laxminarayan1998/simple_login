import 'package:flutter/material.dart';
import 'package:it_futurz/Utils/DatebaseHelper.dart';
import 'package:it_futurz/Model/User.dart';
import 'package:it_futurz/Screens/auth_screen.dart';

import '../Widgets/default_btn.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final formKey = new GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController passControler = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController professionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          height: MediaQuery.of(context).size.height -
              (MediaQuery.of(context).padding.top +
                  AppBar().preferredSize.height),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  'assets/Logo-1.png',
                  width: MediaQuery.of(context).size.width * .4,
                ),
                TextFormField(
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'please enter';
                    }
                  },
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                  ),
                ),
                TextFormField(
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'please enter';
                    }
                  },
                  controller: passControler,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
                TextFormField(
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'please enter';
                    }
                  },
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
                TextFormField(
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'please enter';
                    }
                  },
                  controller: phoneController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone No',
                  ),
                ),
                TextFormField(
                  validator: (v) {
                    if (v!.isEmpty) {
                      return 'please enter';
                    }
                  },
                  controller: professionController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Profession',
                  ),
                ),
                DefaultButton('CONTINUE', onPress: () async {
                  if (formKey.currentState!.validate()) {
                    var user = User(
                      email: emailController.text,
                      name: nameController.text,
                      password: passControler.text,
                      phoneNo: phoneController.text,
                      profession: professionController.text,
                    );
                    DatabaseHelper.instance.saveUser(user);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: new Text('User saved'),
                        backgroundColor: Colors.green,
                      ),
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AuthScreen(),
                      ),
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
