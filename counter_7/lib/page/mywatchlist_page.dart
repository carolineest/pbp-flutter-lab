import 'package:flutter/material.dart';
import 'package:counter_7/model/mywatchlist.dart';
import 'package:counter_7/page/mywatchlist_data.dart';
import '../widget/drawer.dart';

class WatchListPage extends StatefulWidget {
    const WatchListPage({Key? key}) : super(key: key);

    @override
    _MyWatchListState createState() => _MyWatchListState();
}

class _MyWatchListState extends State<WatchListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('My Watch List'),
        ),

        // Menambahkan drawer menu
        drawer: buildDrawer(context),

        body: FutureBuilder(
          future: WatchList.fetchWatchlist(),
          builder: (context, AsyncSnapshot snapshot){

            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (!snapshot.hasData) {
                  return Column(
                  children: const [
                      Text(
                        "Tidak ada watchlist untuk ditampilkan",
                        style: TextStyle(
                          color: Color(0xff59A5D8),
                          fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index)=> InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WatchListDetail(watchlistModel: snapshot.data![index])
                              ),
                          ),

                          child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              padding: const EdgeInsets.all(15.0),
                              decoration: BoxDecoration(
                                color:Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 0.7
                                  )
                                ],
                              ),

                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Text(
                                "${snapshot.data![index].fields.title}",
                                style: const TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                  ),
                )
              );
            }
          }
        }
      )
    );
  }
}