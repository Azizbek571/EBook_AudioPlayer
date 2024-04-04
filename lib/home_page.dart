import 'dart:convert';

import 'package:ebook_with_audio/Config/my_tabs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ebook_with_audio/Config/Colors.dart' as AppColors;
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  // List popularBooks;
  // late List books;
  late ScrollController _scrollController;
  late TabController _tabController;
  ReadData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/popularBooks.json")
        .then((s) {
      setState(() {
        // popularBooks = json.decode(s);
      });
    });
    await DefaultAssetBundle.of(context).loadString("jsonbooks.json").then((s) {
      setState(() {
        // books = json.decode(s);
      });
    });
  }

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: SafeArea(
          child: Scaffold(
              body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.edit_square,
                  size: 25,
                ),
                Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.notifications),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: const Text(
                  "Popular books",
                  style: TextStyle(fontSize: 30),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 180,
            child: Stack(children: [
              Positioned(
                top: 0,
                left: -20,
                right: 0,
                child: Container(
                  height: 180,
                  child: PageView.builder(
                      controller: PageController(viewportFraction: 0.8),
                      // itemCount: popularBooks==null?0:popularBooks.length,
                      itemBuilder: (_, i) {
                        return Container(
                          height: 180,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                // image: AssetImage(popularBooks[i][""]),
                                image: AssetImage("assets/images/book.png"),
                                fit: BoxFit.fill),
                          ),
                        );
                      }),
                ),
              ),
            ]),
          ),
          Expanded(
              child: NestedScrollView(
                  controller: _scrollController,
                  headerSliverBuilder: (BuildContext context, bool isScroll) {
                    return [
                      SliverAppBar(
                        pinned: true,
                        backgroundColor: AppColors.silverBackground,
                        bottom: PreferredSize(
                          preferredSize: Size.fromHeight(50),
                          child: Container(
                              margin: EdgeInsets.only(bottom: 20),
                              child: TabBar(
                                  indicatorPadding: EdgeInsets.all(0),
                                  indicatorSize: TabBarIndicatorSize.label,
                                  labelPadding: EdgeInsets.only(right: 10),
                                  controller: _tabController,
                                  isScrollable: true,
                                  indicator: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          blurRadius: 7,
                                          offset: Offset(0, 0),
                                        )
                                      ]),
                                  tabs: [
                                    AppTabs(
                                        color: AppColors.menu1Color,
                                        text: "New"),
                                    AppTabs(
                                        color: AppColors.menu2Color,
                                        text: "Popular"),
                                    AppTabs(
                                        color: AppColors.menu3Color,
                                        text: "Trendin"),
                                  ])),
                        ),
                      )
                    ];
                  },
                  body: TabBarView(controller: _tabController, children: [
                    ListView.builder(
                        // itemCount: books==null?0:books.length,
                        itemBuilder: (_, i) {
                      return Container(
                        margin: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          bottom: 10,
                        ),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.tabVarViewColor,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 3,
                                      offset: Offset(0, 0),
                                      color: Colors.grey.withOpacity(0.2))
                                ]),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  Container(
                                    width: 90,
                                    height: 120,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/img/pic-1.png")),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.star,
                                              size: 24,
                                              color: AppColors.startColor),
                                          Text(
                                            '4.5',
                                            style: TextStyle(
                                                color: AppColors.menu2Color),
                                          )
                                        ],
                                      ),
                                      Text(
                                        'THE WATER CURE',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Avenir"),
                                      ),
                                      Text(
                                        'Martin Hyatt',
                                        style: TextStyle(
                                            fontSize: 16,
                                           color: AppColors.subTitleText,
                                            fontFamily: "Avenir"),
                                      ),
                                      Container(
                                        // padding: EdgeInsets.all(5),
                                        width: 50,
                                        height: 24,
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: AppColors.loveColor),
                                        child: Text(
                                          'Love',
                                          style: TextStyle(
                                              fontSize: 12,
                                             color: Colors.white,
                                              fontFamily: "Avenir"),
                                        ),
                                        alignment: Alignment.center,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )),
                      );
                    }),
                    Material(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey,
                        ),
                        title: Text('Content'),
                      ),
                    ),
                    Material(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey,
                        ),
                        title: Text('Content'),
                      ),
                    ),
                  ])))
        ],
      ))),
    );
  }
}
