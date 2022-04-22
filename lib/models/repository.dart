import 'dart:convert';

class Repositorio {
  final int? id;
  final String? name;
  final String? description;
  final String? url;

  Repositorio(
    this.id,
    this.name,
    this.description,
    this.url,
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'html_url': url,
    };
  }

  factory Repositorio.fromMap(Map<String, dynamic> map) {
    return Repositorio(
      map['id'],
      map['name'],
      map['description'],
      map['html_url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Repositorio.fromJson(String source) =>
      Repositorio.fromMap(json.decode(source));
}
