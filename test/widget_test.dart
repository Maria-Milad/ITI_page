import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Shop',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Arial',
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<bool> favorites = [false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.chair), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.timer), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // الجزء العلوي الرمادي
            Container(
              color: Colors.grey[200],
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // ✅ صورة الحساب من Google Drive
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                          'https://drive.google.com/uc?export=view&id=1t2-sYrPAMF3WeMkYjz7KEd4OUOjI_3Oy',
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Hello, Maria',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'What do you want to buy?',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 15),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [Icon(Icons.chair, size: 40), Text('Sofas')],
                      ),
                      Column(
                        children: [
                          Icon(Icons.king_bed, size: 40),
                          Text('Wardrobe'),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.desktop_mac, size: 40),
                          Text('Desk'),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.table_bar, size: 40),
                          Text('Dresser'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),

            // المنتجات
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(15),
                children: [
                  buildProductCard(
                    index: 0,
                    name: 'FinnNavian',
                    price: 248,
                    description:
                        'Scandinavian small sized double sofa imported full leather',
                    imageUrl:
                        'https://www.westelm.com/weimgs/rk/images/wcm/products/201736/0139/henry-3-piece-l-shaped-sectional-c.jpg', // 🖼️ صورة منتج 1
                  ),
                  buildProductCard(
                    index: 1,
                    name: 'ChairX Modern',
                    price: 175,
                    description: 'Modern office chair with ergonomic design',
                    imageUrl:
                        'https://png.pngtree.com/background/20231101/original/pngtree-stylishly-furnished-living-room-with-contemporary-3d-render-and-wooden-wall-picture-image_5828581.jpg', // 🖼️ صورة منتج 2
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProductCard({
    required int index,
    required String name,
    required int price,
    required String description,
    required String imageUrl,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  imageUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      favorites[index] = !favorites[index];
                    });
                  },
                  child: Icon(
                    favorites[index] ? Icons.favorite : Icons.favorite_border,
                    color: favorites[index] ? Colors.red : Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(description, maxLines: 2, overflow: TextOverflow.ellipsis),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      '\$$price',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                      ),
                      child: Text('Add to cart'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
