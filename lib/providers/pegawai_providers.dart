import 'package:my_apps/models/pegawai_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PegawaiProviders extends ChangeNotifier {

  List<PegawaiModel> _data = [];
  List<PegawaiModel> get dataPegawai => _data;

  Future<List<PegawaiModel>> getPegawai() async {
    final url = 'http://192.168.1.6:8000/pegawai';
    final response = await http.get(url);

    if(response.statusCode == 200) {

      final result = json.decode(response.body)['data'].cast<Map<String, dynamic>>();
      _data = result.map<PegawaiModel>((json) => PegawaiModel.fromJson(json)).toList();
      return _data;

    } else {
      throw Exception();
    }
  }

  Future<bool> savePegawai(
    String nip,
    String name,
    String gaji,
    String umur
  ) async {
    final url = 'http://192.168.1.6:8000/pegawai';
    final response =  await http.post(url, body: {
      'pegawai_nip' : nip,
      'pegawai_nama' : name,
      'pegawai_gaji' : gaji,
      'pegawai_umur' : umur,
      // 'pegawai_profile' : "Kosong"
    });

    final result = json.decode(response.body);

    if(response.statusCode == 200 && result['messages'] == 'success') {
      notifyListeners();
      return true;
    }
    return false;
  }
}