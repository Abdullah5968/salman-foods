import '../models/menu_item.dart';

class MenuData {
  static List<MenuItem> allItems = [
    // Burgers
    MenuItem(
      id: 'b1',
      name: 'Zinger Burger',
      emoji: '🍔',
      price: 380,
      oldPrice: 450,
      category: 'Burgers',
      tag: 'Spicy',
    ),
    MenuItem(
      id: 'b2',
      name: 'Boti Burger',
      emoji: '🍔',
      price: 350,
      oldPrice: 400,
      category: 'Burgers',
      tag: 'Juicy',
    ),
    MenuItem(
      id: 'b3',
      name: 'Chicken Burger',
      emoji: '🍔',
      price: 320,
      category: 'Burgers',
    ),
    MenuItem(
      id: 'b4',
      name: 'Double Burger',
      emoji: '🍔',
      price: 480,
      category: 'Burgers',
      tag: 'loaded',
    ),
    MenuItem(
      id: 'b5',
      name: 'Crispy Burger',
      emoji: '🍔',
      price: 350,
      category: 'Burgers',
    ),

    // Shawarma
    MenuItem(
      id: 's1',
      name: 'Platter Shawarma',
      emoji: '🌯',
      price: 600,
      category: 'Shawarma',
      tag: 'Best Seller',
    ),
    MenuItem(
      id: 's2',
      name: 'Special Shawarma',
      emoji: '🌯',
      price: 350,
      category: 'Shawarma',
      tag: 'Special',
    ),
    MenuItem(
      id: 's3',
      name: 'Chicken Shawarma',
      emoji: '🌯',
      price: 280,
      category: 'Shawarma',
    ),
    MenuItem(
      id: 's4',
      name: 'Shawarma Roll',
      emoji: '🌯',
      price: 300,
      category: 'Shawarma',
    ),

    // Wraps & Sandwiches
    MenuItem(
      id: 'w1',
      name: 'Shappata Roll',
      emoji: '🥙',
      price: 600,
      category: 'Wraps',
      tag: 'Loaded',
    ),
    MenuItem(
      id: 'w2',
      name: 'Club Sandwich',
      emoji: '🥪',
      price: 400,
      category: 'Wraps',
      tag: 'Classic',
    ),
    MenuItem(
      id: 'w3',
      name: 'Chicken Sandwich',
      emoji: '🥪',
      price: 320,
      category: 'Wraps',
    ),
    MenuItem(
      id: 'w4',
      name: 'Zinger Wrap',
      emoji: '🥙',
      price: 380,
      category: 'Wraps',
    ),

    // Fries & Sides
    MenuItem(
      id: 'f1',
      name: 'Crispy Fries',
      emoji: '🍟',
      price: 150,
      category: 'Fries',
    ),
    MenuItem(
      id: 'f2',
      name: 'Loaded Fries',
      emoji: '🍟',
      price: 250,
      category: 'Fries',
      tag: 'Cheesy',
    ),
    MenuItem(
      id: 'f3',
      name: 'Nuggets (6pc)',
      emoji: '🍗',
      price: 280,
      category: 'Fries',
    ),

    // Drinks
    MenuItem(
      id: 'd1',
      name: 'Soft Drink',
      emoji: '🥤',
      price: 80,
      category: 'Drinks',
    ),
    MenuItem(
      id: 'd2',
      name: 'Juice',
      emoji: '🧃',
      price: 100,
      category: 'Drinks',
    ),
    MenuItem(
      id: 'd3',
      name: 'Water',
      emoji: '💧',
      price: 50,
      category: 'Drinks',
    ),
  ];

  static List<MenuItem> getByCategory(String category) {
    if (category == 'All') return allItems;
    return allItems.where((item) => item.category == category).toList();
  }

  static List<Map<String, dynamic>> deals = [
    {
      'name': 'Burger Deal 1',
      'desc': 'Zinger Burger + Fries + Drink',
      'price': 550,
      'oldPrice': 650,
      'emoji': '🍔',
    },
    {
      'name': 'Burger Deal 2',
      'desc': 'Boti Burger + Fries + Drink',
      'price': 500,
      'oldPrice': 600,
      'emoji': '🍔',
    },
    {
      'name': 'Shawarma Deal 1',
      'desc': 'Platter Shawarma + Drink',
      'price': 650,
      'oldPrice': 750,
      'emoji': '🌯',
    },
    {
      'name': 'Shawarma Deal 2',
      'desc': '2x Special Shawarma + Drink',
      'price': 750,
      'oldPrice': 850,
      'emoji': '🌯',
    },
    {
      'name': 'Family Deal',
      'desc': '2 Burgers + 2 Shawarma + 2 Drinks',
      'price': 1500,
      'oldPrice': 1800,
      'emoji': '👨‍👩‍👧',
    },
    {
      'name': 'Sandwich Deal',
      'desc': 'Club Sandwich + Fries + Drink',
      'price': 520,
      'oldPrice': 620,
      'emoji': '🥪',
    },
    {
      'name': 'Wrap Deal',
      'desc': 'Shappata Roll + Drink',
      'price': 650,
      'oldPrice': 750,
      'emoji': '🥙',
    },
    {
      'name': 'Snack Deal',
      'desc': 'Nuggets + Fries + Drink',
      'price': 450,
      'oldPrice': 550,
      'emoji': '🍗',
    },
    {
      'name': 'Double Deal',
      'desc': '2 Zinger Burgers + 2 Drinks',
      'price': 800,
      'oldPrice': 950,
      'emoji': '🔥',
    },
    {
      'name': 'Mega Deal',
      'desc': '3 Burgers + 3 Drinks + Fries',
      'price': 1200,
      'oldPrice': 1500,
      'emoji': '👑',
    },
  ];
}
