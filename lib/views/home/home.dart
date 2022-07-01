import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fuel_token_app/components/utills.dart';
import 'package:fuel_token_app/views/others/registerd_user.dart';

import '../../components/custom_text_field.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _name = TextEditingController();

    final _phonenumber = TextEditingController();
    final _vehiclenumber = TextEditingController();
    final _id = TextEditingController();

    final Size size = MediaQuery.of(context).size;
   
    bool isregisterd() {
      final docUser = FirebaseFirestore.instance
          .collection('users')
          .where(_id.text, isEqualTo: true)
          .get()
          .then(
            (res) => false,
            onError: (e) => print("Error completing: $e"),
          );
      return true;
    }

    Future registerVehicle() async {
      final docUser = FirebaseFirestore.instance.collection('users');

      final json = {
        'name': _name.text,
        'id': _id.text,
        'phonenumber': _phonenumber.text,
        'vehiclenumber': _vehiclenumber.text,
        'date': DateTime.now().toString()
      };
      await docUser.add(json);
      isregisterd();
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return const RegisterdUser();
        },
      ));
    }

    bool isEmpty() {
      if (_id.text.isNotEmpty &&
          _name.text.isNotEmpty &&
          _vehiclenumber.text.isNotEmpty &&
          _phonenumber.text.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    }
//isregisterd = false && is empty = false
    bool isvalidate() {
      if (isEmpty() && isregisterd()) {
        return true;
      }
      return false;
    }

    return Scaffold(
        backgroundColor: kpinkcolor,
//appbar
        appBar: AppBar(
          leading: IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
            icon: const Icon(Icons.logout),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: kred2color,
          centerTitle: true,
          title: const Text("Cypetco Token Collector"),
        ),
        body: Column(
          children: [
            // Here, default theme colors are used for activeBgColor, activeFgColor, inactiveBgColor and inactiveFgColor

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomTextField(
                      controller: _name,
                      type: TextInputType.name,
                      icon: const Icon(Icons.person),
                      label: "What is Your Name",
                    ),
                    CustomTextField(
                      controller: _id,
                      type: TextInputType.number,
                      icon: const Icon(Icons.person_search_outlined),
                      label: "What is Your Id Number",
                      length: 12,
                    ),
                    CustomTextField(
                      controller: _phonenumber,
                      icon: const Icon(Icons.phone),
                      type: TextInputType.number,
                      label: "What is Your Phone Number",
                      length: 10,
                    ),
                    CustomTextField(
                      controller: _vehiclenumber,
                      icon: const Icon(Icons.car_rental_outlined),
                      label: "What is Your Vehicle Number",
                    ),
                    ElevatedButton(
                        onPressed: () {
                          isvalidate()
                              ? registerVehicle()
                              : AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.ERROR,
                                  animType: AnimType.BOTTOMSLIDE,
                                  title: 'Error ',
                                  desc: 'Please Fill All the Fields',
                                  btnCancelOnPress: () {},
                                  btnOkOnPress: () {},
                                ).show();
                        },
                        child: const Text("Register Now For Token")),
                  ],
                ),
              ),
            )
          ],
        )
//column
//text
//button

//if you logged in then show date and time that he can fuelup

//if he didnt log in then redirect to the register page
//
        );
  }
}
