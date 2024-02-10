import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_job_15_01_24/model/reservation_model.dart';
import 'package:test_job_15_01_24/widget_library.dart';

class ReservationBlock extends StatelessWidget {
  final ReservationModel model;

  const ReservationBlock({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return StandartContener(
        child: Column(
      children: [
        _ReservationBlockItem(
          nameitem: 'Вылет из',
          textitem: model.departure,
        ),
        const SizedBox(
          height: 16,
        ),
        _ReservationBlockItem(
          nameitem: 'Страна, город',
          textitem: model.arrivalCountry,
        ),
        const SizedBox(
          height: 16,
        ),
        _ReservationBlockItem(
          nameitem: 'Даты',
          textitem: '${model.tourDateStart} – ${model.tourDateStop}',
        ),
        const SizedBox(
          height: 16,
        ),
        _ReservationBlockItem(
          nameitem: 'Кол-во ночей',
          textitem: '${model.numberOfNights} ночей',
        ),
        const SizedBox(
          height: 16,
        ),
        _ReservationBlockItem(
          nameitem: 'Отель',
          textitem: model.hotelName,
        ),
        const SizedBox(
          height: 16,
        ),
        _ReservationBlockItem(
          nameitem: 'Номер',
          textitem: model.room,
        ),
        const SizedBox(
          height: 16,
        ),
        _ReservationBlockItem(
          nameitem: 'Питание',
          textitem: model.nutrition,
        ),
      ],
    ));
  }
}

class _ReservationBlockItem extends StatelessWidget {
  final String nameitem;
  final String textitem;

  const _ReservationBlockItem({required this.nameitem, required this.textitem});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 76 + 64,
          child: Text(
            nameitem,
            style: const TextStyle(
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w400,
                fontSize: 16,
                height: 19.2 / 16,
                color: Color(0xff828796)),
          ),
        ),
        Expanded(
            child: Text(
          textitem,
          style: const TextStyle(
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w400,
              fontSize: 16,
              height: 19.2 / 16,
              color: Color(0xff000000)),
        ))
      ],
    );
  }
}

class Prise extends StatelessWidget {
  final int tourprice;
  final int fuelcharge;
  final int servicecharge;

  const Prise(
      {super.key,
      required this.tourprice,
      required this.fuelcharge,
      required this.servicecharge});

  @override
  Widget build(BuildContext context) {
    var format = NumberFormat.decimalPattern('ru_RU');
    return StandartContener(
      child: Column(
        children: [
          _PriseItem(
            textitem: 'Тур',
            prise: tourprice,
          ),
          const SizedBox(
            height: 16,
          ),
          _PriseItem(
            textitem: 'Топливный сбор',
            prise: fuelcharge,
          ),
          const SizedBox(
            height: 16,
          ),
          _PriseItem(
            textitem: 'Сервисный сбор',
            prise: servicecharge,
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              const Text(
                'Коплате',
                style: TextStyle(
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    height: 19.2 / 16,
                    color: Color(0xff828796)),
              ),
              const Spacer(),
              Text(
                '${format.format(tourprice + fuelcharge + servicecharge)} ₽',
                style: const TextStyle(
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    height: 19.2 / 16,
                    color: Color(0xff0D72FF)),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _PriseItem extends StatelessWidget {
  final String textitem;
  final int prise;

  const _PriseItem({required this.textitem, required this.prise});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          textitem,
          style: const TextStyle(
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w400,
              fontSize: 16,
              height: 19.2 / 16,
              color: Color(0xff828796)),
        ),
        const Spacer(),
        Text(
          '$prise',
          style: const TextStyle(
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w400,
              fontSize: 16,
              height: 19.2 / 16,
              color: Color(0xff000000)),
        ),
      ],
    );
  }
}

class Regisration extends StatelessWidget {
  const Regisration({super.key});

  @override
  Widget build(BuildContext context) {
    return const StandartContener(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Информация о покупателе',
          style: TextStyle(
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w500,
              fontSize: 22,
              height: 26.4 / 22,
              color: Color(0xff000000)),
        ),
        SizedBox(
          height: 20,
        ),
        TextField(
          decoration: InputDecoration(
            hoverColor: Color(0xFFF6F6F9),
            border: OutlineInputBorder(),
            labelText: 'Номер телефона',
          ),
        ),
        SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Почта',
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту',
          style: TextStyle(
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.w500,
              fontSize: 14,
              height: 16.8 / 14,
              color: Color(0xff828796)),
        ),
      ],
    ));
  }
}
