import 'package:flutter/material.dart';

class MessagesView extends StatelessWidget {
  const MessagesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = List<String>.generate(100, (i) => "Item $i");
    return Scaffold(
      appBar: AppBar(title: Text("Messages"), actions: <Widget>[
        Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                showLogoutDialog(context);
              },
              child: Icon(
                Icons.logout,
                size: 25,
              ),
            )),
      ]),
      body: Center(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Card(
                child: ListTile(
              // leading: FlutterLogo(size: 72.0),
              leading: Icon(Icons.person, size: 60),
              title: Text('Name'),
              subtitle: Text(
                  'A sufficiently long subtitle warrants three lines. This is the second line. aaaaaaaaaaaaaaaaaaaaaaaaa. bbbbbbbbbbbbbbb'),
            ));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showPostMessageDialog(context);
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }

  void showPostMessageDialog(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("New Message"),
          content: TextField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
          ),
          actions: <Widget>[
            new TextButton(
              child: new Text("POST MESSAGE"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            // usually buttons at the bottom of the dialog
            new TextButton(
              child: new Text("CLOSE"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void showLogoutDialog(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Logout"),
          content: RichText(
            text: TextSpan(
              text: 'Are you sure you want to sign out? ',
              style: DefaultTextStyle.of(context).style,
            ),
          ),
          actions: <Widget>[
            new TextButton(
              child: new Text("YES"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            // usually buttons at the bottom of the dialog
            new TextButton(
              child: new Text("NO"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
