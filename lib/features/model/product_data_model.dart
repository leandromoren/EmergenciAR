class ProductDataModel {
  int? numero;
  String? nombre;
  
  ProductDataModel({
    this.numero,
    this.nombre,
  });

  ProductDataModel.fromJson(Map<String, dynamic> json) {
    numero = json['numero'];
    nombre = json['nombre'];
  }
}
