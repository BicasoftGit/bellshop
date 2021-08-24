part of '../pages.dart';

class AddressPage extends StatefulWidget {
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildListAddress(context),
            buildConfirmAddressButton(),
          ],
        ),
      ),
    );
  }

  Flexible buildConfirmAddressButton() {
    return Flexible(
      flex: 1,
      child: Padding(
        padding: EdgeInsets.fromLTRB(18.0, 0.0, 18.0, 15.0),
        child: FadeInAnimation(
          2,
          child: RaisedButtonWidget(
            title: 'order.next',
            onPressed: navigateToPaymentPage,
          ),
        ),
      ),
    );
  }

  void navigateToPaymentPage() {
    Get.to(PaymentPage());
  }

  Flexible buildListAddress(BuildContext context) {
    return Flexible(
      flex: 9,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.0),
            Text(
              'order.shippingaddress',
              style: Theme.of(context).textTheme.headline4,
            ).tr(),
            SizedBox(height: 20.0),
            ListView.builder(
              itemCount: addressList.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: ScrollPhysics(),
              itemBuilder: (context, index) {
                var address = addressList[index];
                return SideInAnimation(
                  index,
                  child: new AddressCard(
                    address: address,
                    onPressed: () {
                      setState(() {
                        addressList.forEach((e) => e.isSelected = false);
                        address.isSelected = true;
                      });
                    },
                  ),
                );
              },
            ),
            SizedBox(height: 25.0),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        'order.checkout',
        style: Theme.of(context).textTheme.headline4,
      ).tr(),
      actions: [
        IconButton(
          icon: Icon(Icons.add),
          color: Theme.of(context).primaryColor,
          onPressed: () {
            Get.to(AddAddressPage());
          },
        ),
      ],
    );
  }
}
