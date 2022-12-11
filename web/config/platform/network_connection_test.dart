import 'package:eng_center/config/platform/network_connection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class NetWorkConnectionMock extends Mock implements NetWorkConnection {}

void main() {
  final mock = NetWorkConnectionMock();

  setUp(() {});

  test("we need to retrun true when we use is Connected Function", () async {
    when(mock.isConnected()).thenAnswer((realInvocation) async => true);

    //act

    final isConnectTest = await mock.isConnected();

    expect(true, isConnectTest);
  });
}
