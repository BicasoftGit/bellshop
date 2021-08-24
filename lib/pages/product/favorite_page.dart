part of '../pages.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'product.favoriteproduct',
          style: Theme.of(context).textTheme.headline4,
        ).tr(),
      ),
      body: Container(
        child: StaggeredGridView.countBuilder(
          itemCount: productList.length,
          crossAxisCount: 4,
          staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
          mainAxisSpacing: 15.0,
          crossAxisSpacing: 15.0,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: ScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 25.0),
          itemBuilder: (context, index) {
            var product = productList[index];
            return FadeInAnimation(
              index,
              child: ProductGridCard(
                product: product,
              ),
            );
          },
        ),
      ),
    );
  }
}
