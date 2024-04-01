import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ebook_with_audio/Config/Colors.dart' as AppColors;
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          const SizedBox(height: 20,),
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
                      itemCount: 5,
                      itemBuilder: (_, i) {
                        return Container(
                          height: 180,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage("assets/images/book.png"),
                              fit: BoxFit.fill
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ]),
          )
        ],
      ))),
    );
  }
}
