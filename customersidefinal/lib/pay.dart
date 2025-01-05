import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'shop.dart';  // Import the shop.dart file

class PaymentGateway extends StatefulWidget {
  @override
  _PaymentGatewayState createState() => _PaymentGatewayState();
}

class _PaymentGatewayState extends State<PaymentGateway> {
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Payment Successful: ${response.paymentId}'),
    ));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Payment Failed: ${response.message}'),
    ));
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('External Wallet Selected: ${response.walletName}'),
    ));
  }

  void _launchRazorpay() {
    var options = {
      'key': 'rzp_test_1DP5mmOlF5G5ag',  // Razorpay API Key
      'amount': (CartModel.totalCost * 100),  // Convert total cost to paise
      'name': 'FarmDrops',
      'description': 'Payment for items in cart',
      'prefill': {
        'contact': '8888888888',
        'email': 'customer@farmdrops.com',
      },
      'theme': {
        'color': '#136B16',
      },
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void _handlePaymentOption(String option) {
    if (option == 'Online Payment') {
      _launchRazorpay();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Cash on Delivery selected.'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final cartItems = CartModel.cart;  // Get the selected items from cart
    final totalPrice = CartModel.totalCost;  // Get the total price

    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Gateway'),
        backgroundColor: Colors.green[700],  // Green color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ExpansionTile(
              title: Text('Payment Details - ₹$totalPrice'),
              children: cartItems.map((cartItem) {
                return ListTile(
                  title: Text(cartItem.item.name),
                  subtitle: Text('Price: ₹${cartItem.price}'),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,  // Make the button width fill the available space
              child: ElevatedButton(
                onPressed: () => _handlePaymentOption('Online Payment'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[700],  // Green color
                  foregroundColor: Colors.black,  // Text color
                ),
                child: Text('Pay Online ₹$totalPrice'),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,  // Make the button width fill the available space
              child: ElevatedButton(
                onPressed: () => _handlePaymentOption('Cash on Delivery'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[700],  // Green color
                  foregroundColor: Colors.black,  // Text color
                ),
                child: Text('Cash on Delivery'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
