import 'package:get/get.dart';

class PaymentController extends GetxController {
  final _paymentMethod = 'Dinheiro'.obs;
  get paymentMethod => _paymentMethod.value;
  set paymentMethod(value) => _paymentMethod.value = value;
}
