part of '../pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    // final signInProv = Provider.of<SignInProvider>(context);
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 80.0),
              buildIcon(context),
              SizedBox(height: 18.0),
              buildTitle(context),
              SizedBox(height: 12.0),
              buildSubtitle(context),
              SizedBox(height: 35.0),
              buildEmailTextField(),
              SizedBox(height: 15.0),
              buildPasswordTextField(),
              SizedBox(height: 15.0),
              buildForgotPasswordButton(context),
              SizedBox(height: 20.0),
              buildSignInButton(),
              SizedBox(height: 15.0),
              buildDivider(context),
              SizedBox(height: 15.0),
              buildGoogleSignInButton(),
              SizedBox(height: 15.0),
              buildFacebookSignInButton(),
              SizedBox(height: 15.0),
              buildSignUpButton(context),
              SizedBox(height: 15.0),
              // Text(tr('ewew'))
            ],
          ),
        ),
      ),
    );
  }

  FadeInAnimation buildDivider(BuildContext context) {
    return FadeInAnimation(
      5,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              width: double.infinity,
              height: .5,
              color: Theme.of(context).accentColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              'signin.or',
              style: Theme.of(context).textTheme.subtitle2,
            ).tr(),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: .5,
              color: Theme.of(context).accentColor,
            ),
          ),
        ],
      ),
    );
  }

  FadeInAnimation buildSignUpButton(BuildContext context) {
    return FadeInAnimation(
      7,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'signin.noaccount',
              style: Theme.of(context).textTheme.subtitle1,
            ).tr(),
            SizedBox(width: 7.0),
            GestureDetector(
              onTap: navigateToSignUp,
              child: Text(
                'signin.register',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Theme.of(context).primaryColor),
              ).tr(),
            )
          ],
        ),
      ),
    );
  }

  FadeInAnimation buildFacebookSignInButton() {
    return FadeInAnimation(
      6,
      child: FacebookSignInButtonWidget(
        title: 'signin.facebook',
        onPressed: facebookSignInClicked,
      ),
    );
  }

  FadeInAnimation buildGoogleSignInButton() {
    return FadeInAnimation(
      5,
      child: GoogleSignInButtonWidget(
        title: 'signin.google',
        onPressed: googleSignInClicked,
      ),
    );
  }

  SideInAnimation buildSignInButton() {
    return SideInAnimation(
      4,
      child: RaisedButtonWidget(
        title: 'signin.signin',
        onPressed: () => navigateToHomePage(context),
      ),
    );
  }

  SideInAnimation buildForgotPasswordButton(BuildContext context) {
    return SideInAnimation(
      4,
      child: Align(
        alignment: Alignment.topRight,
        child: GestureDetector(
          onTap: navigateToForgotPassword,
          child: Text(
            'signin.forgot',
            style:
                Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 14.0),
          ).tr(),
        ),
      ),
    );
  }

  SideInAnimation buildPasswordTextField() {
    return SideInAnimation(
      3,
      child: TextFormFieldWidget(
        obscureText: true,
        hintText: tr('signin.password'),
        keyboardType: TextInputType.text,
        prefixIcon: Icon(FlutterIcons.lock_fea),
      ),
    );
  }

  SideInAnimation buildEmailTextField() {
    return SideInAnimation(
      3,
      child: TextFormFieldWidget(
        obscureText: false,
        hintText: tr('signin.email'),
        keyboardType: TextInputType.emailAddress,
        prefixIcon: Icon(FlutterIcons.mail_fea),
      ),
    );
  }

  SideInAnimation buildSubtitle(BuildContext context) {
    return SideInAnimation(
      2,
      child: Text(
        'signin.subtitle',
        style: Theme.of(context).textTheme.subtitle1,
      ).tr(),
    );
  }

  SideInAnimation buildTitle(BuildContext context) {
    return SideInAnimation(
      2,
      child: Text(
        'signin.title',
        style: Theme.of(context).textTheme.headline1,
      ).tr(),
    );
  }

  SideInAnimation buildIcon(BuildContext context) {
    return SideInAnimation(
      1,
      child: Center(
        child: Container(
          width: 75.0,
          height: 75.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Theme.of(context).primaryColor,
          ),
          child: Center(
            child: Icon(
              Icons.shopping_basket,
              color: kBackgroundLightColor,
              size: 45.0,
            ),
          ),
        ),
      ),
    );
  }

  void navigateToSignUp() {
    Get.to(SignUpPage());
  }

  void navigateToForgotPassword() {
    Get.to(ForgotPasswordPage());
  }

  navigateToHomePage(BuildContext context) {
    Get.offAll(BottomNavigationBarPage());
  }

  facebookSignInClicked() {
    showToast(msg: 'Facebook Sign In Clicked!');
  }

  googleSignInClicked() {
    showToast(msg: 'Google Sign In Clicked!');
  }
}
