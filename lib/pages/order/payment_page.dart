part of '../pages.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'order.payment',
          style: Theme.of(context).textTheme.headline4,
        ).tr(),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: paymentList.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  final payment = paymentList[index];
                  return SideInAnimation(
                    index,
                    child: PaymentCard(
                      payment: payment,
                      onPressed: () {
                        setState(() {
                          paymentList.forEach((e) => e.isSelected = false);
                          payment.isSelected = true;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: FadeInAnimation(
                4,
                child: RaisedButtonWidget(
                  title: 'order.continue',
                  onPressed: () {
                    Get.to(SuccessPage());
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
