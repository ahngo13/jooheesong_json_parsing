
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jooheesong/daily.dart';
import 'package:jooheesong/date.dart';

import 'date_list.dart';

var box = GetStorage('daily');

class GetStorageTest extends StatefulWidget {
  const GetStorageTest({Key? key}) : super(key: key);

  @override
  State<GetStorageTest> createState() => _GetStorageTestState();
}

class _GetStorageTestState extends State<GetStorageTest> {
  String title = '';
  String content = '';
  String inputDate = '';

  @override
  initState() {
    super.initState();
    print('initState');
  }

  @override
  Widget build(BuildContext context) {



    return Column(
      children: [
        TextField(
          onChanged: (value){
            inputDate = value;
          },
        ),
        TextField(
          onChanged: (value){
            title = value;
          },
        ),
        TextField(
          onChanged: (value){
            content = value;
          },
        ),
        TextButton(onPressed: (){
          print('inputDate');
          print(inputDate);

          var dateList = box.read('data');
          List<dynamic> dailyList = [];
          if(dateList != null){
            List decodeDateList = jsonDecode(box.read('data'));
            List<DateModel> dateModelList = new DateListModel.fromJson(decodeDateList).list;
            //저장된 날짜 목록이 있을 경우
            if(dateModelList.length > 0){
              //저장된 날짜 목록에서 dailyList를 가져와서 새로운 데이터를 추가한 뒤 저장
              for(int i=0; i<dateModelList.length; i++){
                if(dateModelList[i].date == inputDate){
                  dailyList = dateModelList[i].dailyList;
                  for(int j=0; j<dailyList.length; j++){-
                     dailyList.add(DailyModel.fromJson(dailyList[j]));
                  }
                  dailyList.add({'title': title, 'content': content});
                  dateList.add(DateModel.fromJson(
                      {'date': inputDate, 'dailyList': dailyList}));
                }
              }
            }
          }else{
            //저장된 날짜 목록이 없을 경우 새로운 데이터 생성하여 추가
            dateList = [];
            dailyList.add(DailyModel.fromJson({'title': title, 'content': content}));
            dateList.add(DateModel.fromJson({'date': inputDate, 'dailyList': dailyList}));
          }

          box.write('data', jsonEncode(dateList));
          print(dateList.toString());
          
        }, child: Text('데이터 추가')),
        TextButton(onPressed: (){
          box.erase();
        }, child: Text('초기화')),
      ],
    );
  }
}
