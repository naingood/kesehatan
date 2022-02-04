import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kesehatan/theme.dart';

class HomePage extends StatefulWidget {
  static String tag = 'home-page';
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePage createState() => new _MyHomePage();
}
// Widget build(BuildContext context) {
//   final alucard = Hero(
//     tag: 'hero',
//     child: Padding(
//       padding: EdgeInsets.all(16.0),
//       child: CircleAvatar(
//         radius: 72.0,
//         backgroundColor: Colors.transparent,
//         backgroundImage: AssetImage('assets/logo.png'),
//       ),
//     ),
//   );

//   final welcome = Padding(
//     padding: EdgeInsets.all(8.0),
//     child: Text(
//       'Welcome Alucard',
//       style: TextStyle(fontSize: 28.0, color: Colors.white),
//     ),
//   );

//   final lorem = Padding(
//     padding: EdgeInsets.all(8.0),
//     child: Text(
//       'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec hendrerit condimentum mauris id tempor. Praesent eu commodo lacus. Praesent eget mi sed libero eleifend tempor. Sed at fringilla ipsum. Duis malesuada feugiat urna vitae convallis. Aliquam eu libero arcu.',
//       style: TextStyle(fontSize: 16.0, color: Colors.white),
//     ),
//   );

//   final body = Container(
//     width: MediaQuery.of(context).size.width,
//     padding: EdgeInsets.all(28.0),
//     decoration: BoxDecoration(
//       gradient: LinearGradient(colors: [
//         Colors.blue,
//         Colors.lightBlueAccent,
//       ]),
//     ),
//     child: Column(
//       children: <Widget>[alucard, welcome, lorem],
//     ),
//   );

//   return Scaffold(
//     body: body,
//   );
// }
class _MyHomePage extends State<HomePage> {
  List<String> events = [
    "ambulance",
    "darurat",
    "doctor",
    "education",
    "grafik",
    "jadwal",
    "pasien isoman",
    "riwayat",
    "chat nakes"
  ];

  get primaryColor => null;

  @override
  Widget build(BuildContext context) {
    //create empty app with background
    var container = Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/background1.jpg'), fit: BoxFit.cover),
      ),
      child: GridView(
        physics: BouncingScrollPhysics(),
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        children: events.map((title) {
          return GestureDetector(
            child: Card(
                margin: const EdgeInsets.all(20.0),
                child: getCardByTitle(title)),
            onTap: () {
              Fluttertoast.showToast(
                  msg: title + " click",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            },
          );
        }).toList(),
      ),
    );
    // ignore: prefer_typing_uninitialized_variables

    return Scaffold(body: container);
  }

  Column getCardByTitle(String title) {
    String img = "";
    if (title == "jadwal")
      img = "assets/jadwal.jpg";
    else if (title == "ambulance")
      img = "assets/ambulance.png";
    else if (title == "darurat")
      img = "assets/darurat.png";
    else if (title == "doctor")
      img = "assets/doctor.jpg";
    else if (title == "education")
      img = "assets/education.png";
    else if (title == "grafik")
      img = "assets/grafik.png";
    else if (title == "riwayat")
      img = "assets/riwayat.png";
    else if (title == "pasien isoman")
      img = "assets/lovely_time.png";
    else if (title == "chat nakes") img = "assets/telpon.png";

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Center(
          child: Container(
            child: new Stack(
              children: <Widget>[
                new Image.asset(
                  img,
                  width: 60.0,
                  height: 60.0,
                )
              ],
            ),
          ),
        ),
        Text(
          title,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        )
      ],
    );
      Text(
        'Dunia',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: 45,
          fontWeight: FontWeight.bold,
          color: Colors.red
        ),
      )
  }
}
