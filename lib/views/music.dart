import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:pr_media_booster/utils/music_utils.dart';
import 'package:pr_media_booster/views/Musicpage.dart';

class Music extends StatefulWidget {
  const Music({Key? key}) : super(key: key);

  @override
  State<Music> createState() => _MusicState();
}

class _MusicState extends State<Music> {
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
                  Icon(Icons.library_music_outlined,
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
                    height: 150,
                    viewportFraction: 0.4,
                    enlargeCenterPage: true,
                    onPageChanged: (val,_){
                      setState(() {
                        i=val;
                      });
                    }
                ),
                items: MyMusicList.map((e) => Stack(
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(e['Image'])
                          )
                      ),
                      child: IconButton(
                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Music_Page(
                                AName: e['AName'],
                                Image: e['Image'],
                                Music: e['Music'],
                                Name: e['Mname'],
                              )));
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
                      Icon(Icons.music_note_outlined),
                      Text("Music"),
                    ],
                  ),

                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children:MyMusicList.map((e) => GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Music_Page(
                                AName: e['AName'],
                                Image: e['Image'],
                                Music: e['Music'],
                                Name: e['Mname'],
                              )));
                        },
                        child: Card(
                          margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                          elevation: 3,
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          borderOnForeground: false,
                          child: ListTile(
                            tileColor: Colors
                                .primaries[MyMusicList.indexOf(e) % 18].shade100,
                            leading: Image.asset(
                              e['Image'],
                              fit: BoxFit.cover,
                            ),
                            title: Text(e['Mname']),
                            subtitle: Text(e["AName"]),
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.transparent)),
                          ),
                        ),
                      ),
                      ).toList(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
