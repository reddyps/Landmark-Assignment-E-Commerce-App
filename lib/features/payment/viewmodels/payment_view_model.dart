import 'package:injectable/injectable.dart';
import 'package:landmark_assignment/core/base/base_viewmodel.dart';

import '../../cart/models/model/orders/cart_model.dart';


@singleton
class PaymentViewModel extends BaseViewModel { // Changed to ChangeNotifier
  final className = "PaymentViewModel";

  late List<Products> selectedItems;

  @override
  void dispose() {
    super.dispose();
  }
}

