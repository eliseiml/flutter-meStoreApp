part of 'bank_cards_bloc.dart';

abstract class BankCardsEvent extends Equatable {
  const BankCardsEvent();

  @override
  List<Object> get props => [];
}

//to get list of all stored cards
class GetAllBankCards extends BankCardsEvent {}

//to create new card (+ button)
class CreateNewBankCard extends BankCardsEvent {}

//to save new created card into a Storage
class SaveNewBankCard extends BankCardsEvent {
  final BankCard newCard;

  SaveNewBankCard(this.newCard);
}

//to view certain card's details (user taps on a card in the list)
class ViewCertainBankCard extends BankCardsEvent {
  final BankCard card;

  ViewCertainBankCard(this.card);
}

//to Edit certain bank card (when user taps on a pencil on a card details page)
class EditBankCardData extends BankCardsEvent {
  final BankCard card;

  EditBankCardData(this.card);
}

//to save Changed card into a storage
class SaveChangedBankCardData extends BankCardsEvent {
  final BankCard oldCard;
  final BankCard newCard;

  SaveChangedBankCardData({
    required this.oldCard,
    required this.newCard,
  });
}

//to remove certain bank card from a storage
class RemoveBankCard extends BankCardsEvent {
  final BankCard card;

  RemoveBankCard(this.card);
}
