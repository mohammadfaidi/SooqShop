import 'package:eshop2/providers/items.dart';
import 'package:eshop2/providers/items_provider.dart';
import 'package:eshop2/providers/language.dart';
import 'package:eshop2/screens/productdetail.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:eshop2/model/products.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool selected = false;
  Future<List<Prodaucts>> getData() async {
    String url = "http://fakestoreapi.com/products/";
    var jsonData = await http.get(Uri.parse(url));
    if (jsonData.statusCode == 200) {
      List data = jsonDecode(jsonData.body);
      List<Prodaucts> allUsers = [];

      for (var j in data) {
        Prodaucts prodaucts = Prodaucts.fromJason(j);
        allUsers.add(prodaucts);
      }
      return allUsers;
    } else {
      throw Exception("error");
    }
  }

  Future<List<Prodaucts>> users;
  @override
  void initState() {
    super.initState();
    users = getData();
  }

  @override
  Widget build(BuildContext context) {
    TasksProvider basket = Provider.of<TasksProvider>(context);

    return Scaffold(
      body: FutureBuilder<List<Prodaucts>>(
        future: users,
        builder: (ctx, snapShout) {
          if (snapShout.hasData) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: snapShout.data.length,
              itemBuilder: (context, i) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductDetails(
                          id: snapShout.data[i].id,
                          title: snapShout.data[i].title,
                          category: snapShout.data[i].category,
                          description: snapShout.data[i].description,
                          imageUrl: snapShout.data[i].imageUrl,
                          price: snapShout.data[i].price,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    color: Colors.white,
                    shadowColor: Colors.red,
                    margin: EdgeInsets.all(5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 4,
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      NetworkImage(snapShout.data[i].imageUrl),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              snapShout.data[i].title.toString().trim(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    icon: Icon(
                                      //selected
                                      Icons.shop_outlined,
                                      size: 20.0,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      basket.addCountShop();
                                      ItemModel itemModel = new ItemModel(
                                        id: snapShout.data[i].id,
                                        category: snapShout.data[i].category,
                                        imageUrl: snapShout.data[i].imageUrl,
                                        description:
                                            snapShout.data[i].description,
                                        price: snapShout.data[i].price,
                                        title: snapShout.data[i].title,
                                      );
                                      //  Provider.of<TasksProvider>(context)
                                      //    .addFShop(itemModel);
                                      basket.addFShop(itemModel);
                                    }),
                                Text(
                                  " ${snapShout.data[i].price}₪",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Colors.red,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                                IconButton(
                                    icon: Icon(
                                      //selected?Icons. .. : Icons
                                      Icons.favorite_border_outlined,
                                      size: 20.0,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      basket.addCountFav();
                                      ItemModel itemModel = new ItemModel(
                                        id: snapShout.data[i].id,
                                        category: snapShout.data[i].category,
                                        imageUrl: snapShout.data[i].imageUrl,
                                        description:
                                            snapShout.data[i].description,
                                        price: snapShout.data[i].price,
                                        title: snapShout.data[i].title,
                                      );
                                      //  Provider.of<TasksProvider>(context)
                                      //    .addFShop(itemModel);
                                      basket.addFav(itemModel);
                                      //selected=!selected ;
                                    })
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.red,
            ),
          );
        },
      ),
    );
  }
}
