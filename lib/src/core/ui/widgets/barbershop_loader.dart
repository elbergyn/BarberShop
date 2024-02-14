import 'package:barbershop/src/core/ui/constants.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class BarbershopLoader extends StatelessWidget {
  static const int idGlobalCustomLoading = 0;
  const BarbershopLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * .5,
        child: LoadingAnimationWidget.threeArchedCircle(
          color: ColorsConstants.brow,
          size: 60,
        ),
      ),
    );
  }
}
