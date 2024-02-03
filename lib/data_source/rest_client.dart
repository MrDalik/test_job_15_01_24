import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:test_job_15_01_24/model/hotel_model.dart';
import 'package:test_job_15_01_24/model/reservation_model.dart';
import 'package:test_job_15_01_24/model/room_model.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://run.mocky.io/v3')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/75000507-da9a-43f8-a618-df698ea7176d')
  Future<HotelModel> getHotel();

  @GET('/157ea342-a8a3-4e00-a8e6-a87d170aa0a2')
  Future<RoomModel> getRooms();

@GET('/63866c74-d593-432c-af8e-f279d1a8d2ff')
Future<ReservationModel> getResevationInfo();
}
