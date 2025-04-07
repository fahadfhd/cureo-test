class CountriesModel {
  String? code;
  String? name;
  String? emoji;

  CountriesModel({this.code, this.name, this.emoji});

  CountriesModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    emoji = json['emoji'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    data['emoji'] = this.emoji;
    return data;
  }
}