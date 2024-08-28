import 'package:flutter/cupertino.dart';

class FavouriteProvider extends ChangeNotifier{
  List <int> _selectedItems =[]; // we use this underscore for making this private
List <int> get selctedItems=>_selectedItems;//getter

void addItem(int value){
  _selectedItems.add(value);
  notifyListeners();
}
  void removeItem(int value){
    _selectedItems.remove(value);
    notifyListeners();
  }
}