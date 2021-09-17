import 'package:eshop2/providers/items_provider.dart';
import 'package:eshop2/providers/language.dart';
import 'package:eshop2/screens/Favorite.dart';
import 'package:eshop2/screens/Home.dart';
import 'package:eshop2/screens/Shopping.dart';
import 'package:eshop2/widgets/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<HomeScreen> {
  //List<String> _titles = ["Home", "Profile", "Shop"];
  Language _language = Language();
  List<Widget> _items = [
    Home(),
    Favorite(),
    Shopping(),
  ];
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    setState(() => _language.getLanguage());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    TasksProvider basket = Provider.of<TasksProvider>(context);

    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 20,
        title: Text(
          "${_language.tSooq()}",
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    //Navigator.of(context).push(
                    //  MaterialPageRoute(builder: (context) => Shopping()));
                  },
                ),
                basket.countShop == 0
                    ? Container()
                    : Text(basket.countShop.toString()),
              ],
            ),
          )
        ],
        centerTitle: true,
      ),
      body: Center(
          child: IndexedStack(
              index: _selectedIndex,
              children: _items) //_items.elementAt(_index),
          ),
      bottomNavigationBar: _showBottomNav(size),
    );
  }

  Widget _showBottomNav(size) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favorite',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag),
          label: 'Shopping',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[400],
      unselectedItemColor: Colors.white,
      backgroundColor: Colors.red,
      onTap: _onTap,
    );
  }

  void _onTap(int index) {
    _selectedIndex = index;
    setState(() {});
  }
}
