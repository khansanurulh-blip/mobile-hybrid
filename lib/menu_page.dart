import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  final String image;
  final String title;
  final String subtitle;
  final String price;
  final String rating;

  const MenuPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.rating,
  });

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  int selectedSize = 1;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Column(
          children: [
            Stack(
              children: [

                Image.asset(
                  widget.image,
                  width: double.infinity,
                  height: 350,
                  fit: BoxFit.cover,
                ),

                Container(
                  width: double.infinity,
                  height: 350,
                  color: Colors.black.withOpacity(0.3),
                ),

                // Tombol Kembali
                Positioned(
                  top: 15,
                  left: 15,
                  child: CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(0.5),
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                ),

                // Tombol Favorit
                Positioned(
                  top: 15,
                  right: 15,
                  child: CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(0.5),
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                  ),
                ),

                // Judul dan Rating
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      // Judul
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            widget.subtitle,
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),

                      // ⭐ RATING + REVIEW (SUDAH TANPA TOMBOL + -)
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.orange),
                          SizedBox(width: 5),

                          Text(
                            widget.rating,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(width: 5),

                          Text(
                            "(2.330)",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Konten
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(25)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // Deskripsi
                    Text(
                      "Description",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),

                    SizedBox(height: 5),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          "A cappuccino is a coffee-based drink made with espresso and steamed milk.",
                          style: TextStyle(color: Colors.grey),
                        ),

                        if (isExpanded)
                          Text(
                            " It is traditionally prepared with equal parts espresso, steamed milk, and milk foam. Cappuccino has a rich flavor and creamy texture, making it one of the most popular coffee drinks worldwide.",
                            style: TextStyle(color: Colors.grey),
                          ),

                        SizedBox(height: 5),

                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isExpanded = !isExpanded;
                            });
                          },
                          child: Text(
                            isExpanded ? "Read Less" : "Read More",
                            style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),

                    Text(
                      "Size",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),

                    SizedBox(height: 10),

                    Row(
                      children: [
                        sizeItem("S", 0),
                        SizedBox(width: 10),
                        sizeItem("M", 1),
                        SizedBox(width: 10),
                        sizeItem("L", 2),
                      ],
                    ),

                    Spacer(),

                    // Price dan Tombol Beli
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [

                        Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text("Price",
                                style: TextStyle(color: Colors.grey)),
                            Text(
                              widget.price,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                              ),
                            ),
                          ],
                        ),

                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            padding: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(
                            "Buy Now",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget sizeItem(String text, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSize = index;
        });
      },
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: selectedSize == index
              ? Colors.orange
              : Colors.white,
          border: Border.all(color: Colors.orange),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: selectedSize == index
                ? Colors.white
                : Colors.orange,
          ),
        ),
      ),
    );
  }
}