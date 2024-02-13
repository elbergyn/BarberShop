import 'package:barbershop/src/core/ui/widgets/avatar_widget.dart';
import 'package:flutter/material.dart';

class EmployeeRegisterPage extends StatelessWidget {
  const EmployeeRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar colaborador'),
      ),
      body: const SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              AvatarWidget(),
              SizedBox(
                height: 32,
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
