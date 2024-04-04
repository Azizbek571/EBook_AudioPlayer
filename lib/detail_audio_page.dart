import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ebook_with_audio/Config/Colors.dart' as AppColors;

class DetailAudioPage extends StatefulWidget {
  const DetailAudioPage({super.key});

  @override
  State<DetailAudioPage> createState() => _DetailAudioPageState();
}

class _DetailAudioPageState extends State<DetailAudioPage> {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.audioBlueBackground,
      body: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: screenHeight / 3,
              child: Container(color: AppColors.audioBlueBackground)),
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                leading: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back_ios),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search),
                  ),
                ],
                backgroundColor: Colors.transparent,
              )),
          Positioned(
              left: 0,
              right: 0,
              top: screenHeight * 0.2,
              height: screenHeight * 0.36,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 70),
                    Text(
                      "THE WATER CURE",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Avenir"),
                    ),
                    Text("Martin Hyatt", style: TextStyle(fontSize: 20, ),)
                  ],
                ),
              )),
              Positioned(
                top: screenHeight*0.12,
                left: (screenWidth-150)/2,
                right: (screenWidth-150)/2,
                height: screenHeight*0.16,
                child: Container(
               decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
               border: Border.all(color: Colors.white, width: 2),
               color: AppColors.audioGreyBackground
               ),   
               child: Padding(padding: EdgeInsets.all(20),
               child: Container(
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(20),
                shape: BoxShape.circle,
                border:Border.all(color: Colors.white, width: 5),
                image: DecorationImage(image: AssetImage("assets/img/pic-1.png"),
                fit: BoxFit.cover
                )
                ),
               ),
               ),
              )),
        ],
      ),
    );
  }
}
