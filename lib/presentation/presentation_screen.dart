import 'dart:developer';

import 'package:cureo_test/data/Bloc/bloc_event.dart';
import 'package:cureo_test/data/Bloc/bloc_provider.dart';
import 'package:cureo_test/data/Bloc/bloc_state.dart';
import 'package:cureo_test/data/model/countries_model.dart';
import 'package:cureo_test/presentation/search_screen.dart' show SearchScreen;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PresentationScreen extends StatefulWidget {
  static const String routeName = '/presentation';
  const 
  PresentationScreen({super.key});

  @override
  State<PresentationScreen> createState() => _PresentationScreenState();
}



class _PresentationScreenState extends State<PresentationScreen> {
 List<CountriesModel> searched = [];
  List<CountriesModel> countries = [];
  @override
  void initState() {
    // _newsBloc.add(GetCountries());
context.read<CountryBlock>().add( GetCountries());


    super.initState();
  }
  TextEditingController _searchController = TextEditingController();

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.withValues(alpha: 0.7),
        title: Text("Country List"),
      ),
      body: RefreshIndicator(
        onRefresh: ()async {
          
 context.read<CountryBlock>().add( GetCountries());
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
            child: Column(
              children: [
                    BlocBuilder<CountryBlock,CountryState>(
                  
                  
                     builder: (context,state) {
                       return TextField(
                        readOnly:  true,
                          controller: _searchController,
                          decoration: InputDecoration(
                            hintText: "Search Country",
                          ),
                          onTap: (){
                            if(state is CountryLoaded) {
                            Navigator.push(context, MaterialPageRoute(builder:(BuildContext context)  => SearchScreen(tempCountries: state.countryModel

                            )));}
                          },
                          
                        );
                     }
                   ),
                SizedBox(height: 25,),
        
                BlocConsumer<CountryBlock,CountryState>(
                  
                  listener: (context, state) {
                   
                  },
        
                  builder: (context,state) {
                    log("state ---- $state");
                    
                    return Column(
                      children: [
                        if(state is CountryError)
                         Text(state.message.toString()),
                        if(state is CountryLoading)
                          CircularProgressIndicator(),
                        if(state is CountryLoaded)
                
                        ListView.builder(
                          
                          shrinkWrap: true,
                itemCount:  state.countryModel.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(8.0),
                    child: Card(
                      child: Container(
                        margin: EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Text("Country: ${state.countryModel[index].name}"),
                            Text(
                                "Country code: ${state.countryModel[index].code}"),
                            Text("Country flag: ${state.countryModel[index].emoji}"),
                            
                          ],
                        ),
                      ),
                    ),
                  );
                },
                    ),
                    
                        ElevatedButton(onPressed: ()async{
                          print("data");
                    context.read<CountryBlock>().add( GetCountries());
                    //  _newsBloc.add(GetCountries());
                        }, child: Text("Get data"),)
                      ],
                    );
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}