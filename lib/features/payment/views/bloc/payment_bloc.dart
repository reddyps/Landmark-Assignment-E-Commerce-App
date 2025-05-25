import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:landmark_assignment/features/payment/viewmodels/payment_view_model.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentInitial()) {
    on<StartPaymentEvent>((event, emit) async {
      emit(PaymentLoading());
      try {
        await event.paymentViewModel
            .makePayment(event.amount)
            .then((_) => emit(PaymentSuccess()))
            .onError((error, _) => emit(PaymentFailure(error: error.toString())));
      } catch (e) {
        emit(PaymentFailure(error: e.toString()));
      }
    });
  }
}
