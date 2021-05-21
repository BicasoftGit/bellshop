part of '../pages.dart';

class HomePage extends StatelessWidget {
  void navigateToBrowsePage() {
    Get.to(BrowseProductPage());
  }

  navigateToBrowseCategory() {
    Get.to(BrowseCategoryPage());
  }

  void navigateToNotificationPage() {
    Get.to(NotificationPage());
  }

  void navigateToSearchPage() {
    Get.to(SearchPage());
  }

  void navigateToProductDetailPage(Product product) {
    Get.to(ProductDetailPage(product: product));
  }

  navigateToBrowseByNewProduct() {
    Get.to(BrowseProductPage());
  }

  navigateToBrowseByCategory() {
    Get.to(BrowseProductPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              buildSwiper(context),
              buildCategories(context),
              SizedBox(height: 20.0),
              buildNewProduct(context),
              SizedBox(height: 15.0),
              buildSpecialOffer(),
              SizedBox(height: 15.0),
              buildRecommendedProduct(context),
              SizedBox(height: 15.0),
              buildProductGrid(),
              SizedBox(height: 25.0),
              VerticalList(itemCount: productList),
              SizedBox(height: 25.0),
            ],
          ),
        ),
      ),
    );
  }

  StaggeredGridView buildProductGrid() {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: staggeredList.length = 3,
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        var image = staggeredList[index];
        return Container(
          child: FadeInAnimation(
            index,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        );
      },
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 4),
    );
  }

  Column buildRecommendedProduct(BuildContext context) {
    return Column(
      children: [
        SideInAnimation(
          5,
          child: buildHeading(
            context,
            title: 'home.recommended',
            onTap: navigateToBrowsePage,
          ),
        ),
        SizedBox(height: 15.0),
        SideInAnimation(
          5,
          child: HorizontalListView(itemCount: productList),
        ),
      ],
    );
  }

  SideInAnimation buildSpecialOffer() {
    return SideInAnimation(
      4,
      child: CachedNetworkImage(
        imageUrl:
            'https://i.pinimg.com/564x/6a/3b/7b/6a3b7bf9bc206333bb29c4a2c21983ae.jpg',
        width: double.infinity,
        fit: BoxFit.fitWidth,
        height: 250.0,
      ),
    );
  }

  Column buildNewProduct(BuildContext context) {
    return Column(
      children: [
        SideInAnimation(
          3,
          child: buildHeading(
            context,
            title: 'home.newproduct',
            onTap: navigateToBrowsePage,
          ),
        ),
        SizedBox(height: 15.0),
        SideInAnimation(
          3,
          child: HorizontalListView(itemCount: productList),
        ),
      ],
    );
  }

  Column buildCategories(BuildContext context) {
    return Column(
      children: [
        SideInAnimation(
          2,
          child: buildHeading(
            context,
            title: 'home.categories',
            onTap: navigateToBrowseCategory,
          ),
        ),
        SizedBox(height: 15.0),
        SideInAnimation(2, child: categories(context)),
      ],
    );
  }

  SideInAnimation buildSwiper(BuildContext context) {
    return SideInAnimation(
      1,
      child: Container(
        width: double.infinity,
        height: 230.0,
        child: Swiper(
          itemCount: productList.length,
          scrollDirection: Axis.horizontal,
          autoplay: true,
          autoplayDelay: 5000,
          pagination: SwiperPagination(
            alignment: Alignment.bottomCenter,
            builder: DotSwiperPaginationBuilder(
              activeColor: Theme.of(context).primaryColor,
              color: Theme.of(context).accentColor,
            ),
          ),
          itemBuilder: (context, index) {
            var product = productList[index];
            return GestureDetector(
              onTap: () {
                navigateToProductDetailPage(product);
              },
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: 30.0, right: 18.0, left: 18.0, top: 18.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(
                    product.image!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        'Bellcommerce',
        style: GoogleFonts.pacifico(
          fontSize: 25.0,
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            FlutterIcons.search_mdi,
          ),
          onPressed: navigateToSearchPage,
        ),
        IconButton(
          icon: Icon(
            FlutterIcons.notifications_none_mdi,
          ),
          onPressed: navigateToNotificationPage,
        ),
      ],
    );
  }

  Padding buildHeading(BuildContext context,
      {required String title, void Function()? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: Theme.of(context).textTheme.headline3,
          ).tr(),
          GestureDetector(
            onTap: onTap,
            child: Text(
              'home.seeall',
              style: Theme.of(context).textTheme.subtitle1,
            ).tr(),
          ),
        ],
      ),
    );
  }

  Container categories(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 110.0,
      child: ListView.builder(
        itemCount: categoryList.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          var category = categoryList[index];
          return CategoryCircle(
            category: category,
            onTap: navigateToBrowseByCategory,
          );
        },
      ),
    );
  }
}
