import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../providers/cart_provider.dart';
import '../../providers/theme_provider.dart';
import '../../theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _openWhatsApp() async {
    final uri = Uri.parse('https://wa.me/923246278787');
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }

  Future<void> _callUs() async {
    final uri = Uri.parse('tel:+923246278787');
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }

  final List<Map<String, String>> _signatureItems = const [
    {
      'name': 'Platter Shawarma',
      'price': 'Rs 600',
      'emoji': '🌯',
      'tag': 'Best Seller',
    },
    {
      'name': 'Shappata Roll',
      'price': 'Rs 600',
      'emoji': '🥙',
      'tag': 'Loaded',
    },
    {'name': 'Zinger Burger', 'price': 'Rs 380', 'emoji': '🍔', 'tag': 'Spicy'},
    {
      'name': 'Club Sandwich',
      'price': 'Rs 400',
      'emoji': '🥪',
      'tag': 'Classic',
    },
    {'name': 'Boti Burger', 'price': 'Rs 350', 'emoji': '🍔', 'tag': 'Juicy'},
    {
      'name': 'Special Shawarma',
      'price': 'Rs 350',
      'emoji': '🌯',
      'tag': 'Special',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();
    final themeProvider = context.watch<ThemeProvider>();
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primary, AppColors.primaryDark],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('🍔', style: TextStyle(fontSize: 36)),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () => themeProvider.toggleTheme(),
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.white24,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    isDark ? '☀️' : '🌙',
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white24,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Text(
                                  '4PM – 4AM',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'GOOD FOOD\nGOOD MOOD',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          height: 1.1,
                        ),
                      ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.2),
                      const SizedBox(height: 8),
                      const Text(
                        "Lahore's Favourite Fast Food 🔥",
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ).animate().fadeIn(delay: 200.ms),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: _openWhatsApp,
                              icon: const Text(
                                '💬',
                                style: TextStyle(fontSize: 16),
                              ),
                              label: const Text('Order on WhatsApp'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: AppColors.primary,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton.icon(
                            onPressed: _callUs,
                            icon: const Text(
                              '📞',
                              style: TextStyle(fontSize: 16),
                            ),
                            label: const Text('Call'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white24,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 16,
                              ),
                            ),
                          ),
                        ],
                      ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.3),
                    ],
                  ),
                ),
              ),
            ),

            // Marquee
            Container(
              color: AppColors.secondary,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              width: double.infinity,
              child: const Text(
                '🍔 BURGERS  ★  🌯 SHAWARMA  ★  🥪 SANDWICHES  ★  🍟 CRISPY FRIES  ★  🔥 HOT DEALS  ★  🥙 WRAPS  ★  🍗 BOTI BURGER  ★',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                maxLines: 1,
                overflow: TextOverflow.fade,
              ),
            ),

            // Stats
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _statItem('10+', 'Hot Deals', '🔥'),
                  _statItem('4AM', 'Open Till', '🌙'),
                  _statItem('100%', 'Real Chicken', '🍗'),
                  _statItem('Free', 'Delivery', '🛵'),
                ],
              ).animate().fadeIn(delay: 300.ms),
            ),

            // Signature Items
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '⭐ Signature Items',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.1,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                    itemCount: _signatureItems.length,
                    itemBuilder: (context, index) {
                      final item = _signatureItems[index];
                      return Container(
                            decoration: BoxDecoration(
                              color: isDark
                                  ? AppColors.darkSurface
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.08),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  item['emoji']!,
                                  style: const TextStyle(fontSize: 36),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  item['name']!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                ),
                                Text(
                                  item['price']!,
                                  style: const TextStyle(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.secondary.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    item['tag']!,
                                    style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                          .animate(delay: (index * 100).ms)
                          .fadeIn()
                          .scale(begin: const Offset(0.9, 0.9));
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (cart.totalItems > 0)
            FloatingActionButton.extended(
              heroTag: 'cart',
              onPressed: () => Navigator.pushNamed(context, '/cart'),
              backgroundColor: AppColors.secondary,
              icon: const Text('🛒', style: TextStyle(fontSize: 20)),
              label: Text(
                'Cart (${cart.totalItems}) • Rs ${cart.totalPrice}',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ).animate().slideY(begin: 1),
          const SizedBox(height: 10),
          FloatingActionButton.extended(
            heroTag: 'menu',
            onPressed: () => Navigator.pushNamed(context, '/menu'),
            backgroundColor: AppColors.primary,
            icon: const Text('🍽️', style: TextStyle(fontSize: 20)),
            label: const Text(
              'Full Menu',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ).animate().slideY(begin: 1, delay: 200.ms),
        ],
      ),
    );
  }

  Widget _statItem(String value, String label, String emoji) {
    return Column(
      children: [
        Text(emoji, style: const TextStyle(fontSize: 24)),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Text(label, style: const TextStyle(fontSize: 11, color: Colors.grey)),
      ],
    );
  }
}
