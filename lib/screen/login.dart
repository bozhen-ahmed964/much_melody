import 'package:flutter/material.dart';
import 'package:muchmelody/main.dart';
import 'package:muchmelody/resources/auth_methods.dart';
import 'package:muchmelody/screen/signup.dart';
import 'package:muchmelody/utils/colors.dart';
import 'package:muchmelody/utils/utils.dart';
import 'package:muchmelody/widgets/textField_input.dart';

import '../responsive/mobile_screenlayout.dart';
import '../responsive/responsive_layoutscreen.dart';
import '../responsive/web_screenlayout.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });

    String res = await AuthMethods().loginUser(
        email: _emailController.text, password: _passwordController.text);
    if (res == 'success') {
           Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const responsiveLayout(
            mobileScreenLayout: MobileScreenLayout(),
            webScreenLayout: WebScreenLayout(),
          ),
        ),
      );
    } else {
      showSnackBar(res, context);
    }
    setState(() {
      _isLoading = false;
    });
  }

  void navigateToSignup() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => SignupScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/loginImg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(child: Container(), flex: 2),
                  //svg img
                  Image.asset(
                    'assets/logo.png',
                    height: 250,
                  ),
                  const SizedBox(height: 25),
                  // text field input email
                  textFieldInput(
                    hintText: 'Email',
                    textInputType: TextInputType.emailAddress,
                    textEditingController: _emailController,
                  ),
                  const SizedBox(height: 24),
                  // text field input password
                  textFieldInput(
                    hintText: 'Password',
                    textInputType: TextInputType.text,
                    textEditingController: _passwordController,
                    isPass: true,
                  ),
                  const SizedBox(height: 24),
                  //button login
                  InkWell(
                    onTap: loginUser,
                    child: Container(
                      child: _isLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                              color: primaryColor,
                            ))
                          : const Text('Log in'),
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          color: blueColor),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Flexible(child: Container(), flex: 5),
                  // transisioning to signup
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Container(
                      child: const Text("don't have an account ? "),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                    GestureDetector(
                      onTap: navigateToSignup,
                      child: Container(
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                      ),
                    ),
                  ])
                ],
              ),
            ),
          ),
        ));
  }
}
