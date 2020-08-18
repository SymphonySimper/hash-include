import 'dart:convert';
import 'package:http/http.dart' as http;

class CompileCode {
  String clientID = "2e65521fbafb3277b346da01426c6b4e";
  String clientSecret =
      "1ff066deb0c5f30c5f4dfecea6750f187a6aeab450d680d959836691f4df46a1";

  Future getOutput(
      String program, String input, String language, int versionIndex) async {
    String url = 'https://api.jdoodle.com/v1/execute';
    var _header = {"Content-Type": "application/json"};
    var _body = jsonEncode({
      "clientId": clientID,
      "clientSecret": clientSecret,
      "script": program,
      "stdin": input,
      "language": language,
      "versionIndex": versionIndex,
    });
    var data = await http.post(url, headers: _header, body: _body);
    return jsonDecode(data.body);
  }
}
