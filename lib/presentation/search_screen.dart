

import 'package:cureo_test/data/model/countries_model.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  List<CountriesModel> tempCountries;
   SearchScreen({super.key,required this.tempCountries});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}



class _SearchScreenState extends State<SearchScreen> {

  TextEditingController textEditingController =TextEditingController();

  List<CountriesModel> countriesFilter = [];
  @override
  void initState() {
    // TODO: implement initState

    countriesFilter = widget.tempCountries;
    
    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.withValues(alpha: 0.7),
        title: Text( " Search Country "),
      ),
      body: Builder(
        builder: (context) {
          return  SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
            child: Column(
              children: [
                    TextField(
                       controller: textEditingController,
                       decoration: InputDecoration(
                         hintText: "Search Country",
                       ),
                      
                       onChanged: (value){
                    
                         
                           setState(() {
                            if(value.isNotEmpty){
                             countriesFilter = widget.tempCountries.where((country) => country.name!.toLowerCase().contains(value.toLowerCase())).toList();
                             }else{
                              countriesFilter = widget.tempCountries;
                             }
                           });
                           
                           
                           
                            
                           
                         }),
                     
                   
                SizedBox(height: 25,),
        
                Builder(
                  builder: (context) {

                    if(countriesFilter.isEmpty){
                      return Center(child: Text("No country found"));
                    }

                    return ListView.builder(
                              
                              shrinkWrap: true,
                    itemCount:  countriesFilter.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(8.0),
                        child: Card(
                          child: Container(
                            margin: EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Text("Country: ${countriesFilter[index].name}"),
                                Text(
                                    "Country code: ${countriesFilter[index].code}"),
                                Text("Country flag: ${countriesFilter[index].emoji}"),
                                
                              ],
                            ),
                          ),
                        ),
                      );
                    },);
                  }
                )
              ],
            ),
          ),
        );}));}
        

}