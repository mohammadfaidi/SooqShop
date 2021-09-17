import 'package:eshop2/providers/items_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class About extends StatelessWidget {
  Future<void> _launch;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    TasksProvider urlLauncher = Provider.of<TasksProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(
              "This application is an onLine store, the application is easy, simple and secure",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),

            /* Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Created with : ",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                FlutterLogo(),
                Text("Flutter Cross Platform"),
              ],
            ),
            */
            Text(
              "Created and Developed by =>",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: size.width / 2.7,
              height: size.height * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                boxShadow: [BoxShadow(offset: Offset(4, 4))],
                image: DecorationImage(
                  image: NetworkImage(
                      'https://scontent.fcai1-2.fna.fbcdn.net/v/t1.6435-9/151302916_2526024984366934_4606042628157522775_n.jpg?_nc_cat=107&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeEqC9HNT3DXwy41G9z9xFGAVnjmGAyUhxlWeOYYDJSHGSjGBJAd6wXvyaOfJGsl7Cqjxkl2M8Ky2_KE6eTlYnRX&_nc_ohc=UVdnd1vcr7AAX94tekr&_nc_ht=scontent.fcai1-2.fna&oh=390823aa097c529517ac44b847ec4ff4&oe=613DFD66'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            UrlLauncher(
              icon: FontAwesomeIcons.code,
              colorIcon: Colors.black,
              text: "Mobile application dev",
              colorText: Colors.black,
            ),
            UrlLauncher(
              icon: FontAwesomeIcons.github,
              colorIcon: Colors.black,
              text: "mohammadfaidi",
              colorText: Colors.black,
              onTap: () {
                _launch =
                    urlLauncher.gitHup("https://github.com/mohammadfaidi");
              },
            ),
            UrlLauncher(
              icon: FontAwesomeIcons.envelope,
              colorIcon: Colors.amber,
              text: "MohamadFaidi",
              colorText: Colors.amber,
              onTap: () {
                _launch = urlLauncher.email(
                    "mailto:mohamadfaidi@outlook.com?subject=UrlPackage&body=It is awesome");
              },
            ),
            UrlLauncher(
              icon: FontAwesomeIcons.facebook,
              colorIcon: Colors.blue[900],
              text: "Mohammad Faidi",
              colorText: Colors.blue[900],
              onTap: () {
                _launch = urlLauncher.faceBook(
                    "https://web.facebook.com/profile.php?id=100008783705032");
              },
            ),
            UrlLauncher(
              icon: FontAwesomeIcons.mobile,
              colorIcon: Colors.orangeAccent,
              text: " 00972598178584",
              colorText: Colors.orange,
              onTap: () {
                _launch = urlLauncher.phone("tel:00972598178584");
              },
            ),
            UrlLauncher(
              icon: FontAwesomeIcons.sms,
              colorIcon: Colors.teal,
              text: "00972598178584",
              colorText: Colors.teal,
              onTap: () {
                _launch = urlLauncher.sms("sms:00972598178584");
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget UrlLauncher({
    onTap,
    icon,
    colorIcon,
    colorText,
    text,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              icon,
              color: colorIcon,
              size: 30,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: colorText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
