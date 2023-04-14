import 'package:flutter/material.dart';
import 'package:get_post/screen/modal/home_modal.dart';
import 'package:get_post/screen/provider/home_provider.dart';
import 'package:provider/provider.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<PostScreen> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtrate = TextEditingController();
  TextEditingController txtoffer = TextEditingController();
  TextEditingController txtprice = TextEditingController();
  TextEditingController txtdesc = TextEditingController();
  TextEditingController txtcate = TextEditingController();
  List<ProductModel> Alldata = [];
  HomeProvider? homeProviderTrue;
  HomeProvider? homeProviderFalse;

  @override
  Widget build(BuildContext context) {
    homeProviderFalse = Provider.of<HomeProvider>(context, listen: false);
    homeProviderTrue = Provider.of<HomeProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
              child: TextField(
                controller: txtname,
                decoration: InputDecoration(
                    label: Text("Enter Name:-"),
                    labelStyle: TextStyle(fontSize: 13,color: Colors.black),
                    filled: true,
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:10,left: 10,right: 10),
              child: TextField(
                controller: txtprice,
                decoration: InputDecoration(
                    label: Text("Enter Price:-"),
                    labelStyle: TextStyle(fontSize: 13,color: Colors.black),
                    filled: true,
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:10,left: 10,right: 10),
              child: TextField(
                controller: txtoffer,
                decoration: InputDecoration(
                    label: Text("Enter Offer:-"),
                    labelStyle: TextStyle(fontSize: 13,color: Colors.black),
                    filled: true,
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:10,left: 10,right: 10),
              child: TextField(
                controller: txtrate,
                decoration: InputDecoration(
                  label: Text("Enter Rate:-"),
                  labelStyle: TextStyle(fontSize: 13,color: Colors.black),
                  filled: true,
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:10,left: 10,right: 10),
              child: TextField(
                controller: txtcate,
                decoration: InputDecoration(
                  label: Text("Enter Category:-"),
                  labelStyle: TextStyle(fontSize: 13,color: Colors.black),
                  filled: true,
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:10,left: 10,right: 10),
              child: TextField(
                controller: txtdesc,
                decoration: InputDecoration(
                    label: Text("Enter Description:- "),
                    labelStyle: TextStyle(fontSize: 15,color: Colors.black),
                    filled: true,
                    border: OutlineInputBorder()),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 40,
              width: 100,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () async {
                  String name = txtname.text;
                  String rate = txtrate.text;
                  String category = txtcate.text;
                  String description = txtdesc.text;
                  String price = txtprice.text;
                  String offer = txtoffer.text;
                  ProductModel p1 = ProductModel(
                      p_category: category,
                      p_desc: description,
                      p_name: name,
                      p_offer: offer,
                      p_price: price,
                      p_rate: rate);
                  Alldata.add(p1);
                  homeProviderFalse!.PostApiCall(
                      name, price, description, category, rate, offer);
                },
                child: Text("Add",style: TextStyle(color: Colors.white,fontSize: 17),),
              ),
            ),

          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            Navigator.pushNamed(context, 'get');
          },
          child: Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
