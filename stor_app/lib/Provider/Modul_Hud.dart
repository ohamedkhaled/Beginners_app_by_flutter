
import 'package:flutter/cupertino.dart';

class ModulHudProvider extends ChangeNotifier{

bool isLoading =false;

ChangeHud(bool value){
  isLoading =value;
   notifyListeners();
}
}