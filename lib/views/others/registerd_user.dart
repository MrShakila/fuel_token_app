import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RegisterdUser extends StatelessWidget {
  const RegisterdUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    List<String> docId = [];
    Future getDocId() async {
      await FirebaseFirestore.instance
          .collection('users')
          .get()
          .then((snapshot) => snapshot.docs.forEach((document) {
                print(document.reference);
                docId.add(document.reference.id);
              }));
    }

    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("registerd user")),
      body: FutureBuilder(
          future: getDocId(),
          builder: (context, index) {
            return ListView.builder(
              itemCount: docId.length,
              itemBuilder: (context, index) {
                return Text(docId[index]);
              },
            );
          }),
      // body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      //   const SizedBox(
      //     height: 20,
      //   ),
      //   AllTokenNumberCount(
      //     size: size,
      //     title: "Your Token Number",
      //   ),
      //   const SizedBox(
      //     height: 20,
      //   ),
      //   Padding(
      //     padding: const EdgeInsets.only(left: 20),
      //     child: Column(
      //       children: [
      //         Row(
      //           children: [
      //             Text(
      //               "Vehicle Type : ",
      //               style: GoogleFonts.roboto(),
      //             ),
      //             const Text("Bike"),
      //           ],
      //         ),
      //         Row(
      //           children: const [
      //             Text("Vehicle Number : "),
      //             Text("Bike"),
      //           ],
      //         ),
      //         Row(
      //           children: const [
      //             Text("Vehicle Owner : "),
      //             Text("Bike"),
      //           ],
      //         ),
      //         Row(
      //           children: const [
      //             Text("Owner Number : "),
      //             Text("Bike"),
      //           ],
      //         ),
      //         Row(
      //           children: const [
      //             Text("Vehicle Type : "),
      //             Text("Bike"),
      //           ],
      //         )
      //       ],
      //     ),
      //   )
      // ]),
    );
  }
}
