import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

import '../../../../core/utils/constants/list_constants.dart';

class CalculatorController extends GetxController {
  RxString input = ''.obs;
  RxString finalQuestion = ''.obs;
  RxString result = ''.obs;

  calculate(int index) async {
    HapticFeedback.mediumImpact();

    if (index == 0) {
      result.value = '';
      input.value = '';
    } else if (index == 1) {
      result.value = '';

      try {
        input.value = input.substring(0, input.value.length - 1);
      } catch (e) {
        // log('err $e');
      }
    } else if (index == 19) {
      finalAnswar();
    } else {
      result.value = '';
      input.value = input + ListConstants.buttons[index];
    }
  }

  bool isOperator(String x) {
    return switch (x) {
      '%' => true,
      '/' => true,
      '-' => true,
      '×' => true,
      '=' => true,
      '+' => true,
      'del' => true,
      _ => false,
    };
  }

  finalAnswar() async {
    if (input.isNotEmpty) {
      finalQuestion.value = '$input =';
      String finalInput = input.value;
      finalInput = finalInput.replaceAll('×', '*');

      try {
        Parser p = Parser();
        Expression exp = p.parse(finalInput);
        ContextModel cm = ContextModel();
        
        double eval = exp.evaluate(EvaluationType.VECTOR, cm);
        if (eval == eval.toInt()) {
          result.value = eval.toInt().toString();
        } else {
          result.value = eval.toString();
        }
        input.value = '';
      } catch (e) {
        result.value = 'error';
        await Future.delayed(const Duration(milliseconds: 100));
        HapticFeedback.mediumImpact();
      }
    }
  }
}
