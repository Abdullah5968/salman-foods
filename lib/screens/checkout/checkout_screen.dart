import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';
import '../../providers/cart_provider.dart';
import '../../theme/app_colors.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _notesController = TextEditingController();

  Future<void> _orderViaWhatsApp(CartProvider cart) async {
    if (_nameController.text.isEmpty ||
        _phoneController.text.isEmpty ||
        _addressController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all required fields')),
      );
      return;
    }
    final orderId = 'SF-${const Uuid().v4().substring(0, 4).toUpperCase()}';
    final items = cart.items
        .map((i) => '• ${i.menuItem.name} x${i.quantity} = Rs ${i.totalPrice}')
        .join('\n');
    final message =
        '''
🍔 *NEW ORDER — $orderId*

👤 Name: ${_nameController.text}
📞 Phone: ${_phoneController.text}
📍 Address: ${_addressController.text}
${_notesController.text.isNotEmpty ? '📝 Notes: ${_notesController.text}' : ''}

🛒 *Order:*
$items

💰 *Total: Rs ${cart.totalPrice}*

_Sent via Salman Foods App_
''';
    final encoded = Uri.encodeComponent(message);
    final uri = Uri.parse('https://wa.me/923246278787?text=$encoded');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
      cart.clearCart();
      if (mounted)
        Navigator.pushNamedAndRemoveUntil(context, '/home', (r) => false);
    }
  }

  Future<void> _callToOrder() async {
    final uri = Uri.parse('tel:+923246278787');
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>();
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Checkout',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order summary
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkSurface : Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Order Summary',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  ...cart.items.map(
                    (i) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${i.menuItem.emoji} ${i.menuItem.name} x${i.quantity}',
                          ),
                          Text(
                            'Rs ${i.totalPrice}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Rs ${cart.totalPrice}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Delivery Details',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),
            _buildField('Your Name *', _nameController, Icons.person),
            const SizedBox(height: 12),
            _buildField(
              'Phone Number *',
              _phoneController,
              Icons.phone,
              isPhone: true,
            ),
            const SizedBox(height: 12),
            _buildField(
              'Delivery Address *',
              _addressController,
              Icons.location_on,
              maxLines: 2,
            ),
            const SizedBox(height: 12),
            _buildField(
              'Special Instructions (optional)',
              _notesController,
              Icons.note,
              maxLines: 2,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => _orderViaWhatsApp(cart),
              icon: const Text('💬', style: TextStyle(fontSize: 20)),
              label: const Text(
                'Order via WhatsApp',
                style: TextStyle(fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 54),
              ),
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: _callToOrder,
              icon: const Icon(Icons.phone, color: AppColors.primary),
              label: const Text(
                'Call to Order Instead',
                style: TextStyle(color: AppColors.primary),
              ),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 54),
                side: const BorderSide(color: AppColors.primary),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildField(
    String label,
    TextEditingController controller,
    IconData icon, {
    int maxLines = 1,
    bool isPhone = false,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: isPhone ? TextInputType.phone : TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: AppColors.primary),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
      ),
    );
  }
}
