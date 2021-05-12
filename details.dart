import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

// ignore: camel_case_types
class _DetailsState extends State<Details> {
  var username, number, emailid;
  Box<String> details;

  @override
  void initState() {
    super.initState();
    details = Hive.box<String>("userDetails");
    number = details.get("phone");
    username = details.get("username");
    emailid = details.get("emailid");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        backgroundColor: Colors.purple[500],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width * 0.98,
        height: MediaQuery.of(context).size.height * 0.25,
        child: Card(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: username == null
              ? Center(child: Text("No Data Available"))
              : Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text("    User Information",
                              style:
                                  new TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Container(
                          child: Text(
                            "Mobile Number : ",
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 5)),
                        Container(
                            child: Text(
                          '$number',
                        ))
                      ],
                    ),
                    Divider(thickness: 2),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Container(
                          child: Text(
                            "Username : ",
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 5)),
                        Container(
                            child: Text(
                          '$username',
                        ))
                      ],
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        Container(
                          child: Text(
                            "Emailid : ",
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 5)),
                        Container(
                            child: Text(
                          '$emailid',
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(.3),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                  offset: Offset(0, 1))
                            ]),
                        child: TextButton(
                          onPressed: () {
                            details.clear();
                            showInSnackBar("Deleted");
                            Navigator.pop(context);
                          },
                          child: Center(
                            child: Text(
                              "Delete",
                            ),
                          ),
                        )),
                  ],
                ),
        ),
      ),
    );
  }

    void showInSnackBar(String value) {
    ScaffoldMessenger.of(context)
        .showSnackBar(new SnackBar(content: new Text(value)));
  }
}
