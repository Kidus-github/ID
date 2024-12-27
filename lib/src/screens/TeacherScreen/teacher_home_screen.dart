import 'package:flutter/material.dart';
import 'package:id/src/common_widget/header.dart';
import 'package:id/src/constants/image_string.dart';
import 'package:id/src/constants/text_string.dart';

class TeacherHomeScreen extends StatelessWidget {
  const TeacherHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Header(),
            const Text(
              kTeachersTitle,
              textAlign: TextAlign.left,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //this can be a widget to remove repetion
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 3.0, horizontal: 15.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                              style: BorderStyle.solid,
                              strokeAlign: BorderSide.strokeAlignInside)),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.add,
                            size: 24.0,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            kTeacherCreatebtn,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.0),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.04,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 3.0, horizontal: 15.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                              style: BorderStyle.solid,
                              strokeAlign: BorderSide.strokeAlignInside)),
                      child: const Row(
                        children: [
                          Image(
                            image: AssetImage(kFilter),
                            width: 24,
                            height: 24,
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            kTeacherFilterbtn,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.0),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 2,
              color: Color(0xffD9D9D9),
            ),
            const SizedBox(
              height: 10.0,
            ),

            ///
            ///
            ///
            ///
            Container(
              margin: const EdgeInsets.only(bottom: 20.0),
              padding: const EdgeInsets.only(
                  top: 20.0, bottom: 20.0, right: 20.0, left: 25.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                      color: const Color.fromARGB(63, 0, 0, 0),
                      width: 1.0,
                      style: BorderStyle.solid),
                  color: const Color(0xffD9D9D9).withOpacity(0.25)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        kTeacherClassLstTitle1,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        kTeacherClassLstDate1,
                        style:
                            TextStyle(fontSize: 14.0, color: Color(0xff2a2a2a)),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Image(
                      image: AssetImage(kPencil),
                      width: 22,
                      height: 22,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20.0),
              padding: const EdgeInsets.only(
                  top: 20.0, bottom: 20.0, right: 20.0, left: 25.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                      color: const Color.fromARGB(63, 0, 0, 0),
                      width: 1.0,
                      style: BorderStyle.solid),
                  color: const Color(0xffD9D9D9).withOpacity(0.25)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        kTeacherClassLstTitle2,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        kTeacherClassLstDate2,
                        style:
                            TextStyle(fontSize: 14.0, color: Color(0xff2a2a2a)),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Image(
                      image: AssetImage(kPencil),
                      width: 22,
                      height: 22,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20.0),
              padding: const EdgeInsets.only(
                  top: 20.0, bottom: 20.0, right: 20.0, left: 25.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                      color: const Color.fromARGB(63, 0, 0, 0),
                      width: 1.0,
                      style: BorderStyle.solid),
                  color: const Color(0xffD9D9D9).withOpacity(0.25)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        kTeacherClassLstTitle3,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        kTeacherClassLstDate3,
                        style:
                            TextStyle(fontSize: 14.0, color: Color(0xff2a2a2a)),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Image(
                      image: AssetImage(kPencil),
                      width: 22,
                      height: 22,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20.0),
              padding: const EdgeInsets.only(
                  top: 20.0, bottom: 20.0, right: 20.0, left: 25.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                      color: const Color.fromARGB(63, 0, 0, 0),
                      width: 1.0,
                      style: BorderStyle.solid),
                  color: const Color(0xffD9D9D9).withOpacity(0.25)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        kTeacherClassLstTitle4,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        kTeacherClassLstDate4,
                        style:
                            TextStyle(fontSize: 14.0, color: Color(0xff2a2a2a)),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Image(
                      image: AssetImage(kPencil),
                      width: 22,
                      height: 22,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20.0),
              padding: const EdgeInsets.only(
                  top: 20.0, bottom: 20.0, right: 20.0, left: 25.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                      color: const Color.fromARGB(63, 0, 0, 0),
                      width: 1.0,
                      style: BorderStyle.solid),
                  color: const Color(0xffD9D9D9).withOpacity(0.25)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        kTeacherClassLstTitle5,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        kTeacherClassLstDate5,
                        style:
                            TextStyle(fontSize: 14.0, color: Color(0xff2a2a2a)),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Image(
                      image: AssetImage(kPencil),
                      width: 22,
                      height: 22,
                    ),
                  )
                ],
              ),
            ),

            ///
            ///
            ///
          ]),
        ),
        bottomNavigationBar: Container(
          height: 80.0,
          padding: const EdgeInsets.all(20.0),
          margin: const EdgeInsets.symmetric(horizontal: 56.0, vertical: 15.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 4.0,
                spreadRadius: 0.0,
                blurStyle: BlurStyle.outer,
                offset: const Offset(0, -4),
              )
            ],
            color: const Color(0xffD9D9D9).withOpacity(0.25),
          ),
          child: Row(
            children: [],
          ),
        ),
      ),
    );
  }
}
