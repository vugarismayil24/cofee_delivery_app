class CoffeeModel {
  String? title;
  String? subTitle;
  String? description;
  String? imageUrl;
  double? price;
  double? rating;
  int? voteCount;
  bool? isLiked;

  CoffeeModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subTitle = json["subTitle"];
    description = json['description'];
    imageUrl = json['imageUrl'];
    price = json['price'];
    rating = json['rating'];
    voteCount = json['voteCount'];
    isLiked = json['isLiked'];
  }
}
