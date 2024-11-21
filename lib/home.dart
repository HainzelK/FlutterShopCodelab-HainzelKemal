import 'package:codelabs101/productdetail.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> products = [
    {'image': 'nike1.jpg', 'title': 'Nike Air Max', 'subtitle': 'Price: \$120'},
    {'image': 'nike2.jpg', 'title': 'Nike Air Zoom', 'subtitle': 'Price: \$150'},
    {'image': 'nike3.jpg', 'title': 'Nike Pegasus', 'subtitle': 'Price: \$130'},
    {'image': 'nike4.jpg', 'title': 'Nike Revolution', 'subtitle': 'Price: \$100'},
    {'image': 'nike5.jpg', 'title': 'Nike React', 'subtitle': 'Price: \$140'},
    {'image': 'nike6.jpg', 'title': 'Nike Infinity', 'subtitle': 'Price: \$160'},
    {'image': 'nike7.jpg', 'title': 'Nike Vaporfly', 'subtitle': 'Price: \$250'},
    {'image': 'nike8.jpg', 'title': 'Nike Structure', 'subtitle': 'Price: \$110'},
    {'image': 'nike9.jpg', 'title': 'Nike Free Run', 'subtitle': 'Price: \$90'},
    {'image': 'nike10.jpg', 'title': 'Nike Legend', 'subtitle': 'Price: \$170'},
  ];

  List<Card> _buildGridCards(BuildContext context) {
    return products.map((product) {
      return Card(
        clipBehavior: Clip.antiAlias,
        elevation: 4.0,
        child: GestureDetector(
          onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailPage(product: product),
              ),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 18.0 / 11.0,
                child: Image.asset(
                  product['image'],
                  fit: BoxFit.fitWidth,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      product['title'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8.0),
                    Text(product['subtitle']),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu, semanticLabel: 'menu'),
              onPressed: () {
                Scaffold.of(context).openDrawer(); 
              },
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search, semanticLabel: 'search'),
            onPressed: () {
              print('Search button');
            },
          ),
          IconButton(
            icon: const Icon(Icons.tune, semanticLabel: 'filter'),
            onPressed: () {
              print('Filter button');
            },
          ),
        ],
        title: Row(
          children: [
            Image.asset(
              'logo2.jpg', 
              height: 30.0, 
            ),
            const SizedBox(width: 8.0), 
            const Text('Shoehub'),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: const Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: const Text('Sneakers'),
              onTap: () {
                Navigator.pop(context); 
              },
            ),
            ListTile(
              title: const Text('Shoes'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          GridView.count(
            crossAxisCount: 2,
            padding: const EdgeInsets.all(16.0),
            childAspectRatio: 8.0 / 9.0,
            children: _buildGridCards(context),
          ),
        ],
      ),
    );
  }
}
