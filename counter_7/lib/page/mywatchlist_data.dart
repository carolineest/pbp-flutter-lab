import 'package:flutter/material.dart';
import 'package:counter_7/model/mywatchlist.dart';
import '../widget/drawer.dart';

class WatchListDetail extends StatefulWidget {
  const WatchListDetail({super.key, required this.watchlistModel});
  final WatchList watchlistModel;

  @override
  State<WatchListDetail> createState() => _MyDetailState(watchlistModel);
}

class _MyDetailState extends State<WatchListDetail> {
  WatchList model;
  _MyDetailState(this.model);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      drawer: buildDrawer(context),
      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                model.fields.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
            child: Row(
              children: [
                const Text(
                  "Release Date: ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Text(
                  model.fields.releaseDate,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Row(
              children: [
                const Text(
                  "Rating: ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Text(
                  '${model.fields.rating}',
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Row(
              children: [
                const Text(
                  "Watched? ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Text(
                  model.fields.watched.toString().split(".").last.toLowerCase().split("_").first,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Row(
              children: [
                const Text(
                  "Review: ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Flexible(
                  child: Text(
                    model.fields.review,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),

          const Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: TextButton(
              style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Back",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
