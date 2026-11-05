import 'package:flutter/material.dart';
import 'package:first_project/widget/input_field.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration"),
        backgroundColor: Colors.amber,
      ),

      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: 330,

            child: Card(
              color: Colors.pink.shade100,
              elevation: 10,

              child: Padding(
                padding: EdgeInsets.all(20),

                child: Form(
                  key: _formKey,

                  child: Column(
                    children: [

                      Icon(
                        Icons.person_add,
                        size: 70,
                        color: Colors.blue,
                      ),

                      SizedBox(height: 15),

                      Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 25),

                      InputField(
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        labelText: "Name",
                        hintText: "Enter Name",
                        prefixIcon: Icon(Icons.person),

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Name is empty";
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 15),

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

                      SizedBox(height: 15),

                      InputField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        labelText: "Phone",
                        hintText: "Enter Phone",
                        prefixIcon: Icon(Icons.phone),

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Phone is empty";
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 15),

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

                      SizedBox(height: 15),

                      InputField(
                        controller: confirmController,
                        keyboardType: TextInputType.text,
                        labelText: "Confirm Password",
                        hintText: "Enter Confirm Password",
                        prefixIcon: Icon(Icons.lock_outline),

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Confirm password is empty";
                          }

                          if (value != passwordController.text) {
                            return "Password does not match";
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
                                content: Text("Registration Successful"),
                              ),
                            );
                          }
                        },

                        child: Text("REGISTER"),
                      ),

                      SizedBox(height: 10),

                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },

                        child: Text("Already have an account? Login"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}