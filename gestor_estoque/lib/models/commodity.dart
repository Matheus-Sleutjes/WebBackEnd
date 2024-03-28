//classe para transferência de dados entre camada de visão, RN e entidades
//DTO => Data Transfer Object
class Commodity {
  String? id;
  String? name;
  String? type;
  //método construtor
  Commodity({this.id, this.name, this.type});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
    };
  }
}
