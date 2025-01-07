import 'package:flutter/material.dart';
import 'package:id/src/screens/TeacherScreen/widget/attende.dart';

List<Map<String, dynamic>> attendeData = [
  {'name': 'Mekdelawit Teshome', 'status': true},
  {'name': 'Birucktawit Adugna', 'status': false},
  {'name': 'Hanna Yohannes', 'status': false},
  {'name': 'Ruhama Wale', 'status': false},
  {'name': 'Liyuwork Kebede', 'status': false},
  {'name': 'Edna Mesfin', 'status': false},
  {'name': 'Arsema Hailu', 'status': false},
];

class AttendeList extends StatelessWidget {
  const AttendeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: attendeData.length,
          itemBuilder: (context, index) {
            return Attende(
                name: attendeData[index]['name'],
                status: attendeData[index]['status']);
          }),
    );
  }
}
