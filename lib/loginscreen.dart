import 'package:flutter/material.dart';

import 'homescreen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String error = ' message';
  TextEditingController namecontroller = TextEditingController();

  TextEditingController passwordcontorller = TextEditingController();

  void login() {
    print(namecontroller.text);
    print(passwordcontorller.text);

    print(namecontroller.text == 'asdfghjk123@gmail.com');
    if (namecontroller.text == 'asdfghjk123@gmail.com') {
      if (passwordcontorller.text == 'lkjh098') {
        print("welcome");
        error = 'welcome';
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => NextPage(name:  namecontroller.text,)),
            ));
      } else {
        print(error);
        error = 'Invaid password';
      }
    } else {
      error = "Invalid Email";
    }
    print(error);
    setState(() {});
  }

  // Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: ((context) => NextPage()),
  //     ));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Log In"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: namecontroller,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: passwordcontorller,
              decoration: InputDecoration(
                hintText: "password",
              ),
              obscureText: true,
              obscuringCharacter: "0",
              // decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: login,
              child: Text('Login'),
            ),
            Text(error)
          ],
        ),
      ),
    );
  }
}
   // onChanged: (value) {
              //   //onchanged - it is called when any changes occur in textfield
              //   setState(() {
              //     email = value;
              //   });
              // },



                   // onChanged: (value) {
              //   setState(() {
              //     password = value;
              //   });
              // },