import 'package:flutter/material.dart';
import 'package:first_project/widget/input_field.dart';
import 'registration_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Colors.amber,
      ),

      body: Center(
        child: SizedBox(
          height: 430,
          width: 330,

          child: Card(
            color: Colors.pink.shade100,
            elevation: 10,

            child: Padding(
              padding: EdgeInsets.all(20),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Icon(
                    Icons.person,
                    size: 70,
                    color: Colors.blue,
                  ),

                  SizedBox(height: 15),

                  Text(
                    "Welcome Back!",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 25),

                  Form(
                    key: _formKey,

                    child: Column(
                      children: [

                        InputField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          labelText: "Email",
                          hintText: "Enter Email",
                          prefixIcon: Icon(Icons.email),

                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Email is empty";
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: 20),

                        InputField(
                          controller: passwordController,
                          keyboardType: TextInputType.text,
                          labelText: "Password",
                          hintText: "Enter Password",
                          prefixIcon: Icon(Icons.lock),

                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password is empty";
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: 25),

                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Login Successful"),
                                ),
                              );
                            }
                          },

                          child: Text("LOGIN"),
                        ),

                        SizedBox(height: 15),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Text("Don't have an account?"),

                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        RegistrationPage(),
                                  ),
                                );
                              },

                              child: Text("Register"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}