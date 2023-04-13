import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/SepetNotifier.dart';
import '../main.dart';
import 'UrunDetaySayfasi.dart';

class _SepetSayfasiState extends State<SepetSayfasi> {
  @override
  Widget build(BuildContext context) {
    // Daha sonra Sepet sayfası olarak kullanıcam
    // Zamanı Gelince Scaffold yerine sayfa tasarımı yap
    return Scaffold(
      appBar: AppBar(
        title: Text("Sepetim"),
      ),
      body: Consumer<SepetProvider>(
        builder: (context, sepet, child) {
          return Column(children: [
            Expanded(
                child: GridView.builder(
              itemCount: sepet.sepetUzunluk,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.2),
              ),
              itemBuilder: (BuildContext context, int index) {
                final product = sepet.sepettekiler.keys.elementAt(index);
                final urunSayisi = sepet.sepettekiler.values.elementAt(index);

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
                                '${product.fiyat * urunSayisi} TL',
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                              Text(
                                "Adet Sepette :   ${urunSayisi}",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red,
                                ),
                                onPressed: () {
                                  final sepetProvider =
                                      Provider.of<SepetProvider>(context,
                                          listen: false);
                                  sepetProvider.sepettenCikar(product);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      duration: Duration(seconds: 1),
                                      content: Text(urunSayisi == 1
                                          ? "${product.ad} Sepetten çıkarıldı"
                                          : "${product.ad} sepetten eksiltildi"),
                                    ),
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 5),
                                    Text(
                                      urunSayisi == 1
                                          ? "Çıkar"
                                          : "Eksilt",
                                      style: TextStyle(),
                                    ),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.blue,
                                ),
                                onPressed: () {
                                  final sepetProvider =
                                      Provider.of<SepetProvider>(context,
                                          listen: false);
                                  sepetProvider.sepeteEkle(product);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      duration: Duration(seconds: 1),
                                      content:
                                          Text("${urunSayisi} adet sepette"),
                                    ),
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 5),
                                    Text(
                                      "Arttır",
                                      style: TextStyle(),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )),
            Container(
                height: 50,
                color: Colors.grey[300],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("  TOPLAM FİYAT ${sepet.toplamFiyat}  TL"),
                    ElevatedButton(
                        onPressed: () {
                          final sepetProvider = Provider.of<SepetProvider>(
                              context,
                              listen: false);
                          sepetProvider.siparisiTamamla();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            duration: Duration(seconds: 2),
                            content: Text("${sepetProvider.i} Numaralı Sipari Talebi Oluşturuldu"),
                          ));
                          setState(() {});
                        },
                        child: Text("Siparişi Tamamla")),

                  ],
                ))
          ]);
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
        currentIndex: 2,
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

class SepetSayfasi extends StatefulWidget {
  @override
  _SepetSayfasiState createState() => _SepetSayfasiState();
}
