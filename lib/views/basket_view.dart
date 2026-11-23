import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';
import  'package:southsea_cinema/models/basket_item.dart';
import 'package:southsea_cinema/widgets/primary_button.dart';



class BasketView extends StatefulWidget {
  const BasketView({super.key});

  @override
  State<BasketView> createState() {
    return _BasketViewState();
  }
}

class _BasketViewState extends State<BasketView> {
   String _confirmationMessage = '';

  Widget _buildLineItem(BasketRepository basket,
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
                Text('£${item.lineTotal.toStringAsFixed(2)}',),
               
              ],
            ),),
          
            IconButton(icon: const Icon(Icons.delete_outline, color: Colors.red,),
            onPressed: (){
              setState(() {
                basket.removeItem(item);
              });
            },),
          ],),);
  }


  Widget _buildEmptyState() {
    return const Center(
      child: Padding(padding: EdgeInsets.symmetric(vertical: 32.0),
      child: Text('Your basket is empty',
      style: TextStyle(fontSize: 16, color: Colors.grey),),)
    );
  }

  Widget _buildTotalRow(
    String label,
    String value, {
      bool emphasise = false,}) {
        final TextStyle style;

        if (emphasise) {
          style = const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0);
        } else {
          style = const TextStyle(color: cinemaFontWhite,);
        }

        return Padding(padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, 
        children: [
          Text(label, style: style,),
          Text(value, style: style,)
        ],),);
      }

    Widget _buildBasketList(
      BasketRepository basket,
      List<BasketItem> items, 
    ){
      final List<Widget> children = [];

      children.add(
        const Text('Your Basket', 
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
      );

      children.add(const SizedBox(height: 16.0),);

      for (int index= 0; index<items.length; index++){
        final BasketItem item = items[index];
        children.add(_buildLineItem(basket, items[index],),);
    
      }

      children.add(const SizedBox(height: 24.0),);

      children.add(_buildTotalRow('Subtotal', '£${basket.getSubtotal().toStringAsFixed(2)}', emphasise: true,),);

      children.add(
        SizedBox(
          width: double.infinity,
          child: PrimaryButton(
            label: 'Checkout',
            onPressed: () {
              setState(() {
                basket.clear();
                _confirmationMessage = 'Thank you for your order! Your tickets have been booked.';
              });
              // Handle checkout action
            },
          ),
        ),);

        if (_confirmationMessage.isNotEmpty) {
          children.add(const SizedBox(height: 12.0),);
          children.add(Text(_confirmationMessage, style: const TextStyle(fontWeight: FontWeight.bold,),),);
        }

      return Column(crossAxisAlignment: CrossAxisAlignment.start , children: children,);

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
        style: const TextStyle(fontWeight: FontWeight.bold,),),
        ],
        );
      } else {
        content = _buildEmptyState();
      }
    } else {
      content = _buildBasketList(basketRepository, basketItems,);
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
  
  
