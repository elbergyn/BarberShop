import 'dart:developer';

import 'package:barbershop/src/core/providers/application_providers.dart';
import 'package:barbershop/src/core/ui/barbershop_icons.dart';
import 'package:barbershop/src/core/ui/constants.dart';
import 'package:barbershop/src/core/ui/widgets/barbershop_loader.dart';
import 'package:barbershop/src/features/home/adm/home_adm_state.dart';
import 'package:barbershop/src/features/home/adm/home_header.dart';
import 'package:barbershop/src/features/home/adm/widgets/home_adm_vm.dart';
import 'package:barbershop/src/features/home/adm/widgets/home_employee_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeAdmPage extends ConsumerWidget {
  const HomeAdmPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeAdmVmProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: ColorsConstants.brow,
        onPressed: () async {
          await Navigator.of(context)
              .pushNamed(RouteConstants.registerEmployee);
          ref.invalidate(getMeProvider);
          ref.invalidate(homeAdmVmProvider);
        },
        child: const CircleAvatar(
          backgroundColor: Colors.white,
          maxRadius: 12,
          child: Icon(
            BarbershopIcons.addEmployee,
            color: ColorsConstants.brow,
          ),
        ),
      ),
      body: /* homeState.when(
        error: (error, stackTrace) {
          return const Center(
            child: Text("Erro ao carregar página home administrador"),
          );
        },
        loading: () => const BarbershopLoader(),
        data: (HomeAdmState data) {
          return CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: HomeHeader(),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) =>
                        HomeEmployeeTile(employee: data.employees[index]),
                    childCount: data.employees.length),
              ),
            ],
          );
        },
      ) */
      homeState.when(
        error: (error, stackTrace) {
          log('Erro ao carregar colaboradores',
              error: error, stackTrace: stackTrace);
          return const Center(
            child: Text('Erro ao carregar página home administrador'),
          );
        },
        loading: () => const BarbershopLoader(),
        data: (HomeAdmState data) {
          return CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: HomeHeader(),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) =>
                        HomeEmployeeTile(employee: data.employees[index]),
                    childCount: data.employees.length),
              ),
            ],
          );
        },
      )
      ,
    );
  }
}
