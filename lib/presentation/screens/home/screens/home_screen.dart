import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/theme.dart';
import '../controllers/calculator_controller.dart';
import '../widgets/buttons_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: CalculatorController(),
      builder: (calculatorCtrl) => Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    const Spacer(
                      flex: 2,
                    ),
                    FittedBox(
                      child: Text(
                        calculatorCtrl.result.isNotEmpty
                            ? calculatorCtrl.result.value
                            : calculatorCtrl.input.isNotEmpty
                                ? calculatorCtrl.input.value
                                : ' ',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: calculatorCtrl.result.isNotEmpty ? 60 : 30,
                          color: calculatorCtrl.result.isNotEmpty
                              ? primaryClr
                              : null,
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    Expanded(
                      flex: 5,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          calculatorCtrl.result.isNotEmpty
                              ? calculatorCtrl.finalQuestion.value
                              : '',
                          textAlign: TextAlign.left,
                          maxLines: 40,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const ButtonsWidget(),
          ],
        ),
      ),
    );
  }
}
