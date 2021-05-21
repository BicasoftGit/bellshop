part of '../widgets.dart';

class VerticalList extends StatelessWidget {
  final List<Product> itemCount;
  VerticalList({
    Key? key,
    required this.itemCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      itemCount: itemCount.length,
      crossAxisCount: 4,
      staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
      mainAxisSpacing: 15.0,
      crossAxisSpacing: 15.0,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 18.0),
      itemBuilder: (context, index) {
        var product = itemCount[index];
        return FadeInAnimation(
          index,
          child: ProductCard(
            product: product,
            isHorizontalList: false,
          ),
        );
      },
    );
  }
}
