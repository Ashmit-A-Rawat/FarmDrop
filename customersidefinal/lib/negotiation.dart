import 'package:flutter/material.dart';

void main() {
  runApp(GroceryNegotiationApp());
}

class GroceryNegotiationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery Negotiation App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: GroceryListScreen(),
    );
  }
}

class GroceryListScreen extends StatefulWidget {
  @override
  _GroceryListScreenState createState() => _GroceryListScreenState();
}

class _GroceryListScreenState extends State<GroceryListScreen> {
  final List<GroceryItem> _items = [
    GroceryItem(name: 'Apples', priceA: 150.0, priceB: 160.0, maxReduction: 30),
    GroceryItem(name: 'Bananas', priceA: 155.0, priceB: 165.0, maxReduction: 20),
    GroceryItem(name: 'Carrots', priceA: 160.0, priceB: 170.0, maxReduction: 20),
    GroceryItem(name: 'Tomatoes', priceA: 165.0, priceB: 175.0, maxReduction: 50),
    GroceryItem(name: 'Potatoes', priceA: 150.0, priceB: 160.0, maxReduction: 30),
    GroceryItem(name: 'Onions', priceA: 155.0, priceB: 165.0, maxReduction: 20),
    GroceryItem(name: 'Garlic', priceA: 170.0, priceB: 180.0, maxReduction: 30),
    GroceryItem(name: 'Cucumbers', priceA: 160.0, priceB: 170.0, maxReduction: 20),
    GroceryItem(name: 'Lettuce', priceA: 155.0, priceB: 165.0, maxReduction: 20),
    GroceryItem(name: 'Peppers', priceA: 170.0, priceB: 180.0, maxReduction: 50),
  ];

  void _startNegotiation(GroceryItem item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return NegotiationDialog(
          item: item,
          onOfferSent: _handleOfferSent,
        );
      },
    );
  }

  void _handleOfferSent(GroceryItem item, double offer, String message) {
    // Show the "Offer Sent" dialog with details
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Offer Sent'),
          content: Text(
            'The farmer will contact you soon.\n\n'
            'Offer Details:\n'
            'Item: ${item.name}\n'
            'Offer Price: ₹${offer.toStringAsFixed(2)}\n'
            'Message: $message',
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grocery Negotiation'),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];
          return Card(
            margin: EdgeInsets.all(10.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 5,
            child: ListTile(
              contentPadding: EdgeInsets.all(16.0),
              title: Text(item.name, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(
                'Farmer A: ₹${item.priceA.toStringAsFixed(2)}\n'
                'Farmer B: ₹${item.priceB.toStringAsFixed(2)}\n'
                'Max Reduction: ₹${item.maxReduction.toStringAsFixed(2)}',
              ),
              trailing: ElevatedButton(
                child: Text('Negotiate'),
                onPressed: () => _startNegotiation(item),
              ),
            ),
          );
        },
      ),
    );
  }
}

class NegotiationDialog extends StatefulWidget {
  final GroceryItem item;
  final Function(GroceryItem, double, String) onOfferSent;

  NegotiationDialog({required this.item, required this.onOfferSent});

  @override
  _NegotiationDialogState createState() => _NegotiationDialogState();
}

class _NegotiationDialogState extends State<NegotiationDialog> {
  final TextEditingController _offerController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  void _submitOffer() {
    final offer = double.tryParse(_offerController.text);
    if (offer != null &&
        offer >= widget.item.priceA - widget.item.maxReduction &&
        offer <= widget.item.priceA) {
      widget.onOfferSent(widget.item, offer, _messageController.text);

      // Show the "Offer Sent" confirmation dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Offer Sent'),
            content: Text(
              'The farmer will contact you soon.',
            ),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
              ),
            ],
          );
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid offer amount. Must be within allowed range.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Negotiate Price for ${widget.item.name}'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _offerController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(labelText: 'Your Offer Price (INR)'),
          ),
          TextField(
            controller: _messageController,
            decoration: InputDecoration(labelText: 'Your Message'),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Cancel'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        ElevatedButton(
          child: Text('Send Offer'),
          onPressed: _submitOffer,
        ),
      ],
    );
  }
}

class GroceryItem {
  String name;
  double priceA;
  double priceB;
  double maxReduction;

  GroceryItem({
    required this.name,
    required this.priceA,
    required this.priceB,
    required this.maxReduction,
  });
}
