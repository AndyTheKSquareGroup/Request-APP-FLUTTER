import 'package:flutter/material.dart';

class ContactDetail extends StatelessWidget {
  String nameNew = "";
  String info = "";

  ContactDetail({required this.nameNew, required this.info});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text("$nameNew"), Text("$info")],
        ),
      ),
    );
  }
}
