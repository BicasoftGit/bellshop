part of '../pages.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProv = Provider.of<ThemeChangerProvider>(context);
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildProfileUser(context),
              SizedBox(height: 20.0),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                elevation: 8.0,
                child: Center(
                  child: Column(
                    children: [
                      buildOrder(context),
                      buildPayment(context),
                      buildNotification(context),
                      buildFavorite(context),
                      buildTheme(context, themeProv),
                      // buildAbout(context),
                      buildSignOut(context),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }

  SideInAnimation buildSignOut(BuildContext context) {
    return SideInAnimation(
      8,
      child: ListTile(
        onTap: () {
          signOutDialog(context);
        },
        leading: Icon(
          FlutterIcons.exit_to_app_mco,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          'profile.signout',
          style:
              Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 14.0),
        ).tr(),
        trailing: Icon(
          Icons.arrow_forward_ios,
        ),
      ),
    );
  }

  // SideInAnimation buildAbout(BuildContext context) {
  //   return SideInAnimation(
  //     7,
  //     child: ListTile(
  //       onTap: () {
  //         Get.to(AboutPage());
  //       },
  //       leading: Icon(
  //         FlutterIcons.information_outline_mco,
  //         color: Theme.of(context).primaryColor,
  //       ),
  //       title: Text('profile.aboutus',
  //               style: Theme.of(context)
  //                   .textTheme
  //                   .bodyText2
  //                   .copyWith(fontSize: 14.0))
  //           .tr(),
  //       trailing: Icon(
  //         Icons.arrow_forward_ios,
  //       ),
  //     ),
  //   );
  // }

  SideInAnimation buildTheme(
      BuildContext context, ThemeChangerProvider themeProv) {
    return SideInAnimation(
      6,
      child: ListTile(
        onTap: () {
          Get.to(FavoritePage());
        },
        leading: Icon(
          FlutterIcons.sun_fea,
          color: Theme.of(context).primaryColor,
        ),
        title: Text('profile.lighttheme',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontSize: 14.0))
            .tr(),
        trailing: Switch(
          value: themeProv.isLightTheme,
          activeColor: Theme.of(context).primaryColor,
          onChanged: (value) {
            themeProv.changeTheme();
          },
        ),
      ),
    );
  }

  SideInAnimation buildFavorite(BuildContext context) {
    return SideInAnimation(
      6,
      child: ListTile(
        onTap: () {
          Get.to(FavoritePage());
        },
        leading: Icon(
          FlutterIcons.favorite_border_mdi,
          color: Theme.of(context).primaryColor,
        ),
        title: Text('profile.favorite',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontSize: 14.0))
            .tr(),
        trailing: Icon(
          Icons.arrow_forward_ios,
        ),
      ),
    );
  }

  SideInAnimation buildNotification(BuildContext context) {
    return SideInAnimation(
      5,
      child: ListTile(
        leading: SvgPicture.asset('assets/icons/notification.svg'),
        title: Text('profile.notification',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontSize: 14.0))
            .tr(),
        trailing: Icon(
          Icons.arrow_forward_ios,
        ),
        onTap: () {
          Get.to(ActivityPage());
        },
      ),
    );
  }

  SideInAnimation buildPayment(BuildContext context) {
    return SideInAnimation(
      4,
      child: ListTile(
        onTap: () {
          Get.to(ProfilePaymentPage());
        },
        leading: SvgPicture.asset('assets/icons/payment.svg'),
        title: Text('profile.payment',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontSize: 14.0))
            .tr(),
        trailing: Icon(
          Icons.arrow_forward_ios,
        ),
      ),
    );
  }

  SideInAnimation buildOrder(BuildContext context) {
    return SideInAnimation(
      3,
      child: ListTile(
        onTap: () {
          Get.to(OrderPage());
        },
        leading: SvgPicture.asset('assets/icons/order.svg'),
        title: Text('profile.order',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontSize: 14.0))
            .tr(),
        trailing: Icon(
          Icons.arrow_forward_ios,
        ),
      ),
    );
  }

  Container buildProfileUser(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 325.0,
      child: Stack(
        children: [
          headerContent(
            context,
            image: 'assets/images/2ab08d7aa25abbd579f036c3c3acec47.png',
            username: 'Jessica Veranda',
            email: 'jscvrnd19@gmail.com',
          ),
          primaryCard(context),
        ],
      ),
    );
  }

  Future signOutDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          title: Center(
            child: Text('profile.signout',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 14.0))
                .tr(),
          ),
          content: Text(
            'profile.signoutsubtitle',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ).tr(),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text('profile.cancel',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 14.0))
                  .tr(),
            ),
            TextButton(
              onPressed: () {
                Get.offAll(SignInPage());
              },
              child: Text('profile.yes',
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: 14.0,
                        color: Theme.of(context).primaryColor,
                      )).tr(),
            ),
          ],
        );
      },
    );
  }

  Positioned primaryCard(BuildContext context) {
    return Positioned(
      bottom: 0.0,
      left: 0.0,
      right: 0.0,
      child: Container(
        height: 120,
        margin: EdgeInsets.symmetric(horizontal: 18.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 8.0,
          child: Center(
            child: Column(
              children: [
                SideInAnimation(
                  1,
                  child: ListTile(
                    onTap: () {
                      Get.to(ProfileDetailpage());
                    },
                    leading: SvgPicture.asset('assets/icons/profile.svg'),
                    title: Text('profile.account',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(fontSize: 14.0))
                        .tr(),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                    ),
                  ),
                ),
                SideInAnimation(
                  2,
                  child: ListTile(
                    onTap: () {
                      Get.to(ProfileAddressPage());
                    },
                    leading: SvgPicture.asset('assets/icons/location.svg'),
                    title: Text('profile.address',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(fontSize: 14.0))
                        .tr(),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container headerContent(
    BuildContext context, {
    required String image,
    required String username,
    required String email,
  }) {
    return Container(
      width: double.infinity,
      height: 230.0,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25.0),
          bottomRight: Radius.circular(25.0),
        ),
      ),
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 35.0),
            Container(
              width: 95.0,
              height: 95.0,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 2.0,
                ),
              ),
              child: CircleAvatar(
                radius: 40.0,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage(image),
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              username,
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(color: kBackgroundLightColor),
            ),
            SizedBox(height: 8.0),
            Text(
              email,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: kBackgroundLightColor),
            ),
          ],
        ),
      ),
    );
  }
}
