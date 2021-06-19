part of 'bank_cards_bloc.dart';

abstract class BankCardsState extends Equatable {
  const BankCardsState();

  @override
  List<Object> get props => [];
}

//Default State
class BankCardsInitial extends BankCardsState {}

//When cards list is loading
class LoadingBankCards extends BankCardsState {}

//When any error happens
class ErrorBankCards extends BankCardsState {
  final String errorDetails;
  ErrorBankCards(this.errorDetails);
}

//When showing all stored cards
class ShowingAllBankCards extends BankCardsState {
  final List<BankCard> cards;
  ShowingAllBankCards(this.cards);
}

//When viewing details of a certain card
class ShowingBankCardDetails extends BankCardsState {
  final BankCard card;
  ShowingBankCardDetails(this.card);
}

//When editing certaing bank card
class EditingBankCard extends BankCardsState {
  final BankCard card;
  EditingBankCard(this.card);
}

//When creating new bank card
class CreatingNewBankCard extends BankCardsState {}
