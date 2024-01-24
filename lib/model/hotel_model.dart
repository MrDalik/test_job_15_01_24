import 'package:json_annotation/json_annotation.dart';

part 'hotel_model.g.dart';
@JsonSerializable()
class HotelModel {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "adress")
  String adress;
  @JsonKey(name: "minimal_price")
  int minimalPrice;
  @JsonKey(name: "price_for_it")
  String priceForIt;
  @JsonKey(name: "rating")
  int rating;
  @JsonKey(name: "rating_name")
  String ratingName;
  @JsonKey(name: "image_urls")
  List<String> imageUrls;
  @JsonKey(name: "about_the_hotel")
  AboutTheHotel aboutTheHotel;

  HotelModel({
    required this.id,
    required this.name,
    required this.adress,
    required this.minimalPrice,
    required this.priceForIt,
    required this.rating,
    required this.ratingName,
    required this.imageUrls,
    required this.aboutTheHotel,
  });

  factory HotelModel.fromJson(Map<String, dynamic> json) => _$HotelModelFromJson(json);

  Map<String, dynamic> toJson() => _$HotelModelToJson(this);
}

@JsonSerializable()
class AboutTheHotel {
  @JsonKey(name: "description")
  String description;
  @JsonKey(name: "peculiarities")
  List<String> peculiarities;

  AboutTheHotel({
    required this.description,
    required this.peculiarities,
  });

  factory AboutTheHotel.fromJson(Map<String, dynamic> json) => _$AboutTheHotelFromJson(json);

  Map<String, dynamic> toJson() => _$AboutTheHotelToJson(this);
}
