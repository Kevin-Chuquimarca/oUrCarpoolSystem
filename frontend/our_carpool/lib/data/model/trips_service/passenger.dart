class Passenger {
  final int id;
  final int? idTrip;
  final int idLoc;
  final int codUser;

  Passenger(
      {required this.id,
      required this.idTrip,
      required this.idLoc,
      required this.codUser});

  Passenger.empty()
      : id = 0,
        idTrip = 0,
        idLoc = 0,
        codUser = 0;

  factory Passenger.fromJson(Map<String, dynamic> json) {
    return Passenger(
      id: json['id'],
      idTrip: json['idTrip'],
      idLoc: json['idLoc'],
      codUser: json['codUser'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'idTrip': idTrip,
        'idLoc': idLoc,
        'codUser': codUser,
      };
}
