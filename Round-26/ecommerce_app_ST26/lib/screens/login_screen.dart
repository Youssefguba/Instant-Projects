import 'package:ecommerce_app_sat26/repositories/auth_repo.dart';
import 'package:ecommerce_app_sat26/screens/home_screen.dart';
import 'package:ecommerce_app_sat26/screens/register_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // build method called 60 time/second
  bool isPasswordObscure = true;

  // on click sign in ---> validation

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Image
                _logoImage(),

                SizedBox(height: 10),
                // Text Welcome
                _welcomeTextWidget(),

                // empty space
                SizedBox(
                  height: 10,
                ),

                // Text Sign In
                _textSignInWidget(),

                // TextBox Email
                _emailTextBox(),

                // TextBox Password
                _passwordTextField(),

                // Sign In Button
                _signInButton(context),

                // Divider and Text
                _dividerWidget(context),

                // Button Google
                googleButton(),
                // Button Facebook

                _facebookButton(),
                // Text Clickable Forget Password
                TextButton(
                  onPressed: () {},
                  child: Text('Forget Password?'),
                ),

                // Row [ Text,  Clickable Text ]
                forgetPasswordWidget(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  OutlinedButton _facebookButton() {
    return OutlinedButton.icon(
      onPressed: () {},
      label: Text('Login with Facebook'),
      icon: Icon(Icons.facebook),
    );
  }

  OutlinedButton googleButton() {
    return OutlinedButton.icon(
      onPressed: () {},
      label: Text('Login with Google'),
      icon: Image.asset(
        'assets/images/google_logo.png',
        height: 25,
      ),
    );
  }

  Container _dividerWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 0.5,
            width: MediaQuery.of(context).size.width * 0.25,
            color: Colors.black,
          ),
          Text('OR'),
          Container(
            height: 0.5,
            width: MediaQuery.of(context).size.width * 0.25,
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  Container _signInButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 160,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
        ),
        onPressed: () {
          print('Email :: ${emailController.text}');

          if (formKey.currentState!.validate()) {
            AuthRepo().login(
              emailController.text,
              passwordController.text,
            );

            // Navigator.of(context)
            //     .push(MaterialPageRoute(builder: (context) => HomeScreen()));
          }
        },
        child: Text('Sign In'),
      ),
    );
  }

  Container _emailTextBox() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 16,
      ),
      child: TextFormField(
        controller: emailController,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: 'test@gmail.com',
          border: OutlineInputBorder(),
          prefixIcon: Icon(
            Icons.email_outlined,
            color: Colors.blue,
          ),
        ),
        validator: (String? text) {
          if (text!.isEmpty) {
            return 'Your Email cannot be empty!';
          } else if (!text.contains('@') || !text.contains('.')) {
            return 'Your email is incorrect!';
          } else {
            return null;
          }
        },
      ),
    );
  }

  Text _textSignInWidget() {
    return Text(
      'Sign in to continue',
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Image _logoImage() {
    return Image.asset(
      'assets/images/logo.png',
      height: 80,
      width: 80,
    );
  }

  Row forgetPasswordWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account?"),
        SizedBox(width: 8),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) {
              return RegisterScreen();
            }), (route) => false);
          },
          child: Text(
            'Register',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Container _passwordTextField() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 16,
      ),
      child: TextFormField(
        controller: passwordController,
        obscureText: isPasswordObscure,
        decoration: InputDecoration(
          hintText: 'enter your password',
          border: OutlineInputBorder(),
          prefixIcon: Icon(
            Icons.password,
            color: Colors.blue,
          ),
          suffixIcon: IconButton(
            icon: Icon(Icons.visibility_off),
            onPressed: () {
              setState(() {
                // version 1
                // if (isPasswordObscure) {
                //   isPasswordObscure = false;
                // } else {
                //   isPasswordObscure = true;
                // }

                // version 2
                isPasswordObscure = !isPasswordObscure;
              });
            },
          ),
        ),
      ),
    );
  }

  Widget _welcomeTextWidget() {
    return Text(
      'Welcome to Lafyuu',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
