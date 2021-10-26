// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'film.dart';

void main() {
  runApp(const MaterialApp(
    title: 'My App',
    home: Main(),
  ));
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anmeldeseite'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Anmelden'),
          onPressed: () {
// pushing SecondRoute
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondRoute()),
            );
          },
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  SecondRoute({Key? key}) : super(key: key);
  final List<Film> movies = [
    Film("Fluch der Karibik", 10),
    Film("Infinite", 2),
    Film("Jungle Cruise", 3),
    Film("Escape Room", 5),
    Film("Terminator", 3),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MovieApp"),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(50),
          itemCount: movies.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              width: 50,
              margin: const EdgeInsets.all(2),
              color: movies[index].liked >= 10
                  ? Colors.blue[400]
                  : movies[index].liked > 3
                      ? Colors.blue[100]
                      : Colors.grey,
              child: Center(
                  child: Row(
                children: <Widget>[
                  Text(
                    '${movies[index].title} (${movies[index].liked})',
                    style: const TextStyle(fontSize: 18),
                  ),
                  IconButton(
                      onPressed: () {
                        movies[index].changeliked(movies[index].liked + 1);
                      },
                      icon: const Icon(Icons.add))
                ],
              )),
            );
          }),
      floatingActionButton: Center(
        heightFactor: 1,
        child: ElevatedButton(
          onPressed: () {
            // Removing SecondRoute
            toFavouriten(context);
          },
          child: const Text('Favoriten'),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}

class ThirdRoute extends StatelessWidget {
  const ThirdRoute({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favoriten"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
// Removing SecondRoute
            toMain(context);
          },
          child: const Text('MovieApp'),
        ),
      ),
    );
  }
}

toMain(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SecondRoute()),
  );
}

toFavouriten(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const ThirdRoute()),
  );
}

addLiked(Film movies) {
  movies.liked + 1;
}
