import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:number_trivia/core/network/network_info.dart';

class MockInternetConnectionChecker extends Mock implements InternetConnectionChecker {}

@GenerateMocks([InternetConnectionChecker])
void main() {
  late MockInternetConnectionChecker mockInternetConnectionChecker;
  late NetworkInfoImpl networkInfo;

  setUpAll(() {
    mockInternetConnectionChecker = MockInternetConnectionChecker();
    networkInfo = NetworkInfoImpl(mockInternetConnectionChecker);
  });

  group('isConnected', () {
    test('should forward the call to DataConnectionChecker.hasConnection', () async {
      final tHasConnectionFuture = Future.value(true);
      when(mockInternetConnectionChecker.hasConnection).thenAnswer((_)  => tHasConnectionFuture);

      final result = await networkInfo.isConnected;

      verify(mockInternetConnectionChecker.hasConnection);
      expect(result, true);
    });
  });
}
