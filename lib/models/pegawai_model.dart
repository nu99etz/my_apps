class PegawaiModel {

  int id;
  String pegawaiName;
  int pegawaiGaji;
  int pegawaiUmur;

  // Constructor
  PegawaiModel({
    this.id,
    this.pegawaiName,
    this.pegawaiGaji,
    this.pegawaiUmur,
  });

  //Convert JSON
  factory PegawaiModel.fromJson(Map<String, dynamic> json) => PegawaiModel(
    id: json['id'],
    pegawaiName: json['pegawai_nama'],
    pegawaiGaji: json['pegawai_gaji'],
    pegawaiUmur: json['pegawai_umur']
  );
}