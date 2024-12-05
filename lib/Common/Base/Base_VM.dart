import 'package:flutter/material.dart';
import 'package:newsapp/Common/Base/Base_State.dart';

class BaseVm<T> extends ChangeNotifier{
  BaseState<T> state = LoadingState();
  void emit(BaseState<T> newState){
    state = newState ;
    notifyListeners();
  }
}