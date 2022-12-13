// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:eng_center/core/function/int_to_string_converter.dart';
import 'package:eng_center/features/trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:eng_center/features/trivia/domain/usecases/get_random_number_trivia.dart';

import '../../../domain/entity/trivia_entity.dart';

part 'number_trivia_event.dart';
part 'number_trivia_state.dart';

class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState> {
  final GetConcreteNumberTrivia getConcreteNumberTriviaUsecase;
  final NumberConverter numberConverter = NumberConverter();
  final GetRandonNumberTrivia getRandonNumberTriviaUsecase;

  int? number;

  NumberTriviaBloc({
    required this.getConcreteNumberTriviaUsecase,
    required this.getRandonNumberTriviaUsecase,
  }) : super(const NumberTriviaInitial()) {
    on<NumberTriviaEvent>((event, emit) async {
      // if (event is GetConcerteNumberTriviaEvent) {
      //   emit(const NumberTriviaLoading());
      //   final myNumber = numberConverter.string2intConverter(event.number);
      //   if (myNumber.isRight()) {
      //     final numberTriviaEntity = await getConcreteNumberTriviaUsecase
      //         .call(GetConcreteNumberTriviaInput(number: 1));
      //     numberTriviaEntity?.fold(
      //         (l) => emit(NumberTriviaIError(msg: l.message)),
      //         (r) => emit(NumberTriviaLoaded(numberTrivia: r)));
      //   } else {
      //     emit(const NumberTriviaIError(msg: "error number"));
      //   }
      // }
      switch (event.events) {
        case NumberTriviaEventes.getConverteTrivia:
          {
            await getConcerteNumberCase(event, emit);
            break;
          }
        case NumberTriviaEventes.getRandomTrivai:
          {
            await getRandomNumberTriciaCase(event, emit);
            break;
          }
      }
    });
  }

  Future<void> getRandomNumberTriciaCase(
      NumberTriviaEvent event, Emitter<NumberTriviaState> emit) async {
    event as GetRandomNumberTriviaEvent;
    emit(const NumberTriviaLoading());
    final numberTriviaEntity =
        await getRandonNumberTriviaUsecase.call(NoParams());
    numberTriviaEntity?.fold((l) => emit(NumberTriviaIError(msg: l.message)),
        (r) => emit(NumberTriviaLoaded(numberTrivia: r)));
  }

  Future<void> getConcerteNumberCase(
      NumberTriviaEvent event, Emitter<NumberTriviaState> emit) async {
    event as GetConcerteNumberTriviaEvent;
    emit(const NumberTriviaLoading());
    final myNumber = numberConverter.string2intConverter(event.number);
    if (myNumber.isRight()) {
      final numberTriviaEntity = await getConcreteNumberTriviaUsecase
          .call(GetConcreteNumberTriviaInput(number: 1));
      numberTriviaEntity?.fold((l) => emit(NumberTriviaIError(msg: l.message)),
          (r) => emit(NumberTriviaLoaded(numberTrivia: r)));
    } else {
      emit(const NumberTriviaIError(msg: "error number"));
    }
  }
}
