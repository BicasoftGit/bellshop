part of '../widgets.dart';

class CategoryCircle extends StatelessWidget {
  final Category category;
  final Function onTap;

  const CategoryCircle({
    Key? key,
    required this.category,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap as void Function()?,
      child: Container(
        width: 80.0,
        child: Column(
          children: <Widget>[
            Container(
              width: 60.0,
              height: 60.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: Theme.of(context).accentColor.withOpacity(.2)),
                image: DecorationImage(
                  image: AssetImage(category.icon!),
                ),
              ),
            ),
            SizedBox(height: 12.0),
            Text(
              category.name!,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.subtitle2,
            ).tr(),
          ],
        ),
      ),
    );
  }
}
