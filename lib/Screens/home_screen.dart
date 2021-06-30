import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:it_futurz/Screens/web_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                showAlertDialog(context);
              },
              child: ListTile(
                title: Text("Company Info"),
                trailing: Icon(Icons.arrow_forward),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => NewWebView(),
                  ),
                );
              },
              child: ListTile(
                title: Text("Hoblist"),
                trailing: Icon(Icons.arrow_forward),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('IT Futurz'),
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BoxWidget(),
              BoxWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // ignore: deprecated_member_use
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text("Company Info"),
    content: Text(
        "Company: Geeksynergy Technologies Pvt Ltd\nAddress:  Sanjay Nagar, Bengaluru-56\nPhone:XXXXXXXXX09\nEmail: XXXXXX@gmail.com"),
    actions: [
      okButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class BoxWidget extends StatelessWidget {
  const BoxWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              children: [
                Icon(
                  Icons.arrow_drop_up_outlined,
                  size: 62,
                  color: Colors.grey,
                ),
                Text(
                  '1',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                Icon(
                  Icons.arrow_drop_down_sharp,
                  size: 62,
                  color: Colors.grey,
                ),
              ],
            ),
            FlutterLogo(
              size: 82,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bond 26',
                    style: TextStyle(fontSize: 22),
                  ),
                  SizedBox(height: 8),
                  Details(
                    text: 'Genere',
                    value: 'Action, Adventure, Thriller',
                  ),
                  Details(
                    text: 'Director',
                    value: 'Cary Joji Fukunaga',
                  ),
                  Details(
                    text: 'Starting',
                    value: 'Starting Ana de Armas, Rami dsvsd',
                  ),
                  Text('Mins | English | 2Apr'),
                  SizedBox(height: 4),
                  Text(
                    '137 views | Voted by 1 People',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  )
                ],
              ),
            )
          ],
        ),
        Container(
          height: 40,
          margin: EdgeInsets.only(top: 6),
          width: double.infinity,
          child: CupertinoButton(
            padding: EdgeInsets.all(8),
            child: Text('Watch Trailer'),
            onPressed: () {},
            color: Theme.of(context).primaryColor,
          ),
        ),
        Divider(
          thickness: 2,
        )
      ],
    );
  }
}

class Details extends StatelessWidget {
  final String? text;
  final String? value;
  const Details({
    Key? key,
    this.text,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            '$text: ',
            style: TextStyle(color: Colors.grey),
          ),
          Expanded(
              child: Text(
            '$value',
            overflow: TextOverflow.ellipsis,
          )),
        ],
      ),
    );
  }
}
