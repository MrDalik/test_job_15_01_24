import 'package:json_annotation/json_annotation.dart';

part 'room_model.g.dart';

@JsonSerializable()
class RoomModel {
  @JsonKey(name: "rooms")
  final List<Room> rooms;

  RoomModel({
    required this.rooms,
  });

  factory RoomModel.fromJson(Map<String, dynamic> json) =>
      _$RoomModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoomModelToJson(this);
}

@JsonSerializable()
class Room {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "price")
  final int price;
  @JsonKey(name: "price_per")
  final String pricePer;
  @JsonKey(name: "peculiarities")
  final List<String> peculiarities;
  @JsonKey(name: "image_urls")
  final List<String> imageUrls;

  Room({
    required this.id,
    required this.name,
    required this.price,
    required this.pricePer,
    required this.peculiarities,
    required this.imageUrls,
  });

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  Map<String, dynamic> toJson() => _$RoomToJson(this);
}
