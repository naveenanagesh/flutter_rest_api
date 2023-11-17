import 'package:flutter_rest_api/models/locations.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_rest_api/models/therapists.dart';

class RemoteService {
  Future getLocations() async {
    var client = http.Client();

    var uri =
        Uri.parse('https://api2.squeezemassage.com/api/v2/nearest-location');
    final response = await client.get(uri);
    if (response.statusCode == 200) {
      var result = locationslistFromJson(response.body);
      return result;
    }
  }

  Future getTherapists() async {
    var client = http.Client();

    var uri = Uri.parse('https://api2.squeezemassage.com/api/v2/therapists');
    final response = await client.get(uri);
    if (response.statusCode == 200) {
      var result = therapistslistFromJson(response.body);
      return result;
    }
  }

  Future fetchData() async {
    var client = http.Client();

    var uri = Uri.parse('https://jsonplaceholder.typicode.com/photos');
    final response = await client.get(uri);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
