import 'package:flutter/material.dart';
import 'package:taskr/data/auth_data.dart';

class Signup extends StatefulWidget {
  final VoidCallback signUp;
  const Signup(this.signUp, {super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  var _enteredEmail = TextEditingController();
  var _enteredPassword = TextEditingController();
  var _confirmPassword = TextEditingController();

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    _formKey.currentState!.save();
    Authenticate().register(_enteredEmail.text, _enteredPassword.text, _confirmPassword.text);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 50,
          ),
          Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    width: screenWidth * .5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: widget.signUp,
                            child: const Text("Have an account? Login here!"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: screenWidth * .5,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email_outlined),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                          hintText: "Email"),
                      autocorrect: false,
                      keyboardType: TextInputType.emailAddress,
                      textCapitalization: TextCapitalization.none,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !value.contains("@")) {
                          return "Please enter a valid email";
                        }
                        return null;
                      },
                      controller: _enteredEmail,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: screenWidth * .5,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.password_outlined),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            hintText: "Password"),
                        autocorrect: false,
                        obscureText: true,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.trim().length < 6) {
                            return "Please enter at least 6 characters";
                          }
                          return null;
                        },
                        controller: _enteredPassword,
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: screenWidth * .5,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.password_outlined),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            hintText: "Confirm Password"),
                        autocorrect: false,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "This field cannot be blank";
                          } 
                          if (value != _enteredPassword.text) {
                            return "Passwords must match";
                          }
                          return null;
                        },
                        controller: _confirmPassword,
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: _submit,
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(screenWidth * .5, 40),
                          backgroundColor:
                              Theme.of(context).colorScheme.primaryContainer),
                      child: const Text("Signup")),
                ],
              ),
            ),
          )
        ]),
      )),
    );
  }
}
