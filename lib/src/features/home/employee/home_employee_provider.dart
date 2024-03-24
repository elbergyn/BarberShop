
import 'package:barbershop/src/core/fp/either.dart';
import 'package:barbershop/src/core/providers/application_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_employee_provider.g.dart';

@riverpod
Future<int> getTotalSchedulesToday(GetTotalSchedulesTodayRef ref, int userId) async {
  final DateTime(:year, :month, :day) = DateTime.now();
  final filter  = (
    date: DateTime(year, month, day),
    userId: userId
  );
  
  final scheduleRepository = ref.read(scheduleRepositoryProvider);
  final schedulesResult = await scheduleRepository.findScheduleByDate(filter);

  return switch(schedulesResult){
    Success(value: List(length: final totalSchedule)) => totalSchedule,
    Failure(: final exception) => throw exception,
  };
}