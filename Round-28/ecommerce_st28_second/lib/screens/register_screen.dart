import 'package:ecommerce_st28_second/screens/login_screen.dart';
import 'package:ecommerce_st28_second/utils/app_colors.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width; // Bad Performance
    final screenWidth = MediaQuery.sizeOf(context).width; // Good Performance
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 70),
                Image.asset(
                  'assets/images/blue_logo.png',
                  height: 72,
                  width: 72,
                ),
                const SizedBox(height: 16),
                Text(
                  'Welcome to Lafyuu',
                  style: TextStyle(
                    color: Color(0xff223263),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Sign Up to Continue',
                  style: TextStyle(
                    color: Color(0xff9098B1),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Name',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  obscureText: isObscure,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                    prefixIcon: Icon(Icons.lock_outlined),
                    suffixIcon: IconButton(
                      icon: isObscure
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                      onPressed: () {
                        setState(() {
                          // if (isObscure == true) {
                          //   isObscure = false;
                          // } else {
                          //   isObscure = true;
                          // }
                          //

                          isObscure = !isObscure;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Confirm Password',
                    prefixIcon: Icon(Icons.lock_outlined),
                    suffixIcon: Icon(Icons.visibility_off),
                  ),
                ),
                const SizedBox(height: 18),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    fixedSize: Size(screenWidth, 50),
                  ),
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.red,
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 8,
                        ),
                        child: Text('OR'),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                OutlinedButton.icon(
                  icon: Icon(
                    Icons.facebook,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    fixedSize: Size(screenWidth, 50),
                  ),
                  label: Center(
                    child: Text(
                      'Login with Facebook',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                TextButton.icon(
                  icon: Icon(Icons.facebook),
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    fixedSize: Size(screenWidth, 50),
                  ),
                  label: Text(
                    'Login with Facebook',
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "You have an account?",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) {
                              return LoginScreen();
                            },
                          ),
                        );
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
