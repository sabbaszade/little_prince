import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:littleprince/story.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';

class StoryDetails extends StatefulWidget {
  final String title;
  final Story story;

  const StoryDetails({Key key, this.title, this.story}) : super(key: key);

  //static for night mode
  static bool pressed = true;

  @override
  _StoryDetailsState createState() => _StoryDetailsState();
}

class _StoryDetailsState extends State<StoryDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            Scaffold(
              backgroundColor: StoryDetails.pressed
                  ? Color.fromRGBO(247, 247, 247, 1)
                  : Color.fromRGBO(21, 30, 39, 1),
              appBar: AppBar(
                title: Text(
                  widget.story.title,
                  style: TextStyle(
                      color: StoryDetails.pressed
                          ? Color.fromRGBO(90, 90, 90, 1)
                          : Color.fromRGBO(254, 254, 254, 1)),
                ),
                backgroundColor: StoryDetails.pressed
                    ? widget.story.color
                    : Color.fromRGBO(33, 45, 59, 1),
                iconTheme: StoryDetails.pressed ? IconThemeData(
                    color: Color.fromRGBO(90, 90, 90, 1)) : IconThemeData(
                    color: Colors.white),
                elevation: 0,
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
              body: Scrollbar(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      StoryDetailsPoster(
                        poster: widget.story.image[0],
                        trackNumber: widget.story.track,
                        color: widget.story.color,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FullStory(
                        fullStory: widget.story.desc.replaceAll('7777777', ''),
                      ),
                      HorizontalLine(
                        color: widget.story.color,
                      ),
                      StoryExtraPictures(
                        pictures: widget.story.image,
                        color: widget.story.color,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

//details poster
class StoryDetailsPoster extends StatefulWidget {
  final String poster;
  final int trackNumber;
  final Color color;

  const StoryDetailsPoster({Key key, this.poster, this.trackNumber, this.color})
      : super(key: key);

  @override
  _StoryDetailsPosterState createState() => _StoryDetailsPosterState();
}

class _StoryDetailsPosterState extends State<StoryDetailsPoster> {
  //for audio
  Duration _duration = new Duration();
  AudioPlayerState _currentState;
  Duration _position = new Duration();

  static AudioPlayer advancedPlayer = new AudioPlayer();
  static AudioCache audioCache = new AudioCache(fixedPlayer: advancedPlayer);

  static int index;

  @override
  void initState() {
    super.initState();
    initMyPlayer();
  }

  // try new code
  void initMyPlayer() {
    advancedPlayer.onDurationChanged.listen((Duration d) {
      // print('Max duration: $d');
      setState(() => _duration = d);
    });

    advancedPlayer.onAudioPositionChanged.listen((Duration p) {
      //print('Current position: $p');
      setState(() {
        if (widget.trackNumber == index)
          _position = p;
        else
          _position = Duration(seconds: 0);
      });
    });

    advancedPlayer.onPlayerStateChanged.listen((AudioPlayerState s) {
      print('Current player state: $s');
      setState(() {
        _currentState = s;
        if (advancedPlayer.state == AudioPlayerState.COMPLETED) {
          _position = Duration(seconds: 0);
          pausePlayToggle();
        }
      });
    });
  }

// end audio when back screen
  @override
  void dispose() {
    super.dispose();
    advancedPlayer.stop();
  }

  Widget slider() {
    return Slider(
      value: _position.inSeconds.toDouble(),
      activeColor: StoryDetails.pressed ? Theme
          .of(context)
          .primaryColor : Color.fromRGBO(135, 196, 251, 1),
      inactiveColor: StoryDetails.pressed
          ? Color.fromRGBO(250, 234, 235, 1)
          : Color.fromRGBO(98, 140, 190, 0.3),
      min: 0.0,
      max: _duration.inSeconds.toDouble(),
      onChanged: (double value) {
        setState(() {
          seekToSecond(value.toInt());
          value = value;
        });
      },
    );
  }

  void seekToSecond(int second) {
    Duration newDuration = Duration(seconds: second);
    advancedPlayer.seek(newDuration);
  }

  bool _isVisible = true;
  bool _notVisible = false;

  pausePlayToggle() {
    setState(() {
      _isVisible = !_isVisible;
    });

    setState(() {
      _notVisible = !_isVisible;
    });
  }

  void showPause(int storyNum) {
    index = storyNum;
    pausePlayToggle();
    advancedPlayer.resume();
    // Sections.advancedPlayer.stop();
    audioCache.play('audio/Shazdeh$storyNum.mp3');
  }

  void showPlay(int storyNum) {
    index = storyNum;
    pausePlayToggle();
    advancedPlayer.pause();
  }

//end of audio
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              color: StoryDetails.pressed ? widget.color : Color.fromRGBO(
                  34, 46, 58, 1),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: 220,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      image: DecorationImage(
                          image: AssetImage(widget.poster),
                          fit: BoxFit.fill,
                          colorFilter: StoryDetails.pressed
                              ?
                          ColorFilter.mode(Colors.grey, BlendMode.softLight)
                              : ColorFilter.mode(
                              Colors.black, BlendMode.lighten))),
                ),
              ),
            ),
            Stack(
              children: <Widget>[
                Offstage(
                  offstage: _isVisible,
                  child: IconButton(
                    icon: Icon(Icons.pause_circle_outline),
                    iconSize: 80,
                    color: StoryDetails.pressed ? Theme
                        .of(context)
                        .primaryColor : Color.fromRGBO(135, 196, 251, 1),
                    onPressed: () {
                      //showPlay(widget.trackNumber);
                      if (widget.trackNumber != 0) {
                        showPlay(widget.trackNumber);
                      }
                      if (widget.trackNumber == 0) {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          duration: Duration(minutes: 5),
                          content:
                          Text('این فصل توسط استاد شاملو خوانده نشده است.'),
                          action: SnackBarAction(
                              label: 'باشه',
                              onPressed: () {
                                return;
                              }),
                        ));
                      }
                    },
                  ),
                ),
                Offstage(
                  offstage: _notVisible,
                  child: IconButton(
                      icon: Icon(Icons.play_circle_outline),
                      iconSize: 80,
                      color: StoryDetails.pressed ? Theme
                          .of(context)
                          .primaryColor : Color.fromRGBO(135, 196, 251, 1),
                      onPressed: () {
                        //  showPause(widget.trackNumber);
                        if (widget.trackNumber != 0) {
                          showPause(widget.trackNumber);
                        }
                        if (widget.trackNumber == 0) {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            duration: Duration(minutes: 5),
                            content: Text(
                                'این فصل توسط استاد شاملو خوانده نشده است.'),
                            action: SnackBarAction(
                                label: 'باشه',
                                onPressed: () {
                                  return;
                                }),
                          ));
                        }
                      }),
                ),
              ],
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0x00f5f5f5), Color(0xfff5f5f5)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          height: 80,
        ),
        slider(),
      ],
    );
  }
}

// full story
class FullStory extends StatefulWidget {
  final String fullStory;

  const FullStory({Key key, this.fullStory}) : super(key: key);

  @override
  _FullStoryState createState() => _FullStoryState();
}

class _FullStoryState extends State<FullStory> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            color: StoryDetails.pressed
                ? Color.fromRGBO(251, 251, 251, 1)
                : Color.fromRGBO(34, 46, 58, 1),
            child: SelectableText.rich(
              TextSpan(
                  style: StoryDetails.pressed
                      ? TextStyle(fontSize: 20, fontWeight: FontWeight.w300)
                      : TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(250, 250, 250, 1)),
                  children: <TextSpan>[TextSpan(text: widget.fullStory)]),
              textAlign: TextAlign.justify,
              enableInteractiveSelection: true,
              toolbarOptions: ToolbarOptions(selectAll: false, copy: true),
              onTap: () {
                //  ClipboardData data = await Clipboard.getData('text/plain');
                print('salamm');
              },
            ),
          ),
//          FloatingActionButton(
//            onPressed: () {
//              setState(() {
//               pressed = !pressed;
//              });
//            },
//            child: Icon(
//              Icons.brightness_4,
//              color: Colors.black54,
//            ),
//          ),
        ],
      ),
    );
  }
}

// hori
class HorizontalLine extends StatelessWidget {
  final Color color;

  const HorizontalLine({Key key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Container(
        height: 2,
        color: color,
      ),
    );
  }
}

//EXTERA PictureS
class StoryExtraPictures extends StatelessWidget {
  final List<String> pictures;
  final Color color;

  const StoryExtraPictures({Key key, this.pictures, this.color})
      : super(key: key);

// small method for showing extra pic or no
  Widget _showTextNaghashiA() {
    if (pictures.length - 1 > 0) {
      return Row(
        children: <Widget>[
          Text(
            'نقاشی ها',
            style: StoryDetails.pressed
                ? TextStyle(
                color: Color.fromRGBO(139, 151, 163, 1), fontSize: 14)
                : TextStyle(
                color: Color.fromRGBO(116, 122, 135, 1), fontSize: 14),
          ),
          SizedBox(width: 5,),
          Text(
            '(${pictures.length - 1 })',
            style: StoryDetails.pressed
                ? TextStyle(
                color: Color.fromRGBO(139, 151, 163, 1), fontSize: 14)
                : TextStyle(
                color: Color.fromRGBO(116, 122, 135, 1), fontSize: 14),
          ),
        ],
      );
    } else
      return Text('');
  }

  Widget _showExtraPictures() {
    if (pictures.length - 1 <= 0) {
      return Container(
        height: 5,
      );
    }
    if (pictures.length - 1 > 0) {
      return Container(
        height: 160,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) =>
              SizedBox(
                width: 10,
              ),
          itemCount: pictures.length - 1,
          itemBuilder: (context, index) =>
              ClipRRect(
                // borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width / 2 - 10,
                  height: 140,
                  decoration: BoxDecoration(
                      border: Border.all(width: 10,
                          color: StoryDetails.pressed ? color : Color.fromRGBO(
                              124, 142, 154, 1)),
                      image: DecorationImage(
                          image: AssetImage(pictures[index + 1]),
                          fit: BoxFit.fill)),
                ),
              ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: _showTextNaghashiA(),
        ),
        _showExtraPictures(),
      ],
    );
  }
}
