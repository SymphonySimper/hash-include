import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hashinclude/widgets/widgets.dart';

class ListWheelScrollViewApp extends StatefulWidget {
  @override
  _ListWheelScrollViewAppState createState() {
    return _ListWheelScrollViewAppState();
  }
}

class _ListWheelScrollViewAppState extends State<ListWheelScrollViewApp> {
  // int _selectedItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [
      DeveloperCard(
        image: 'assets/images/devs/ashik.jpg',
        name: "Haja Ashik",
        oneLiner: "Hi I'm Ashik, I'm the Front-End developer",
      ),
      DeveloperCard(
        image: 'assets/images/devs/pragati.jpeg',
        name: 'Pragati',
        oneLiner: "Hi I'm Pragati, I'm the Front-End developer",
      ),
      DeveloperCard(
        image: 'assets/images/devs/sanghavi.jpg',
        name: 'Shanghavi Gupta',
        oneLiner: "Hi I'm Shanghavi, I'm the Back-End developer",
      ),
      DeveloperCard(
        image: 'assets/images/devs/sharanya.jpg',
        name: 'Sharanya',
        oneLiner: "Hi I'm Sharanya, I'm the Back-End developer",
      ),
      DeveloperCard(
        image: 'assets/images/devs/senthil.jpg',
        name: 'Sri Senthil Balaji',
        oneLiner: "Hi I'm Senthil, I'm the designer of this app",
      ),
    ];

    return BackgroundBox(
      appBar: TransparentAppBar(
        title: "About Developers",
      ),
      child: ListWheelScrollView(
        perspective: 0.01,
        itemExtent: 300.h,
        children: items,
        // useMagnifier: true,
        offAxisFraction: -0.5,
        physics: BouncingScrollPhysics(),
        diameterRatio: 5,
        squeeze: 0.8,
        // onSelectedItemChanged: (index) => {
        //   setState(
        //     () {
        //       _selectedItemIndex = index;
        //     },
        //   ),
        // },
      ),
    );
  }
}
