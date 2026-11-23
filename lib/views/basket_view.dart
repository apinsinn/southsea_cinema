import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';
import  'package:southsea_cinema/models/basket_item.dart';



class BasketView extends StatefulWidget {
  const BasketView({super.key});

  @override
  State<BasketView> createState() {
    return _BasketViewState();
  }
}

class _BasketViewState extends State<BasketView> {
  String _confirmationMessage = '';

  Widget_buildLineItem(BasketRepository basket,
      BasketItem item,){
        return Padding(
          padding: const EdgeInsets.symmetric(vertical:8.0),
          child: Row(children: [
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${item.quantity} x ${item.movie.title}',
                style: const TextStyle(fontWeight: FontWeight.w600),),
                const SizedBox(height: 4.0),
                Text('£${item.lineTotal.toStringAsFixed(2)}',)
               
              ]
            )),
            IconButton(icon: const Icon(Icons.delete, color: Colors.red,),
            onPressed: (){
              setState(() {
                basket.removeItem(item);
              });
            },)
          ],));
      }


  Widget _buildEmptyState() {
    return const Center(
      child: Padding(padding: EdgeInsets.symmetric(vertical: 32.0),
      child: Text('Your basket is empty',
      style: TextStyle(fontSize: 16, color: Colors.grey),),)
    );
  }

  @override
  Widget build(BuildContext context) {
    final BasketRepository basketRepository = BasketRepository();
    final List<BasketItem> basketItems = basketRepository.basketItems;
    final Widget content;
    if (basketItems.isEmpty){
      if (_confirmationMessage.isNotEmpty) {
        content = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_buildEmptyState(),
        const SizedBox(height: 12.0),
        Text(_confirmationMessage,
        style: const TextStyle(fontWeight: FontWeight.bold,))
        ],
        );
      } else {
        content = _buildEmptyState();
      }} else {
      content = const Text('Basket list placeholder');
    }
    

   
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
      ),
      body:  SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: content,
      ),


 
          
        );
      
    
  }
}