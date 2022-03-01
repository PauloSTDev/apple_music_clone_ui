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
      home: const HomePage(),
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
  var favoriteHeart = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
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
          gradient: LinearGradient(
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
              const SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Image(
                      image: Song().albumCover,
                      fit: BoxFit.cover,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * .8,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          Song().title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            favoriteHeart
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              if (favoriteHeart) {
                                favoriteHeart = false;
                              } else {
                                favoriteHeart = true;
                              }
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          Song().singerName,
                          style: const TextStyle(
                            color: Color(0xFF16CFDE),
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: const LinearProgressIndicator(
                        backgroundColor: Colors.grey,
                        valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xFF25D0DE)),
                        value: .4,
                        minHeight: 10.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "1:24",
                            style: TextStyle(color: Colors.black38),
                          ),
                          Text(
                            "3:47",
                            style: TextStyle(color: Colors.black38),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_back_ios_outlined),
                          color: Colors.white,
                        ),
                        IconButton(
                          iconSize: 70.0,
                          onPressed: () {},
                          icon: const Icon(Icons.play_arrow_rounded),
                          color: Colors.white,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward_ios_outlined),
                          color: Colors.white,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                  ],
                ),
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
  AssetImage albumCover = const AssetImage("assets/cover.jpg");
}
