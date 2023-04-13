import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/SepetNotifier.dart';
import '../main.dart';
import 'UrunDetaySayfasi.dart';

class UrunListeSayfasi extends StatelessWidget {
  final List<Urun> urunler;

  UrunListeSayfasi({required this.urunler});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ürünlerimiz"),
      ),
      body: GridView.builder(
        itemCount: urunler.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 1.2),
        ),
        itemBuilder: (BuildContext context, int index) {
          final product = urunler[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UrunDetaySayfasi(urun: product),
                ),
              );
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: Image.asset(
                      product.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          product.ad,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${product.fiyat} TL',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            final sepetProvider = Provider.of<SepetProvider>(
                                context,
                                listen: false);
                            sepetProvider.sepeteEkle(product);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: Duration(seconds: 1),
                                content: Text("${product.ad} sepete eklendi"),
                              ),
                            );
                          },
                          child: Text("Sepete Ekle"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Ana Sayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Ürünler',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Sepetim',
          ),
        ],
        currentIndex: 1,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/ürünler');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/sepet');
          }
        },
      ),
    );
  }
}