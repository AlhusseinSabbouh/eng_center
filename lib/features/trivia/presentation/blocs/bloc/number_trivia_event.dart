// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'number_trivia_bloc.dart';

enum NumberTriviaEventes { getConverteTrivia, getRandomTrivai }

abstract class NumberTriviaEvent extends Equatable {
  final NumberTriviaEventes events;
  const NumberTriviaEvent({required this.events});

  @override
  List<Object> get props => [events];
}

class GetConcerteNumberTriviaEvent extends NumberTriviaEvent {
  final String number;
  const GetConcerteNumberTriviaEvent({
    required this.number,
  }) : super(events: NumberTriviaEventes.getConverteTrivia);
}

class GetRandomNumberTriviaEvent extends NumberTriviaEvent {
  const GetRandomNumberTriviaEvent()
      : super(events: NumberTriviaEventes.getRandomTrivai);
}
