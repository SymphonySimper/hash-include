import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hashinclude/intropage.dart';
import 'package:hashinclude/widgets/widgets.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => IntroPage()),
    );
  }

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset(assetName, width: 350.w),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {

    var bodyStyle = GoogleFonts.poppins(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontSize: ScreenUtil().setSp(14),
    );
    var pageDecoration = PageDecoration(
      titleTextStyle: GoogleFonts.poppins(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: ScreenUtil().setSp(24),
      ),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.w, 0.0, 16.w, 16.h),
      imagePadding: EdgeInsets.zero,
    );

    return BackgroundBox(
      child: IntroductionScreen(
        globalBackgroundColor: Colors.transparent,
        key: introKey,
        pages: [
          PageViewModel(
            title: "Community Discussion",
            body: "Have a discussion with fellow developers.",
            image: _buildImage('assets/images/carousel/onboarding0.png'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "We got you covered",
            body: "Execute upto 67 programming languages in-app.",
            image: _buildImage('assets/images/carousel/onboarding1.png'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Have doubts",
            body:
                "Ask any question you have and get answered by developers around the world.",
            image: _buildImage('assets/images/carousel/onboarding2.png'),
            decoration: pageDecoration,
          ),
        ],
        onDone: () => _onIntroEnd(context),
        //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
        showSkipButton: true,
        skipFlex: 0,
        nextFlex: 0,
        skip: Text(
          'Skip',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: ScreenUtil().setSp(14),
          ),
        ),
        next: Icon(
          Icons.arrow_forward,
          color: Colors.white,
          size: ScreenUtil().setSp(24),
        ),
        done: Text(
          'Done',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: ScreenUtil().setSp(12),
          ),
        ),
        dotsDecorator: DotsDecorator(
          activeColor: Colors.white,
          size: Size(10.w, 10.h),
          color: Colors.white.withOpacity(0.50),
          activeSize: Size(22.w, 10.h),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.h),
          ),
        ),
      ),
    );
  }
}

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Home')),
//       body: const Center(child: Text("This is the screen after Introduction")),
//     );
//   }
// }
