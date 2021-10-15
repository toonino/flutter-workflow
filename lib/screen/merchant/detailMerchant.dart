import 'package:flutter/material.dart';
import 'package:practice6_workflow/screen/merchant/contractMerchant.dart';
import 'package:practice6_workflow/screen/merchant/inforMerchan.dart';
import 'package:practice6_workflow/screen/merchant/workSchedule.dart';

class detailMerchant extends StatelessWidget {
  // detailMerchant({Key? key, required this.merchant}) : super(key: key);
  // final dynamic merchant;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: AppBar(
            centerTitle: true,
            title: Text('Merchant'),
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
            bottom: TabBar(
              tabs: [
                Text('Thông tin'),
                Text('Lịch làm việc'),
                Text('Hợp đồng'),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            InforMerchant(),
            workSchedule(),
            ContractMerchant(),
          ],
        ),
      ),
    );
  }
}
