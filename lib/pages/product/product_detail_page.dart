part of '../pages.dart';

class ProductDetailPage extends StatelessWidget {
  final Product? product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildCarousel(),
              SizedBox(height: 15.0),
              buildTitleAndFavorite(context),
              SizedBox(height: 12.0),
              buildRating(),
              SizedBox(height: 12.0),
              buildPrice(context),
              SizedBox(height: 12.0),
              buildDescriptionHeading(context),
              buildDescriptionBody(context),
              SizedBox(height: 15.0),
              buildRatingHeading(context),
              SizedBox(height: 12.0),
              buildRatingIcon(context),
              SizedBox(height: 15.0),
              FadeInAnimation(9, child: ReviewCardWidget()),
              buildOtherHeading(context),
              buildOtherProducts(),
              SizedBox(height: 100.0),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          //todo: Get.to(CartPage());
        },
        backgroundColor: kPrimaryColor,
        label: Text(
          'product.addtocart',
          style: Theme.of(context).textTheme.button,
        ).tr(),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            showSearch(context: context, delegate: Search());
          },
        ),
        IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {},
        ),
      ],
    );
  }

  VerticalList buildOtherProducts() => VerticalList(itemCount: productList);

  Padding buildOtherHeading(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 15.0),
      child: Text(
        'product.youmightalsolike',
        style: Theme.of(context).textTheme.headline1,
      ).tr(),
    );
  }

  FadeInAnimation buildRatingIcon(BuildContext context) {
    return FadeInAnimation(
      8,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Row(
          children: [
            SmoothStarRating(
              color: kYellowColor,
              size: 25.0,
              spacing: 5.0,
              starCount: 5,
              rating: 3.5,
              allowHalfRating: true,
              borderColor: kGreyColor,
            ),
            SizedBox(width: 12.0),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '4.5  ',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  TextSpan(
                    text: '(5) ' + tr("product.reviews"),
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  FadeInAnimation buildRatingHeading(BuildContext context) {
    return FadeInAnimation(
      7,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'product.reviews',
              style: Theme.of(context).textTheme.headline3,
            ).tr(),
            GestureDetector(
              onTap: () {
                Get.to(ReviewsPage());
              },
              child: Text(
                'product.seemore',
                style: Theme.of(context).textTheme.subtitle2,
              ).tr(),
            ),
          ],
        ),
      ),
    );
  }

  FadeInAnimation buildDescriptionBody(BuildContext context) {
    return FadeInAnimation(
      6,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5.0),
        child: ReadMoreText(
          product!.description!,
          trimLines: 4,
          colorClickableText: Theme.of(context).primaryColor,
          trimMode: TrimMode.Line,
          trimCollapsedText: '\n' + tr("product.showmore"),
          trimExpandedText: '\n' + tr("product.showless"),
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
    );
  }

  SideInAnimation buildDescriptionHeading(BuildContext context) {
    return SideInAnimation(
      5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Text(
          'product.desc',
          style: Theme.of(context).textTheme.headline3,
        ).tr(),
      ),
    );
  }

  SideInAnimation buildPrice(BuildContext context) {
    return SideInAnimation(
      4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Text(
          "\$ ${product!.normalPrice}",
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }

  SideInAnimation buildRating() {
    return SideInAnimation(
      3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: SmoothStarRating(
          color: kYellowColor,
          size: 25.0,
          spacing: 5.0,
          starCount: 5,
          rating: product!.ratingValue!,
          allowHalfRating: true,
          borderColor: kGreyColor,
        ),
      ),
    );
  }

  SideInAnimation buildTitleAndFavorite(BuildContext context) {
    return SideInAnimation(
      2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                product!.title!,
                style: Theme.of(context).textTheme.headline3,
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(width: 25.0),
            GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.favorite_border,
                color: Theme.of(context).errorColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  SideInAnimation buildCarousel() {
    return SideInAnimation(
      1,
      child: Container(
        width: double.infinity,
        height: 230.0,
        child: Swiper(
          itemCount: product!.images!.length,
          scrollDirection: Axis.horizontal,
          autoplay: true,
          autoplayDelay: 5000,
          pagination: SwiperPagination(
            alignment: Alignment.bottomCenter,
            builder: DotSwiperPaginationBuilder(
              size: 7.0,
              activeColor: kPrimaryColor,
              color: kGreyColor,
              activeSize: 7.0,
            ),
          ),
          itemBuilder: (context, index) {
            var image = product!.images![index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
    );
  }
}
