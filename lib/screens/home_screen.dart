import 'package:flutter/material.dart';
// import 'package:toonflix/models/webtoon_model.dart';
// import 'package:toonflix/services/api_service.dart';
// import 'package:toonflix/widgets/webtoon_widget.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2, //dim을 넣어주기 위함
        backgroundColor: Colors.green[500],
        foregroundColor: Colors.white,
        title: const Text(
          "오늘의 웹툰", 
          style: TextStyle(fontSize : 23, fontWeight: FontWeight.w500,),
        ),
      ),
    );
  }
}