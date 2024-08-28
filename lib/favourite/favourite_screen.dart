import 'package:favouriteapp/favourite/myfavourite.dart';
import 'package:favouriteapp/providers/favourite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  List<int> selectedItems =[];
  Widget build(BuildContext context) {

   // final favouriteItemProvider = Provider.of<FavouriteProvider>(context);
    print('build');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Favourite App'),
        actions: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Myfavourite(),));
            },
              child: Icon(Icons.favorite)),
          SizedBox(width: 20,),
        ],
      ),
      body: Column(
        children: [
          
          Expanded(
            child: ListView.builder(
              itemCount: 50,
                itemBuilder: (context , index){
                return Consumer<FavouriteProvider>(builder: (context, value,child){
                  return ListTile(
                    onTap: (){
                      if(value.selctedItems.contains(index)){
                        value.removeItem(index);

                      }else{
                        value.addItem(index);

                      }


                    },

                    title: Text('Item'+index.toString()),
                    trailing: Icon(
                        value.selctedItems.contains(index)? Icons.favorite :Icons.favorite_border_outlined),
                  );
                });
            

            
            }
            ),
          )
        ],
      ),
    );
  }
}
