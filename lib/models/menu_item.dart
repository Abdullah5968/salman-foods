class MenuItem {
  final String id;
  final String name;
  final String emoji;
  final int price;
  final int? oldPrice;
  final String category;
  final String? tag;

  MenuItem({
    required this.id,
    required this.name,
    required this.emoji,
    required this.price,
    this.oldPrice,
    required this.category,
    this.tag,
  });
}
