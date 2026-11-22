import 'package:southsea_cinema/models/basket_item.dart';


class BasketRepository {
  BasketRepository._internal();

  static final BasketRepository _instance = BasketRepository._internal();

  factory BasketRepository() {
    return _instance;
  }
  final List<BasketItem> _basketItems = [];

  List<BasketItem> get basketItems => List.unmodifiable(_basketItems);

  void addItem(BasketItem item) {
    _basketItems.add(item);
  }
  void removeItem(BasketItem item) {
    _basketItems.remove(item);
  }

  int getTotalItems() {
    int total = 0;
    for (var item in _basketItems) {
      total += item.quantity;
    }
    return total;
  }

  int get totalItemCount {
    return getTotalItems();
  }

  double getSubtotal(){
    double subtotal = 0.0;
    for (var item in _basketItems) {
      subtotal += item.lineTotal;
    }
    return subtotal;
  }

  


  

  void clear(){
    _basketItems.clear();
  }
}

