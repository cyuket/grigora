import 'dart:convert';
import 'package:http/http.dart' as http;

var apiKey = "6a4572d50cdf49888d653e0988130fcc";

Future fetchMethod(route) async {
  String url = "https://us-central1-grigora-alt.cloudfunctions.net/$route";
  var response = await http.get(url);

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  }
}
