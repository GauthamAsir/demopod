import 'package:demopod_flutter/global.dart';
import 'package:demopod_flutter/screens/auth/signup.dart';
import 'package:demopod_flutter/screens/home/home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController(),
      passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String error = '';

  bool isLoading = false;

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
        body: Form(
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _errorWidget(),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) =>
                              value != null && value.isNotEmpty
                                  ? null
                                  : 'Required',
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: passwordController,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.text,
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
                              setIsLoading();
                              try {
                                var res = await client.authentication.login(
                                    emailController.text.toString(),
                                    passwordController.text.toString());
                                if (kDebugMode) {
                                  print(res.toString());
                                }

                                if (!res.success) {
                                  error = res.message;
                                } else {
                                  error = '';
                                  Get.offAndToNamed(HomePage.routeName);
                                }
                              } catch (e) {
                                error = e.toString();
                                if (kDebugMode) {
                                  print(e.toString());
                                }
                              } finally {
                                setIsLoading();
                              }
                            },
                            child: isLoading
                                ? const CircularProgressIndicator.adaptive()
                                : const Text('Login'),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextButton(
                          child: const Text(
                              'Don\'t have an account? Register Here'),
                          onPressed: () {
                            Get.toNamed(SignUpPage.routeName);
                          },
                        )
                      ],
                    ),
                  )),
            )));
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
}
