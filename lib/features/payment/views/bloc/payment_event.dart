part of 'payment_bloc.dart';

abstract class PaymentEvent extends Equatable {
  const PaymentEvent();

  @override
  List<Object> get props => [];
}

class StartPaymentEvent extends PaymentEvent {
  final double amount;
  final String currency;

  const StartPaymentEvent({required this.amount, required this.currency});

  @override
  List<Object> get props => [amount, currency];
}