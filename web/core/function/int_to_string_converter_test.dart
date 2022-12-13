import 'package:dartz/dartz.dart';
import 'package:eng_center/core/error/error_handler.dart';
import 'package:eng_center/core/function/int_to_string_converter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final NumberConverter numberConverter = NumberConverter();
  test("test string 2 int function", () async {
    //act
    final result1 = numberConverter.string2intConverter("1");
    final result2 = numberConverter.string2intConverter("-5");
    final result3 = numberConverter.string2intConverter("dsf");

    expect(result1, const Right(1));
    expect(result2, Left(DataSourceError.invalidInput.getFailure()));
    expect(result3, Left(DataSourceError.invalidInput.getFailure()));
  });
}
