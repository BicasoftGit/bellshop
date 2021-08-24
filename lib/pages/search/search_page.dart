part of '../pages.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 50.0,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 3.0),
            child: Center(
              child: TextField(
                onTap: () => showSearch(context: context, delegate: Search()),
                readOnly: true,
                decoration: InputDecoration(
                  hintText: tr('search.search'),
                  alignLabelWithHint: true,
                  hintStyle: Theme.of(context).textTheme.subtitle2,
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              FlutterIcons.sort_descending_mco,
              color: Theme.of(context).accentColor,
            ),
            onPressed: navigateToSortPage,
          ),
          IconButton(
            icon: Icon(
              FlutterIcons.filter_fea,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: navigateToFilterPage,
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 18.0),
        height: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '0 ' + tr('search.result'),
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  InkWell(
                    onTap: navigateToSearchByCategory,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'search.searchbycategory',
                          style: Theme.of(context).textTheme.subtitle2,
                        ).tr(),
                        SizedBox(width: 5.0),
                        Icon(FlutterIcons.chevron_small_down_ent)
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/search.png',
                      width: MediaQuery.of(context).size.width / 2,
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      'search.title',
                      style: Theme.of(context).textTheme.headline1,
                    ).tr(),
                    SizedBox(height: 15.0),
                    Text(
                      'search.subtitle',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle1,
                    ).tr(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 5,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToSearchByCategory() {
    Get.to(SearchCategoryPage());
  }

  void navigateToFilterPage() {
    Get.to(FilterPage());
  }

  void navigateToSortPage() {
    Get.to(SortPage());
  }

  void navigateToSearch(BuildContext contexts) {
    showSearch(context: contexts, delegate: Search());
  }
}
