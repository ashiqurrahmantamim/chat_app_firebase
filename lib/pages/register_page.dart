import 'package:chatapp_firebase/service/auth_service.dart';
import 'package:chatapp_firebase/pages/login_page.dart';
import 'package:chatapp_firebase/pages/register_page.dart';
import 'package:chatapp_firebase/widgets/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isLoading = false;
  String email = "";
  String password = "";
  String fullName = "";
  final _key = GlobalKey<FormState>();
  var authService = AuthService();

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
        //   backgroundColor: Theme.of(context).primaryColor,
        // ),
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor),
              )
            : SingleChildScrollView(
                child: Container(
                  child: Form(
                    key: _key,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 30),
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
                          //create your accout now to chat and explore
                          Text(
                            "Create your account now to chat and explore",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          //registration image
                          Image.asset(
                            "assets/register.png",
                            height: 300,
                            width: 500,
                          ),
                          //Name textField

                          TextFormField(
                            controller: fullNameController,
                            decoration: textInputDecoration.copyWith(
                              labelText: "Full Name",
                              hintText: "Full Name",
                              prefixIcon: Icon(
                                Icons.person,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                fullName = value;
                                print(value);
                              });
                            },
                            //check the validator
                            validator: ((value) {
                              if (value!.isNotEmpty) {
                                return null;
                              } else {
                                return "Name cann't be empty";
                              }
                            }),
                          ),
                          SizedBox(
                            height: 12,
                          ),

                          //email textField
                          TextFormField(
                            controller: emailController,
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
                            controller: passwordController,
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
                                password = value;
                                print(value);
                              });
                            },
                            obscureText: true,

                            //check the validator
                            validator: ((value) {
                              if (value!.length < 6) {
                                return "Password must be at least 6 characters";
                              } else {
                                return null;
                              }
                            }),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          //Register button
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
                                "Register",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              //register tab
                              onPressed: () {
                                register();
                              },
                            ),
                          ),

                          SizedBox(
                            height: 10,
                          ),
                          //last text
                          Text.rich(
                            TextSpan(
                                text: "Already have an account? ",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                                children: <InlineSpan>[
                                  TextSpan(
                                      text: "Login now",
                                      style: TextStyle(
                                        color: Colors.black,
                                        decoration: TextDecoration.underline,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          nextScreenReplace(
                                              context, LoginPage());
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

  register() async {
    if (_key.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authService
          .registerUserWithEmailandPassword(fullName, email, password)
          .then((value) {
        if (value == true) {
          //saving the shared_preferences state
          
          nextScreenReplace(context, LoginPage());
        } else {
          setState(() {
            _isLoading = false;
          });

          showSnackbar(context, Colors.red, value.toString());
        }
      });
    }
  }
}
