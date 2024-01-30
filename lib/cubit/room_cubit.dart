import 'package:test_job_15_01_24/cubit/base_cubit.dart';
import 'package:test_job_15_01_24/data_source/rest_client.dart';
import 'package:test_job_15_01_24/model/room_model.dart';

class RoomCubit extends BaseCubit<RoomModel> {
  final RestClient client;

  RoomCubit(this.client);

  @override
  Future<RoomModel> fetchData() => client.getRooms();
}
