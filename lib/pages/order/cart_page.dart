part of '../pages.dart';

class CartPage extends StatelessWidget {
  void navigateToAddressPage() {
    Get.to(AddressPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20.0),
              Divider(color: Theme.of(context).accentColor.withOpacity(.5)),
              SizedBox(height: 12.0),
              buildListCartCard(),
              SizedBox(height: 20.0),
              buildCoupunBox(context),
              SizedBox(height: 20.0),
              buildPriceBox(context),
              SizedBox(height: 18.0),
              buildCheckoutButton(),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }

  FadeInAnimation buildCheckoutButton() {
    return FadeInAnimation(
      5,
      child: RaisedButtonWidget(
        title: 'order.checkout',
        onPressed: navigateToAddressPage,
      ),
    );
  }

  FadeInAnimation buildPriceBox(BuildContext context) {
    return FadeInAnimation(
      4,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: Theme.of(context).accentColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tr('order.items') + ' (3)',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Text('Rp. 36.000.000',
                    style: Theme.of(context).textTheme.subtitle1),
              ],
            ),
            SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('order.shipping',
                        style: Theme.of(context).textTheme.subtitle2)
                    .tr(),
                Text('Rp. 7.000', style: Theme.of(context).textTheme.subtitle1),
              ],
            ),
            SizedBox(height: 12.0),
            Divider(
              color: Theme.of(context).accentColor,
              thickness: 1.0,
            ),
            SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'order.totalprice',
                  style: Theme.of(context).textTheme.subtitle2,
                ).tr(),
                Text(
                  'Rp. 41.000.000',
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(color: Theme.of(context).primaryColor),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  FadeInAnimation buildCoupunBox(BuildContext context) {
    return FadeInAnimation(
      2,
      child: Container(
        width: double.infinity,
        height: 50.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: Theme.of(context).primaryColor),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: TextField(
                  cursorColor: Theme.of(context).primaryColor,
                  style: Theme.of(context).textTheme.subtitle1,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: tr('order.entercouponcode'),
                    hintStyle: Theme.of(context).textTheme.subtitle2,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 85.0,
              height: 50.0,
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                  'order.apply',
                  style: Theme.of(context).textTheme.button,
                ).tr(),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListView buildListCartCard() {
    return ListView.builder(
      itemCount: 2,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemBuilder: (context, index) {
        return SideInAnimation(index, child: CartCard());
      },
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        'order.mybag',
        style: Theme.of(context).textTheme.headline4,
      ).tr(),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            showSearch(context: context, delegate: Search());
          },
        ),
      ],
    );
  }
}
