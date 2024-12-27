import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/utils/constants/list_constants.dart';
import '../controllers/calculator_controller.dart';

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
                      //fit: BoxFit.none,
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
            Expanded(
              flex: 7,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: ListConstants.buttons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () => calculatorCtrl.calculate(index),
                    splashColor: containerPClr,
                    focusColor: containerPClr,
                    hoverColor: containerPClr,
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(top: 5),
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        // color: containerPClr,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: containerPClr),
                      ),
                      child: Text(
                        ListConstants.buttons[index],
                        style: TextStyle(
                          fontSize: 25,
                          color: index == 0 || index == 19
                              ? primaryClr
                              : calculatorCtrl
                                      .isOperator(ListConstants.buttons[index])
                                  ? iconClr
                                  : null,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
