import 'package:flutter/material.dart';

import 'views/music.dart';
import 'views/video.dart';


void main() {
  runApp(
      Mymusic(),
  );
}

class Mymusic extends StatefulWidget {
  const Mymusic({Key? key}) : super(key: key);

  @override
  State<Mymusic> createState() => _MymusicState();
}

class _MymusicState extends State<Mymusic> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) => DefaultTabController(
          length: 2,
          initialIndex: 0,
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                "Ranibow music",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              centerTitle: true,
              backgroundColor: Colors.white,
              bottom: TabBar(
                indicatorWeight: 3,
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.black,
                isScrollable: true,
                labelPadding: EdgeInsets.only(left: 20, right: 20),
                tabs: [
                  Tab(
                    child: Text(
                      "Musics",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Videos",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black
                      ),
                    ),
                  ),
                ],
              ),
              elevation: 0,
            ),
            body: TabBarView(
              children: [
                Music(),
                Video(),
              ],
            ),
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}

