import 'package:get/get.dart';

import '../models/model_payment.dart';


class ValueStorageController extends GetxController {
  ModelPayment? selectedPaymentMethod;
  RxInt selectedServiceQuantity = 1.obs;

  RxInt selectedPaymentOption = 0.obs;
  // ModelAppointmentDetail? modelAppointmentDetail;

  @override
  void onInit() {
    super.onInit();
  }

  setSelectedService(ModelPayment paymentMethod) {
    selectedPaymentMethod = paymentMethod;
  }
}
