import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MoviesView extends StatefulWidget {
  const MoviesView({super.key});

  @override
  State<MoviesView> createState() => _MoviesViewState();
}

class _MoviesViewState extends State<MoviesView> {
  List<MovieModel> list = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  bool isLoading = true;

  Future<void> getData() async {
    final response = await Dio().get(
        "https://api.themoviedb.org/3/discover/movie?api_key=2001486a0f63e9e4ef9c4da157ef37cd&page=9");

    final movies = response.data["results"] as List;
    for (var element in movies) {
      print("***********");
      print(element["original_title"]);
      print(element["backdrop_path"]);
      final movie = MovieModel(
        image: element["backdrop_path"] ?? "",
        title: element["original_title"],
      );
      list.add(movie);
    }
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Movie App",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: list.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (context, index) => Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    list[index].image,
                    loadingBuilder: (context, child, loadingProgress) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: Container(
                      height: 40,
                      alignment: Alignment.center,
                      width: double.infinity,
                      color: Colors.black.withOpacity(.8),
                      child: Text(
                        list[index].title,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}

class MovieModel {
  late String image;
  final String title;

  MovieModel({required this.image, required this.title}) {
    image = (image.isEmpty
        ? "https://static.vecteezy.com/system/resources/previews/005/337/799/original/icon-image-not-found-free-vector.jpg"
        : "http://image.tmdb.org/t/p/original$image");
  }
}
