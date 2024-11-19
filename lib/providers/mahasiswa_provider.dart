import 'package:flutter/material.dart';
import 'package:flutter_restapi/models/mahasiswa_model.dart';
import 'package:flutter_restapi/services/mahasiswa_service.dart';

class MahasiswaProvider with ChangeNotifier{
  List<MahasiswaModel> _mahasiswa = [];
  List<MahasiswaModel> get mahasiswa => _mahasiswa;

  set mahasiswa(List<MahasiswaModel> data){
    _mahasiswa = data;
    notifyListeners();
  }

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  set isLoading(bool data){
    _isLoading = data;
    notifyListeners();
  }

  Future<void> getMahasiswa() async {
    _isLoading = true;
    await MahasiswaService().getMahasiswa().then((value) {
      _isLoading = false;
      _mahasiswa = value;
    }).catchError((err){
      throw Exception('Gagal');
    });

  }
}