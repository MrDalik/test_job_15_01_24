import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_job_15_01_24/cubit/base_state.dart';
import 'package:test_job_15_01_24/cubit/room_cubit.dart';
import 'package:test_job_15_01_24/data_source/rest_client.dart';
import 'package:test_job_15_01_24/ui/pages/romms/room_page_content.dart';

class RoomPage extends StatelessWidget {
  const RoomPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xffF6F6F9),
        body: SafeArea(
          child: BlocProvider(
            create: (context) => RoomCubit(RestClient(Dio())),
            child: BlocBuilder<RoomCubit, BaseState>(
              builder: (context, state) => switch (state) {
                LoadingState() => const CircularProgressIndicator(),
                ErrorState(error: final error) => Text(error.toString()),
                ResultState(value: final value) =>
                  RoomPageContent(model: value),
              },
            ),
          ),
        ),
      );
}
