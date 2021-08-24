part of '../pages.dart';

class AddAddressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Container(
          child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.0),
            buildFullName(context),
            SizedBox(height: 20.0),
            buildAddress(context),
            SizedBox(height: 20.0),
            buildCity(context),
            SizedBox(height: 20.0),
            buildZipcode(context),
            SizedBox(height: 20.0),
            buildPhone(context),
            SizedBox(height: 25.0),
            buildAddButton(),
            SizedBox(height: 25.0),
          ],
        ),
      )),
    );
  }

  FadeInAnimation buildAddButton() {
    return FadeInAnimation(
      6,
      child: RaisedButtonWidget(
        title: 'product.done',
        onPressed: () {
          Get.back();
        },
      ),
    );
  }

  Column buildPhone(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SideInAnimation(
          5,
          child: Text(
            'product.phone',
            style: Theme.of(context).textTheme.headline4,
          ).tr(),
        ),
        SizedBox(height: 15.0),
        SideInAnimation(
          5,
          child: TextFormFieldWidget(
            hintText: tr('product.hinttextphone'),
            keyboardType: TextInputType.text,
            obscureText: false,
            prefixIcon: Icon(FlutterIcons.phone_fea),
          ),
        ),
      ],
    );
  }

  Column buildZipcode(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SideInAnimation(
          4,
          child: Text(
            'product.zipcode',
            style: Theme.of(context).textTheme.headline4,
          ).tr(),
        ),
        SizedBox(height: 15.0),
        SideInAnimation(
          4,
          child: TextFormFieldWidget(
            hintText: tr('product.hinttextzipcode'),
            keyboardType: TextInputType.text,
            obscureText: false,
            prefixIcon: Icon(FlutterIcons.zip_box_mco),
          ),
        ),
      ],
    );
  }

  Column buildCity(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SideInAnimation(
          3,
          child: Text(
            'product.city',
            style: Theme.of(context).textTheme.headline4,
          ).tr(),
        ),
        SizedBox(height: 15.0),
        SideInAnimation(
          3,
          child: TextFormFieldWidget(
            hintText: tr('product.hinttextcity'),
            keyboardType: TextInputType.text,
            obscureText: false,
            prefixIcon: Icon(FlutterIcons.city_variant_mco),
          ),
        ),
      ],
    );
  }

  Column buildAddress(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SideInAnimation(
          2,
          child: Text('product.streetaddress',
                  style: Theme.of(context).textTheme.headline4)
              .tr(),
        ),
        SizedBox(height: 15.0),
        SideInAnimation(
          2,
          child: TextFormFieldWidget(
            hintText: tr('product.hinttextfullname'),
            keyboardType: TextInputType.text,
            obscureText: false,
            prefixIcon: Icon(FlutterIcons.location_pin_sli),
          ),
        ),
      ],
    );
  }

  Column buildFullName(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SideInAnimation(
          1,
          child: Text(
            'product.fullname',
            style: Theme.of(context).textTheme.headline4,
          ).tr(),
        ),
        SizedBox(height: 15.0),
        SideInAnimation(
          1,
          child: TextFormFieldWidget(
            hintText: tr('product.hinttextfullname'),
            keyboardType: TextInputType.text,
            obscureText: false,
            prefixIcon: Icon(FlutterIcons.user_fea),
          ),
        ),
      ],
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        'product.addaddress',
        style: Theme.of(context).textTheme.headline4,
      ).tr(),
    );
  }
}
