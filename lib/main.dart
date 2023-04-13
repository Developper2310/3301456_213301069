
import 'package:app_7_ticari_kapsamli/Providers/SepetNotifier.dart';
import 'package:app_7_ticari_kapsamli/Providers/app_theme.dart';
import 'package:app_7_ticari_kapsamli/Sayfalar/SiparisDetaySayfasi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Sayfalar/AnaEkranSayfasi.dart';
import 'Sayfalar/DrawerSayfalari.dart';
import 'Sayfalar/SepetSayfasi.dart';
import 'Sayfalar/SiparisGecmisi.dart';
import 'Sayfalar/UrunListeSayfasi.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  final List<Urun> urunler = [
    Urun(
        kategori: "Gıda",
        ad: "Gofret Kutu (X30)",
        fiyat: 33.75,
        imageUrl: "assets/images/10559456051250.jpg",
        bilgi: 'İçinden 30 adet gofret çıkar '),
    Urun(
        kategori: "Gıda",
        ad: "Biscolata",
        fiyat: 8.50,
        imageUrl: 'assets/images/07011700_yan-06a477-1650x1650.jpg',
        bilgi: 'Mevsimi her zaman çikolatalı'),
    Urun(
        kategori: "Gıda",
        ad: "Çitos",
        fiyat: 13.50,
        imageUrl: 'assets/images/cheetos-firindan-fistikli.png',
        bilgi: 'Lezzetli atıştırmalık'),
    Urun(
        kategori: "Gıda",
        ad: "Dondurma",
        fiyat: 14.50,
        imageUrl: 'assets/images/dondurma.jpg',
        bilgi: 'Sıcaktan erimeden Önce yiyin'),
    Urun(
        kategori: "Gıda",
        ad: "Pepsi",
        fiyat: 24.75,
        imageUrl: 'assets/images/pepsi.jpg',
        bilgi: 'Pepsi Yaşatır Seni'),
    Urun(
        kategori: "Gıda",
        ad: "Milshake",
        fiyat: 5.50,
        imageUrl:
            'assets/images/dr-oetker-milkshake-cilekli-26-gr-cd9fa9-1650x1650.jpg',
        bilgi: 'Kremalı çilekli milkshake.'),
    Urun(
        kategori: "Oyuncak",
        ad: "Oyuncak Araba",
        fiyat: 29.25,
        imageUrl: 'assets/images/araba.jpg',
        bilgi: 'Türk Mühendisler Geliştirdi işte yerli TOGG'),
    Urun(
        kategori: "Oyuncak",
        ad: "Oyuncak Uçak",
        fiyat: 44.25,
        imageUrl: 'assets/images/miniucak.jpg',
        bilgi: ''),
    Urun(
        kategori: "Oyuncak",
        ad: "Spiderman",
        fiyat: 4.50,
        imageUrl: 'assets/images/sp.jpg',
        bilgi: 'Bu Örümcek adam silah kullanmayı öğrendi'),
    Urun(
        kategori: "Oyuncak",
        ad: "Oyuncak Tabanca",
        fiyat: 18.75,
        imageUrl: 'assets/images/61_boncuklu-o-7749_1.jpg',
        bilgi:
            'Arkadaşlarınızdan intikam almak ister misiniz? O zaman gözlerine boncuk sıkın'),
    Urun(
        kategori: "Sağlık",
        ad: "Vitamin",
        fiyat: 34.50,
        imageUrl: 'assets/images/vitamin.jpg',
        bilgi: 'Koronaysanız şimdi Tam vakti'),
    Urun(
        kategori: "Sağlık",
        ad: "Sargı bezi",
        fiyat: 49.00,
        imageUrl: 'assets/images/bez.jpg',
        bilgi: 'Yaralandınız mı? hiç sıkıntı değil'),
    Urun(
        kategori: "Sağlık",
        ad: "Yara Bandı",
        fiyat: 16.25,
        imageUrl: 'assets/images/yb.jpg',
        bilgi:
            'Bıçak kullanmayı bilmiyor musunuz? O zaman ihtiyacınız olacak.'),
  ];

  Widget build(BuildContext context) {
    //Tüm sayfaların renk değiştirmesi için if komutları?
    //theme üzzerine atancak
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SepetProvider()),
          ChangeNotifierProvider(create: (_) => AppTheme())],
        child: Consumer<AppTheme>(
        builder: (context, AppTheme, child) {

          return MaterialApp(

            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: AppTheme.th ,
            home: AnaEkran(
              products: [],
            ),
            routes: {
              '/ürünler': (context) =>
                  UrunListeSayfasi(
                    urunler: urunler,
                  ),
              '/sepet': (context) => SepetSayfasi(),
              '/profil': (context) => ProfilSayfasi(),
              '/sirket': (context) => SirketTanitimiSayfasi(),
              '/siparisler': (context) => SiparisGecmisiSayfasi(),
              '/siparisdetay': (context) => SiparisDetayi(siparis: {},),
              '/kullanim': (context) => kullanimSayfasi(),
            },
          );
        }
    )
    ); }
}


class Urun {
  final String ad;
  final double fiyat;
  final String imageUrl;
  final String kategori;
  final String bilgi;

  Urun(
      {required this.kategori,
      required this.ad,
      required this.fiyat,
      required this.imageUrl,
      required this.bilgi});
}


