import 'dart:developer';

import 'package:barbershop/src/core/fp/nil.dart';
import 'package:barbershop/src/core/ui/constants.dart';
import 'package:dio/dio.dart';

import 'package:barbershop/src/core/exceptions/repository_exception.dart';
import 'package:barbershop/src/core/fp/either.dart';
import 'package:barbershop/src/core/restClient/rest_client.dart';
import 'package:barbershop/src/model/barbershop_model.dart';
import 'package:barbershop/src/model/user_model.dart';

import './barbershop_repository.dart';

class BarbershopRepositoryImpl implements BarbershopRepository {
  final RestClient restClient;

  BarbershopRepositoryImpl({
    required this.restClient,
  });

  @override
  Future<Either<RepositoryException, BarbershopModel>> getMyBarbershop(
      UserModel userModel) async {
    try {
      switch (userModel) {
        case UserModelADM():
          final Response(data: List(first: data)) = await restClient.auth.get(
            RouteConstants.barbershop,
            queryParameters: {'user_id': '#userAuthRef'},
          );
          return Success(BarbershopModel.fromMap(data));
        case UserModelEmployee():
          final Response(:data) = await restClient.auth.get(
            '/${RouteConstants.barbershop}/${userModel.barbershopId}',
          );
          return Success(BarbershopModel.fromMap(data));
      }
    } on DioException catch (e, s) {
      log('Erro ao carregar informação de barbearia', error: e, stackTrace: s);
      return Failure(
        RepositoryException(
            message: 'Erro ao carregar informação de barbearia'),
      );
    } on ArgumentError catch (e, s) {
      log('Json inválido', error: e, stackTrace: s);
      return Failure(
        RepositoryException(message: e.message),
      );
    }
  }

  @override
  Future<Either<RepositoryException, Nil>> save(
      ({
        String email,
        String name,
        List<String> openingDays,
        List<int> openingHours
      }) data) async {
    try {
      await restClient.auth.post('/barbershop', data: {
        'user_id': '#userAuthRef',
        'name': data.name,
        'email': data.email,
        'opening_days': data.openingDays,
        'opening_hours': data.openingHours,
      });
      return Success(nil);
    } on DioException catch (e, s) {
      log('Erro ao registrar barbearia', error: e, stackTrace: s);
      return Failure(
        RepositoryException(message: 'Erro ao registrar barbearia'),
      );
    }
  }
}
