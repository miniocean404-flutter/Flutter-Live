import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void request(List<String> arguments) async {
  var url =
      Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});
  var res = await http.get(url);

  if (res.statusCode == 200) {
    var json = convert.jsonDecode(res.body) as Map<String, dynamic>;
    var itemCount = json['totalItems'];
    print('Number of books about http: $itemCount.');
  } else {
    print('请求失败状态码: ${res.statusCode}');
  }
}
