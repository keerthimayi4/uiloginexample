import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:uiloginexample/signedpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  saveUser() async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();

// Save an integer value to 'counter' key.
    await prefs.setInt('counter', 10);
// Save an boolean value to 'repeat' key.
    await prefs.setBool('repeat', true);
// Save an double value to 'decimal' key.
    await prefs.setDouble('decimal', 1.5);
// Save an String value to 'action' key.
    await prefs.setString('action', 'Start');
// Save an list of strings to 'items' key.
    await prefs.setStringList('items', <String>['Earth', 'Moon', 'Sun']);

    // Try reading data from the 'counter' key. If it doesn't exist, returns null.
    final int? counter = prefs.getInt('counter');
// Try reading data from the 'repeat' key. If it doesn't exist, returns null.
    final bool? repeat = prefs.getBool('repeat');
// Try reading data from the 'decimal' key. If it doesn't exist, returns null.
    final double? decimal = prefs.getDouble('decimal');
// Try reading data from the 'action' key. If it doesn't exist, returns null.
    final String? action = prefs.getString('action');
// Try reading data from the 'items' key. If it doesn't exist, returns null.
    final List<String>? items = prefs.getStringList('items');

    print("""
counter $counter
repeat $repeat
decimal $decimal
action $action
item $items


""");
  }

  // Initial Selected Value
  String dropdownvalue = 'Select item';
  // String name = '';
  // String phonenumber = '';
  String gender = '';
  // String dateofbirth = '';

  String password = '';
  String newpassword = '';
  String error1 = 'message';
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonenumbercontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
  TextEditingController dateofbirthcontroller = TextEditingController();
  TextEditingController passwordcontroller =
      TextEditingController(); //Controller for the password field
  TextEditingController newpasswordcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();

  List userList = [];

  createUser(
      namecontroller,
      phonenumbercontroller,
      agecontroller,
      dateofbirthcontroller,
      passwordcontroller,
      newpasswoedcontroller,
      emailcontroller) {
    Map user = {};

    user['name'] = namecontroller;
    user['phone'] = phonenumbercontroller;

    print(user);
    userList.add(user);
    print(userList);
  }

  dobformat(String dob) {
    if (dob.length <= 1) {
      dateofbirthcontroller.text = "hello";
    } else if (dob.length < 2 && dob.length > 4) {
      dateofbirthcontroller.text =
          "${dob.substring(0, 1)} -  ${dob.substring(2, 4)}";
    }
  }

  void pass() {
    String password =
        passwordcontroller.text; //Get the text entered in the password field
    String newpassword = newpasswordcontroller.text;
    if (password == newpassword) {
      setState(() {
        error1 = ''; // clear any previous error
        //messages or reset the error state to its initial or neutral state
      });
      bool isSignInSuccessful = true;
      if (isSignInSuccessful) {
        createUser(
            namecontroller.text,
            phonenumbercontroller.text,
            agecontroller.text,
            dateofbirthcontroller.text,
            passwordcontroller.text,
            newpasswordcontroller.text,
            emailcontroller.text);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => Signedin()),
          ),
        );
      } else {
        setState(() {
          error1 = 'sign in failed';
        });
      }
    } else {
      setState(
        () {
          error1 = 'Passwords do not match.';
        },
      );
    }
  }

  // List of items in our dropdown menu
  //var items = ['Select item', 'Male', 'Female'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              // child: Container(
              //   height: MediaQuery.of(context).size.height,
              //   width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  TextField(
                    controller: namecontroller,
                    decoration: InputDecoration(labelText: "Name"),
                  ),
                  TextField(
                      controller: agecontroller,
                      decoration: InputDecoration(labelText: 'Age'),
                      keyboardType: TextInputType.number),
                  TextField(
                    controller: phonenumbercontroller,
                    decoration: InputDecoration(labelText: 'Phone Number'),
                  ),
                  TextField(
                    controller: emailcontroller,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  TextField(
                    controller: passwordcontroller,
                    decoration: InputDecoration(labelText: 'password'),
                    obscureText: true,
                    obscuringCharacter: '*',
                  ),
                  TextField(
                    controller: newpasswordcontroller,
                    decoration: InputDecoration(labelText: 'confirmpassword'),
                    obscureText: true,
                    obscuringCharacter: '*',
                  ),
                  if (error1.isNotEmpty)
                    Text(
                      error1,
                      style: TextStyle(color: Colors.red),
                    ),

                  TextField(
                    controller: dateofbirthcontroller,
                    decoration: InputDecoration(labelText: 'DateOfBirth'),
                    onChanged: (value) {
                      dobformat(value);
                    },
                  ),

                  DropdownButtonFormField(
                    decoration: InputDecoration(labelText: 'Gender'),
                    items: [
                      DropdownMenuItem(
                        value: 'Male',
                        child: Text('Male'),
                      ),
                      DropdownMenuItem(
                        value: 'Female',
                        child: Text('Female'),
                      ),
                    ],
                    onChanged: (String? value) {
                      gender = value.toString();
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(onPressed: saveUser(), child: Text('sign up')),
                  // SizedBox(
                  //   height: 30,
                  // ),
                  // Text("Select gender: -"),
                  // SizedBox(
                  //   width: 30,
                  // ),
                  // DropdownButton(
                  //   // Initial Value
                  //   value: dropdownvalue,

                  //   // Down Arrow Icon
                  //   // icon: const Icon(Icons.person),

                  //   // Array list of items
                  //   items: items.map((String value) {
                  //     return DropdownMenuItem(
                  //       value: value,
                  //       child: Row(
                  //         children: [
                  //           Text(value),
                  //           Icon(
                  //             value == "Male"
                  //                 ? Icons.male
                  //                 : value == "Select item"
                  //                     ? Icons.person
                  //                     : Icons.female,
                  //           )
                  //         ],
                  //       ),
                  //     );
                  //   }).toList(),

                  // After selecting the desired option,it will
                  // change button value to selected value
                  //   onChanged: (String? newValue) {
                  //     setState(() {
                  //       dropdownvalue = newValue!;
                  //     });
                  //   },
                  // ),
                ],
              ),
              //),
            )
          ],
        ),
      ),
    );
  }
}
