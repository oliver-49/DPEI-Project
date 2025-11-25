class BookingSummaryModel {
  final String name;
  final String type;
  final int salary;
  final String fullAddress;
  final String homeNo;
  final String streetNo;
  final DateTime? date;
  final String time;

  BookingSummaryModel({
    required this.name,
    required this.type,
    required this.salary,
    required this.fullAddress,
    required this.homeNo,
    required this.streetNo,
    required this.date,
    required this.time,
  });

  @override
  String toString() {
    return '''
BookingSummaryModel:
  name: $name
  type: $type
  salary: $salary
  fullAddress: $fullAddress
  homeNo: $homeNo
  streetNo: $streetNo
  date: $date
  time: $time
''';
  }
}
