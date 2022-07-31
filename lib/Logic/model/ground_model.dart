class Ground {
 late  String name;
 late String pitchType;
 late String image;
 late String address;
 late String date;

  Ground({required this.name,required this.pitchType,required this.image,required this.address,required this.date});

  Ground.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    pitchType = json['pitch_type'];
    image = json['Image'];
    address = json['Address'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['pitch_type'] = pitchType;
    data['Image'] = image;
    data['Address'] = address;
    data['date'] = date;
    return data;
  }
}
