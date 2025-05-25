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
        // await paymentViewModel.makePayment(event.amount, event.currency);
        emit(PaymentSuccess());
      } catch (e) {
        emit(PaymentFailure(error: e.toString()));
      }
    });
  }
}