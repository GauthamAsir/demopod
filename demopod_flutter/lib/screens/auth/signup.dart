import 'dart:math';

import 'package:demopod_client/demopod_client.dart';
import 'package:demopod_flutter/global.dart';
import 'package:demopod_flutter/screens/auth/login.dart';
import 'package:demopod_flutter/screens/home/home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SignUpPage extends StatefulWidget {
  static const String routeName = '/signup';

  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpSignUpPageState();
}

class _SignUpSignUpPageState extends State<SignUpPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String error = '', userName = '', firstName = '', password = '', email = '';
  DateTime? dob;
  User? user;

  bool isLoading = false;

  final TextEditingController dobController = TextEditingController();

  void setIsLoading() {
    if (mounted) {
      setState(() {
        isLoading = !isLoading;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Center(
                    child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 400),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(6))),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          child: Column(
                            children: [
                              _errorWidget(),
                              const SizedBox(height: 20),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Email',
                                  border: OutlineInputBorder(),
                                ),
                                onSaved: (value) {
                                  if (value != null) {
                                    email = value;
                                  }
                                },
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) => value != null &&
                                        value.isNotEmpty &&
                                        value.isEmail
                                    ? null
                                    : 'In Valid Email',
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'UserName',
                                  border: OutlineInputBorder(),
                                ),
                                onSaved: (value) {
                                  if (value != null) {
                                    userName = value;
                                  }
                                },
                                validator: (value) =>
                                    value != null && value.isNotEmpty
                                        ? null
                                        : 'Required',
                                keyboardType: TextInputType.text,
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'First Name',
                                  border: OutlineInputBorder(),
                                ),
                                onSaved: (value) {
                                  if (value != null) {
                                    firstName = value;
                                  }
                                },
                                validator: (value) =>
                                    value != null && value.isNotEmpty
                                        ? null
                                        : 'Required',
                                keyboardType: TextInputType.text,
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                controller: dobController,
                                decoration: const InputDecoration(
                                  labelText: 'Date of Birth',
                                  border: OutlineInputBorder(),
                                ),
                                readOnly: true,
                                onTap: () async {
                                  var todayDate = DateTime.now();
                                  final DateTime? picked = await showDatePicker(
                                      context: context,
                                      initialDate:
                                          DateTime(todayDate.year - 18),
                                      firstDate: DateTime(todayDate.year - 99),
                                      lastDate: DateTime(todayDate.year - 18));
                                  if (picked != null && picked != dob) {
                                    dobController.text =
                                        DateFormat('dd-MMM-yyyy')
                                            .format(picked);
                                    setState(() {
                                      dob = picked;
                                    });
                                  }
                                },
                                keyboardType: TextInputType.text,
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Password',
                                  border: OutlineInputBorder(),
                                ),
                                onSaved: (value) {
                                  if (value != null) {
                                    password = value;
                                  }
                                },
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                validator: (value) =>
                                    value != null && value.isNotEmpty
                                        ? null
                                        : 'Required',
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    if (formKey.currentState!.validate()) {
                                      formKey.currentState!.save();

                                      setIsLoading();
                                      try {
                                        var res =
                                            await showConfirmPasswordSheet();

                                        if (res) {
                                          var result = await client
                                              .authentication
                                              .signUp(
                                                  User(
                                                      userName: userName,
                                                      firstName: firstName,
                                                      dateOfBirth: dob!,
                                                      email: email),
                                                  password);

                                          if (kDebugMode) {
                                            print('SignUp Result: $result');
                                          }

                                          if (result) {
                                            Get.offAndToNamed(
                                                HomePage.routeName);
                                          } else {
                                            throw Exception(
                                                'Unable to SignUp!');
                                          }
                                        }

                                        if (kDebugMode) {
                                          print('HEY $res');
                                        }
                                      } catch (e) {
                                        error = e.toString();
                                        if (kDebugMode) {
                                          print(e.toString());
                                        }
                                      } finally {
                                        setIsLoading();
                                      }
                                    }
                                  },
                                  child: isLoading
                                      ? const CircularProgressIndicator
                                          .adaptive()
                                      : const Text('Next'),
                                ),
                              ),
                              const SizedBox(height: 10),
                              TextButton(
                                child: const Text(
                                    'Already have an account? Login Here'),
                                onPressed: () {
                                  Get.toNamed(LoginPage.routeName);
                                },
                              )
                            ],
                          ),
                        )),
                  )),
            ],
          ),
        ));
  }

  _errorWidget() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      child: error.isNotEmpty
          ? MaterialBanner(
              backgroundColor: Theme.of(context).errorColor,
              content: Text(error),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      error = '';
                    });
                  },
                  child: const Text(
                    'dismiss',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
              contentTextStyle: const TextStyle(color: Colors.white),
              padding: const EdgeInsets.all(10),
            )
          : Container(),
    );
  }

  Future<bool> showConfirmPasswordSheet() async {
    final TextEditingController confirmPassword = TextEditingController();
    String? confirmPasswordError;

    return await showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        constraints: const BoxConstraints(
          maxWidth: 400,
        ),
        isDismissible: false,
        builder: (_) => StatefulBuilder(
            builder: (__, bState) => WillPopScope(
                onWillPop: () {
                  return Future.value(false);
                },
                child: Container(
                  width: 400,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            'Confirm Password',
                            style: Get.textTheme.headline6,
                          )),
                          IconButton(
                              onPressed: () {
                                Get.back(result: false);
                              },
                              icon: const Icon(Icons.close))
                        ],
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: confirmPassword,
                        decoration: InputDecoration(
                          errorText: confirmPasswordError,
                          labelText: 'Re-Type Password',
                          border: const OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            if (confirmPassword.text.toString() == password) {
                              Get.back(result: true);
                            } else {
                              confirmPasswordError = 'Password Mismatch';
                              confirmPassword.clear();
                              bState(() {});
                            }
                          },
                          child: const Text('Sign Up'),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ))));
  }
}
