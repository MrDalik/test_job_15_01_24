import 'package:test_job_15_01_24/cubit/base_cubit.dart';
import 'package:test_job_15_01_24/data_source/rest_client.dart';
import 'package:test_job_15_01_24/model/reservation_model.dart';
import 'package:test_job_15_01_24/model/room_model.dart';

class ReservationCubit extends BaseCubit<ReservationModel> {
  final RestClient client;

  ReservationCubit(this.client);

  @override
  Future<ReservationModel> fetchData() => client.getResevationInfo();
}
