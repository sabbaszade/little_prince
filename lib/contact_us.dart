import 'package:flutter/material.dart';
import 'package:littleprince/story_details.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  void _launchURL() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'its_codingtime@hotmail.com',
    );
    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/contact.gif"),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('ارتباط با ما',
              style: TextStyle(
                  color: StoryDetails.pressed
                      ? Color.fromRGBO(90, 90, 90, 1)
                      : Color.fromRGBO(254, 254, 254, 1))),
          backgroundColor: StoryDetails.pressed
              ? Theme
              .of(context)
              .primaryColor
              : Color.fromRGBO(29, 39, 51, 1),
          iconTheme: StoryDetails.pressed ? IconThemeData(
              color: Color.fromRGBO(90, 90, 90, 1)) : IconThemeData(
              color: Colors.white),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Card(
                  elevation: 6,
                  color: StoryDetails.pressed
                      ? Color.fromRGBO(255, 255, 255, 0.75)
                      : Color.fromRGBO(34, 46, 58, 0.9),
                  margin: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 25.0,
                  ),
                  child: ListTile(
                    leading: Icon(
                      FontAwesomeIcons.phone,
                      color: StoryDetails.pressed
                          ? Theme
                          .of(context)
                          .primaryColor
                          : Color.fromRGBO(124, 142, 154, 1),
                    ),
                    title: Center(
                      child: FittedBox(
                        child: Text(
                          'Sanaz Abbaszadeh',
                          style: StoryDetails.pressed
                              ? TextStyle(
                              fontFamily: 'SourceSans',
                              color: Colors.blueGrey.shade900,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold)
                              : TextStyle(
                              fontFamily: 'SourceSans',
                              color: Color.fromRGBO(251, 249, 250, 1),
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    subtitle: Center(
                        child: Text('09155574578', style: StoryDetails.pressed
                            ? TextStyle(
                          color: Color.fromRGBO(137, 138, 138, 1),
                        )
                            : TextStyle(
                          color: Color.fromRGBO(114, 130, 145, 1),
                        ),)),
                    onTap: () {
                      launch("tel: +989155574578");
                    },
                  )),
              Card(
                  elevation: 6,
                  color: StoryDetails.pressed
                      ? Color.fromRGBO(255, 255, 255, 0.75)
                      : Color.fromRGBO(34, 46, 58, 0.9),
                  margin: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 25.0,
                  ),
                  child: ListTile(
                    leading: Icon(
                      FontAwesomeIcons.mailBulk,
                      color: StoryDetails.pressed
                          ? Theme
                          .of(context)
                          .primaryColor
                          : Color.fromRGBO(124, 142, 154, 1),
                    ),
                    title: Center(
                      child: FittedBox(
                        child: Text(
                          'its_codingtime@hotmail.com',
                          style: StoryDetails.pressed
                              ? TextStyle(
                              fontFamily: 'SourceSans',
                              color: Colors.blueGrey.shade900,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold)
                              : TextStyle(
                              fontFamily: 'SourceSans',
                              color: Color.fromRGBO(251, 249, 250, 1),
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    subtitle: Center(child: Text(
                      'Hotmail account', style: StoryDetails.pressed
                        ? TextStyle(
                      color: Color.fromRGBO(137, 138, 138, 1),
                    )
                        : TextStyle(
                      color: Color.fromRGBO(114, 130, 145, 1),
                    ),)),
                    onTap: () {
                      _launchURL();
                    },
                  )),

              Card(
                  elevation: 6,
                  color: StoryDetails.pressed
                      ? Color.fromRGBO(255, 255, 255, 0.75)
                      : Color.fromRGBO(34, 46, 58, 0.9),
                  margin: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 25.0,
                  ),
                  child: ListTile(
                    leading: Icon(
                      FontAwesomeIcons.instagram,
                      color: StoryDetails.pressed
                          ? Theme
                          .of(context)
                          .primaryColor
                          : Color.fromRGBO(124, 142, 154, 1),
                    ),
                    title: Center(
                      child: FittedBox(
                        child: Text(
                          'its_codingtime',
                          style: StoryDetails.pressed
                              ? TextStyle(
                              fontFamily: 'SourceSans',
                              color: Colors.blueGrey.shade900,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold)
                              : TextStyle(
                              fontFamily: 'SourceSans',
                              color: Color.fromRGBO(251, 249, 250, 1),
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    onTap: () async {
                      const url = 'https://www.instagram.com/its_codingtime/';

                      if (await canLaunch(url)) {
                        await launch(url, forceSafariVC: false);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    subtitle: Center(child: Text(
                      'Instagram account', style: StoryDetails.pressed
                        ? TextStyle(
                      color: Color.fromRGBO(137, 138, 138, 1),
                    )
                        : TextStyle(
                      color: Color.fromRGBO(114, 130, 145, 1),
                    ),)),
                  )),
              Card(
                  elevation: 6,
                  color: StoryDetails.pressed
                      ? Color.fromRGBO(255, 255, 255, 0.75)
                      : Color.fromRGBO(34, 46, 58, 0.9),
                  margin: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 25.0,
                  ),
                  child: ListTile(
                    leading: Icon(
                      FontAwesomeIcons.telegram,
                      color: StoryDetails.pressed
                          ? Theme
                          .of(context)
                          .primaryColor
                          : Color.fromRGBO(124, 142, 154, 1),
                    ),
                    title: Center(
                      child: FittedBox(
                        child: Text(
                          't.me/its_codingtime',
                          style: StoryDetails.pressed
                              ? TextStyle(
                              fontFamily: 'SourceSans',
                              color: Colors.blueGrey.shade900,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold)
                              : TextStyle(
                              fontFamily: 'SourceSans',
                              color: Color.fromRGBO(251, 249, 250, 1),
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    subtitle: Center(
                        child: Text(
                          'Telegram channel',
                          style: StoryDetails.pressed
                              ? TextStyle(
                            color: Color.fromRGBO(137, 138, 138, 1),
                          )
                              : TextStyle(
                            color: Color.fromRGBO(114, 130, 145, 1),
                          ),
                        )),
                    onTap: () async {
                      const url = 'https://t.me/its_codingtime';

                      if (await canLaunch(url)) {
                        await launch(url, forceSafariVC: false);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
