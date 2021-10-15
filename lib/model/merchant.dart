class Merchant {
  int id;
  String avatar;
  String name;
  String phone;
  String address1;
  String address2;
  String image1;
  String image2;

  Merchant(
      {required this.id,
      required this.avatar,
      required this.name,
      required this.phone,
      required this.address1,
      required this.address2,
      required this.image1,
      required this.image2});

  Merchant.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        avatar = json['avatar'],
        name = json['name'],
        phone = json['phone'],
        address1 = json['address1'],
        address2 = json['address2'],
        image1 = json['image1'],
        image2 = json['image2'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['avatar'] = this.avatar;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['image1'] = this.image1;
    data['image2'] = this.image2;
    return data;
  }
}
