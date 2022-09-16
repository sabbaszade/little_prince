import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:littleprince/story_details.dart';
import 'story.dart';
import 'main_drawer.dart';

class Sections extends StatefulWidget {
  @override
  _SectionsState createState() => _SectionsState();
}

class _SectionsState extends State<Sections> {
  final List<Story> storiesList = Story.getStories();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StoryDetails.pressed
          ? Color.fromRGBO(247, 247, 247, 1)
          : Color.fromRGBO(29, 39, 51, 1),
      appBar: AppBar(
        title: Text(
          'شازده کوچولو',
          style: TextStyle(
              color: StoryDetails.pressed
                  ? Color.fromRGBO(90, 90, 90, 1)
                  : Color.fromRGBO(254, 254, 254, 1)),
        ),
        backgroundColor: StoryDetails.pressed
            ? Theme
            .of(context)
            .primaryColor
            : Color.fromRGBO(33, 45, 59, 1),
        iconTheme: StoryDetails.pressed
            ? IconThemeData(color: Color.fromRGBO(90, 90, 90, 1))
            : IconThemeData(color: Colors.white),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.brightness_2,
                color: StoryDetails.pressed
                    ? Color.fromRGBO(90, 90, 90, 1)
                    : Color.fromRGBO(254, 254, 254, 1),
              ),
              onPressed: () {
                setState(() {
                  StoryDetails.pressed = !StoryDetails.pressed;
                });
              })
        ],
      ),
      drawer: MainDrawer(),
      body: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Stack(
              children: <Widget>[
                storyCard(storiesList[index], context),
                Positioned(
                  child: storyImage(storiesList[index].image[0]),
                  top: 10,
                  right: 10,
                )
              ],
            );
          },
          itemCount: storiesList.length,
        ),
      ),
    );
  }

  Widget storyCard(Story story, BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(right: 60),
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: 130,
        child: Card(
          color: StoryDetails.pressed
              ? story.color.withOpacity(0.9)
              : story.color.withOpacity(0.8),
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8, right: 54),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    story.title,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(65, 57, 68, 1)),
                  ),
                  Expanded(
                      child: Text(
                        story.desc.split('7777777')[0],
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(106, 100, 88, 1)),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,)),
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) =>
                StoryDetails(
                  title: story.title,
                  story: story,
                ),
          ),
        );
      },
    );
  }

  Widget storyImage(String image) {
    return Container(
      width: 110,
      height: 110,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
              colorFilter: StoryDetails.pressed
                  ? ColorFilter.mode(Colors.grey, BlendMode.softLight)
                  : ColorFilter.mode(Colors.black, BlendMode.lighten))),
    );
  }
}
