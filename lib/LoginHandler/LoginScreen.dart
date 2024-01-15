import 'package:flutter/material.dart';
import 'package:qmsadminflutter/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;

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

    Widget rememberForgotSection = width < 800
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
                width: width > 800 ? width * 0.3 : width * 0.8,
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
                          ),
                          SizedBox(height: height * 0.02),
                          TextFormField(
                            obscureText: true,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                borderSide: BorderSide(
                                  width: 2,
                                ),
                              ),
                              hintText: 'Enter Your Password',
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
                                // Handle button click
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
