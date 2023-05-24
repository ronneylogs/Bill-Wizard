class ReceiptModel {
  final String location;
  final String when;
  final String subTotal;
  final String tax;
  final String tip;
  final String payerEmail;
  String? image;

  ReceiptModel(
      {required this.location,
      required this.when,
      required this.subTotal,
      required this.tax,
      required this.tip,
      required this.payerEmail,
      this.image});

  factory ReceiptModel.fromJson(Map<String, dynamic> json) {
    return ReceiptModel(
        location: json['location'],
        when: json['when'],
        subTotal: json['subTotal'],
        tax: json['tax'],
        tip: json['tip'],
        payerEmail: json['payerEmail'],
        image: json['image']);
  }
}
