class WorkSchedule {
  int id;
  String title;
  String target;
  String address;
  String time;
  String finishtime;
  bool isFinish;
  bool isSuccess;
  String note;
  String avatar;
  String name;
  String phone;
  String date;
  WorkSchedule(
      {required this.id,
      required this.title,
      required this.target,
      required this.address,
      required this.time,
      required this.finishtime,
      required this.isFinish,
      required this.isSuccess,
      required this.note,
      required this.avatar,
      required this.name,
      required this.phone,
      required this.date});

  WorkSchedule.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        target = json['target'],
        address = json['address'],
        time = json['time'],
        finishtime = json['finishtime'],
        isFinish = json['isFinish'],
        isSuccess = json['isSuccess'],
        note = json['note'],
        avatar = json['avatar'],
        name = json['name'],
        phone = json['phone'],
        date = json['date'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['target'] = this.target;
    data['address'] = this.address;
    data['time'] = this.time;
    data['finishtime'] = this.finishtime;
    data['isFinish'] = this.isFinish;
    data['isSuccess'] = this.isSuccess;
    data['note'] = this.note;
    data['avatar'] = this.avatar;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['date'] = this.date;
    return data;
  }
}
