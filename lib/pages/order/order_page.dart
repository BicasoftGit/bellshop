part of '../pages.dart';

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order', style: Theme.of(context).textTheme.headline4),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: orderList.length,
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 20.0),
          itemBuilder: (context, index) {
            var order = orderList[index];
            return SideInAnimation(index, child: OrderCard(order: order));
          },
        ),
      ),
    );
  }
}
