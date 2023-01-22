import 'package:chatapp_firebase/pages/register_page.dart';
import 'package:chatapp_firebase/widgets/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = "";
  String password = "";

  GlobalKey _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
        //   backgroundColor: Theme.of(context).primaryColor,
        // ),
        body: SingleChildScrollView(
      child: Container(
        child: Form(
          key: _key,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //text Groupie
                Text(
                  "Groupie",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //Login now to see what they are talking
                Text(
                  "Login now to see what they are talking",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                //login Image
                Image.asset(
                  "assets/login.png",
                  height: 300,
                  width: 500,
                ),
                //email textField
                TextFormField(
                  decoration: textInputDecoration.copyWith(
                    labelText: "Email",
                    hintText: "Email",
                    prefixIcon: Icon(
                      Icons.email,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      email = value;
                      print(value);
                    });
                  },
                  //check the validator
                  validator: ((value) {
                    return RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value!)
                        ? null
                        : "Please enter a valid email";
                  }),
                ),

                SizedBox(
                  height: 12,
                ),

                //password textField
                TextFormField(
                  decoration: textInputDecoration.copyWith(
                    labelText: "Password",
                    hintText: "Password",
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      email = value;
                      print(value);
                    });
                  },
                  obscureText: true,

                  //check the validator
                  validator: ((value) {
                    if (value!.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                  }),
                ),
                SizedBox(
                  height: 15,
                ),
                //signIn button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    //login tab
                    onPressed: () {
                      login();
                    },
                  ),
                ),

                SizedBox(
                  height: 10,
                ),
                //last text
                Text.rich(
                  TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                      children: <InlineSpan>[
                        TextSpan(
                            text: "Register here",
                            style: TextStyle(
                              color: Colors.black,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                nextScreen(context, RegisterPage());
                              })
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  login() {}
}
