
import 'package:flutter/cupertino.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ModelHud extends ChangeNotifier
{

  bool IsLoading= false;

  ChangeIsLoading(bool state ){
    IsLoading =state;
    notifyListeners();
  }
}