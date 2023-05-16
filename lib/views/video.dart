import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pr_media_booster/utils/video_utils.dart';

import 'videopage.dart';

void main() {
  runApp(const Video());
}

class Video extends StatefulWidget {
  const Video({Key? key}) : super(key: key);

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  CarouselController carouselController = CarouselController();
  int i=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.video_collection_outlined,
                          color: Colors.black),
                      SizedBox(width: 15),
                      Text("Populer",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
      CarouselSlider(carouselController: carouselController,
        options: CarouselOptions(
            height: 200,
            viewportFraction: 0.6,
            enlargeCenterPage: true,
            onPageChanged: (val,_){
              setState(() {
                i=val;
              });
            }
        ),
        items: Videolist.map((e) => Stack(
          children: [
            Container(
              height: 250,
              width: 330,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(e['VImage'])
                  )
              ),
              child: IconButton(
                onPressed: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Video_page(
                        Name: e['Vname'],
                        video: e['Video'],
                      ),
                    ),
                  );
                },
                icon: Icon(
                  Icons.play_circle_fill_outlined,
                  color: Colors.white.withOpacity(0.7),
                  size: 40,
                ),
              ),
            ),
          ],
        )).toList(),),
            Column(
              children: [
                Divider(color: Colors.black,thickness:1),
                Row(
                  children: [
                    Icon(Icons.video_library_outlined),
                    Text("Video"),
                  ],
                ),
          SingleChildScrollView(
            child: Center(
              child: Column(
                children: Videolist.map(
                      (e) => GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Video_page(
                            Name: e['Vname'],
                            video: e['Video'],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 200,
                      width: 330,
                      margin: const EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                        image: DecorationImage(
                            image: AssetImage(
                              e['VImage'],
                            ),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        Icons.play_circle_filled,
                        color: Colors.white.withOpacity(0.7),
                        size: 50,
                      ),
                    ),
                  ),
                ).toList(),)
              ),
            ),
          ],),
                ],
              ),
            ),
          ),
          backgroundColor: Colors.white,
        );
  }
}
