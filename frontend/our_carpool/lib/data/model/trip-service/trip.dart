import 'package:intl/intl.dart';

class Trip {
  final int id;
  final int idDri;
  final int idLoc;
  final DateTime leaveHour;
  final DateTime date;
  final int available;
  final int freeSeats;
  final String typeTrip;

  Trip({
    required this.id,
    required this.idDri,
    required this.idLoc,
    required this.leaveHour,
    required this.date,
    required this.available,
    required this.freeSeats,
    required this.typeTrip,
  });

  Trip.empty()
      : id = 0,
        idDri = 0,
        idLoc = 0,
        leaveHour = DateTime.now(),
        date = DateTime.now(),
        available = 0,
        freeSeats = 0,
        typeTrip = '';

  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      id: json['id'],
      idDri: json['idDri'],
      idLoc: json['idLoc'],
      leaveHour: DateTime.parse(json['leaveHour']),
      date: DateTime.parse(json['date']),
      available: json['available'],
      freeSeats: json['freeSeats'],
      typeTrip: json['typeTrip'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'idDri': idDri,
        'idLoc': idLoc,
        'leaveHour': DateFormat('HH:mm:ss').format(leaveHour),
        'date': DateFormat('yyyy-MM-dd').format(date),
        'available': available,
        'freeSeats': freeSeats,
        'typeTrip': typeTrip,
      };
}
