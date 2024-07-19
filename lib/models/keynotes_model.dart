class KeynotesModel {
  final int? id;
  final String account;
  final String password;
  final String createdAt;

  KeynotesModel(
      {this.id,
      required this.account,
      required this.password,
      required this.createdAt});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'account': account,
      'password': password,
      'createdAt': createdAt,
    };
  }

  factory KeynotesModel.fromMap(Map<String, dynamic> map) {
    return KeynotesModel(
      id: map['id'],
      account: map['account'],
      password: map['password'],
      createdAt: map['createdAt'],
    );
  }
}
