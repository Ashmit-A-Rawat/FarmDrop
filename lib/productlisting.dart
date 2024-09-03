import 'package:flutter/material.dart';

// Product Model
class Product {
  final String? imageUrl;
  final String name;
  final String description;
  final String priceRange;
  final String stock;

  Product({
    this.imageUrl,
    required this.name,
    required this.description,
    required this.priceRange,
    required this.stock,
  });
}

// Product Form Page
class ProductFormPage extends StatefulWidget {
  final Function(Product) onAddProduct;
  final Product? existingProduct;
  final int? productIndex;

  ProductFormPage({required this.onAddProduct, this.existingProduct, this.productIndex});

  @override
  _ProductFormPageState createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();
  String? _imageUrl;
  String? _name;
  String? _description;
  String? _priceRange;
  String? _stock;

  @override
  void initState() {
    super.initState();
    if (widget.existingProduct != null) {
      _imageUrl = widget.existingProduct!.imageUrl;
      _name = widget.existingProduct!.name;
      _description = widget.existingProduct!.description;
      _priceRange = widget.existingProduct!.priceRange;
      _stock = widget.existingProduct!.stock;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.existingProduct == null ? 'Add Product' : 'Edit Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _imageUrl,
                decoration: InputDecoration(labelText: 'Image URL'),
                onSaved: (value) => _imageUrl = value,
              ),
              TextFormField(
                initialValue: _name,
                decoration: InputDecoration(labelText: 'Product Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Product name is required';
                  }
                  return null;
                },
                onSaved: (value) => _name = value,
              ),
              TextFormField(
                initialValue: _description,
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Description is required';
                  }
                  return null;
                },
                onSaved: (value) => _description = value,
              ),
              TextFormField(
                initialValue: _priceRange,
                decoration: InputDecoration(labelText: 'Price Range (e.g., 50-100 INR)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Price range is required';
                  }
                  return null;
                },
                onSaved: (value) => _priceRange = value,
              ),
              TextFormField(
                initialValue: _stock,
                decoration: InputDecoration(labelText: 'Stock (e.g., 50kg, 100kg)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Stock is required';
                  }
                  return null;
                },
                onSaved: (value) => _stock = value,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    final newProduct = Product(
                      imageUrl: _imageUrl,
                      name: _name!,
                      description: _description!,
                      priceRange: _priceRange!,
                      stock: _stock!,
                    );
                    widget.onAddProduct(newProduct);
                    Navigator.pop(context);
                  }
                },
                child: Text(widget.existingProduct == null ? 'Add Product' : 'Update Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Products Page
class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final List<Product> _products = [];

  void _addOrUpdateProduct(Product product, [int? index]) {
    setState(() {
      if (index != null) {
        _products[index] = product;
      } else {
        _products.add(product);
      }
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  void _editProduct(int index) {
    final product = _products[index];
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductFormPage(
          onAddProduct: (updatedProduct) => _addOrUpdateProduct(updatedProduct, index),
          existingProduct: product,
          productIndex: index,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductFormPage(onAddProduct: _addOrUpdateProduct),
                ),
              );
            },
          ),
        ],
      ),
      body: _products.isEmpty
          ? Center(
        child: Text(
          'To add your products\nclick +',
          style: TextStyle(fontSize: 18, color: Colors.black54),
          textAlign: TextAlign.center,
        ),
      )
          : GridView.builder(
        padding: EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 3 / 4,
        ),
        itemCount: _products.length,
        itemBuilder: (context, index) {
          final product = _products[index];
          return Card(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AspectRatio(
                      aspectRatio: 4 / 3,
                      child: product.imageUrl != null && product.imageUrl!.isNotEmpty
                          ? Image.network(
                        product.imageUrl!,
                        fit: BoxFit.cover,
                      )
                          : Container(
                        color: Colors.grey[300],
                        child: Center(
                          child: Text(
                            'Image Not Uploaded',
                            style: TextStyle(color: Colors.black54),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(product.name, style: TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(height: 4),
                              Text(product.description),
                              SizedBox(height: 4),
                              Text('Price: ${product.priceRange}'),
                              SizedBox(height: 4),
                              Text('Stock: ${product.stock}'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: PopupMenuButton<String>(
                    onSelected: (value) {
                      if (value == 'edit') {
                        _editProduct(index);
                      } else if (value == 'delete') {
                        _deleteProduct(index);
                      }
                    },
                    itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                      PopupMenuItem<String>(
                        value: 'edit',
                        child: Text('Edit'),
                      ),
                      PopupMenuItem<String>(
                        value: 'delete',
                        child: Text('Delete'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Main Application
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductsPage(),
    );
  }
}