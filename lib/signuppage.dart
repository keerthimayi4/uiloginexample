import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // Initial Selected Value
  String dropdownvalue = 'Select item';

  // List of items in our dropdown menu
  var items = ['Select item', 'Male', 'Female'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                
                child: Row(
                  children: [
                    Text("Select gender: -"),
                    SizedBox(
                      width: 30,
                    ),
                    DropdownButton(
                      // Initial Value
                      value: dropdownvalue,

                      // Down Arrow Icon
                      // icon: const Icon(Icons.person),

                      // Array list of items
                      items: items.map((String value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Row(
                            children: [
                              Text(value),
                              Icon(
                                value == "Male"
                                    ? Icons.male
                                    : value == "Select item"
                                        ? Icons.person
                                        : Icons.female,
                              )
                            ],
                          ),
                        );
                      }).toList(),

                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
