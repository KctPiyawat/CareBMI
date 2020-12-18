import 'package:carebmi/states/authen.dart';
import 'package:carebmi/utility/myconstant.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<PageViewModel> pageViewModels = List();
  List<String> titles = [
    'รักเพือน',
    'รักครอบครัว',
    'รักพ่อแม่',
    'แล้วทำไม ? ไม่่รักตัวเอง ',
  ];
  List<String> bodys = [
    'รักสิ',
    'รักมาก',
    'รักที่สุด',
    'จริงด้วย',
  ];
  List<String> paths = [
    'images/page1.png',
    'images/page2.png',
    'images/page3.png',
    'images/page4.png',
  ];

  @override
  void initState() {
    super.initState();

    int index = 0;
    for (var title in titles) {
      setState(() {
        pageViewModels
            .add(createPageViewModel(title, bodys[index], paths[index]));
      });
      index++;
    }
  }

  PageViewModel createPageViewModel(String title, String body, String path) {
    return PageViewModel(
      titleWidget: Text(
        title,
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blue.shade700),
      ),
      body: body,
      image: Container(
        width: 300,
        padding: EdgeInsets.only(top: 16),
        child: Image.asset(path),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          pages: pageViewModels,
          onDone: () async {
            print('OnDone');
            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            preferences.setInt(MyConstant().keyRoute, 1);
            
            Navigator.pushNamedAndRemoveUntil(context, '/authen', (route) => false);

            // Navigator.pushAndRemoveUntil(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => Authen(),
            //     ),
            //     (route) => false);

          },
          done: Column(
            children: [
              Icon(Icons.forward),
              Text('Authen'),
            ],
          ),
          skip: Text('skip'),
          showSkipButton: true,
          showNextButton: true,
          next: Column(
            children: [
              Icon(Icons.forward),
              Text('Next Page'),
            ],
          ),
        ),
      ),
    );
  }
}
