class PrayModel {
  int? number;
  String? name;
  int? numAyat;
  String? text;

  PrayModel({this.number, this.name, this.numAyat, this.text});

  PrayModel.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    name = json['name'];
    numAyat = json['num_ayat'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['name'] = this.name;
    data['num_ayat'] = this.numAyat;
    data['text'] = this.text;
    return data;
  }
}
