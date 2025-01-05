import 'package:flutter/material.dart';
import 'pay.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fruits & Vegetables',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeScreen(),
    );
  }
}

class Item {
  final String name;
  final String image;
  final int costFarmer1;
  final int costFarmer2;
  final Farmer farmer1;
  final Farmer farmer2;

  Item({
    required this.name,
    required this.image,
    required this.costFarmer1,
    required this.costFarmer2,
    required this.farmer1,
    required this.farmer2,
  });
}

class Farmer {
  final String name;
  final String location;
  final int age;
  final double rating;

  Farmer({
    required this.name,
    required this.location,
    required this.age,
    required this.rating,
  });
}

class CartModel {
  static final List<CartItem> _items = [];

  static List<CartItem> get cart => List.unmodifiable(_items);

  static void addItem(Item item, int price) {
    _items.add(CartItem(item: item, price: price));
  }

  static void removeItem(CartItem cartItem) {
    _items.remove(cartItem);
  }

  static int get totalCost => _items.fold(0, (total, current) => total + current.price);
}

class CartItem {
  final Item item;
  final int price;

  CartItem({required this.item, required this.price});
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Item> items = [
    Item(
      name: 'Apple',
      image: 'https://www.ampimex.in/wp-content/uploads/2021/02/apples-.jpg',
      costFarmer1: 250,
      costFarmer2: 280,
      farmer1: Farmer(name: 'Farmer A', location: 'Pune', age: 45, rating: 4.5),
      farmer2: Farmer(name: 'Farmer B', location: 'Nagpur', age: 40, rating: 4.2),
    ),
    Item(
      name: 'Banana',
      image: 'https://images.immediate.co.uk/production/volatile/sites/30/2017/01/Bunch-of-bananas-67e91d5.jpg?quality=90&resize=440,400',
      costFarmer1: 50,
      costFarmer2: 55,
      farmer1: Farmer(name: 'Farmer A', location: 'Kolkata', age: 50, rating: 4.7),
      farmer2: Farmer(name: 'Farmer B', location: 'Delhi', age: 35, rating: 4.3),
    ),
    Item(
      name: 'Carrot',
      image: 'https://www.economist.com/sites/default/files/20180929_BLP506.jpg',
      costFarmer1: 30,
      costFarmer2: 35,
      farmer1: Farmer(name: 'Farmer A', location: 'Ahmedabad', age: 55, rating: 4.4),
      farmer2: Farmer(name: 'Farmer B', location: 'Jaipur', age: 60, rating: 4.1),
    ),
    Item(
      name: 'Tomato',
      image: 'https://m.economictimes.com/thumb/msid-95423731,width-1200,height-900,resizemode-4,imgsize-56196/tomatoes-canva.jpg',
      costFarmer1: 80,
      costFarmer2: 75,
      farmer1: Farmer(name: 'Farmer A', location: 'Delhi', age: 48, rating: 4.6),
      farmer2: Farmer(name: 'Farmer B', location: 'Mumbai', age: 42, rating: 4.3),
    ),
    Item(
      name: 'Broccoli',
      image: 'https://wellwo.es/wp-content/uploads/2020/04/brocoli.jpg',
      costFarmer1: 85,
      costFarmer2: 80,
      farmer1: Farmer(name: 'Farmer A', location: 'Bangalore', age: 50, rating: 4.7),
      farmer2: Farmer(name: 'Farmer B', location: 'Chennai', age: 38, rating: 4.2),
    ),
    Item(
      name: 'Grapes',
      image: 'https://5.imimg.com/data5/VU/MR/MY-24751011/purple-grapes.jpg',
      costFarmer1: 90,
      costFarmer2: 95,
      farmer1: Farmer(name: 'Farmer A', location: 'Hyderabad', age: 55, rating: 4.8),
      farmer2: Farmer(name: 'Farmer B', location: 'Pune', age: 45, rating: 4.5),
    ),
    Item(
      name: 'Rice',
      image: 'https://static.toiimg.com/photo/104401541/104401541.jpg',
      costFarmer1: 80,
      costFarmer2: 85,
      farmer1: Farmer(name: 'Farmer A', location: 'Kolkata', age: 60, rating: 4.4),
      farmer2: Farmer(name: 'Farmer B', location: 'Patna', age: 50, rating: 4.1),
    ),
    Item(
      name: 'Wheat',
      image: 'https://cdn.britannica.com/80/157180-050-7B906E02/Heads-wheat-grains.jpg',
      costFarmer1: 60,
      costFarmer2: 65,
      farmer1: Farmer(name: 'Farmer A', location: 'Lucknow', age: 65, rating: 4.6),
      farmer2: Farmer(name: 'Farmer B', location: 'Agra', age: 55, rating: 4.3),
    ),
    Item(
      name: 'Sugarcane',
      image: 'https://cff2.earth.com/uploads/2024/03/29151621/sugarcane-genome_sequenced_1m.jpg',
      costFarmer1: 40,
      costFarmer2: 45,
      farmer1: Farmer(name: 'Farmer A', location: 'Amritsar', age: 60, rating: 4.5),
      farmer2: Farmer(name: 'Farmer B', location: 'Kanpur', age: 48, rating: 4.2),
    ),
    Item(
      name: 'Potato',
      image: 'https://static.toiimg.com/photo/92522114.cms',
      costFarmer1: 25,
      costFarmer2: 30,
      farmer1: Farmer(name: 'Farmer A', location: 'Dehradun', age: 52, rating: 4.4),
      farmer2: Farmer(name: 'Farmer B', location: 'Shimla', age: 49, rating: 4.3),
    ),
    Item(
      name: 'Onion',
      image: 'https://m.media-amazon.com/images/I/71GUFttn0jL.AC_UF1000,1000_QL80.jpg',
      costFarmer1: 35,
      costFarmer2: 40,
      farmer1: Farmer(name: 'Farmer A', location: 'Jaipur', age: 53, rating: 4.6),
      farmer2: Farmer(name: 'Farmer B', location: 'Jodhpur', age: 45, rating: 4.4),
    ),
    Item(
      name: 'Garlic',
      image: 'https://www.realsimple.com/thmb/zjJYhj0AXTu8Ndio6-Hl2NzSicY=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/health-benefits-of-garlic-2000-482c21fd2d154102a9b7a46ccb34e70a.jpg',
      costFarmer1: 45,
      costFarmer2: 50,
      farmer1: Farmer(name: 'Farmer A', location: 'Ludhiana', age: 50, rating: 4.5),
      farmer2: Farmer(name: 'Farmer B', location: 'Chandigarh', age: 44, rating: 4.2),
    ),
    Item(
      name: 'Spinach',
      image: 'https://m.media-amazon.com/images/I/71tdN2taTCL.jpg',
      costFarmer1: 55,
      costFarmer2: 60,
      farmer1: Farmer(name: 'Farmer A', location: 'Ranchi', age: 47, rating: 4.4),
      farmer2: Farmer(name: 'Farmer B', location: 'Bhopal', age: 39, rating: 4.3),
    ),
    Item(
      name: 'Cucumber',
      image: 'https://seed2plant.in/cdn/shop/products/saladcucumberseeds.jpg?v=1603435556&width=1500',
      costFarmer1: 20,
      costFarmer2: 25,
      farmer1: Farmer(name: 'Farmer A', location: 'Surat', age: 42, rating: 4.6),
      farmer2: Farmer(name: 'Farmer B', location: 'Vadodara', age: 46, rating: 4.5),
    ),
    Item(
      name: 'Lettuce',
      image: 'https://trikaya.net/cdn/shop/products/LettuceLeafytabletop_grande.jpg?v=1594756664',
      costFarmer1: 30,
      costFarmer2: 35,
      farmer1: Farmer(name: 'Farmer A', location: 'Nashik', age: 44, rating: 4.4),
      farmer2: Farmer(name: 'Farmer B', location: 'Pondicherry', age: 37, rating: 4.3),
    ),
    Item(
      name: 'Pumpkin',
      image: 'https://images.immediate.co.uk/production/volatile/sites/30/2022/08/Pumpkin-sliced-open-f2b8dde.jpg',
      costFarmer1: 70,
      costFarmer2: 75,
      farmer1: Farmer(name: 'Farmer A', location: 'Gwalior', age: 51, rating: 4.5),
      farmer2: Farmer(name: 'Farmer B', location: 'Rourkela', age: 54, rating: 4.2),
    ),
    Item(
      name: 'Beetroot',
      image: 'https://seed2plant.in/cdn/shop/products/beetrootseeds.jpg?v=1606739694&width=1500',
      costFarmer1: 50,
      costFarmer2: 55,
      farmer1: Farmer(name: 'Farmer A', location: 'Jabalpur', age: 48, rating: 4.6),
      farmer2: Farmer(name: 'Farmer B', location: 'Raipur', age: 52, rating: 4.4),
    ),
    Item(
      name: 'Cauliflower',
      image: 'https://cdn.britannica.com/27/78227-050-28A68F87/cauliflower-Head-colour-White-brown-cultivars.jpg',
      costFarmer1: 60,
      costFarmer2: 65,
      farmer1: Farmer(name: 'Farmer A', location: 'Indore', age: 50, rating: 4.4),
      farmer2: Farmer(name: 'Farmer B', location: 'Sagar', age: 47, rating: 4.3),
    ),
    Item(
      name: 'Bell Pepper',
      image: 'https://cdn.britannica.com/12/147312-050-BEC6A59E/Bell-peppers.jpg',
      costFarmer1: 80,
      costFarmer2: 85,
      farmer1: Farmer(name: 'Farmer A', location: 'Solapur', age: 38, rating: 4.7),
      farmer2: Farmer(name: 'Farmer B', location: 'Aurangabad', age: 44, rating: 4.5),
    ),
    Item(
      name: 'Cabbage',
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSv16mQSx3cF7qBs4FbJKowZc0BnvzdtAtFfQ&s',
      costFarmer1: 65,
      costFarmer2: 70,
      farmer1: Farmer(name: 'Farmer A', location: 'Coimbatore', age: 55, rating: 4.6),
      farmer2: Farmer(name: 'Farmer B', location: 'Chennai', age: 48, rating: 4.4),
    ),
    Item(
      name: 'Chili',
      image: 'https://c.ndtvimg.com/2019-03/e8bse1po_red-chilli_625x300_08_March_19.jpg?im=FaceCrop,algorithm=dnn,width=1200,height=886',
      costFarmer1: 75,
      costFarmer2: 80,
      farmer1: Farmer(name: 'Farmer A', location: 'Mangalore', age: 43, rating: 4.5),
      farmer2: Farmer(name: 'Farmer B', location: 'Visakhapatnam', age: 39, rating: 4.3),
    ),
    Item(
      name: 'Raddish',
      image: 'https://perfarmersglobal.in/wp-content/uploads/2023/10/white-raddish.jpg',
      costFarmer1: 40,
      costFarmer2: 45,
      farmer1: Farmer(name: 'Farmer A', location: 'Gurgaon', age: 41, rating: 4.4),
      farmer2: Farmer(name: 'Farmer B', location: 'Faridabad', age: 36, rating: 4.2),
    ),
    Item(
      name: 'Corn',
      image: 'https://m.media-amazon.com/images/I/41F62-VbHSL.AC_UF1000,1000_QL80.jpg',
      costFarmer1: 85,
      costFarmer2: 90,
      farmer1: Farmer(name: 'Farmer A', location: 'Jammu', age: 49, rating: 4.5),
      farmer2: Farmer(name: 'Farmer B', location: 'Srinagar', age: 52, rating: 4.3),
    ),
    Item(
      name: 'Mango',
      image: 'https://4.imimg.com/data4/EX/IX/MY-26971534/alphonso-mango1.jpg',
      costFarmer1: 120,
      costFarmer2: 130,
      farmer1: Farmer(name: 'Farmer A', location: 'Pune', age: 46, rating: 4.6),
      farmer2: Farmer(name: 'Farmer PB', location: 'Nashik', age: 40, rating: 4.4),
    ),
    Item(
      name: 'Pineapple',
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3EZenExcPl5a_leFkFbwu5jGw2Dv3dmI2fw&s',
      costFarmer1: 100,
      costFarmer2: 110,
      farmer1: Farmer(name: 'Farmer A', location: 'Kochi', age: 54, rating: 4.7),
      farmer2: Farmer(name: 'Farmer B', location: 'Trivandrum', age: 49, rating: 4.5),
    ),
    Item(
      name: 'Strawberry',
      image: 'https://clv.h-cdn.co/assets/15/22/2048x2048/square-1432664914-strawberry-facts1.jpg',
      costFarmer1: 90,
      costFarmer2: 100,
      farmer1: Farmer(name: 'Farmer A', location: 'Ooty', age: 43, rating: 4.6),
      farmer2: Farmer(name: 'Farmer B', location: 'Mysore', age: 41, rating: 4.4),
    ),
    Item(
      name: 'Pear',
      image: 'https://cdn.policyx.com/images/benefits-of-pear-fruit-main-banner-1.webp',
      costFarmer1: 110,
      costFarmer2: 120,
      farmer1: Farmer(name: 'Farmer A', location: 'Shimla', age: 50, rating: 4.5),
      farmer2: Farmer(name: 'Farmer B', location: 'Kullu', age: 48, rating: 4.3),
    ),
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    // Filter items based on search query
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
            child: ListView.builder(
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                final item = filteredItems[index];
                return ListTile(
                  leading: Image.network(item.image, width: 50, height: 50, fit: BoxFit.cover),
                  title: Text(item.name),
                  subtitle: Text('Cost: Farmer 1 - ₹${item.costFarmer1}, Farmer 2 - ₹${item.costFarmer2}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ItemDetailScreen(item: item),
                      ),
                    );
                  },
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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(item.image, fit: BoxFit.cover),
            SizedBox(height: 16),
            Text(
              item.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Farmer 1: ${item.farmer1.name} - ₹${item.costFarmer1} (${item.farmer1.location}, Age: ${item.farmer1.age}, Rating: ${item.farmer1.rating})',
            ),
            Text(
              'Farmer 2: ${item.farmer2.name} - ₹${item.costFarmer2} (${item.farmer2.location}, Age: ${item.farmer2.age}, Rating: ${item.farmer2.rating})',
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                CartModel.addItem(item, item.costFarmer1); // Add item with Farmer 1's price to cart
                Navigator.pop(context);
              },
              child: Text('Add to Cart (Farmer 1)'),
            ),
            ElevatedButton(
              onPressed: () {
                CartModel.addItem(item, item.costFarmer2); // Add item with Farmer 2's price to cart
                Navigator.pop(context);
              },
              child: Text('Add to Cart (Farmer 2)'),
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
    final cartItems = CartModel.cart;
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: cartItems.isEmpty
          ? Center(child: Text('No items in the cart'))
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = cartItems[index];
                return ListTile(
                  leading: Image.network(cartItem.item.image, width: 50, height: 50, fit: BoxFit.cover),
                  title: Text(cartItem.item.name),
                  subtitle: Text('Price: ₹${cartItem.price}'),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_shopping_cart),
                    onPressed: () {
                      CartModel.removeItem(cartItem);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => CartScreen()),
                      );
                    },
                  ),
                );
              },
            ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total Cost: ₹${CartModel.totalCost}'),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PaymentGateway()),
                      );
                },
                child: Text('Checkout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
