import 'package:flutter/material.dart';
import 'package:taskr/data/auth_data.dart';

class Login extends StatefulWidget {
  final VoidCallback signUp;
  const Login(this.signUp, {super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String _enteredEmail = "";
  String _enteredPassword = "";

  _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    _formKey.currentState!.save();
    Authenticate().login(_enteredEmail, _enteredPassword);
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
                  Container(
                    width: screenWidth * .5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: widget.signUp,
                            child: Text("Don't have an account? Sign up here!"),
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
                      onSaved: (value) {
                        _enteredEmail = value!;
                      },
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
                        onSaved: (value) {
                          _enteredPassword = value!;
                        },
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
                      child: const Text("Login")),
                ],
              ),
            ),
          )
        ]),
      )),
    );
  }
}
