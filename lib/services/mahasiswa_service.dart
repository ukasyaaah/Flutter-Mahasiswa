import 'dart:convert';

import 'package:flutter_restapi/models/mahasiswa_model.dart';
import 'package:http/http.dart' as http;

class MahasiswaService {
  Future<List<MahasiswaModel>> getMahasiswa() async {
    var url = 'http://127.0.0.1:8000/api/mahasiswa';
    var headers = {'Accept': 'application/json'};

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<MahasiswaModel> model = [];

      for (var item in data) {
        model.add(MahasiswaModel.fromJson(item));
      }

      return model;
    } else {
      throw Exception('Gagal');
    }
  }
}
