import 'package:flutter/material.dart';
import 'package:practice6_workflow/model/timeline.dart';
import 'package:practice6_workflow/service/service.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dương Công Tuấn',
              style: TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.left,
            ),
            Text(
              'duongcongtoo1411@gmail.com',
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        leading: Center(
          child: CircleAvatar(
            child: Icon(
              Icons.person_rounded,
              size: 30,
            ),
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.notifications,
                color: Colors.yellow[300],
                size: 30,
              ),
              onPressed: () => {}),
        ],
      ),
      body: Container(
          child: Column(
        children: [
          Container(
            height: 70,
            width: double.infinity,
            margin: EdgeInsets.only(right: 14, left: 14, top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Thứ 6, ngày 08/10/2021',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    Text(
                      '08:30 - 17:30',
                      style: TextStyle(
                          fontSize: 26,
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green)),
                  onPressed: () => showModalBottomSheet(
                    context: context,
                    builder: (context) => buildSheet(),
                  ),
                  child: Text('Chấm công'),
                ),
              ],
            ),
          ),
          Divider(thickness: 5.0, color: Colors.grey[300]),
          Container(
            height: 107,
            margin: EdgeInsets.only(right: 14, left: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'KPI tháng 10/2021',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Xem chi tiết',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '14',
                      style: TextStyle(
                          fontSize: 26,
                          color: Colors.red[800],
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '/',
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '15',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                LinearPercentIndicator(
                  width: MediaQuery.of(context).size.width - 28,
                  lineHeight: 11.0,
                  percent: 0.93,
                  backgroundColor: Colors.grey[200],
                  progressColor: Colors.red,
                ),
                Container(
                  margin: EdgeInsets.only(right: 19),
                  child: Text(
                    '93.33%',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Divider(thickness: 5.0, color: Colors.grey[300]),
          Container(
            height: 30,
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.grey, width: 0.5))),
            child: Container(
              margin: EdgeInsets.only(right: 14, left: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Công việc 08/10/2021',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Xem tất cả',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              child: FutureBuilder(
                future: loadTimelines(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Timeline>> snapshot) {
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
                              return Container(
                                height: 80,
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey, width: 0.5))),
                                child: Container(
                                  margin: EdgeInsets.only(right: 14, left: 14),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '${snapshot.data![index].title}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                  '${snapshot.data![index].time}',
                                                  style: TextStyle(
                                                      color: snapshot
                                                              .data![index]
                                                              .isFinish
                                                          ? Colors.green
                                                          : Colors.grey,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Icon(
                                                Icons.check_circle,
                                                color: snapshot
                                                        .data![index].isFinish
                                                    ? Colors.green
                                                    : Colors.grey,
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('${snapshot.data![index].name}',
                                              style: TextStyle(fontSize: 12)),
                                          snapshot.data![index].isFinish
                                              ? Row(
                                                  children: [
                                                    Text('Hoàn thành: '),
                                                    Text(
                                                      '${snapshot.data![index].finishtime}',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  ],
                                                )
                                              : Text(''),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.place,
                                            color: Colors.grey,
                                          ),
                                          Text(
                                              '${snapshot.data![index].address}',
                                              style: TextStyle(fontSize: 12)),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ); // snapshot.data  :- get your object which is pass from your downloadData() function
                  }
                },
              ),
            ),
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          print('float action');
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }

  Widget buildSheet() => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.grey, width: 0.5))),
            child: Container(
              height: 70,
              width: double.infinity,
              margin: EdgeInsets.only(right: 14, left: 14, top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Thứ 6, ngày 08/10/2021',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      Text(
                        '08:30 - 17:30',
                        style: TextStyle(
                            fontSize: 26,
                            color: Colors.blue[800],
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green)),
                    onPressed: () {},
                    child: Text('Check In/Out'),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.grey, width: 0.5))),
            child: Container(
              height: 70,
              width: double.infinity,
              margin: EdgeInsets.only(right: 14, left: 14, top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Thứ 6, ngày 08/10/2021',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      Text(
                        '08:30 - 17:30',
                        style: TextStyle(
                            fontSize: 26,
                            color: Colors.blue[800],
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green)),
                    onPressed: () {},
                    child: Text('Check In/Out'),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.grey, width: 0.5))),
            child: Container(
              height: 70,
              width: double.infinity,
              margin: EdgeInsets.only(right: 14, left: 14, top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Thứ 6, ngày 08/10/2021',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      Text(
                        '08:30 - 17:30',
                        style: TextStyle(
                            fontSize: 26,
                            color: Colors.blue[800],
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green)),
                    onPressed: () {},
                    child: Text('Check In/Out'),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
}
