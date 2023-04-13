import 'package:app_7_ticari_kapsamli/Providers/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/SepetNotifier.dart';
import '../main.dart';
import 'UrunDetaySayfasi.dart';


class _AnaEkranState extends State<AnaEkran> {
  //-------------------------------------------------------------------------
  //Bu widget stateful olarak değiştirilebilir içine dinamik değişkenler var!!
  final List<Urun> products;

  _AnaEkranState({required this.products});

  bool a = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Ana Sayfa'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
      ),
      body: Center(

        child: Stack(alignment: Alignment.center,
            children: [
              Positioned(
                  top: 100,
                  child: SizedBox(
                    width: 400,
                    height: 200,
                    child: HaberPanel(),
                  )
              ),
              Positioned(
                bottom: 50, // alt kenar boşluğu

                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/ürünler');
                  },
                  child: Text('Ürünleri Listele'),
                ),
              ),
              Positioned(
                top: 360,
                  child:Container(

                  padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.amber,
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                  child: Column(children:[

                Row
                (
                    children:[Text( "Yeni ürünleri Görmek İçin \n Yana Kaydırın --------------->>>>>>>>>>>\n")])
              ,Row(children: [Text("İnternet Derleyicilerinde Kaydırmakta\n Sıkıntı yaşıyorsanız Emilatorden deneyin")],)
              ])),),
              Positioned(
                bottom: 100,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/sepet');
                  },
                  child: Text('Sepetim'),
                ),

              ),
              Positioned(
                bottom: 150,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/siparisler');

                  },
                  child: Text('Siparişlerim'),
                ),

              )
            ]),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Batuhan Usta'),
              accountEmail: Text('arkadş123@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/memati.jpg'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profil Sayfası'),
              onTap: () {
                Navigator.pushNamed(context, '/profil');
              },
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('Sipariş Geçmişi'),
              onTap: () {
                Navigator.pushNamed(context, '/siparisler');
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Uygulama Tanıtımı'),
              onTap: () {
                Navigator.pushNamed(context, '/kullanim');
              },
            ),
            ListTile(
              leading: Icon(Icons.business),
              title: Text('Şirket Tanıtımı'),
              onTap: () {
                Navigator.pushNamed(context, '/sirket');
              },
            ),
            ListTile(
              leading: Icon(
                a ?   Icons.nightlight_round :Icons.wb_sunny ,
              ),
              title: Text('Tema'),
              onTap: () {
                final app = Provider.of<AppTheme>(
                    context,
                    listen: false);
                app.toggleTheme();
                        setState(() {
                               a=!a;
                                });

              },
            ),
          ],
        ),
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
            label: 'sepet',
          ),
        ],
        currentIndex: 0,
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

class AnaEkran extends StatefulWidget {
  final List<Urun> products;

  AnaEkran({
    required this.products,
  });

  @override
  _AnaEkranState createState() => _AnaEkranState(products: []);
}

class _HaberPanelState extends State<HaberPanel> {
  final List<String>panelresimleri =[
    "assets/images/yeniler.jpg",
    "assets/images/07011700_yan-06a477-1650x1650.jpg",
    "assets/images/10559456051250.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var i = 0; i < panelresimleri.length; i++)
            Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                panelresimleri[i],
                fit: BoxFit.cover,
              ),
            ),
        ],
      ),
    );
  }
}

class HaberPanel extends StatefulWidget {

  HaberPanel({Key? key, }) : super(key: key);

  @override
  _HaberPanelState createState() => _HaberPanelState();
}