import 'package:test_job_15_01_24/cubit/base_cubit.dart';
import 'package:test_job_15_01_24/data_source/rest_client.dart';
import 'package:test_job_15_01_24/model/hotel_model.dart';

class MainCubit extends BaseCubit<HotelModel> {
  final RestClient client;

  MainCubit(this.client);

  @override
  Future<HotelModel> fetchData() => client.getHotel();
}
