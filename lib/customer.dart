import 'package:flutter/material.dart';

void main() {
  runApp(FarmDropsApp());
}

class FarmDropsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Farm Drops',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Item> items = [
    Item(name: 'Apple', image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ868djAR5mIlAFnnjF---4paarCg48aQTr-g&s', costFarmer1: 250, costFarmer2: 280),
    Item(name: 'Banana', image: 'https://images.immediate.co.uk/production/volatile/sites/30/2017/01/Bunch-of-bananas-67e91d5.jpg?quality=90&resize=440,400', costFarmer1: 50, costFarmer2: 55),
    Item(name: 'Carrot', image: 'https://cdn.britannica.com/70/158370-050-CC2F25D4/Carrots-Apiales-members.jpg', costFarmer1: 30, costFarmer2: 35),
    Item(name: 'Tomato', image: 'https://m.economictimes.com/thumb/msid-95423731,width-1200,height-900,resizemode-4,imgsize-56196/tomatoes-canva.jpg', costFarmer1: 80, costFarmer2: 75),
    Item(name: 'Broccoli', image: 'https://wellwo.es/wp-content/uploads/2020/04/brocoli.jpg', costFarmer1: 85, costFarmer2: 80),
    Item(name: 'Grapes', image: 'https://5.imimg.com/data5/VU/MR/MY-24751011/purple-grapes.jpg', costFarmer1: 90, costFarmer2: 95),
    Item(name: 'Rice', image: 'https://static.toiimg.com/photo/104401541/104401541.jpg', costFarmer1: 80, costFarmer2: 85),
    Item(name: 'Wheat', image: 'https://cdn.britannica.com/80/157180-050-7B906E02/Heads-wheat-grains.jpg', costFarmer1: 60, costFarmer2: 65),
    Item(name: 'Sugarcane', image: 'https://cff2.earth.com/uploads/2024/03/29151621/sugarcane-genome_sequenced_1m.jpg', costFarmer1: 40, costFarmer2: 45),
    Item(name: 'Potato', image: 'https://static.toiimg.com/photo/92522114.cms', costFarmer1: 25, costFarmer2: 30),
    Item(name: 'Onion', image: 'https://m.media-amazon.com/images/I/71GUFttn0jL.AC_UF1000,1000_QL80.jpg', costFarmer1: 35, costFarmer2: 40),
    Item(name: 'Garlic', image: 'https://www.realsimple.com/thmb/zjJYhj0AXTu8Ndio6-Hl2NzSicY=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/health-benefits-of-garlic-2000-482c21fd2d154102a9b7a46ccb34e70a.jpg', costFarmer1: 45, costFarmer2: 50),
    Item(name: 'Spinach', image: 'https://m.media-amazon.com/images/I/71tdN2taTCL.jpg', costFarmer1: 55, costFarmer2: 60),
    Item(name: 'Cucumber', image: 'https://seed2plant.in/cdn/shop/products/saladcucumberseeds.jpg?v=1603435556&width=1500', costFarmer1: 20, costFarmer2: 25),
    Item(name: 'Lettuce', image: 'https://trikaya.net/cdn/shop/products/LettuceLeafytabletop_grande.jpg?v=1594756664', costFarmer1: 30, costFarmer2: 35),
    Item(name: 'Pumpkin', image: 'https://images.immediate.co.uk/production/volatile/sites/30/2022/08/Pumpkin-sliced-open-f2b8dde.jpg', costFarmer1: 70, costFarmer2: 75),
    Item(name: 'Beetroot', image: 'https://seed2plant.in/cdn/shop/products/beetrootseeds.jpg?v=1606739694&width=1500', costFarmer1: 50, costFarmer2: 55),
    Item(name: 'Cauliflower', image: 'https://cdn.britannica.com/27/78227-050-28A68F87/cauliflower-Head-colour-White-brown-cultivars.jpg', costFarmer1: 60, costFarmer2: 65),
    Item(name: 'Bell Pepper', image: 'https://cdn.britannica.com/12/147312-050-BEC6A59E/Bell-peppers.jpg', costFarmer1: 80, costFarmer2: 85),
    Item(name: 'Cabbage', image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSv16mQSx3cF7qBs4FbJKowZc0BnvzdtAtFfQ&s', costFarmer1: 65, costFarmer2: 70),
    Item(name: 'Chili', image: 'https://c.ndtvimg.com/2019-03/e8bse1po_red-chilli_625x300_08_March_19.jpg?im=FaceCrop,algorithm=dnn,width=1200,height=886', costFarmer1: 75, costFarmer2: 80),
    Item(name: 'Raddish', image: 'https://perfarmersglobal.in/wp-content/uploads/2023/10/white-raddish.jpg', costFarmer1: 40, costFarmer2: 45),
    Item(name: 'Corn', image: 'https://m.media-amazon.com/images/I/41F62-VbHSL.AC_UF1000,1000_QL80.jpg', costFarmer1: 85, costFarmer2: 90),
    Item(name: 'Mango', image: 'https://4.imimg.com/data4/EX/IX/MY-26971534/alphonso-mango1.jpg', costFarmer1: 120, costFarmer2: 130),
    Item(name: 'Pineapple', image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3EZenExcPl5a_leFkFbwu5jGw2Dv3dmI2fw&s', costFarmer1: 100, costFarmer2: 110),
    Item(name: 'Strawberry', image: 'https://clv.h-cdn.co/assets/15/22/2048x2048/square-1432664914-strawberry-facts1.jpg', costFarmer1: 90, costFarmer2: 100),
    Item(name: 'Pear', image: 'https://cdn.policyx.com/images/benefits-of-pear-fruit-main-banner-1.webp', costFarmer1: 110, costFarmer2: 120),
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredItems = items.where((item) {
      return item.name.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to FarmDrop'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.business_center),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NegotiationPortal()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (query) {
                setState(() {
                  searchQuery = query;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(8.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 0.75,
              ),
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                final item = filteredItems[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ItemDetailScreen(item: item),
                      ),
                    );
                  },
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Image.network(item.image, fit: BoxFit.cover),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.0),
                          child: Text(item.name, style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ItemDetailScreen extends StatelessWidget {
  final Item item;

  ItemDetailScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: Column(
        children: [
          Image.network(item.image),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(item.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Farmer 1: ₹${item.costFarmer1}', style: TextStyle(fontSize: 18)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Farmer 2: ₹${item.costFarmer2}', style: TextStyle(fontSize: 18)),
          ),
          ElevatedButton(
            onPressed: () {
              _showChoosePriceDialog(context);
            },
            child: Text('Add to Cart'),
          ),
        ],
      ),
    );
  }

  void _showChoosePriceDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Choose Price'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text('Farmer 1 (per kg): ₹${item.costFarmer1}'),
              onTap: () {
                CartModel.addItem(item, item.costFarmer1);
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text('Farmer 2 (per kg): ₹${item.costFarmer2}'),
              onTap: () {
                CartModel.addItem(item, item.costFarmer2);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = CartModel.cart;

    return Scaffold(
      appBar: AppBar(
        title: Text('Basket'),
      ),
      body: cart.isEmpty
          ? Center(child: Text('Basket is empty'))
          : ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItem = cart[index];
          return ListTile(
            leading: Image.network(cartItem.item.image, height: 50, width: 50, fit: BoxFit.cover),
            title: Text(cartItem.item.name),
            subtitle: Text('₹${cartItem.price}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                CartModel.removeItem(cartItem);
                (context as Element).markNeedsBuild();
              },
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Purchase successful!'),
              backgroundColor: Colors.green,
            ));
          },
          child: Text('Checkout'),
        ),
      ),
    );
  }
}

class CartModel {
  static final List<CartItem> cart = [];

  static void addItem(Item item, double price) {
    cart.add(CartItem(item: item, price: price));
  }

  static void removeItem(CartItem cartItem) {
    cart.remove(cartItem);
  }
}

class CartItem {
  final Item item;
  final double price;

  CartItem({required this.item, required this.price});
}

class Item {
  final String name;
  final String image;
  final double costFarmer1;
  final double costFarmer2;

  Item({required this.name, required this.image, required this.costFarmer1, required this.costFarmer2});
}

// Negotiation Portal

class NegotiationPortal extends StatefulWidget {
  @override
  State<NegotiationPortal> createState() => NegotiationPortalState();
}

class NegotiationPortalState extends State<NegotiationPortal> {
  final List<AuctionItem> items = [
    AuctionItem(
      produceName: 'Tomatoes',
      stock: '50 kg',
      minPrice: 1500,
      maxPrice: 2000,
      farmerName: 'Farmer John',
    ),
    AuctionItem(
      produceName: 'Potatoes',
      stock: '100 kg',
      minPrice: 2500,
      maxPrice: 3000,
      farmerName: 'Farmer Jane',
    ),
    AuctionItem(
      produceName: 'Onions',
      stock: '75 kg',
      minPrice: 1800,
      maxPrice: 2200,
      farmerName: 'Farmer Mike',
    ),
    AuctionItem(
      produceName: 'Carrots',
      stock: '60 kg',
      minPrice: 2000,
      maxPrice: 2400,
      farmerName: 'Farmer Sarah',
    ),
  ];

  final Map<int, String> offers = {}; // Map to store offers for each item
  String? selectedOffer; // Selected offer for dropdown

  void placeOffer(int index, double offerAmount) {
    final item = items[index];

    if (offerAmount >= item.minPrice && offerAmount <= item.maxPrice) {
      setState(() {
        final offerText = 'Offer for ${item.produceName}: ₹$offerAmount';
        offers[index] = offerText; // Update the offer for the item
        selectedOffer = offerText; // Set the latest offer as selected
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Offer placed successfully: ₹$offerAmount for ${item.produceName}'),
        backgroundColor: Colors.green,
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('The offer could not be placed. Please check your offer amount.'),
        backgroundColor: Colors.red,
      ));
    }
  }

  void cancelOffer(int index) {
    setState(() {
      offers.remove(index); // Remove the offer for the item
      if (offers.isNotEmpty) {
        selectedOffer = offers.values.first; // Update the selected offer to the first one if available
      } else {
        selectedOffer = null; // Clear the selected offer if no offers are left
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Offer canceled successfully'),
      backgroundColor: Colors.red,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Negotiation Portal'),
        backgroundColor: const Color(0xFF2C6B2F), // Dark green color
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Card(
                  margin: const EdgeInsets.all(10.0),
                  color: const Color(0xFFF1F8E9), // Very light green color
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.produceName,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF004D40), // Darker green color
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Stock: ${item.stock}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Price Range: ₹${item.minPrice} - ₹${item.maxPrice}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Your Offer (₹)',
                            labelStyle: const TextStyle(color: Color(0xFF004D40)), // Darker green color
                            border: const OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Color(0xFF004D40)), // Darker green color
                            ),
                          ),
                          onSubmitted: (value) {
                            final offerAmount = double.tryParse(value);
                            if (offerAmount != null && offerAmount > 0) {
                              placeOffer(index, offerAmount);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please enter a valid offer amount!'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          },
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF004D40), // Darker green color
                            foregroundColor: Colors.white, // Text color
                          ),
                          onPressed: () {
                            final offerAmount = double.tryParse('3000'); // Example offer
                            if (offerAmount != null) {
                              placeOffer(index, offerAmount);
                            }
                          },
                          child: const Text('Submit Offer'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          if (offers.isNotEmpty)
            ExpansionTile(
              title: const Text(
                'Offers Summary',
                style: TextStyle(
                  color: Color(0xFF004D40), // Darker green color
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: offers.entries.map((entry) {
                final index = entry.key;
                final offerText = entry.value;
                return ListTile(
                  title: Text(offerText),
                  trailing: IconButton(
                    icon: Icon(Icons.cancel, color: Colors.red),
                    onPressed: () => cancelOffer(index),
                  ),
                );
              }).toList(),
            ),
        ],
      ),
    );
  }
}

class AuctionItem {
  final String produceName;
  final String stock;
  final double minPrice;
  final double maxPrice;
  final String farmerName;

  AuctionItem({
    required this.produceName,
    required this.stock,
    required this.minPrice,
    required this.maxPrice,
    required this.farmerName,
  });
}