import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/SepetNotifier.dart';
import '../main.dart';
import 'package:flutter/cupertino.dart';


class AppTheme extends ChangeNotifier {
  ThemeData _th= ThemeData.light();


  ThemeData get th => _th;

  void toggleTheme() {
    print("DEĞİŞİKLİK--------------------");
    if (_th == ThemeData.light()) {
     _th = ThemeData.dark();
    } else if(_th==null){
      _th = ThemeData.light();
    }
    else{
      _th = ThemeData.light();
    }
    notifyListeners();
  }
}