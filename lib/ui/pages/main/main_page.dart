import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_job_15_01_24/cubit/base_state.dart';
import 'package:test_job_15_01_24/cubit/main_cubit.dart';
import 'package:test_job_15_01_24/data_source/rest_client.dart';
import 'package:test_job_15_01_24/ui/pages/main/main_page_content.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color(0xffF6F6F9),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: BlocBuilder<MainCubit, BaseState>(
                    bloc: MainCubit(RestClient(Dio())),
                    builder: (context, state) => switch (state) {
                      LoadingState() => const CircularProgressIndicator(),
                      ErrorState(error: final error) => Text(error.toString()),
                      ResultState(value: final value) =>
                        MainPageContent(model: value),
                    },
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: const Color(0xff0D72FF),
                        padding: const EdgeInsets.all(15.0),
                        textStyle: const TextStyle(fontSize: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {
                        // TODO
                        // Navigator.of(context).push(MaterialPageRoute(
                        //   builder: (context) => Apartament(context),
                        // ));
                      },
                      child: const Text(
                        'К выбору номера',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          height: 17.6 / 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SvgPicture.asset('assets/icon/Home Indicator.svg'),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
