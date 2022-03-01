import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var favoriteStar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient:  LinearGradient(
              colors: [
                Color(0xFF3AA575),
                Color(0xFF4CD4A9),
              ],
            ),
          ),
        ),
        elevation: 0.0,
        title: const Text("Now Playing"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.share),
          ),
          IconButton(
            icon: Icon(favoriteStar ? Icons.star : Icons.star_border),
            onPressed: () {
              setState(() {
                if (favoriteStar) {
                  favoriteStar = false;
                } else {
                  favoriteStar = true;
                }
              });
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient:  LinearGradient(
            colors: [
              Color(0xFF3AA575),
              Color(0xFF4CD4A9),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Image(
                      image: Song().albumCover,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class Song {
  String title = "Circles";
  String singerName = "Post Malone";

  AssetImage albumCover = AssetImage("assets/cover.png";)
}