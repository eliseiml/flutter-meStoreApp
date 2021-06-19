import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_mestore_app/domain/entities/bank_card.dart';
import '../../../../domain/use_cases/bank_cards_use_cases/bank_card_use_cases.dart'
    as useCases;
part 'bank_cards_event.dart';
part 'bank_cards_state.dart';

class BankCardsBloc extends Bloc<BankCardsEvent, BankCardsState> {
  final useCases.AddNewBankCard addNewBankCard;
  final useCases.ChangeBankCardData changeBankCardData;
  final useCases.GetAllBankCards getAllBankCards;
  final useCases.RemoveBankCard removeBankCard;

  BankCardsBloc({
    required this.addNewBankCard,
    required this.changeBankCardData,
    required this.getAllBankCards,
    required this.removeBankCard,
  }) : super(BankCardsInitial());

  @override
  Stream<BankCardsState> mapEventToState(BankCardsEvent event) async* {
    //show all cards
    if (event is GetAllBankCards) {
      yield LoadingBankCards();
      List<BankCard> cards = await getAllBankCards();
      yield ShowingAllBankCards(cards);
    }
    //create new card
    if (event is CreateNewBankCard) {
      yield CreatingNewBankCard();
    }
    //Save new card
    if (event is SaveNewBankCard) {
      await addNewBankCard(event.newCard);
      yield LoadingBankCards();
      List<BankCard> cards = await getAllBankCards();
      yield ShowingAllBankCards(cards);
    }
    //Show card details
    if (event is ViewCertainBankCard) {
      yield ShowingBankCardDetails(event.card);
    }
    //Edit card
    if (event is EditBankCardData) {
      yield EditingBankCard(event.card);
    }
    //Save changed card
    if (event is SaveChangedBankCardData) {}
    //Remove card
    if (event is RemoveBankCard) {}
  }
}
