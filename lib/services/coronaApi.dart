import 'package:http/http.dart' as http;

class CoronaApi {

  Future<String> updateData() async {

     final response = await http.get(
        'https://covid-19-coronavirus-statistics.p.rapidapi.com/v1/stats?country=Brazil',
        headers: {
          "x-rapidapi-host": "covid-19-coronavirus-statistics.p.rapidapi.com",
          "x-rapidapi-key": "1fce8bb448msh9f8ab63696ca9f0p1ccd4ajsn69f8f8834355"
        });
    print(response.body);
    return response.body;

  }

}