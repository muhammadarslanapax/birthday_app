// To parse this JSON data, do
//
//     final childDataModel = childDataModelFromJson(jsonString);

import 'dart:convert';

ChildDataModel childDataModelFromJson(String str) =>
    ChildDataModel.fromJson(json.decode(str));

String childDataModelToJson(ChildDataModel data) => json.encode(data.toJson());

class ChildDataModel {
  final bool? gender;
  final bool? premine;
  final String? expectedDate;
  final bool? isBornyet;
  final String? uuid;
  final String? name;
  final String? bornDate;

  ChildDataModel({
    this.gender,
    this.premine,
    this.expectedDate,
    this.isBornyet,
    this.uuid,
    this.name,
    this.bornDate,
  });

  factory ChildDataModel.fromJson(Map<String, dynamic> json) => ChildDataModel(
        gender: json["gender"],
        premine: json["premine"],
        expectedDate: json["expected_date"],
        isBornyet: json["isBornyet"],
        uuid: json["uuid"],
        name: json["name"],
        bornDate: json["born_date"],
      );

  Map<String, dynamic> toJson() => {
        "gender": gender,
        "premine": premine,
        "expected_date": expectedDate,
        "isBornyet": isBornyet,
        "uuid": uuid,
        "name": name,
        "born_date": bornDate,
      };
}
