import 'package:flutter/material.dart';
import 'package:coffeeshop_app/menu_page.dart';

class BerandaPage extends StatefulWidget {
  const BerandaPage({super.key});

  @override
 State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,

        body: Column(
          children: [

            // Header
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.grey.shade800,
                    Colors.black87,
                    Colors.black,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Column(
                children: [

                  // Profil
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(
                            "Location",
                            style: TextStyle(color: Colors.white70),
                          ),

                          Row(
                            children: [
                              Text(
                                "West, Balurghat",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 5),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),

                      CircleAvatar(
                        radius: 18,
                        backgroundImage:
                            AssetImage("assets/images/profil.jpg"),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  // Tombol Pencarian
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Search coffee",
                      prefixIcon: Icon(Icons.search),

                      suffixIcon: Container(
                        margin: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.tune,
                          color: Colors.white,
                        ),
                      ),

                      filled: true,
                      fillColor: Colors.white,

                      contentPadding:
                          EdgeInsets.symmetric(vertical: 15),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),

            // Kategori
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  categoryItem("Cappuccino", true),
                  categoryItem("Macchiato", false),
                  categoryItem("Latte", false),
                  categoryItem("Americano", false),
                ],
              ),
            ),

            SizedBox(height: 10),

            // Menu
            Expanded(
              child: GridView.count(
                padding: EdgeInsets.all(12),
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: [
                  coffeeItem("assets/images/coffee1.jpeg",
                      "Cappuccino", "with Chocolate", "\$4.53", "4.8"),
                  coffeeItem("assets/images/coffee2.jpeg",
                      "Cappuccino", "with Oat Milk", "\$3.90", "4.5"),
                  coffeeItem("assets/images/coffee3.jpeg",
                      "Cappuccino", "with Caramel", "\$4.20", "4.7"),
                  coffeeItem("assets/images/coffee4.jpeg",
                      "Cappuccino", "with Vanilla", "\$4.10", "4.6"),
                ],
              ),
            ),
          ],
        ),

        // Navigasi
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ""),
          ],
        ),
      ),
    );
  }

  // Kategori
  Widget categoryItem(String title, bool active) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: active ? Colors.orange : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: TextStyle(
              color: active ? Colors.white : Colors.black),
        ),
      ),
    );
  }

  // Item Kopi
  Widget coffeeItem(String image, String title, String subtitle,
      String price, String rating) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MenuPage(
              image: image,
              title: title,
              subtitle: subtitle,
              price: price,
              rating: rating,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            )
          ],
        ),
        child: Column(
          children: [

            Expanded(
              child: Stack(
                children: [

                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),

                  // Rating
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 6, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.star,
                              color: Colors.orange, size: 14),
                          SizedBox(width: 3),
                          Text(
                            rating,
                            style: TextStyle(
                                color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold)),
                  Text(subtitle,
                      style: TextStyle(
                          color: Colors.grey, fontSize: 12)),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      Text(price,
                          style:
                              TextStyle(fontWeight: FontWeight.bold)),

                      Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius:
                              BorderRadius.circular(8),
                        ),
                        child: Icon(Icons.add,
                            color: Colors.white, size: 18),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}