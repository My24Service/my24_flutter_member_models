import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:my24_flutter_core/tests/http_client.mocks.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:my24_flutter_member_models/private/api.dart';


void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});

  test('Test API call', () async {
    final client = MockClient();
    final privateMemberApi = PrivateMemberApi();
    privateMemberApi.httpClient = client;
    const String memberSettings = '{"equipment_location_employee_quick_create": true}';
    const String tokenData = '{"token": "hkjhkjhkl.ghhhjgjhg.675765jhkjh"}';

    // return token request with a 200
    when(client.post(Uri.parse('https://demo.my24service-dev.com/api/jwt-token/refresh/'), headers: anyNamed('headers'), body: anyNamed('body')))
        .thenAnswer((_) async => http.Response(tokenData, 200));

    when(client.get(Uri.parse('https://demo.my24service-dev.com/api/member/member/get_my_settings/'), headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response(memberSettings, 200));

    await privateMemberApi.fetchSettings();
  });
}
