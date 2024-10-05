// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class HarrypotterModel {
  final int id;
  final String name;
  final String gender;
  final String house;
  final String yearOfBirth;
  final String ancestry;
  final String patronus;
  final String image;

  HarrypotterModel({
    required this.id,
    required this.name,
    required this.gender,
    required this.house,
    required this.yearOfBirth,
    required this.ancestry,
    required this.patronus,
    required this.image,
  });

  factory HarrypotterModel.fromMap(Map<String, dynamic> map) {
    return HarrypotterModel(
      id: map['id'] as int,
      name: map['name'] as String,
      gender: map['gender'] as String,
      house: map['house'] as String,
      yearOfBirth: map['yearOfBirth'] as String,
      ancestry: map['ancestry'] as String,
      patronus: map['patronus'] as String,
      image: map['image'] as String,
    );
  }

  factory HarrypotterModel.fromJson(String source) =>
      HarrypotterModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
