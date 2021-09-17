import 'package:eshop2/providers/items_provider.dart';
import 'package:eshop2/screens/info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Shopping extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Shopping> {
  @override
  Widget build(BuildContext context) {
    TasksProvider basket = Provider.of<TasksProvider>(context);
    return Scaffold(
      body: basket.countShop > 0
          ? SingleChildScrollView(
              child: Column(
                children: [
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemCount: basket.itemsShop.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: () {
                          /*
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductDetails(
                          id: basket.items[i].id,
                          title: basket.items[i].title,
                          category: basket.items[i].category,
                          description: basket.items[i].description,
                          imageUrl: basket.items[i].imageUrl,
                          price: basket.items[i].price,
                        ),
                      ),
                    );
                    */
                        },
                        child: Card(
                          color: Colors.white,
                          shadowColor: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            basket.itemsShop[i].imageUrl),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    basket.itemsShop[i].title.toString(),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        " ₪ ${basket.itemsShop[i].price}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                          color: Colors.red,
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                      IconButton(
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              barrierDismissible: false,
                                              builder: (BuildContext context) {
                                                return CupertinoAlertDialog(
                                                  content: Container(
                                                    height: 100,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          child: Text(
                                                              "Do you want to delete the Product?"),
                                                        ),
                                                        Divider(),
                                                        Row(
                                                          children: [
                                                            TextButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Text(
                                                                  "Cancel"),
                                                            ),
                                                            GestureDetector(
                                                                onTap: () {
                                                                  // basket.itemsShop
                                                                  //   .removeAt(i);
                                                                  //  basket.removeShop(itemsShop[i]);
                                                                  basket.removeShop(
                                                                      basket.itemsShop[
                                                                          i]);
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child:
                                                                    Text("Ok"))
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
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
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${basket.price.toString()} ₪ ",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                      Text(" : السعر الكلي ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  /*
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Data(),
                            ));
                      },
                      child: Text("انتقال الى صفحة الشراء  "))
                      */
                ],
              ),
            )
          : Container(
              alignment: Alignment.topRight,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage("images/car1.png"),
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.darken),
                  //fit: BoxFit.cover,
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Data(),
              ));
        },
        child: Icon(Icons.shop),
        backgroundColor: Colors.red,
      ),
    );
  }
}
