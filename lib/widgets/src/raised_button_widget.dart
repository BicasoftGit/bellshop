part of '../widgets.dart';

class RaisedButtonWidget extends StatelessWidget {
  final String title;
  final void Function() onPressed;

  const RaisedButtonWidget({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.transparent,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.4),
            blurRadius: 5,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          primary: Theme.of(context).primaryColor,
        ),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(color: kBackgroundLightColor),
          ).tr(),
        ),
      ),
    );
  }
}
