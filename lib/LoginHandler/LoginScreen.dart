import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qmsadminflutter/app_colors.dart';

import 'dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your email address';
  }
  // Use a regular expression to check if the entered email is valid
  if (!RegExp(
      r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
      .hasMatch(value)) {
    return 'Please enter a valid email address';
  }
  return null;
}

void showToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 3,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 86.0,
  );
}
void authenticate(){}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;
  bool isObscure = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    Widget headerSection = width > 800
        ? Expanded(
      child: Container(
        height: height,
        width: width,
        color: AppColors.buttonColor,
        child: const Center(
          child: Text(
            'Sunfox Technologies',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontSize: 48,
            ),
          ),
        ),
      ),
    )
        : Container(); // Empty container if width is not greater than 800

    Widget rememberForgotSection = width < 880
        ? Column(
      children: [
        Row(
          children: [
            Checkbox(
              checkColor: Colors.white,
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
            const Text(
              'Remember Me?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: AppColors.textColor,
              ),
            ),
          ],
        ),
        const Text(
          'Forgot Password',
          style: TextStyle(
            fontSize: 16,
            color: AppColors.textColor,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    )
        : Row(
      children: [
        Checkbox(
          checkColor: Colors.white,
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
        const Text(
          'Remember Me?',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: AppColors.textColor,
          ),
        ),
        Spacer(),
        const Text(
          'Forgot Password',
          style: TextStyle(
            fontSize: 16,
            color: AppColors.textColor,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );

    return Scaffold(
      body: SizedBox(
        height: height,
        width: width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            headerSection, // Display headerSection if width is greater than 800
            SizedBox(height: height * 0.34),
            Expanded(
              child: Container(
                width: width > 880 ? width * 0.3 : width * 0.8,
                margin: EdgeInsets.symmetric(horizontal: height * 0.12),
                color: Colors.white54,
                child: Column(
                  children: [
                    SizedBox(height: height * 0.145),
                    Image.asset(
                      'assets/sunfoxlogo.png.png',
                      height: height * 0.1,
                      width: width * 0.1,
                      alignment: Alignment.center,
                    ),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "Welcome Back to",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          TextSpan(
                            text: " QMS Admin Panel!",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    const Text(
                      "Please Enter Your Details",
                      style: TextStyle(color: AppColors.textColor),
                    ),
                    SizedBox(height: height * 0.05),
                    SizedBox(
                      height: height * 0.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                borderSide: BorderSide(
                                  width: 2,
                                ),
                              ),
                              hintText: 'Enter Your Mail',
                            ),
                            validator: validateEmail,
                          ),
                          SizedBox(height: height * 0.02),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: isObscure,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                borderSide: BorderSide(
                                  width: 2,
                                ),
                              ),
                              hintText: 'Enter Your Password',
                              suffixIcon: IconButton(
                                icon: Icon(
                                  isObscure
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: AppColors.textColor,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isObscure = !isObscure;
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: height * 0.02),
                          rememberForgotSection,
                          SizedBox(height: height * 0.05),
                          SizedBox(
                            width: width * 0.3,
                            height: height * 0.07,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_emailController.text.isNotEmpty &&
                                    _passwordController.text.isNotEmpty &&
                                    validateEmail(_emailController.text) == null) {
                                  // Email is not empty and valid
                                  // Perform your login logic here
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Dashboard(),
                                    ),
                                  );
                                } else {
                                  // Show an error message or handle the invalid input
                                  showToast('Invalid input. Please check your email.');
                                  print(
                                      'Invalid input. Please check your email.');
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                primary: AppColors.buttonColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
