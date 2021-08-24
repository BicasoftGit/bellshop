part of '../pages.dart';

class ProfileDetailpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30),
              buildUserName(context),
              SizedBox(height: 30),
              buildGender(context),
              buildEmail(context),
              buildPhoneNumber(context),
              buildChangePassword(context),
            ],
          ),
        ),
      ),
    );
  }

  SideInAnimation buildChangePassword(BuildContext context) {
    return SideInAnimation(
      4,
      child: _customListTile(
        context,
        icon: FlutterIcons.lock1_ant,
        title: 'profile.changepassword',
        subtitle: '•••••••••••••',
        onTap: () => Get.to(ChangePasswordPage()),
      ),
    );
  }

  SideInAnimation buildPhoneNumber(BuildContext context) {
    return SideInAnimation(
      4,
      child: _customListTile(
        context,
        icon: FlutterIcons.smartphone_fea,
        title: 'profile.phonenumber',
        subtitle: '+62870717071',
        onTap: () => Get.to(ChangePhonePage()),
      ),
    );
  }

  SideInAnimation buildEmail(BuildContext context) {
    return SideInAnimation(
      3,
      child: _customListTile(
        context,
        icon: FlutterIcons.mail_ant,
        title: 'profile.emailaddress',
        subtitle: 'jscvrnd19@gmail.com',
        onTap: () => Get.to(ChangeEmailPage()),
      ),
    );
  }

  SideInAnimation buildGender(BuildContext context) {
    return SideInAnimation(
      2,
      child: _customListTile(
        context,
        icon: FlutterIcons.gender_female_mco,
        title: 'profile.gender',
        subtitle: tr('profile.female'),
        onTap: () => Get.to(ChangeGenderPage()),
      ),
    );
  }

  SideInAnimation buildUserName(BuildContext context) {
    return SideInAnimation(
      1,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(
              'https://i.pinimg.com/564x/aa/0b/51/aa0b512753d5a1c9c3c2869b77e0c67b.jpg'),
        ),
        title: GestureDetector(
          onTap: () {
            Get.to(ChangeNamePage());
          },
          child: Text(
            'Jessica Veranda',
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        subtitle: Text(
          'jscvrnd19@gmail.com',
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 1.0,
      title:
          Text('profile.profile', style: Theme.of(context).textTheme.headline4)
              .tr(),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
        ),
        onPressed: () => Get.back(),
      ),
    );
  }

  Widget _customListTile(BuildContext context,
      {IconData? icon, required String title, required String subtitle, void Function()? onTap}) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.blue,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyText2,
          ).tr(),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ],
      ),
      trailing: Icon(
        FlutterIcons.right_ant,
      ),
      onTap: onTap,
    );
  }
}
