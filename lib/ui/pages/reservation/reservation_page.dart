import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_job_15_01_24/cubit/base_state.dart';
import 'package:test_job_15_01_24/cubit/reservation_cubit.dart';
import 'package:test_job_15_01_24/data_source/rest_client.dart';
import 'package:test_job_15_01_24/ui/pages/reservation/reservation_page_content.dart';
import 'package:test_job_15_01_24/widget_library.dart';

class ReservationPage extends StatelessWidget {
  const ReservationPage({super.key,});

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: const Color(0xffF6F6F9),
    body: SafeArea(
      child: Column(
        children: [ const TitlePage(text: "Бронирование"),
          BlocProvider(
            create: (context) => ReservationCubit(RestClient(Dio())),
            child: BlocBuilder<ReservationCubit, BaseState>(
              builder: (context, state) => switch (state) {
                LoadingState() => const CircularProgressIndicator(),
                ErrorState(error: final error) => Text(error.toString()),
                ResultState(value: final value) =>
                    ReservationPageContent(model: value,),
              },
            ),
          ),
        ],
      ),
    ),
  );
}
