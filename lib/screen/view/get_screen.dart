import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/home_provider.dart';

class GetScreen extends StatefulWidget {
  const GetScreen({Key? key}) : super(key: key);

  @override
  State<GetScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<GetScreen> {
  HomeProvider? homeProviderTrue;
  HomeProvider? homeProviderFalse;

  @override
  void initState() {
    super.initState();
    Provider.of<HomeProvider>(context, listen: false).ProductApiCall();
  }

  @override
  Widget build(BuildContext context) {
    homeProviderFalse = Provider.of<HomeProvider>(context, listen: false);
    homeProviderTrue = Provider.of<HomeProvider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white54,
        appBar: AppBar(title: Text("Product Data",style: TextStyle(fontSize: 15),),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: FutureBuilder(
          future: homeProviderFalse!.ProductApiCall(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(
                  "===${snapshot.error}=====");
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              List<dynamic>? productModel = snapshot.data;

              return ListView.builder(
                itemCount: productModel!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 70,
                      width: 150,
                      decoration: BoxDecoration(

                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: ListTile(
                        leading: Container(

                          decoration: BoxDecoration(
                          ),child: Image.asset("assets/image/2.jpg",height: 100,fit: BoxFit.cover,),
                        ),
                        title:  Text(
                          "${homeProviderFalse!.product[index].p_name}",
                          style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 15),
                        ),
                        subtitle: Text("rate :- ${homeProviderFalse!.product[index].p_rate}"),
                        trailing: Column(
                          children: [
                            SizedBox(height: 10,),
                            Text("${homeProviderFalse!.product[index].p_offer}",style: TextStyle(fontSize: 13),),
                            SizedBox(height: 6,),
                            Text("${homeProviderFalse!.product[index].p_desc}",style: TextStyle(fontSize: 13,color: Colors.black38),),

                          ],
                        ),
                      ),
                    ),
                  );

                },
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}