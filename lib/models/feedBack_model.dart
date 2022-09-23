// ignore_for_file: file_names

class FeedBack {
  String? imgAvatar;
  String? name;
  String? time;
  String? date;
  int? voteStar;
  String? feedBackFor;
  String? comment;

  FeedBack(
      {this.imgAvatar,
      this.name,
      this.time,
      this.date,
      this.voteStar,
      this.feedBackFor,
      this.comment});

  FeedBack.fromJson(Map<String, dynamic> json) {
    imgAvatar = json['imgAvatar'];
    name = json['name'];
    time = json['time'];
    date = json['date'];
    voteStar = json['voteStar'];
    feedBackFor = json['feedBackFor'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imgAvatar'] = imgAvatar;
    data['name'] = name;
    data['time'] = time;
    data['date'] = date;
    data['voteStar'] = voteStar;
    data['feedBackFor'] = feedBackFor;
    data['comment'] = comment;
    return data;
  }
}
