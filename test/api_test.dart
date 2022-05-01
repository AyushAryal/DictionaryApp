import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  test("API test", () async {
    final url = Uri.https('api.dictionaryapi.dev', 'api/v2/entries/en/agile');
    final response = await http.get(url);
    expect(response.statusCode, 200);
  });
}
