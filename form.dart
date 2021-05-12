import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

// ignore: camel_case_types
class _UserFormState extends State<UserForm> {
  Box<String> details;

  TextEditingController username = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController gmail = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    details = Hive.box<String>("userDetails");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form"),
        backgroundColor: Colors.purple[500],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: TextField(
                controller: username,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'UserName'),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: TextField(
                controller: phone,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Phone number'),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: TextField(
                controller: gmail,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Emailid'),
              ),
            ),
            Container(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(.3),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: Offset(0, 1))
                    ]),
                child: _isLoading == true
                    ? Center(child: CircularProgressIndicator())
                    : TextButton(
                        onPressed: () {
                          _saveForm();
                        },
                        child: Center(
                          child: Text(
                            "Save",
                            style: new TextStyle(color: Colors.black),
                          ),
                        ),
                      )),
          ],
        ),
      ),
    );
  }

  void showInSnackBar(String value) {
    ScaffoldMessenger.of(context)
        .showSnackBar(new SnackBar(content: new Text(value)));
  }

  void _saveForm() {
    _isLoading = true;
    if (username.text.isEmpty) {
      showInSnackBar("Username Required");
    } else if (gmail.text.isEmpty) {
      showInSnackBar("Emailid Required");
    } else if (!EmailValidator.validate(gmail.text)) {
      showInSnackBar("Enter Valid emailid");
    } else if (phone.text.isEmpty) {
      showInSnackBar("Phone Number Required");
    } else if (phone.text.length > 10 || phone.text.length < 10) {
      showInSnackBar("enter valid number");
    } else {
      setState(() {
        details.put("username", username.text);
        details.put("emailid", gmail.text);
        details.put("phone", phone.text);
        showInSnackBar("details added ");
        _isLoading = false;
        Navigator.pop(context);
      });
    }
  }
}
