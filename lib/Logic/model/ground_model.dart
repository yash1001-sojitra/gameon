class Ground {

 List<GroundList>? fields;

  Ground({required this.fields});

  Ground.fromJson(Map<String, dynamic> json) {
    if (json['ground'] != null) {
      fields = <GroundList>[];
      json['ground'].forEach((v) {
        fields!.add(GroundList.fromJson(v));
      });
    } 
  } 

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }
}

class GroundList {
 late  String name;
 late String pitchType;
 late String image;
 late String address;
 late String date;

  GroundList({required this.name,required this.pitchType,required this.image,required this.address,required this.date});

  GroundList.fromJson(Map<String, dynamic> json) {
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

// class Ground {
//   String? name;
//   String? pitchType;
//   String? image;
//   String? address;
//   String? date;

//   Ground({this.name, this.pitchType, this.image, this.address, this.date});

//   Ground.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     pitchType = json['pitch_type'];
//     image = json['Image'];
//     address = json['Address'];
//     date = json['date'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['pitch_type'] = this.pitchType;
//     data['Image'] = this.image;
//     data['Address'] = this.address;
//     data['date'] = this.date;
//     return data;
//   }
// }


// class Ground {
//   String? name;
//   String? image;

//   Ground({this.name, this.image});

//   Ground.fromJson(List<dynamic> json) {
//     print( json.first['Name']);
//     name = json.first['Name'];
//     // image = json['Image'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Name'] = this.name;
//     data['Image'] = this.image;
//     return data;
//   }
// }

