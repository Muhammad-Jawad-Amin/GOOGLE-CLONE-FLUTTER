import "dart:convert";
import "package:google_clone/config/api_json.dart";
import "package:google_clone/config/api_key.dart";
import "package:http/http.dart" as http;

class APIService {
  bool isDummy = true;

  Future<Map<String, dynamic>> fetchdata(
      {required String queryTerm, String start = "0"}) async {
    try {
      if (!isDummy) {
        String query = queryTerm.contains(" ")
            ? queryTerm.split(" ").join("%20")
            : queryTerm;

        final response = await http.get(
          Uri.parse(
              "https//www.googleapis.com/customsearch/v1?key=$apiKey&cx=$contextKey&q=$query&start=$start"),
        );

        if (response.statusCode == 200) {
          final jsonData = response.body;
          final resData = json.decode(jsonData);
          return resData;
        }
      }
    } catch (e) {
      print(e.toString());
    }
    return apiResponse;
  }
}
