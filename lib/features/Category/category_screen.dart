import 'package:flutter/material.dart';
import 'package:news_application/core/shared_wigets/drawer.dart';
import 'package:news_application/provider/category_provider.dart';
import 'package:news_application/provider/sourceModel_provider.dart';
import 'package:provider/provider.dart';
import '../../core/Custome Widgets/channels.dart';
import '../../core/Custome Widgets/text_field_search.dart';
import '../../core/Custome Widgets/visible.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  static const String routeName = "CategoryScreen";

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    super.initState();

    var category = context.read<CategoryProvider>();
    var source = context.read<SourceModelProvider>();

    source.getSourceModel(category.selectedCategory!.catName);
  }

  late var sources;
  Icon search = const Icon(Icons.search);
  Icon cancel = const Icon(Icons.cancel);
  bool clicked = false;
  bool visible = false;
  bool articleClicked = false;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    CategoryProvider category = Provider.of<CategoryProvider>(context);
    SourceModelProvider sourceModel = Provider.of<SourceModelProvider>(context);

    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage("assets/pattern.png"),
            fit: BoxFit.cover,
          )),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: AppBar(
            title: visible
                ? Visible(visible: visible,)
                : const SearchBar(),
            actions: [
              IconButton(
                icon: clicked ? cancel : search,
                onPressed: () {
                  setState(
                    () {
                      clicked = !clicked;
                      visible = !visible;
                      sourceModel
                          .getSourceModel(category.selectedCategory!.catName);
                    },
                  );
                },
              ),
            ],
          ),
        ),
        drawer: const ScreenDrawer(),
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            !sourceModel.loading
                ? Expanded(
                    child: DefaultTabController(
                      initialIndex: selectedIndex,
                      length: sourceModel.sourceModel!.sources.length,
                      child: TabBar(
                        onTap: (index) {

                          setState(
                            () {
                              if (selectedIndex == index) {
                                sourceModel.getSourceModel(
                                    category.selectedCategory!.catName);
                              } else {
                                selectedIndex = index;
                                sourceModel.searchForArticle(sourceModel
                                    .sourceModel!.sources[selectedIndex].name);
                              }
                            },
                          );
                        },
                        indicator: const BoxDecoration(),
                        isScrollable: true,
                        tabs: sourceModel.sourceModel!.sources
                            .map((e) => ChannelsView(
                                  name: e.name,
                                  index: selectedIndex ==
                                          sourceModel!.sourceModel!.sources
                                              .indexOf(e)
                                      ? selectedIndex
                                      : -1,
                                ))
                            .toList(),
                      ),
                    ),
                  )
                : const Center(child: CircularProgressIndicator()),
            !sourceModel.loading
                ? Expanded(
                    flex: 20,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(20),
                              child: InkWell(
                                child: Column(
                                  children: [
                                    Image.network(
                                        "https://ichef.bbci.co.uk/onesport/cps/976/cpsprodpb/094B/production/_131297320_20871252.jpg"),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(sourceModel
                                        .displaySearch![index].description)
                                  ],
                                ),
                                onTap: () {
                                  print("Clicked");
                                },
                              ),
                            ),
                        itemCount: sourceModel.displaySearch!.length),
                  )
                : const Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
