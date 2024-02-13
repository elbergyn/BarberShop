import 'package:asyncstate/asyncstate.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:barbershop/src/core/ui/constants.dart';

class BarbershopLoader extends AsyncOverlay {
  static const int idGlobalCustomLoading = 0;
  BarbershopLoader()
      : super(
          id: idGlobalCustomLoading,
          builder: (context, settings) => Center(
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width * .5,
              child: LoadingAnimationWidget.threeArchedCircle(
                color: ColorsConstants.brow,
                size: 60,
              ),
            ),
          ),
        );
}

class BarbershopLoaderCustom extends StatelessWidget {
  const BarbershopLoaderCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * .5,
      child: LoadingAnimationWidget.threeArchedCircle(
        color: ColorsConstants.brow,
        size: 60,
      ),
    );
  }
}
