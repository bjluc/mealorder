import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../services/firebase_services.dart';
import '../provider/cart.dart';
import '../widgets/custom_action_bar.dart';
import '../widgets/image_swipe.dart';
import '../widgets/product_allergen.dart';

class ProductPage extends StatefulWidget {
  final String productId;
  ProductPage({this.productId});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  FirebaseServices _firebaseServices = FirebaseServices();

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 114.0),
            child: FutureBuilder(
              future: _firebaseServices.productsRef.doc(widget.productId).get(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Scaffold(
                    body: Center(
                      child: Text("Error: ${snapshot.error}"),
                    ),
                  );
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  // Firebase Document Data Map
                  Map<String, dynamic> documentData = snapshot.data.data();
                  // List of images
                  List imageList = documentData['images'];
                  // List of Allergens
                  List allergen = documentData['allergen'];

                  return ListView(
                    padding: EdgeInsets.all(0),
                    children: [
                      ImageSwipe(
                        imageList: imageList,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20.0,
                          left: 16.0,
                          right: 12.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${documentData['name']}",
                              style: Constants.boldHeading,
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.add,
                                  size: 30.0,
                                ),
                                color: Colors.green[800],
                                onPressed: () {
                                  String productId = widget.productId;
                                  String productName = documentData['name'];
                                  double productPrice =
                                      double.parse(documentData['price']);

                                  cart.addItem(
                                      productId, productName, productPrice);
                                  Scaffold.of(context).hideCurrentSnackBar();
                                  Scaffold.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Added item to cart!',
                                      ),
                                      duration: Duration(seconds: 2),
                                      action: SnackBarAction(
                                        label: 'UNDO',
                                        onPressed: () {
                                          cart.removeSingleItem(productId);
                                        },
                                      ),
                                    ),
                                  );
                                }),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4.0,
                          horizontal: 20.0,
                        ),
                        child: Text(
                          "£${documentData['price']}",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Theme.of(context).accentColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 24.0,
                        ),
                        child: Text(
                          "${documentData['desc']}",
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 24.0,
                        ),
                        child: Text(
                          "Alergens:",
                          style: Constants.regularDarkText,
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 24.0),
                            child: Allergen(
                              allergen: allergen,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                }

                // Loading State
                return Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
          ),
          CustomActionBar(
            hasBackArrow: true,
            hasTitle: false,
            hasBackground: false,
          )
        ],
      ),
    );
  }
}
