import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';
// import 'package:toonflix/widgets/webtoon_widget.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final Future <List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

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
      body: FutureBuilder(
        future: webtoons,
        builder: (context, futureData) {
          if(futureData.hasData) {
            return Column(
              children: [
                const SizedBox(
                  height: 50,
              ),
              Expanded(child: makeList(futureData))
            ],
            );
            // return ListView.separated(
            //   scrollDirection: Axis.horizontal,
            //   itemCount: futureData.data!.length,
            //   itemBuilder: (context, index) {
            //     // !를 붙이면 데이터가 있다는 확신을 주기 위함. 강제성 부여
            //     var webtoon = futureData.data![index];
            //     return Text(webtoon.title);
            //   },
            //   separatorBuilder: (context, index) => const SizedBox 
            //   (width: 20),
            // );
              // children: [
                // for(var webtoon in futureData.data!) Text('${webtoon.title}')
              // ],
            // );
          }
          return const Center (
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      // padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      itemBuilder: (context, index) {
        var webtoon = snapshot.data![index];
        return Column(
          children: [Image.network(webtoon.thumb), Text
          (webtoon.title)],
        );
      },
      separatorBuilder: (context, index) => const
      SizedBox(width: 40),
    );
  }
}
