import 'package:eshop2/widgets/cloudDatabase.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
//import 'package:intl/intl.dart';

class Data extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Data> {
  String _timeString;
  cloudDatabase dd = cloudDatabase();
  final name = TextEditingController();
  final phone1 = TextEditingController();
  final phone2 = TextEditingController();
  final address = TextEditingController();
  //final date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    var timer = now.hour.toString() +
        ":" +
        now.minute.toString() +
        ":" +
        now.second.toString();
    print(timer);

    var now2 = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now2);
    print(formattedDate);
    //   DateTime now = DateTime.now();
//String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(now);
    final productId = ModalRoute.of(context).settings.arguments;
    print(productId);
    //return Directionality(
    //textDirection: TextDirection.rtl,
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                '  Purchase Order...',
                textStyle: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 5,
                    color: Colors.white),
              ),
            ],
            totalRepeatCount: 10,
            pause: const Duration(milliseconds: 2500),
            displayFullTextOnTap: true,
            stopPauseOnTap: true,
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.blueGrey[50],
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  // Text("$productId",style(textStyle(fontSize:20,fontWeight:FontWeight.bold,color:Colors.black))),
                  //Text("$productId"),

                  /*
                           Padding(  
                          padding: EdgeInsets.all(15),  
                          
                          child: TextField(  
                          //  image
                          
                            decoration: InputDecoration(  
                              border: OutlineInputBorder(),  
                              labelText: 'جدد كم 1 كغم',  
                              hintText: 'كيلو:',  
                            ),  
                          ),  
                        ),
                        */

                  /* Text(
                      "Thank you To Dealing With Us  ",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 5),
                    ),
*/
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      //  image
                      controller: name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'full name',
                        hintText: 'name',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      controller: phone1,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Phone1',
                        hintText: 'ph1',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      controller: phone2,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Phone2',
                        hintText: 'Ph2',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextField(
                      controller: address,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'City/Street',
                        hintText: 'Address',
                      ),
                    ),
                  ),
                  Text(
                    "طريقة الدفع عند الاستلام",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  Text(
                    "موعد الوصول خلال 48 ساعة",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  Text(
                    "رسوم التوصيل بمقدار 10 شيقل",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  /*
                    RaisedButton(
                      textColor: Colors.white,
                      color: Colors.red,
                      child: Text('ارسال الطلب '),
                      onPressed: () {
                        dd
                            .create(address.text, name.text, phone2.text,
                                phone1.text)
                            .then((_) => snackBBar(context));
                      },
                    )
                    */
                ],
              )),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            dd
                .create(address.text, formattedDate, name.text, phone1.text,
                    phone2.text, timer)
                .then((_) => snackBBar(context));
          },
          child: Icon(FontAwesomeIcons.shopify),
          backgroundColor: Colors.red,
        ));
  }
/*
  Future<void> _showDateTimeDialog(BuildContext context) async {
    var datee = await showDatePicker(
        context: context,
        initialDate: DateTime(2021),
        firstDate: DateTime(2021),
        lastDate: DateTime(2022));
    datee.month;
    datee.day;
    datee.year;
    
    var d = datee.year.toString() +
        "-" +
        datee.month.toString() +
        "-" +
        datee.day.toString();
    TimeOfDay d2 =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    var d3 = d2.hour.toString() + "-" + d2.minute.toString();
    setState(() {
      date = d;
      timeeee = d3.toString();
    });
    //  _showTimeDialog(context);
  }
*/

  Widget snackBBar(context) {
    final snackBar = SnackBar(
        content: Text(
          "Thank You To Dealing With Us ",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  /*
  Widget snackBBar(context) {
    final snackBar = SnackBar(
        content: Text(
          "Your Arriver Time : ${date} \n "
          "Time : ${timeeee.toString()}",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  */
}
