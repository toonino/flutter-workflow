import 'package:flutter/material.dart';
import 'package:practice6_workflow/model/WorkSchedule.dart';
import 'package:practice6_workflow/service/service.dart';

class workSchedule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: loadWorkSchedule(),
        builder:
            (BuildContext context, AsyncSnapshot<List<WorkSchedule>> snapshot) {
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
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Color(0xFFf5f5f0), width: 25))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration:
                                  BoxDecoration(color: Color(0xFFEBEBEB)),
                              child: Container(
                                margin: EdgeInsets.only(right: 14, left: 14),
                                height: 40,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${snapshot.data![index].date}',
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '02 công việc',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Color(0xFFebebe0),
                                          width: 0.5))),
                              child: Container(
                                margin: EdgeInsets.only(right: 14, left: 14),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          '${snapshot.data![index].time}',
                                          style: TextStyle(
                                              color: snapshot.data![index]
                                                          .isFinish &&
                                                      !snapshot.data![index]
                                                          .isSuccess
                                                  ? Colors.red
                                                  : snapshot.data![index]
                                                              .isFinish &&
                                                          snapshot.data![index]
                                                              .isSuccess
                                                      ? Colors.green
                                                      : Colors.grey,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Icon(
                                          snapshot.data![index].isFinish &&
                                                  !snapshot
                                                      .data![index].isSuccess
                                              ? Icons.cancel
                                              : Icons.check_circle,
                                          color:
                                              snapshot.data![index].isFinish &&
                                                      !snapshot.data![index]
                                                          .isSuccess
                                                  ? Colors.red
                                                  : snapshot.data![index]
                                                              .isFinish &&
                                                          snapshot.data![index]
                                                              .isSuccess
                                                      ? Colors.green
                                                      : Colors.grey,
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 70,
                                          height: 70,
                                          child: Image.asset(
                                            '${snapshot.data![index].avatar}',
                                            width: 70,
                                            height: 70,
                                          ),
                                        ),
                                        Text('${snapshot.data![index].name}')
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Color(0xFFebebe0),
                                          width: 0.5))),
                              child: Container(
                                margin: EdgeInsets.only(
                                    right: 14, left: 14, top: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${snapshot.data![index].title}',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(right: 10),
                                          child: ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                            Color>(
                                                        Color(0xFF77A841)),
                                                shape: MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                )),
                                              ),
                                              onPressed: () {},
                                              child: Row(
                                                children: [
                                                  Text('mPos'),
                                                ],
                                              )),
                                        ),
                                        ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(Color(0xFF77A841)),
                                              shape: MaterialStateProperty.all<
                                                      RoundedRectangleBorder>(
                                                  RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              )),
                                            ),
                                            onPressed: () {},
                                            child: Row(
                                              children: [
                                                Text('NextShop'),
                                              ],
                                            )),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Mục đích: '),
                                            if (snapshot.data![index].isFinish)
                                              Text('Kết quả: '),
                                            Text('Điểm hẹn: '),
                                            if (snapshot.data![index].isSuccess)
                                              Text('Hoàn thành: '),
                                          ],
                                        ),
                                        Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '${snapshot.data![index].title}',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              if (snapshot
                                                  .data![index].isFinish)
                                                snapshot.data![index].isSuccess
                                                    ? Text(
                                                        '${snapshot.data![index].target} hoàn thành',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )
                                                    : Text(
                                                        '${snapshot.data![index].target} thất bại',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                              Text(
                                                '${snapshot.data![index].address}',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              if (snapshot
                                                  .data![index].isSuccess)
                                                Text(
                                                  '${snapshot.data![index].finishtime}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    if (snapshot.data![index].isSuccess)
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.menu),
                                              Text(
                                                  '   ${snapshot.data![index].target}'),
                                            ],
                                          ),
                                          Text(
                                            'Hình ảnh',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                padding:
                                                    EdgeInsets.only(right: 10),
                                                child: SizedBox(
                                                  width: 70,
                                                  height: 70,
                                                  child: Image.asset(
                                                    '${snapshot.data![index].avatar}',
                                                    width: 70,
                                                    height: 70,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 70,
                                                height: 70,
                                                child: Image.asset(
                                                  '${snapshot.data![index].avatar}',
                                                  width: 70,
                                                  height: 70,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ); // snapshot.data  :- get your object which is pass from your downloadData() function
          }
        },
      ),
    );
  }
}
