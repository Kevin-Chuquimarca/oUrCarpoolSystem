class Driver {
  final int id;
  final double idLoc;
  final String plateCar;
  final String photoCar;
  final int codUser;

  Driver(
      {required this.id,
      required this.idLoc,
      required this.plateCar,
      required this.photoCar,
      required this.codUser});

  Driver.empty()
      : id = 0,
        idLoc = 0,
        plateCar = '',
        photoCar = '',
        codUser = 0;

  factory Driver.fromJson(Map<String, dynamic> json) {
    return Driver(
      id: json['id'],
      idLoc: json['idLoc'],
      plateCar: json['plateCar'],
      photoCar: json['photoCar'],
      codUser: json['codUser'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'idLoc': idLoc,
        'plateCar': plateCar,
        'photoCar': photoCar,
        'codUser': codUser,
      };
}
