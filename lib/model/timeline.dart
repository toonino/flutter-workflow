class Timeline {
  int id;
  String title;
  String name;
  String address;
  String time;
  String finishtime;
  bool isFinish;

  Timeline(
      {required this.id,
      required this.title,
      required this.name,
      required this.address,
      required this.time,
      required this.finishtime,
      required this.isFinish});

  Timeline.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        name = json['name'],
        address = json['address'],
        time = json['time'],
        finishtime = json['finishtime'],
        isFinish = json['isFinish'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['name'] = this.name;
    data['address'] = this.address;
    data['time'] = this.time;
    data['finishtime'] = this.finishtime;
     data['isFinish'] = this.isFinish;
    return data;
  }
}
