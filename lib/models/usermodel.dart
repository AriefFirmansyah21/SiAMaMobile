// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

part of '../ui/pages/pages.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.nim,
    this.password,
    this.namaMahasiswa,
    this.kelas,
    this.jurusan,
    this.alamat,
    this.nomorTelp,
    this.tahunAngkatan,
    this.email,
  });

  String nim;
  String password;
  String namaMahasiswa;
  String kelas;
  String jurusan;
  String alamat;
  String nomorTelp;
  String tahunAngkatan;
  String email;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        nim: json["nim"],
        password: json["password"],
        namaMahasiswa: json["nama_mahasiswa"],
        kelas: json["kelas"],
        jurusan: json["jurusan"],
        alamat: json["alamat"],
        nomorTelp: json["nomor_telp"],
        tahunAngkatan: json["tahun_angkatan"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "nim": nim,
        "password": password,
        "nama_mahasiswa": namaMahasiswa,
        "kelas": kelas,
        "jurusan": jurusan,
        "alamat": alamat,
        "nomor_telp": nomorTelp,
        "tahun_angkatan": tahunAngkatan,
        "email": email,
      };
}
