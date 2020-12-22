part of '../pages.dart';

class ChangeEmailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            FlutterIcons.left_ant,
          ),
          onPressed: () => Get.back(),
        ),
        title: Text('profile.emailaddress',
                style: Theme.of(context).textTheme.headline4)
            .tr(),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.0),
            SideInAnimation(
              1,
              child: Text(
                'profile.changeemail',
                style: Theme.of(context).textTheme.subtitle2,
              ).tr(),
            ),
            SizedBox(height: 15.0),
            SideInAnimation(
              2,
              child: TextFieldWidget(
                hintText: tr('profile.emailaddress'),
                prefixIcon: Icon(FlutterIcons.mail_ant),
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
                value: 'jscvrnd19@gmail.com',
              ),
            ),
            Spacer(),
            FadeInAnimation(
              3,
              child: RaisedButtonWidget(
                title: 'profile.save',
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
