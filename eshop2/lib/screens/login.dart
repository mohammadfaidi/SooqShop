import 'package:eshop2/adminpages/adminOrders.dart';
import 'package:eshop2/screens/homescreen.dart';
import 'package:eshop2/screens/signup.dart';
//import 'package:dsc_shop/tools/colors.dart';
//import 'package:dsc_shop/tools/language.dart';
import 'package:firebase_auth/firebase_auth.dart';

//import 'package:dsc_shop/widgets/widgetemail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LogIn extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LogIn> {
  bool showvalue = false;
  final email = TextEditingController();
  final password = TextEditingController();
  bool passwordvisible = true;

  final auth = FirebaseAuth.instance;

  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  String validglobal(String val) {
    if (val.isEmpty) {
      return "fild ";
    }
  }

  String validpassword(String val) {
    if (val.trim().isEmpty) {
      return "يجب كتابة كلمة المرور";
    }
    if (val.length < 8) {
      return "لايمكن لكلمة المرور ان تكون اقل من 8 احرف";
    }
    if (val.length > 30) {
      return "لايمكن لكلمة المرور ان تكون اكثر من 30 احرف";
    }
  }

  String validemail(String val) {
    if (val.trim().isEmpty) {
      return "يجب كتابة البريد الالكتروني";
    }
    if (val.length < 4) {
      return "البريد الالكتروني غير صحيح";
    }

    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(val)) {
      return "تأكد من عنوان البريد الالكتروني";
    }
  }

  bool checkBoxVal = false;

//  Language _language = Language();

  @override
  void initState() {
    super.initState();
    //  setState(() => _language.getLanguage());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 20,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "So0oq Shop ",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Icon(
              Icons.shopping_cart,
              size: 30,
            )
          ],
        ),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("images/back.jpg"),
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.darken),
            fit: BoxFit.cover,
          ),
        ),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              padding: EdgeInsets.all(10),
              width: size.width * 0.9,
              height: size.height * 0.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white.withOpacity(0.8),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    //  _language==null? "Welcome Back":"${_language.tWelcomeBack()}",
                    "Welcome Back",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(height: 30),
                  customTextEmail(
                    // _language==null?"email":"${_language.tEmail()}",
                    "email",
                    false,
                    Icon(Icons.email),
                  ),
                  SizedBox(height: 30),
                  customTextPassword(
                    // _language==null?"password":"${_language.tPAssword()}",
                    "password",
                    true,
                    Icon(Icons.lock),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 22),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Am Admin?",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Checkbox(
                            value: this.checkBoxVal,
                            onChanged: (bool value) {
                              setState(() {
                                this.checkBoxVal = value;
                                print(checkBoxVal);
                              });
                            }),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Row(
                      children: [
                        Text(
                          // _language==null? "Do not have am account?":"${_language.tnotAcount()}",
                          "Do not have am account?",
                          style: TextStyle(fontSize: 17),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUp(),
                                ));
                          },
                          child: Text(
                            // _language==null?"Sign Up":"${_language.tCrateAcount()}",
                            "Sign Up",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      //bool if checkbox true open navigation to admin page else to home page
                      //

                      if (checkBoxVal == true) {
                        print(checkBoxVal);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ReadData()));
                      } else {
                        print(checkBoxVal);
                        auth
                            .signInWithEmailAndPassword(
                                email: email.text, password: password.text)
                            .then(
                              (_) => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen())),
                            );
                      }
                    },
                    child: //Text(_language==null? "Login ":"${_language.tLogIn()}"),
                        Text("Login "),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget customTextEmail(hint, obsecure, icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
          controller: email,
          obscureText: obsecure,
          decoration: InputDecoration(
            labelText: '$hint',
            labelStyle: TextStyle(color: Colors.red),
            //prefixIcon: icon,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(10)),
          ),
          validator: validemail),
    );
  }

  Widget customTextPassword(hint, obsecure, icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
          keyboardType: TextInputType.visiblePassword,
          controller: password,
          obscureText: passwordvisible,
          decoration: InputDecoration(
            labelText: '$hint',
            labelStyle: TextStyle(color: Colors.red),
            prefixIcon: icon,
            suffixIcon: IconButton(
                icon: FaIcon(passwordvisible
                    ? FontAwesomeIcons.eye
                    : FontAwesomeIcons.eyeSlash),
                onPressed: () {
                  setState(() {
                    passwordvisible = !passwordvisible;
                  });
                }),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(10)),
          ),
          validator: validpassword),
    );
  }
}
