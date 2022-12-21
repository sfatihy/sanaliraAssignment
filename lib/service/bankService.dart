import 'package:http/http.dart' as http;

class BankService {
  static Future getBankList() {
    return http.get(Uri.parse("https://api.sanalira.com/assignment"));
  }
}