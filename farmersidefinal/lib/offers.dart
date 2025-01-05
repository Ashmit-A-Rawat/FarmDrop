import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Offer {
  final String customerName;
  final double originalPrice;
  final double offeredPrice;
  final String message;

  Offer({
    required this.customerName,
    required this.originalPrice,
    required this.offeredPrice,
    required this.message,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Offers Received',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: OffersScreen(),
    );
  }
}

class OffersScreen extends StatefulWidget {
  @override
  _OffersScreenState createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  List<Offer> offers = List.generate(
    5,
    (index) => Offer(
      customerName: 'Customer ${index + 1}',
      originalPrice: 150 + index * 10.0,
      offeredPrice: 150 + index * 10.0 - (index % 2 == 0 ? 20 : 30),
      message: 'This is offer message ${index + 1}',
    ),
  );

  void _handleAccept(int index) {
    setState(() {
      offers.removeAt(index);
    });
    _showPopup('Offer accepted. Expect a contact from the customer soon.');
  }

  void _handleReject(int index) {
    setState(() {
      offers.removeAt(index);
    });
    _showPopup('Offer rejected.');
  }

  void _showPopup(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
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
        title: Text('Offers Received'),
      ),
      body: offers.isEmpty
          ? Center(
              child: Text(
                'No offers yet.',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: offers.length,
              itemBuilder: (context, index) {
                final offer = offers[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5,
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Customer: ${offer.customerName}',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SizedBox(height: 8.0),
                        Text('Original Price: INR ${offer.originalPrice.toStringAsFixed(2)}'),
                        Text('Offered Price: INR ${offer.offeredPrice.toStringAsFixed(2)}'),
                        SizedBox(height: 8.0),
                        Text('Message: ${offer.message}'),
                        SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromRGBO(62, 135, 64, 1), // Custom color for Accept
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () => _handleAccept(index),
                              child: Text('Accept',
                              style: TextStyle(
                                color: Colors.white,
                              ),),
                            ),
                            SizedBox(width: 8.0),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromRGBO(198, 63, 53, 1), // Custom color for Reject
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () => _handleReject(index),
                              child: Text('Reject',
                              style: TextStyle(
                                color: Colors.white,
                              ),),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
