part of '../pages.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'assets/icons/logo.png',
      nextScreen: SplashWelcomePage(),
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
      duration: 1000,
      animationDuration: Duration(milliseconds: 1500),
    );
  }
}

class SplashWelcomePage extends StatefulWidget {
  @override
  _SplashWelcomePageState createState() => _SplashWelcomePageState();
}

class _SplashWelcomePageState extends State<SplashWelcomePage> {
  startTime() {
    Timer(
      Duration(milliseconds: 1500),
      () {
        Get.offAll(
          OnBoardingPage(),
          transition: Transition.topLevel,
          duration: Duration(milliseconds: 2500),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Byneet Dev', style: Theme.of(context).textTheme.bodyText1),
      ),
    );
  }
}
