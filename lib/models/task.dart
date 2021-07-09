class RowValue {
  static String onHold = '0';
  static String inProgress = '1';
  static String needsReview = '2';
  static String approved = '3';
}

class CardItem {
  final int id;
  final String row;
  final int seqNum;
  final String text;

  CardItem({
    required this.id,
    required this.row,
    required this.seqNum,
    required this.text,
  });

  factory CardItem.fromJson(Map<String, dynamic> json) {
    return CardItem(
      id: json['id'],
      row: json['row'],
      seqNum: json['seq_num'],
      text: json['text'],
    );
  }
}

class LoginResult {
  final String token;

  LoginResult({
    required this.token,
  });

  factory LoginResult.fromJson(Map<String, dynamic> json) {
    return LoginResult(
      token: json['token'],
    );
  }
}
