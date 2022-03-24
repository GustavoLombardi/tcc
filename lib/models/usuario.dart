import 'dart:convert';

class Usuario {
  final int? codusu;
  final String? nomeusu;
  final String? usuario;
  final int codgrupo;
  final String nomegrupo;
  final String dpto;
  final String status;
  final String? dtlogin;
  final String? dtlogout;

  Usuario(
    this.codusu,
    this.nomeusu,
    this.usuario,
    this.codgrupo,
    this.nomegrupo,
    this.dpto,
    this.status,
    this.dtlogin,
    this.dtlogout,
  );

  Map<String, dynamic> toMap() {
    return {
      'codusu': codusu,
      'nomeusu': nomeusu,
      'usuario': usuario,
      'codgrupo': codgrupo,
      'nomegrupo': nomegrupo,
      'dpto': dpto,
      'status': status,
      'dtlogin': dtlogin,
      'dtlogoff': dtlogout
    };
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      map['codusu'],
      map['nomeusu'],
      map['usuario'],
      map['codgrupo'],
      map['nomegrupo'],
      map['dpto'],
      map['status'],
      map['dtlogin'],
      map['dtlogoff'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Usuario.fromJson(String source) =>
      Usuario.fromMap(json.decode(source));
}
