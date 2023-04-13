import 'package:flutter/cupertino.dart';

import '../main.dart';

class SepetProvider extends ChangeNotifier {
int i=0;
  Map<Urun, int> sepet = {};

  List<Map<Urun, int>> siparisList = [];


  List<Map<Urun, int>> get siparisler => siparisList;
  Map<Urun, int> get sepettekiler => sepet;
  int get sepetUzunluk => sepet.length;
  int get siparisSayisi => siparisList.length;

  void sepeteEkle(Urun? urun) {
    if (urun != null) {
      if (sepet.containsKey(urun)) {
        sepet[urun] = sepet[urun]! + 1;
      } else {
        sepet[urun] = 1;
      }
      notifyListeners();
    }
  }

  void sepettenCikar(Urun? urun) {
    if (urun != null) {
      if (sepet.containsKey(urun)) {
        if (sepet[urun]! > 1) {
          sepet[urun] = sepet[urun]! - 1;
        } else {
          sepet.remove(urun);
        }
        notifyListeners();
      }
    }
  }

  double get toplamFiyat {
    double toplam = 0;
    sepet.forEach((urun, adet) {
      toplam += urun.fiyat * adet;
    });
    return toplam;
  }


  void siparisiTamamla() {
    siparisList.insert(i, Map.from(sepet));
    sepet.clear();
    i++;
  }
double siparisFiyat(Map<Urun, int> siparis) {
  double toplamFiyat = 0;
  for (var entry in siparis.entries) {
    toplamFiyat += entry.key.fiyat * entry.value;
  }
  return toplamFiyat;
}
}






