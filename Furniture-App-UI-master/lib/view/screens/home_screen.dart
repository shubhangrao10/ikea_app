import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/category_widget.dart';
import '../widgets/header.dart';
import '../widgets/product_card.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey categoryListKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                const Header(),
                SizedBox(
                  height: 310,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Hero(
                        tag: 'blue_card',
                        child: Material(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 270,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15.0),
                              ),
                              color: Theme.of(context).primaryColor,
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 30.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 30.0,
                                      vertical: 10.0,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Image.asset(
                                              "assets/images/weather.png",
                                              width: 25,
                                            ),
                                            const Text(
                                              " 32'C",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Text(
                                          "24",
                                          style: TextStyle(
                                            height: 1.1,
                                            fontSize: 50,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const Text(
                                          "January",
                                          style: TextStyle(
                                            fontSize: 12,
                                            height: 0.2,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 25,
                        right: 0,
                        left: 0,
                        child: Hero(
                          tag: "cat",
                          child: CategoriesListView(
                            categoryListKey: categoryListKey,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 10,
                        child: Image.asset(
                          "assets/images/ladder.png",
                          height: 180,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Recommend",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/svg/right_arrow.svg',
                        height: 18,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    itemCount: recommend.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductCard(
                        product: recommend[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const BottomNavBar(),
    );
  }
}

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
    required this.categoryListKey,
  });

  final GlobalKey<State<StatefulWidget>> categoryListKey;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SizedBox(
        key: categoryListKey,
        height: 85,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                final offset = (categoryListKey.currentContext!
                        .findRenderObject() as RenderBox)
                    .localToGlobal(Offset.zero);
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) =>
                        DetailsScreen(
                            selectedCat: index, catListOffset: offset),
                    transitionDuration: const Duration(milliseconds: 500),
                    transitionsBuilder: (_, a, __, c) =>
                        FadeTransition(opacity: a, child: c),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CategoryWidget(
                  category: categories[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
