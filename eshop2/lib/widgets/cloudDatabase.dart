import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class cloudDatabase {
  FirebaseFirestore firestore;
  inlialize() {
    firestore = FirebaseFirestore.instance;
  }

  Future<void> create(String address, String date, String name, String ph1,
      String ph2, String time) async {
    try {
      await FirebaseFirestore.instance.collection('shop').add({
        'address': address,
        'date': date,
        'name': name,
        'phone1': ph1,
        'phone2': ph2,
        'time': time
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> create2(String price, String item) async {
    try {
      await FirebaseFirestore.instance.collection('orders').add({
        'TotalPrice': price,
        'Items': item,
      });
    } catch (e) {
      print(e);
    }
  }

  Future<List> read() async {
    QuerySnapshot querySnapshot;
    List objects = [];
    try {
      querySnapshot = await FirebaseFirestore.instance.collection('shop').get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map object = {
            'address': doc['address'],
            'date': doc['date'],
            'name': doc['name'],
            'phone1': doc['phone1'],
            'phone2': doc['phone2'],
            'time': doc['time'],
          };
          print("man");

          objects.add(object);
        }
      }
      return objects;
    } catch (e) {
      print(e);
      return objects;
    }
  }
}
