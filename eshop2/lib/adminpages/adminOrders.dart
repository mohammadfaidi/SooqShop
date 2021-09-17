import 'package:eshop2/screens/login.dart';
import 'package:eshop2/widgets/cloudDatabase.dart';
import 'package:flutter/material.dart';

class ReadData extends StatefulWidget {
  @override
  _ReadDataState createState() => _ReadDataState();
}

class _ReadDataState extends State<ReadData> {
  List docs = [];
  cloudDatabase db = cloudDatabase();

  initilize() {
    db.inlialize();
    db.read().then((value) => {
          setState(() {
            docs = value;
          })
        });
  }

  @override
  void initState() {
    super.initState();

    initilize();
    print("hello");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Orders page"),
        centerTitle: true,
        backgroundColor: Colors.red,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(
                Icons.login_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => LogIn()));
              },
            ),
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: docs.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: //Text(docs[index]['address']),
                    Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Address : " + docs[index]['address'],
                      style: TextStyle(color: Colors.red),
                    ),
                    Text("Date : " + docs[index]['date'],
                        style: TextStyle(color: Colors.red)),
                    Text("Name : " + docs[index]['name'],
                        style: TextStyle(color: Colors.red)),
                    Text("Nu1 : " + docs[index]['phone1'],
                        style: TextStyle(color: Colors.red)),
                    Text("Nu2 : " + docs[index]['phone2'],
                        style: TextStyle(color: Colors.red)),
                    Text("Time :" + docs[index]['time'],
                        style: TextStyle(color: Colors.red)),
                  ],
                ),

                //subtitle: Text(docs[index]['phone1']),
                //trailing:
                onTap: () {},
              ),
            );
          }),
    );
  }
}
