class RowValue {
  static String one = '0';
  static String two = '1';
  static String three = '2';
  static String four = '3';
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
