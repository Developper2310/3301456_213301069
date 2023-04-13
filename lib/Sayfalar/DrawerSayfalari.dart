import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/SepetNotifier.dart';
import '../main.dart';
import 'UrunDetaySayfasi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/SepetNotifier.dart';
import '../main.dart';
import 'UrunDetaySayfasi.dart';

class kullanimSayfasi extends StatelessWidget {
 kullanimSayfasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(child: Text("Burası Düzenlenecek"),)
    );
  }
}



class ProfilSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Sayfası'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('assets/images/memati.jpg'),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Batuhan Usta',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'arkadş123@gmail.com',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              '+90 555 555 55 55',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Ankara/sincan',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),

          ],
        ),
      ),
    );
  }
}

class SirketTanitimiSayfasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Şirket Bilgileri'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Biz Kimiz?',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              'Firmamız, 1995 yılında kurulmuş ve o günden beri müşteri memnuniyetini en ön planda tutarak faaliyetlerini sürdürmektedir. ',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 32.0),
            Text(
              'Misyonumuz',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              'Müşterilerimizin ihtiyaçlarını en iyi şekilde karşılayarak, sektörde lider bir firma olmak.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 32.0),
            Text(
              'Vizyonumuz',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              'Daima yenilikçi bir yaklaşımla, müşterilerimize kaliteli hizmet sunarak, sektörün öncü firmalarından biri olmak.',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
