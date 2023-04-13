import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/SepetNotifier.dart';
import '../main.dart';
import 'UrunDetaySayfasi.dart';
import 'SiparisGecmisi.dart';

class SiparisDetayi extends StatelessWidget {
  final Map<Urun, int> siparis;

  const SiparisDetayi({required this.siparis});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Siparis Detayi"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Siparis Detayi",
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: siparis.length,
              itemBuilder: (context, index) {
                final urun = siparis.keys.toList()[index];
                final adet = siparis.values.toList()[index];
                return ListTile(
                  title: Text(urun.ad),
                  subtitle: Text("${urun.fiyat} ₺ x $adet adet"),
                  trailing: Text("${urun.fiyat * adet} ₺"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
