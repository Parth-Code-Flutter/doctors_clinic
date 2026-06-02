class BillingLineItemModel {
  const BillingLineItemModel({
    required this.label,
    required this.qty,
    required this.price,
  });

  final String label;
  final int qty;
  final double price;

  double get total => qty * price;
}
