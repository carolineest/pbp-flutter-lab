import 'dart:convert';
import 'package:http/http.dart' as http;

List<WatchList> watchListFromJson(String str) => List<WatchList>.from(json.decode(str).map((x) => WatchList.fromJson(x)));

String watchListToJson(List<WatchList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WatchList {
    WatchList({
        required this.model,
        required this.pk,
        required this.fields,
    });

    Model? model;
    int pk;
    Fields fields;

    factory WatchList.fromJson(Map<String, dynamic> json) => WatchList(
        model: modelValues.map[json["model"]],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": modelValues.reverse[model],
        "pk": pk,
        "fields": fields.toJson(),
    };

    static Future<List<WatchList>> fetchWatchlist() async {
        var url = Uri.parse('https://tugas-2-caroline.herokuapp.com/mywatchlist/json/');
        var response = await http.get(
          url,
          headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json",
          },
        );

        // Decoding response menjadi json
        var data = jsonDecode(utf8.decode(response.bodyBytes));
        
        // Konversi data json menjadi object dari Watchlist
        List<WatchList> watchlist = [];
        for (var elem in data) {
          if (elem != null) {
            watchlist.add(WatchList.fromJson(elem));
          }
        }
        return watchlist;
    }
}

class Fields {
  String title;
  int rating;
  Watched? watched;
  String releaseDate;
  String review;

  Fields({
      required this.title,
      required this.rating,
      required this.watched,
      required this.releaseDate,
      required this.review,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
      title: json["title"],
      rating: json["rating"],
      watched: watchedValues.map[json["watched"]],
      releaseDate: json["release_date"],
      review: json["review"],
  );

  Map<String, dynamic> toJson() => {
      "title": title,
      "rating": rating,
      "watched": watchedValues.reverse[watched],
      "release_date": releaseDate,
      "review": review,
  };
}

enum Watched {YES, NO}

final watchedValues = EnumValues({
    "yes": Watched.YES,
    "no": Watched.NO
});

enum Model {MYWATCHLIST_MY_WATCH_LIST}

final modelValues = EnumValues({"mywatchlist.MyWatchList": Model.MYWATCHLIST_MY_WATCH_LIST});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}