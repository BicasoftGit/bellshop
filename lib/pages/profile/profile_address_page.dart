part of '../pages.dart';

class ProfileAddressPage extends StatefulWidget {
  @override
  _ProfileAddressPageState createState() => _ProfileAddressPageState();
}

class _ProfileAddressPageState extends State<ProfileAddressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'profile.savedaddress',
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
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        child: ListView.builder(
          itemCount: addressList.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: ScrollPhysics(),
          itemBuilder: (context, index) {
            var address = addressList[index];
            return SideInAnimation(
              index,
              child: AddressCard(
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
      ),
    );
  }

  onItemSelected(int index) {
    setState(() {});
  }
}
