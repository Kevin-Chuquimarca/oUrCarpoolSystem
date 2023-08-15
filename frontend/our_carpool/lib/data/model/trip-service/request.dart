class Request {
  final int id;
  final int idDri;
  final int idPas;
  final String nameU;
  final String lastNameU;
  final String phoneU;
  final DateTime date;
  final String state;

  Request(
      {required this.id,
      required this.idDri,
      required this.idPas,
      required this.nameU,
      required this.lastNameU,
      required this.phoneU,
      required this.date,
      required this.state});

  Request.empty()
      : id = 0,
        idDri = 0,
        idPas = 0,
        nameU = '',
        lastNameU = '',
        phoneU = '',
        date = DateTime.now(),
        state = '';

  Request.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        idDri = json['idDri'],
        idPas = json['idPas'],
        nameU = json['nameU'],
        lastNameU = json['lastNameU'],
        phoneU = json['phoneU'],
        date = DateTime.parse(json['date']),
        state = json['state'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'idDri': idDri,
        'idPas': idPas,
        'nameU': nameU,
        'lastNameU': lastNameU,
        'phoneU': phoneU,
        'date': date.toString().substring(0, 10),
        'state': state,
      };
}
