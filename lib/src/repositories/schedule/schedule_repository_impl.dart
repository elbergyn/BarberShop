import 'dart:developer';

import 'package:barbershop/src/core/exceptions/repository_exception.dart';

import 'package:barbershop/src/core/fp/either.dart';

import 'package:barbershop/src/core/fp/nil.dart';
import 'package:barbershop/src/core/restClient/rest_client.dart';
import 'package:barbershop/src/core/ui/constants.dart';
import 'package:barbershop/src/model/schedule_model.dart';
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

  @override
  Future<Either<RepositoryException, List<ScheduleModel>>> findScheduleByDate(
      ({DateTime date, int userId}) filter) async {
    try {
      final Response(:List data) = await restClient.auth
          .get(RouteConstants.schedules, queryParameters: {
        'user_id': filter.userId,
        'date': filter.date.toIso8601String()
      });

      final schedules = data.map((s) => ScheduleModel.fromMap(s)).toList();

      return Success(schedules);
    } on DioException catch (e, s) {
      log('Erro ao buscar agendamentos de uma data', error: e, stackTrace: s);
      return Failure(
        RepositoryException(message: 'Erro ao buscar agendamentos de uma data'),
      );
    } on ArgumentError catch (e, s) {
      log('JSON inválido', error: e, stackTrace: s);
      return Failure(
        RepositoryException(message: 'JSON inválido'),
      );
    }
  }
}
