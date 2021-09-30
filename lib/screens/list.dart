import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:requestsflutter/screens/detail.dart';
import 'package:requestsflutter/widgets/MenuWidgets.dart';
import 'package:flutter/material.dart';

class ContactList extends StatefulWidget {
  const ContactList({Key? key}) : super(key: key);
  @override
  _ContactList createState() => _ContactList();
}

class _ContactList extends State<ContactList> {
  var URL = "https://codesundar.com/wp-json/wp/v2/posts";
  var _user = [];
  getContactFromNetwork() async {
    try {
      await http.get(Uri.parse(URL)).then((res) {
        print("Success");
        print(res.body);
        var resp = json.decode(res.body);
        setState(() {
          _user = resp;
        });
        _user = resp;
      }).catchError((e) {
        print("Error");
        print(e);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ANDY NEWS"),
      ),
      body: Center(
        child: _user.length == 0
            ? Container(
                color: Colors.blue[200],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                                "Would you like to view the most important news in the World?, only in ANDY NEWS",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          Container(
                            child: ElevatedButton(
                              onPressed: () {
                                getContactFromNetwork();
                              },
                              child: Text(
                                "Click Here",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.black,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            height: 70,
                            width: double.infinity,
                            child: Text(
                              "Reliable News",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(15),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Icon(
                                    Icons.facebook_rounded,
                                    size: 35,
                                    color: Colors.blue,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Icon(
                                    Icons.email_rounded,
                                    size: 35,
                                    color: Colors.blue,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: _user.length,
                itemBuilder: (bc, index) {
                  return Card(
                      child: ListTile(
                    title: Text(
                      "${_user[index]['title']['rendered']}",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blueGrey,
                      ),
                    ),
                    tileColor: Colors.white,
                    subtitle: Text(
                        "${_user[index]['yoast_head_json']['description']}"),
                    // leading: CircleAvatar(
                    //   backgroundImage: NetworkImage(_users[index]['avatar']),
                    // ),
                    onTap: () {
                      Get.to(ContactDetail(
                        nameNew: _user[index]['title']['rendered'],
                        info: _user[index]['yoast_head_json']['description'],
                      ));
                    },
                  ));
                },
              ),
      ),
    );
  }
}
