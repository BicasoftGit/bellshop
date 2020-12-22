part of '../pages.dart';

class ChangePasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () => Get.back()),
        title: Text('profile.changepassword',
                style: Theme.of(context).textTheme.headline4)
            .tr(),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25.0),
              SideInAnimation(1,
                  child: Text('profile.oldpassword',
                          style: Theme.of(context).textTheme.subtitle2)
                      .tr()),
              SizedBox(height: 15.0),
              SideInAnimation(
                1,
                child: TextFieldWidget(
                  hintText: tr('profile.oldpassword'),
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  value: '123456789',
                  prefixIcon: Icon(FlutterIcons.lock1_ant),
                ),
              ),
              SizedBox(height: 20.0),
              SideInAnimation(2,
                  child: Text('profile.newpassword',
                          style: Theme.of(context).textTheme.subtitle2)
                      .tr()),
              SizedBox(height: 15.0),
              SideInAnimation(
                2,
                child: TextFieldWidget(
                  hintText: tr('profile.newpassword'),
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  value: '123456789',
                  prefixIcon: Icon(FlutterIcons.lock1_ant),
                ),
              ),
              SizedBox(height: 20.0),
              SideInAnimation(3,
                  child: Text('profile.newpasswordagain',
                          style: Theme.of(context).textTheme.subtitle2)
                      .tr()),
              SizedBox(height: 15.0),
              SideInAnimation(
                3,
                child: TextFieldWidget(
                  hintText: tr('profile.newpasswordagain'),
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  value: '123456789',
                  prefixIcon: Icon(FlutterIcons.lock1_ant),
                ),
              ),
              SizedBox(height: 35.0),
              FadeInAnimation(
                4,
                child: RaisedButtonWidget(
                  title: 'profile.save',
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
              SizedBox(height: 15.0),
            ],
          ),
        ),
      ),
    );
  }
}
