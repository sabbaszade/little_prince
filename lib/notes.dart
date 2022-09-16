import 'package:flutter/material.dart';
import 'package:littleprince/story_details.dart';

class Notes extends StatelessWidget {
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
            title: Text('یادداشت ها', style: TextStyle(
                color: StoryDetails.pressed
                    ? Color.fromRGBO(90, 90, 90, 1)
                    : Color.fromRGBO(254, 254, 254, 1))),
            backgroundColor: StoryDetails.pressed ? Theme
                .of(context)
                .primaryColor : Color.fromRGBO(29, 39, 51, 1),
            iconTheme: StoryDetails.pressed ? IconThemeData(
                color: Color.fromRGBO(90, 90, 90, 1)) : IconThemeData(
                color: Colors.white),
          ),
          body: Scrollbar(
            child: Container(
              margin: EdgeInsets.all(30),
              padding: EdgeInsets.all(20),
              color: StoryDetails.pressed
                  ? Color.fromRGBO(255, 255, 255, 0.75)
                  : Color.fromRGBO(34, 46, 58, 0.9),
              child: SingleChildScrollView(
                child: Text.rich(
                    TextSpan(
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w300),
                        children: <TextSpan>[
                          TextSpan(
                              text: "شازده کوچولو : اهلی کردن یعنی چی؟\nروباه : چیزی ست که پاک فراموش شده…معنی اش ایجاد علاقه کردن است.\n\n",
                              style: TextStyle(
                                  color: Colors.black87,
                                  backgroundColor: Color.fromRGBO(
                                      255, 179, 186, 1),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: "شازده کوچولو: این راز منه. خیلی سادست؛ تو فقط با قلبت می تونی چیزی را به درستی ببینی؛ چیزی که واقعیه با چشم دیده نمی شه\n\n",
                              style: TextStyle(
                                  color: Colors.black87,
                                  backgroundColor: Color.fromRGBO(
                                      255, 223, 186, 1),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: "شازده کوچولو پرسید : کی اوضاع بهتر میشه؟\nروباه گفت : از وقتی که بفهمی همه چیز به خودت بستگی داره\n\n\n",
                              style: TextStyle(
                                  color: Colors.black87,
                                  backgroundColor: Color.fromRGBO(
                                      255, 255, 186, 1),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: "شازده کوچولو : اگر تو عاشق گل هایی باشی که روی ستاره ها زندگی می کنند خیلی لذت بخشه که شب ها به آسمون نگاه کنی.\nچون همه ی ستاره ها مثل شکوفه های یک گل سرخ هستن …\n\n",
                              style: TextStyle(
                                  color: Colors.black87,
                                  backgroundColor: Color.fromRGBO(
                                      186, 255, 201, 1),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: "ارزش گلِ تو به اندازه‌ی وقتیست که برایش صرف کرده ای... \n\n",
                              style: TextStyle(
                                  color: Colors.black87,
                                  backgroundColor: Color.fromRGBO(
                                      186, 225, 255, 1),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: "شازده کوچولو پرسید:  دوست داشتن بهتره یا دوست داشته شدن ؟\nروباه جواب داد:  کدوم یکی برای پرنده مهمتره ؟ بال چپ یا بال راست ؟\n\n",
                              style: TextStyle(
                                  color: Colors.black87,
                                  backgroundColor: Color.fromRGBO(
                                      219, 220, 255, 1),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: "روباه : انسان ها این حقیقت را فراموش کرده اند؛ اما تو نباید فراموشش کنی .\nتو تا زنده ای نسبت به چیزی که اهلی کرده ای مسئولی\n\n",
                              style: TextStyle(
                                  color: Colors.black87,
                                  backgroundColor: Color.fromRGBO(
                                      254, 255, 163, 1),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: "شازده کوچولو : وفاداری یعنی چی ؟\nروباه : یعنی اگه تو سیارات دیگه گلی دیگه ای بود تو عاشق گل خودت باشی ...\n\n",
                              style: TextStyle(
                                  color: Colors.black87,
                                  backgroundColor: Color.fromRGBO(
                                      255, 212, 229, 1),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: "شازده کوچولو  : دیگه مهم نیست !\nروباه  : مهمترين خاطره ها همونايى هستن كه ميگيم ديگه مهم نيست.\n\n",
                              style: TextStyle(
                                  color: Colors.black87,
                                  backgroundColor: Color.fromRGBO(
                                      212, 255, 234, 1),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: "فقط بچه ها می دانند که در جستجوی چه هستند...\n\n",
                              style: TextStyle(
                                  color: Colors.black87,
                                  backgroundColor: Color.fromRGBO(
                                      238, 203, 255, 1),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: "آدم ها همۀ چیزها را ساخته و آماده از فروشنده‌ها می‌خرند. ولی چون کسی نیست که دوست بفروشد آدم‌ها دیگر دوستی ندارند!\n\n",
                              style: TextStyle(
                                  color: Colors.black87,
                                  backgroundColor: Color.fromRGBO(
                                      247, 190, 137, 1),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: "از کجا بفهمم وابسته شدم ؟\n شازده : تا هست نمیفهمی\n\n",
                              style: TextStyle(
                                  color: Colors.black87,
                                  backgroundColor: Color.fromRGBO(
                                      202, 243, 243, 1),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold)),

                        ]),
                    textAlign: TextAlign.justify),
              ),
            ),
          )),
    );
  }
}
