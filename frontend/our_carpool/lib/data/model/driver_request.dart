class DriverRequest {
  final int id;
  final int idAd;
  final String email;
  final DateTime shippingDate;
  final DateTime approvalDate;
  final String typeLic;
  final DateTime expiryDateLic;
  final String photoLic;
  final String plateCar;
  final String photoCar;
  final String state;
  final String message;

  DriverRequest({
    required this.id,
    required this.idAd,
    required this.email,
    required this.shippingDate,
    required this.approvalDate,
    required this.typeLic,
    required this.expiryDateLic,
    required this.photoLic,
    required this.plateCar,
    required this.photoCar,
    required this.state,
    required this.message,
  });

  factory DriverRequest.fromJson(Map<String, dynamic> json) {
    return DriverRequest(
        id: json['id'],
        idAd: json['idAd'],
        email: json['email'],
        shippingDate: DateTime.parse(json['shippingDate']),
        approvalDate: json['approvalDate'] != null
            ? DateTime.parse(json['approvalDate'])
            : DateTime.now(),
        typeLic: json['typeLic'],
        expiryDateLic: DateTime.parse(json['expiryDateLic']),
        photoLic: json['photoLic'],
        plateCar: json['plateCar'],
        photoCar: json['photoCar'],
        state: json['state'],
        message: json['message']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'idAd': idAd,
        'email': email,
        'shippingDate': shippingDate,
        'approvalDate': approvalDate,
        'typeLic': typeLic,
        'expiryDateLic': expiryDateLic,
        'photoLic': photoLic,
        'plateCar': plateCar,
        'photoCar': photoCar,
        'state': state,
        'message': message
      };
}
