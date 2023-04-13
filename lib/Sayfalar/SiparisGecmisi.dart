import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/SepetNotifier.dart';
import '../main.dart';
import 'UrunDetaySayfasi.dart';
import 'SiparisDetaySayfasi.dart';


class SiparisGecmisiSayfasi extends StatefulWidget {
  const SiparisGecmisiSayfasi({Key? key}) : super(key: key);

  @override
  State<SiparisGecmisiSayfasi> createState() => _SiparisGecmisiSayfasiState();
}

class _SiparisGecmisiSayfasiState extends State<SiparisGecmisiSayfasi> {
  @override
  late final Map<Urun, int> siparis;
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sipariş Geçmişim"),
        ),
        body: Consumer<SepetProvider>(
        builder: (context, siparisler, child)
    {
      return ListView.builder(
        itemCount: siparisler.siparisSayisi,
        itemBuilder: (BuildContext context, int index) {
          final siparis = siparisler.siparisList[index];
          final urunler = siparis.keys.toList();
          final adetler = siparis.values.toList();

          Color? backgroundColor  = index % 2 == 0 ? Colors.purple : Colors.blue;

          //Color? null kontrolü yapmadan hata veriyor aynı hata için değişken sonun ? koy
          return Container(
              color: backgroundColor,

           child: GestureDetector(
             onTap:() {
               Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => SiparisDetayi(siparis: siparis)),
               );
             },

           child: ListTile(
            title: Text("${index + 1} Numaralı Siparis"),
            subtitle: Text(''),
              trailing: Text('${siparisler.siparisFiyat(siparis)} ₺')

          )
           ));
        },
       );
    },
    )

    );
    }

}
