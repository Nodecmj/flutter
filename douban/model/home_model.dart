int counter = 1;

class MovieItem {
  int ranking;
  double rank;
  String imageURL;
  String title;
  String createTime;

  MovieItem.fromMap(Map<String, dynamic> json) {
    this.ranking = counter++;
    this.imageURL = json["img"];
    this.rank = double.parse(json["rank"]);
    this.title = json["name"];
  }

  @override
  String toString() {
    return 'MovieItem{ranking: $ranking, rank: $rank, imageURL: $imageURL, title: $title, createTime: $createTime}';
  }
}
