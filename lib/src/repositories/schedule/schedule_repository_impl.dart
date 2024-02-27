import 'dart:developer';

import 'package:barbershop/src/core/exceptions/repository_exception.dart';

import 'package:barbershop/src/core/fp/either.dart';

import 'package:barbershop/src/core/fp/nil.dart';
import 'package:barbershop/src/core/restClient/rest_client.dart';
import 'package:barbershop/src/core/ui/constants.dart';
import 'package:dio/dio.dart';

import './schedule_repository.dart';

class ScheduleRepositoryImpl implements ScheduleRepository {
  final RestClient restClient;

  ScheduleRepositoryImpl({
    required this.restClient,
  });

  @override
  Future<Either<RepositoryException, Nil>> scheduleClient(
      ({
        int barbershopId,
        String clientName,
        DateTime date,
        int time,
        int userId,
      }) scheduleData) async {
    try {
      await restClient.auth.post(RouteConstants.schedules, data: {
        'barbershop_id': scheduleData.barbershopId,
        'user_id': scheduleData.userId,
        'client_name': scheduleData.clientName,
        'date': scheduleData.date.toIso8601String(),
        'time': scheduleData.time
      });

      return Success(Nil());
    } on DioException catch (e, s) {
      log('Erro ao registrar agendamento', error: e, stackTrace: s);
      return Failure(
          RepositoryException(message: 'Erro ao registrar agendamento'));
    }
  }
}