import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
            child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(
                height: 85.0,
              ),
              Image.asset(
                "assets/images/login.png",
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 25.0,
              ),
              Text(
                "Welcome $name",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        hintText: "Enter Username",
                        labelText: "Username",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Username";
                        }

                        return null;
                      },
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Password";
                        } else if (value.length < 6) {
                          return "Password Length Too Short... Atleast 6 words needed.";
                        }

                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Material(
                      borderRadius:
                          BorderRadius.circular(changeButton ? 45 : 8),
                      color: Colors.deepPurple,
                      child: InkWell(
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            setState(() {
                              changeButton = true;
                            });
                            await Future.delayed(Duration(seconds: 3));
                            await Navigator.pushNamed(
                                context, MyRoutes.HomeRoute);
                            setState(() {
                              changeButton = false;
                            });
                          }
                          ;
                        },
                        child: AnimatedContainer(
                          duration: Duration(seconds: 2),
                          width: changeButton ? 50 : 500,
                          height: 40,
                          child: Center(
                            child: changeButton
                                ? Icon(Icons.done, color: Colors.white)
                                : Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )));
  }
}
