import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fuel_token_app/components/custom_text_field.dart';
import 'package:fuel_token_app/components/utills.dart';
import 'package:fuel_token_app/views/home/home.dart';

class SignIn extends StatefulWidget {
  final VoidCallback isShowLoginPage;
  const SignIn({Key? key, required this.isShowLoginPage}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    final _email = TextEditingController();
    final _password = TextEditingController();
    final _confirmpassword = TextEditingController();

    bool isPasswordConfirmed() {
      if (_password.text.trim() == _confirmpassword.text.trim()) {
        return true;
      } else {
        return false;
      }
    }

    Future createUser() async {
      final docUser = FirebaseFirestore.instance.collection('registerd users');

      final json = {'email': _email.text, 'date': DateTime.now().toString()};
      await docUser.add(json);
    }

    Future emailSignIn() async {
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email.text,
          password: _password.text,
        );
        createUser();
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return const Homepage();
          },
        ));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.BOTTOMSLIDE,
            title: 'weak-password',
            desc: 'The password provided is too weak.',
            btnCancelOnPress: () {},
            btnOkOnPress: () {},
          ).show();
        } else if (e.code == 'email-already-in-use') {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.BOTTOMSLIDE,
            title: 'email-already-in-use',
            desc: 'The account already exists for that email.',
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
              "Hello There",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Register Below with your details",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
                label: "Email",
                icon: const Icon(
                  Icons.email,
                  color: kred2color,
                ),
                controller: _email,
                type: TextInputType.emailAddress),
            CustomTextField(
                label: "Password",
                icon: const Icon(
                  Icons.remove_red_eye,
                  color: kred2color,
                ),
                controller: _password,
                isObscure: true,
                type: TextInputType.visiblePassword),
            CustomTextField(
                label: "Confirm Password",
                icon: const Icon(
                  Icons.remove_red_eye,
                  color: kred2color,
                ),
                controller: _confirmpassword,
                isObscure: true,
                type: TextInputType.visiblePassword),
            TextButton(
                onPressed: () {
                  isPasswordConfirmed()
                      ? emailSignIn()
                      : AwesomeDialog(
                          context: context,
                          dialogType: DialogType.ERROR,
                          animType: AnimType.BOTTOMSLIDE,
                          title: 'Error',
                          desc: 'Passwords didnt match',
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
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already A Member? ',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                ),
                GestureDetector(
                  onTap: widget.isShowLoginPage,
                  child: const Text(
                    'Sign In here ',
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
