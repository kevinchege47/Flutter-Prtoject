import 'package:first_flutter_project/DetailsTwo.dart';
import 'package:first_flutter_project/form.dart';
import 'package:flutter/material.dart';

// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors
class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _MyFormState();
}

class _MyFormState extends State<Details> {
  var _productname;
  final _productController = TextEditingController();


  @override
  void dispose() {
    _productController.dispose();
    super.dispose()

  } // @override
  // void initState() {
  //   super.initState();
  //   _productController.addListener(_updateText);
  // }

  void _updateText(){
    setState(() {
      _productname = _productController.text;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyForm"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            TextFormField(
              controller: _productController,
              // onChanged: (val){
              //   _updateText(val);
              // },
              decoration: InputDecoration(
                  labelText: "Product Name",
                  prefixIcon: Icon(Icons.production_quantity_limits),
                  border: OutlineInputBorder()),
            ),
            SizedBox(height: 20.0),
            buildOutlinedButton(context)
            // Text("Product Name is ${_productController.text}")
          ],
        ),
      ),
    );
  }

  OutlinedButton buildOutlinedButton(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return Detailstwo(productname:_productController.text);
          }),
        );
      },
      style: OutlinedButton.styleFrom(minimumSize: const Size(200, 50)),
      child: Text(
        "submit form".toUpperCase(),
        style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold),
      ),
    );
  }
}
