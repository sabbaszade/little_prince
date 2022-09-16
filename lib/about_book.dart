import 'package:flutter/material.dart';
import 'story_details.dart';

class AboutBook extends StatelessWidget {
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
            title: Text('درباره ی اثر',
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
                        style: StoryDetails.pressed
                            ? TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: Colors.black)
                            : TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: Color.fromRGBO(251, 249, 250, 1)),
                        children: <TextSpan>[
                          TextSpan(
                            text: "درباره کتاب شازده کوچولو\n",
                            style: StoryDetails.pressed
                                ? TextStyle(
                                color: Theme
                                    .of(context)
                                    .primaryColor,
                                fontSize: 22,
                                fontWeight: FontWeight.bold)
                                : TextStyle(
                                color: Color.fromRGBO(114, 130, 145, 1),
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                              text:
                              'آنتوان دوسنت اگزوپری خلبان بود. سال هزار و نهصد و سی و پنج هواپیمای او دچار مشکل فنی شد و در صحرای آفریقا فرود آمد. این ماجرا جرقه‌ای را در ذهن آنتوان برای نوشتن کتاب شازده کوچولو روشن کرد.\nدر این کتاب خلبانی در یک بیابان فرود آمده است و هواپیمایش دچار مشکل شده؛ او در آنجا پسرکی عجیب و کوچک که همان شازده کوچولو است را ملاقات می‌کند که می‌گوید از سیاره‌ای به نام ب ۶۱۲ به زمین آمده است.\nشازده کوچولوی کنجکاو با کلی سوال‌های جورواجور و کلی حرف از سیاره‌اش و سیارک‌های دیگر برای خلبان می‌گوید. او یک گل سرخ دارد که فکر می‌کرد تنها گل دنیاست و شازده کوچولو بسیار مواظب آن بود و دوستش می‌داشت، اما گل مغرور قدر محبت‌های او را نمی‌دانست، بنابراین شازده تصمیم می‌گیرد به سیاره‌های دیگر سفر کند.\nشازده کوچولو در مسیر آمدنش به زمین به شش سیارک می‌رود، در هرکدام از آن سیارک‌ها فردی با یک خصوصیت اخلاقی به‌خصوص زندگی می‌کند و هرکدام به کاری مشغول هستند.\nشازده کوچولو بعد از آمدن روی زمین با یک مار روبه‌رو می‌شود که می‌گوید حلال تمام مشکلات است و بعدازآن با گل‌ها و سپس با روباهی آشنا می‌شود که چیزهای زیادی را درباره زمین و انسان‌ها به او یاد می‌دهد. پسرک تصمیم دارد به سیاره‌اش برگردد...\nاین کتاب آموزنده و فلسفی در سبک سورئال نوشته شده است و نثری بسیار روان دارد. شازده کوچولو در این کتاب فردی است که در جست‌وجوی حقیقت می‌باشد و هفت‌سیاره‌ای که به آن‌ها سفر می‌کند و از هرکدام نکات آموزنده‌ای را فرامی‌گیرد؛ می‌توان هفت مرحله رسیدن به حقیقت دانست که در کتب عرفانی بسیار دیده می‌شوند.\nسیاره‌ی شازده کوچولو که ب ۶۱۲ نام داشت در زمان نگارش این کتاب سیاره‌ای خیالی محسوب می‌شد اما بعدها سیاره‌ای را به‌افتخار او به این اسم نام‌گذاری کردند.\n'),
                          TextSpan(
                            text: "درباره آنتوان دوسنت اگزوپری\n",
                            style: StoryDetails.pressed
                                ? TextStyle(
                                color: Theme
                                    .of(context)
                                    .primaryColor,
                                fontSize: 22,
                                fontWeight: FontWeight.bold)
                                : TextStyle(
                                color: Color.fromRGBO(114, 130, 145, 1),
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                              text:
                              'آنتوان دوسنت اگزوپری نویسنده و خلبان فرانسوی در سال ۱۹۰۰ به دنیا آمد. او در یک خانواده اشرافی رشد یافت اما هیچ‌گاه مانند یک اشراف‌زاده رفتار نکرد. او عاشق انسان‌ها و طبیعت بود. ساز می‌زد و شعر و داستان می‌نوشت.\nاو به نیروی هوایی ارتش فرانسه پیوست و پروازهای بسیاری را تجربه کرد و با فرهنگ‌های متنوعی آشنا شد. در داستان‌های او عرفان، صداقت، وفاداری، عشق و طبیعت و دل نبستن به مادیات جایگاه ویژه‌ای دارند.\nاز آثار او می‌توان خلبان جنگ، پرواز شبانه، نامه به یک گروگان، شازده کوچولو، نوشته‌های جنگ، قلعه، نامه‌های جوانی و مانون رقاص را نام برد.\nآنتوان در جنگ جهانی دوم در سال ۱۹۴۴ درحالی‌که با یک هواپیمای غیرمسلح بر روی آب‌های فرانسه در حال پرواز بود هواپیمایش در آب سقوط کرد و تا سال‌ها هیچ نشانی از او پیدا نشد. بنابراین همه گمان می‌کردند که هواپیمای او مورد هدف تیراندازی آلمان‌های نازی قرارگرفته است. اما سال‌ها بعد با پیدا شدن لاشه هواپیمای او مشخص شد که تیراندازی در کار نبوده و علت سقوط نقص فنی گزارش شد. \n')
                        ]),
                    textAlign: TextAlign.justify),
              ),
            ),
          )),
    );
  }
}
