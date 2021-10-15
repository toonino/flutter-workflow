import 'package:flutter/material.dart';
import 'package:practice6_workflow/model/merchant.dart';
import 'package:practice6_workflow/routes/routes.dart';
import 'package:practice6_workflow/screen/merchant/mapMerchant.dart';
import 'package:practice6_workflow/service/service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class listMerchant extends StatefulWidget {
  @override
  _listMerchantState createState() => _listMerchantState();
}

class _listMerchantState extends State<listMerchant> {
  bool isMap = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        onGenerateRoute: Routes.onGenerateRoute,
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor:
              Colors.blue, //Changing this will change the color of the TabBar
        ),
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: false,
              actions: [
                IconButton(
                    icon: Icon(
                      Icons.search,
                      size: 25,
                    ),
                    onPressed: () => {}),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      size: 25,
                    ))
              ],
              title: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(150),
                  color: Colors.blue[900],
                ),
                child: TabBar(
                  onTap: (index) {
                    if (index == 0) {
                      isMap = false;
                    } else {
                      isMap = true;
                    }
                    setState(() {});
                  },
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(50), // Creates border
                      color: Colors.white),
                  tabs: [
                    Container(
                      child: Text('Danh sách',
                          style: TextStyle(
                            color: this.isMap ? Colors.white : Colors.blue[900],
                          )),
                      padding: EdgeInsets.symmetric(
                        vertical: 21,
                        horizontal: 10,
                      ),
                    ),
                    Container(
                      child: Text('Bản đồ',
                          style: TextStyle(
                            color: this.isMap ? Colors.blue[900] : Colors.white,
                          )),
                      padding: EdgeInsets.symmetric(
                        vertical: 21,
                        horizontal: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // floatingActionButton: FloatingActionButton(
            //   backgroundColor: Colors.green,
            //   onPressed: () {
            //     print('float action');
            //   },
            //   child: Icon(
            //     Icons.add,
            //   ),
            // ),
           
            body:
                TabBarView(physics: NeverScrollableScrollPhysics(), children: [
              SizedBox(
                child: FutureBuilder(
                  future: loadMerchant(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Merchant>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: Text('Please wait its loading...'));
                    } else {
                      if (snapshot.hasError)
                        return Center(child: Text('Error: ${snapshot.error}'));
                      else
                        return Center(
                          child: ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (_, index) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed('/detailMerchant');
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Color(0xFFebebe0),
                                                width: 5))),
                                    child: Container(
                                      margin: EdgeInsets.all(14),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            height: 40,
                                            width: 40,
                                            child: Image.asset(
                                              '${snapshot.data![index].avatar}',
                                              height: 40,
                                              width: 40,
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${snapshot.data![index].name}',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                '${snapshot.data![index].phone}',
                                                style: TextStyle(
                                                    color: Color(0xFF8D8E8F)),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: 10, bottom: 10),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.place,
                                                      color: Colors.grey,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          '${snapshot.data![index].address1}',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(
                                                          '${snapshot.data![index].address2}',
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xFF8D8E8F)),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Stack(
                                                clipBehavior: Clip.none,
                                                children: [
                                                  Positioned(
                                                    left: 20,
                                                    child: CircleAvatar(
                                                      radius: 16,
                                                      backgroundColor:
                                                          Color(0xFFd6d6c2),
                                                      child: CircleAvatar(
                                                        radius: 13,
                                                        backgroundImage: AssetImage(
                                                            '${snapshot.data![index].image1}'),
                                                      ),
                                                    ),
                                                  ),
                                                  CircleAvatar(
                                                    radius: 16,
                                                    backgroundColor:
                                                        Color(0xFF4d94ff),
                                                    child: CircleAvatar(
                                                      radius: 13,
                                                      backgroundImage: AssetImage(
                                                          '${snapshot.data![index].image2}'),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          Icon(
                                            Icons.calendar_today_outlined,
                                            color: Colors.grey,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ); // snapshot.data  :- get your object which is pass from your downloadData() function
                    }
                  },
                ),
              ),
               MapSample(),
              // Text('Map'),
              // Container>Column[Row[Text,Text],Row[Text,Image]]
            ]),
          ),
        ));
  }
}
