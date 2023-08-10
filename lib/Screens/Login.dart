import 'package:flutter/material.dart';
import 'package:busapp/Shared/Shared.dart';
import 'package:busapp/Services/authenticator.dart';
//import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //final AuthenticationService _auth = AuthenticationService(); // Instance of auth service class
  final _formKey = GlobalKey<FormState>(); // Used to Identify the form

  final Authenticator _authenticator = Authenticator();

  //Text Field States
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _authenticator.isLogedIn().then((value) {
        if (value) {
          // Navigator.pushReplacement(
          //     context, MaterialPageRoute(builder: (context) => MainScreenWidget()));
        }
      });
    });

    return Scaffold(
      backgroundColor: Colors.black,
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
                controller: usernameController,
                decoration: textInputDecoration.copyWith(hintText: "Email"),
                validator: (val) => val?.isEmpty ?? true ? "Enter An Email!" : null
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: passwordController,
                decoration: textInputDecoration.copyWith(hintText: "Password"),
                obscureText: true,
              ),

              const SizedBox(height: 20.0),
              ElevatedButton(
                child: const Text("register"),
                onPressed: (){
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
                },
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.pink[400]),
                ),
                child: const Text(
                  "Sign in",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  _authenticator
                              .login(usernameController.text,
                                  passwordController.text, () {})
                              .then((value) => {
                                if (value){
                                    // Navigator.pushReplacement(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             MainScreenWidget()))
                                }});
                  // if (_formKey.currentState.validate()) {

                  //   dynamic result = await _auth.loginUser(email, password);
                  //   // Validates from based on current state. Evaluates either true or false
                  //   if (result == null) {
                  //     setState(() => error = "Invalid Credentials");
                  //   }else{
                  //     if (_auth.emailVerified) {
                  //       Fluttertoast.showToast(msg: "Login Successfully");
                  //       Navigator.push(context, MaterialPageRoute( builder: (context) => Home()));
                  //     }else{
                  //       Fluttertoast.showToast(msg: "Email Not verified");
                  //     }
                  //   }
                  // }
                },
              ),
              const SizedBox(height: 20.0),
              // const Text(
              //   // error,
              //   style: TextStyle(
              //     color: Colors.red,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}