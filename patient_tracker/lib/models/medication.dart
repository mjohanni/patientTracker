class Medication{
  final String name;
  final double amount;

  Medication({ required this.name, required this.amount});

  factory Medication.fromJson(Map<String, dynamic> json){
    print(json);
    return Medication(
      name: json['name'] as String,
      amount: json['amount'] as double,
    );
  }
}