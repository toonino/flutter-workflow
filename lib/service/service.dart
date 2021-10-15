import 'dart:convert';

import 'package:practice6_workflow/model/WorkSchedule.dart';
import 'package:practice6_workflow/model/merchant.dart';
import 'package:practice6_workflow/model/merchant_data.dart';
import 'package:practice6_workflow/model/timeline.dart';
import 'package:practice6_workflow/model/timeline_data.dart';
import 'package:practice6_workflow/model/workschedule_data.dart';

List<Timeline> timelines = [];

Future<List<Timeline>> loadTimelines() async {
  Map<String, dynamic> timelineMap = json.decode(jsonTimeLineData);
  List<dynamic> all = timelineMap["data"];
  List<Timeline> timelines = [];
  timelines = all.map((e) => Timeline.fromJson(e)).toList();
  return timelines;
}

Future<List<Merchant>> loadMerchant() async {
  Map<String, dynamic> merchantMap = json.decode(jsonMerchantData);
  List<dynamic> all = merchantMap["data"];
  List<Merchant> merchants = [];
  merchants = all.map((e) => Merchant.fromJson(e)).toList();
  return merchants;
}


Future<List<WorkSchedule>> loadWorkSchedule() async {
  Map<String, dynamic> workScheduleMap = json.decode(jsonWorkScheduleData);
  List<dynamic> all = workScheduleMap["data"];
  List<WorkSchedule> workschedules = [];
  workschedules = all.map((e) => WorkSchedule.fromJson(e)).toList();
  return workschedules;
}
