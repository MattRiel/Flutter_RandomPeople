import 'dart:convert';
import 'package:http/http.dart';

Future<List<Map<String, dynamic>>> fetchUserData() async {
  List<Map<String, dynamic>> userDataList = [];

  try {
    userDataList.clear();
    for (int i = 0; i < 5; i++) {
      final response = await get(Uri.parse('https://randomuser.me/api'));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData.containsKey('results') && jsonData['results'] is List) {
          userDataList.add(jsonData['results'][0]);
        } else {
          print('Invalid response format');
        }
      } else {
        print('Failed to fetch data: ${response.statusCode}');
      }
    }
  } catch (error) {
    print('Error fetching data: $error');
  }

  return userDataList;
}
