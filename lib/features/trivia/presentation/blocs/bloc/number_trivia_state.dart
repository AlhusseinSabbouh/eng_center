// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'number_trivia_bloc.dart';

enum NumberTriviaStates { initail, loading, loaded, error }

abstract class NumberTriviaState extends Equatable {
  final NumberTriviaStates numberTriviaStates;
  const NumberTriviaState(
    this.numberTriviaStates,
  );

  @override
  List<Object> get props => [];
}

class NumberTriviaInitial extends NumberTriviaState {
  const NumberTriviaInitial() : super(NumberTriviaStates.initail);
}

class NumberTriviaLoading extends NumberTriviaState {
  const NumberTriviaLoading() : super(NumberTriviaStates.loading);
}

class NumberTriviaLoaded extends NumberTriviaState {
  final NumberTrivia numberTrivia;
  const NumberTriviaLoaded({
    required this.numberTrivia,
  }) : super(NumberTriviaStates.loaded);
  @override
  List<Object> get props => [numberTrivia];
}

class NumberTriviaIError extends NumberTriviaState {
  final String msg;
  const NumberTriviaIError({
    required this.msg,
  }) : super(NumberTriviaStates.error);
  @override
  List<Object> get props => [msg];
}
