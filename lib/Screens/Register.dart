import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:busapp/Shared/Shared.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // final AuthenticationService _auth =
  //     AuthenticationService(); // Instance of auth service class
  final _formKey = GlobalKey<FormState>(); // Used to Identify the form
  //Text Field States
  String email = "";
  String password = "";
  String error = "";
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        // Left right and top bottom same padding
        child: Form(
          key: _formKey,
          // Keeps track of form and the forms state. Associates form with key
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: "Email"),
                // validator: (val) => val.isEmpty ? "Enter An Email!" : null,
                // return val.isEmpty ? "Enter An Email!" : null;//Return Operator
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: "Password"),
                // validator: (val) => val.length < 6
                //     ? "Enter a password with 6 characters or longer"
                //     : null,
                obscureText: true,
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                  child: const Text("Login Page"),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              const SizedBox(height: 20.0),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.pink[400]),
                  ),
                  child: const Text(
                    "Register",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                  //Only when it recieves null from every single function will the form be considered valid
                  // if (_formKey.currentState.validate()) {
                  //   // Validates from based on current state. Evaluates either true or false
                  //   print("Email: " + email + "\n" + "Password: " + password);
                  //   dynamic result = await _auth.registerUser(email, password);

                  //   // Becuase we will either get database user or datatype Null back
                  //   if (result == null) {
                  //     setState(() {
                  //       error = "Please Supply a Valid Email";
                  //     });
                  //   }else{
                  //     Fluttertoast.showToast(msg: "Account Successfully registered");
                  //     Navigator.pop(context);
                  //   }
                  // }

                  },
                ),
              const SizedBox(height: 20.0),
              const Text(
                "Error Message",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
