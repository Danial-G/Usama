import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.purple),
          onPressed: () {
            // Handle menu action
          },
        ),
        title:Center( child:  Text(
          'Product',
          style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold),
        ),
        )
      ),
      body:Stack(

        children: [
           Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Dropdown and View Toggle
          Container(
            decoration: BoxDecoration(
    color: const Color.fromARGB(255, 255, 255, 255), // White background
    border: Border(
      top: BorderSide(color: Colors.grey, width: 1), // Gray thin top border
    ),
  ),
          
            child: Row( 
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 10.0),
      child:
   Container(
  height: 30,
  width: MediaQuery.of(context).size.width / 4,
  child: DropdownButtonFormField<String>(
    decoration: InputDecoration(
      hintText: 'All Products', // Set hint text
      border: InputBorder.none, // Remove underline
      contentPadding: EdgeInsets.symmetric(vertical: 10), // Optional padding
    ),
    items: [
      DropdownMenuItem(
        value: 'All products',
        child: Text('All products'),
      ),
      // Add more dropdown items here
    ],
    onChanged: (value) {
      // Handle dropdown value change
    },
  ),
)
    ),
    SizedBox(width: 10),

  Padding( padding: const EdgeInsets.only(top: 0.0),
    child:Row(
      children: [
    Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          left: BorderSide(color: const Color.fromARGB(255, 199, 199, 199), width: 1), // Left border
         
        ),
      ),
      child: IconButton(
        icon: Icon(Icons.grid_view, color: Colors.purple),
        onPressed: () {
          // Handle grid view toggle
        },
      ),
    ),
    Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          left: BorderSide(color: const Color.fromARGB(255, 199, 199, 199), width: 1), // Left border
        ),
      ),
      child: IconButton(
        icon: Icon(Icons.search, color: Colors.purple),
        onPressed: () {
          // Handle search action
        },
      ),
    ),
    Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          left: BorderSide(color: const Color.fromARGB(255, 199, 199, 199), width: 1), // Left border
        ),
      ),
      child: IconButton(
        icon: Icon(Icons.view_list, color: Colors.purple),
        onPressed: () {
          // Handle view toggle action
        },
      ),
    ),
    ],
    )
  )
  ],
)
          
          ),


          // Product Grid
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: 4, // Number of products
              itemBuilder: (context, index) {
                return _buildProductCard(
                  imageUrl: 'assets/usama/dinner-set-$index.jpg',
                  title: 'Dinner SET',
                  subtitle: index % 2 == 0 ? '(Must choose level)' : '',
                  price: 'PKR ${[50067, 30099, 27032, 34398][index]}',
                );
              },
            ),
          ),

          // Bottom Cart Summary

          
          Container(
            
            color: Colors.purple,
            padding: EdgeInsets.only(bottom: 70, left: 10, right: 10,top:10 ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [


           
                     Row(
                      children: [

                     
                   IconButton(
            icon: Icon(Icons.shopping_cart, color: const Color.fromARGB(255, 255, 255, 255)),
            onPressed: () {
              // Handle search action
            },
          ),

                Text(
                  '8 Items',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),

                 ],
                     ),



                Text(
                  'Total: Rs 200.00',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
        Positioned(
            left: 0,
            right: 0,
            bottom: 0, // Position at the bottom of the screen
            child: Container(
              color: const Color.fromARGB(255, 255, 255, 255),
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Equal space between icons
                children: [
                  
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      // Handle action
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.shopping_bag),
                    onPressed: () {
                      // Handle action
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.person),
                    onPressed: () {
                      // Handle action
                    },
                  ),
                ],
              ),
            ),
          ),
        ]
      ),
    );
  }

  Widget _buildProductCard({
    required String imageUrl,
    required String title,
    required String subtitle,
    required String price,
  }) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(14)),
            child: Image.asset(
              imageUrl,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
            
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                if (subtitle.isNotEmpty)
                  Text(
                    subtitle,
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  )
                else
                  SizedBox(height: 13,),
               

               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    
                
               
                Text(
                  price,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4), // Adjust the radius as needed
    ),
                      padding: EdgeInsets.all(8),
                      backgroundColor: const Color.fromRGBO(156, 39, 176, 1),
                    ),
                    onPressed: () {
                      // Handle add to cart action
                    },
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ),
                  ])
              ],
            ),
          ),
        ],
      ),
    );
  }
}
