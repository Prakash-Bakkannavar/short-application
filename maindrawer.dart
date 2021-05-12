import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MainDrawer extends StatefulWidget {
  static const routeName = '/maindrawer';
  @override
  _Maindrawer createState() => _Maindrawer();
}

class _Maindrawer extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
            ),
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.1,
                    margin: EdgeInsets.only(top: 30.0, bottom: 10),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/personIcon.png'),
                      radius: 50.0,
                    ),
                  ),
                  Center(
                    child: Text("Prakash Bakkannavar"),
                  ),
                  SizedBox(height: 3.0),
                  Container(
                    child: Text("prakashbakkannavar@gmail.com"),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              color: Colors.black,
            ),
            title: Text("Form"),
            onTap: () {
              Navigator.pushNamed(context, '/form');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.device_hub,
              color: Colors.black,
            ),
            title: Text("Details"),
            onTap: () {
              Navigator.pushNamed(context, '/details');
            },
          ),
        ],
      ),
    );
  }
}
