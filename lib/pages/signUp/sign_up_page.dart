part of '../pages.dart';

class SignUpPage extends StatelessWidget {
  void navigateToSignInPage() {
    Get.back();
  }

  void navigateToHomePage() {
    Get.to(BottomNavigationBarPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 18.0),
              buildTitle(context),
              SizedBox(height: 12.0),
              buildSubtitle(context),
              SizedBox(height: 35.0),
              buildFullNameTextField(),
              SizedBox(height: 15.0),
              buildEmailTextField(),
              SizedBox(height: 15.0),
              buildPasswordTextField(),
              SizedBox(height: 15.0),
              buildPasswordAgainTextField(),
              SizedBox(height: 20.0),
              buildSignUpButton(),
              SizedBox(height: 15.0),
              buildSignInButton(context),
              SizedBox(height: 15.0),
            ],
          ),
        ),
      ),
    );
  }

  FadeInAnimation buildSignInButton(BuildContext context) {
    return FadeInAnimation(
      3,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'signup.haveaccount',
              style: Theme.of(context).textTheme.subtitle1,
            ).tr(),
            SizedBox(width: 7.0),
            GestureDetector(
              onTap: navigateToSignInPage,
              child: Text(
                'signup.signin',
                style: Theme.of(context).textTheme.headline4.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              ).tr(),
            )
          ],
        ),
      ),
    );
  }

  FadeInAnimation buildSignUpButton() {
    return FadeInAnimation(
      3,
      child: RaisedButtonWidget(
        title: 'signup.signup',
        onPressed: navigateToHomePage,
      ),
    );
  }

  SideInAnimation buildPasswordAgainTextField() {
    return SideInAnimation(
      3,
      child: TextFormFieldWidget(
        obscureText: true,
        hintText: tr('signup.passwordagain'),
        keyboardType: TextInputType.text,
        prefixIcon: Icon(FlutterIcons.lock_fea),
      ),
    );
  }

  SideInAnimation buildPasswordTextField() {
    return SideInAnimation(
      2,
      child: TextFormFieldWidget(
        obscureText: true,
        hintText: tr('signup.password'),
        keyboardType: TextInputType.text,
        prefixIcon: Icon(FlutterIcons.lock_fea),
      ),
    );
  }

  SideInAnimation buildEmailTextField() {
    return SideInAnimation(
      2,
      child: TextFormFieldWidget(
        obscureText: false,
        hintText: tr('signup.email'),
        keyboardType: TextInputType.emailAddress,
        prefixIcon: Icon(FlutterIcons.mail_fea),
      ),
    );
  }

  SideInAnimation buildFullNameTextField() {
    return SideInAnimation(
      2,
      child: TextFormFieldWidget(
        obscureText: false,
        hintText: tr('signup.fullname'),
        keyboardType: TextInputType.text,
        prefixIcon: Icon(FlutterIcons.user_fea),
      ),
    );
  }

  SideInAnimation buildSubtitle(BuildContext context) {
    return SideInAnimation(
      1,
      child: Text(
        'signup.subtitle',
        style: Theme.of(context).textTheme.subtitle1,
      ).tr(),
    );
  }

  SideInAnimation buildTitle(BuildContext context) {
    return SideInAnimation(
      1,
      child: Text(
        'signup.title',
        style: Theme.of(context).textTheme.headline1,
      ).tr(),
    );
  }

  Row customVerticalDivider(BuildContext context) {
    return Row(
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
            'signup.or',
            style: Theme.of(context).textTheme.headline1,
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
    );
  }
}
