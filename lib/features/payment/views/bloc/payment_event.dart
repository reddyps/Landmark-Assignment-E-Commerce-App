part of 'payment_bloc.dart';

abstract class PaymentEvent extends Equatable {
  const PaymentEvent();

  @override
  List<Object> get props => [];
}

class StartPaymentEvent extends PaymentEvent {
  final double amount;
  final PaymentViewModel paymentViewModel;

  const StartPaymentEvent({required this.amount, required this.paymentViewModel});

  @override
  List<Object> get props => [amount, paymentViewModel];
}