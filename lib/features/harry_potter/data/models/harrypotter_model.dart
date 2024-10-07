class HarrypotterModel {
  final int id;
  final String name;
  final String? gender;
  final String? house;
  final String? yearOfBirth;
  final String? ancestry;
  final String? patronus;
  final String image;

  HarrypotterModel({
    required this.id,
    required this.name,
    this.gender,
    this.house,
    this.yearOfBirth,
    this.ancestry,
    this.patronus,
    required this.image,
  });

  factory HarrypotterModel.fromMap(Map<String, dynamic> map) {
    return HarrypotterModel(
      id: map['id'] as int,
      name: map['name'] as String,
      gender: map['gender'] as String?,
      house: map['house'] as String?,
      yearOfBirth: map['yearOfBirth'] as String?,
      ancestry: map['ancestry'] as String?,
      patronus: map['patronus'] as String?,
      image: map['image'] as String,
    );
  }
}
