import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/utils/constants/list_constants.dart';
import '../controllers/calculator_controller.dart';

class ButtonsWidget extends StatelessWidget {
  const ButtonsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CalculatorController>(
      builder: (calculatorCtrl) => Expanded(
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
    );
  }
}
