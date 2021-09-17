import 'package:eshop2/main.dart';
import 'package:eshop2/providers/language.dart';
import 'package:eshop2/screens/homescreen.dart';
//import 'package:dsc_shop/screens/homescreen.dart';
//import 'package:dsc_shop/screens/login.dart';
//import 'package:dsc_shop/tools/language.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageDrawer extends StatefulWidget {
  @override
  _LanguageDrawerState createState() => _LanguageDrawerState();
}

class _LanguageDrawerState extends State<LanguageDrawer> {
  List<String> _languages = ['العربية', 'English'];
  List<String> _emoji = ['🇪🇬', '🇺🇸'];
  String _slLanguage;
  Language _language = Language();

  @override
  void initState() {
    super.initState();
    setState(() => _language.getLanguage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: FaIcon(
          FontAwesomeIcons.language,
          size: 50,
        ),
      ),
      body: ListView.builder(
        itemCount: _languages.length,
        itemBuilder: (context, i) {
          return ListTile(
            title: Text(_languages[i]),
            leading: Text(
              _emoji[i],
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Divider(),
            onTap: () async {
              SharedPreferences pref = await SharedPreferences.getInstance();
              pref.setString('language', _languages[i]);
              _language.setLanguage(_languages[i]);
              language = _languages[i];
              setState(() {
                _slLanguage = _languages[i];
              });
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
