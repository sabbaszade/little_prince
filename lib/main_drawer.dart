import 'package:flutter/material.dart';
import 'package:littleprince/about_book.dart';
import 'package:littleprince/contact_us.dart';
import 'package:littleprince/notes.dart';
import 'package:littleprince/sections.dart';
import 'package:littleprince/story_details.dart';

class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
//        size: 26,
        color: StoryDetails.pressed
            ? Color.fromRGBO(255, 179, 186, 1)
            : Color.fromRGBO(124, 142, 154, 1),
      ),
      title: Text(
        title,
        style: StoryDetails.pressed
            ? TextStyle(color: Colors.black)
            : TextStyle(color: Color.fromRGBO(245, 247, 246, 1)),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color:
        StoryDetails.pressed ? Colors.white : Color.fromRGBO(33, 45, 59, 1),
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
              width: double.infinity,
              padding: EdgeInsets.all(0),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                      image: AssetImage('assets/images/mydrawer.png'),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              height: 5,
            ),
            buildListTile('درباره ی اثر', Icons.info_outline, () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                return AboutBook();
              }));
            }),
            buildListTile('یادداشت ها', Icons.event_note, () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                return Notes();
              }));
            }),
            buildListTile('حالت مطالعه', Icons.brightness_2, () {
              setState(() {
                StoryDetails.pressed = !StoryDetails.pressed;
                // Navigator.pop(context, true);
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (ctx) {
                      return Sections();
                    }));
              });
            }),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Divider(
                  height: 2,
                  color: StoryDetails.pressed
                      ? Theme
                      .of(context)
                      .primaryColor
                      : Color.fromRGBO(8, 15, 23, 1)),
            ),
            buildListTile('ارتباط با ما', Icons.email, () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                return ContactUs();
              }));
            }),
          ],
        ),
      ),
    );
  }
}
