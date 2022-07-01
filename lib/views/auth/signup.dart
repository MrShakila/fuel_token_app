import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fuel_token_app/components/custom_text_field.dart';

import '../../components/utills.dart';
import '../home/home.dart';

class SignUp extends StatefulWidget {
  final VoidCallback isShowLoginPage;
  const SignUp({Key? key, required this.isShowLoginPage}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    final _email = TextEditingController();
    final _password = TextEditingController();
    bool isempty() {
      if (_email.text.isNotEmpty && _password.text.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    }

    Future emailSignUp() async {
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: _email.text, password: _password.text);
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return const Homepage();
          },
        ));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.BOTTOMSLIDE,
            title: 'user-not-found',
            desc: 'No user found for that email.',
            btnCancelOnPress: () {},
            btnOkOnPress: () {},
          ).show();
        } else if (e.code == 'wrong-password') {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.BOTTOMSLIDE,
            title: 'wrong-password',
            desc: 'Wrong password provided for that user.',
            btnCancelOnPress: () {},
            btnOkOnPress: () {},
          ).show();
        }
      }
    }

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const FaIcon(
              FontAwesomeIcons.car,
              size: 50,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Hello Again",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Welcome Back You're been missed",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
                label: "Email",
                icon: const Icon(Icons.email, color: kred2color),
                controller: _email,
                type: TextInputType.emailAddress),
            CustomTextField(
                label: "Password",
                icon: const Icon(Icons.remove_red_eye, color: kred2color),
                controller: _password,
                isObscure: true,
                type: TextInputType.visiblePassword),
            TextButton(
              onPressed: () {
                isempty()
                    ? emailSignUp()
                    : AwesomeDialog(
                        context: context,
                        dialogType: DialogType.ERROR,
                        animType: AnimType.BOTTOMSLIDE,
                        title: 'Error',
                        desc: 'Please Fill All the Field',
                        btnCancelOnPress: () {},
                        btnOkOnPress: () {},
                      ).show();
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(25)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  child: Text(
                    "Sign In",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Not A Member? ',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                ),
                GestureDetector(
                  onTap: widget.isShowLoginPage,
                  child: const Text(
                    'Sign Up here ',
                    style: TextStyle(
                        fontSize: 15,
                        color: kred2color,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
