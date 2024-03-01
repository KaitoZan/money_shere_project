// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_shere_project/views/show_money_share_ui.dart';

class InputMoneyUI extends StatefulWidget {
  const InputMoneyUI({super.key});

  @override
  State<InputMoneyUI> createState() => _InputMoneyUIState();
}

class _InputMoneyUIState extends State<InputMoneyUI> {
  bool? checkStatus = false;

  TextEditingController moneyCtrl = TextEditingController(text: '');
  TextEditingController personCtrl = TextEditingController(text: '');
  TextEditingController tipCtrl = TextEditingController(text: '');

  warningMessage(context, msg) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Container(
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.height * 0.05,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 231, 92, 82),
            borderRadius: BorderRadius.circular(5.0),
          ),
          alignment: Alignment.center,
          child: Text(
            'คำเตือน',
            style: GoogleFonts.kanit(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        content: Text(
          msg,
          style: GoogleFonts.kanit(
              color: const Color.fromARGB(255, 238, 10, 10),
              fontSize: MediaQuery.of(context).size.width * 0.05),
          textAlign: TextAlign.center,
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'ตกลง',
              style: GoogleFonts.kanit(
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 206, 192, 1),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 242, 113, 74),
        title: Text(
          'แชร์เงินกันเถอะ',
          style: GoogleFonts.itim(color: Colors.white70),
        ),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              right: MediaQuery.of(context).size.width * 0.1,
              left: MediaQuery.of(context).size.width * 0.1,
            ),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.2,
                    backgroundColor: Color.fromARGB(255, 242, 113, 74),
                    child: Image.asset(
                      'assets/images/money.png',
                      width: MediaQuery.of(context).size.width * 0.2,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  TextField(
                    controller: moneyCtrl,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r'^[0-9]+.?[0-9]*'),
                      ),
                    ],
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: 'ป้อนจำนวนเงิน (บาท)',
                        hintStyle: GoogleFonts.itim(
                          color: Colors.grey[200],
                        ),
                        prefixIcon: Icon(
                          FontAwesomeIcons.moneyBillWave,
                          color: Color.fromARGB(255, 204, 255, 0),
                        )),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  TextField(
                    controller: personCtrl,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r"\d([\.]\d+)?"),
                      ),
                    ],
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: 'ป้อนจำนวน (คน)',
                        hintStyle: GoogleFonts.itim(
                          color: Colors.grey[200],
                        ),
                        prefixIcon: Icon(
                          FontAwesomeIcons.person,
                          color: Color.fromARGB(255, 204, 255, 0),
                        )),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        onChanged: (param) {
                          if (param == false) {
                            setState(() {
                              tipCtrl.text = '';
                            });
                          }
                          setState(() {
                            checkStatus = param;
                          });
                        },
                        value: checkStatus,
                        activeColor: Colors.red,
                        side: BorderSide(color: Colors.red),
                      ),
                      Text(
                        'เงินทิป (บาท)',
                        style: GoogleFonts.itim(color: Colors.red),
                      )
                    ],
                  ),
                  TextField(
                    controller: tipCtrl,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r"\d([\.]\d+)?"),
                      ),
                    ],
                    enabled: checkStatus,
                    decoration: InputDecoration(
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: 'ป้อนจำนวน (ทิป)',
                        hintStyle: GoogleFonts.itim(
                          color: Colors.grey[200],
                        ),
                        prefixIcon: Icon(
                          FontAwesomeIcons.moneyCheck,
                          color: Color.fromARGB(255, 204, 255, 0),
                        )),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            double money = 0, tip = 0, moneyshare = 0;
                            int person;
                            if (moneyCtrl.text.length == 0) {
                              warningMessage(context, 'ป้อนจำนวนเงินด้วย');
                              return;
                            } else if (double.parse(moneyCtrl.text) == 0) {
                              warningMessage(context, 'จำนวนเงินไม่ควรเป็น 0');
                              return;
                            } else if (personCtrl.text.isEmpty == true) {
                              warningMessage(context, 'ป้อนจำนวนคนด้วย');
                              return;
                            } else if (int.parse(personCtrl.text) == 0) {
                              warningMessage(context, 'คนไม่ควรเป็น 0');
                              return;
                            } else if (checkStatus == true) {
                              if (tipCtrl.text.length == 0) {
                                warningMessage(context, 'ป้อนทิปด้วย');
                                return;
                              } else if (double.parse(tipCtrl.text) == 0) {
                                warningMessage(context, 'ทิปไม่ควรเป็น 0');
                                return;
                              } else {
                                money = double.parse(moneyCtrl.text);
                                tip = double.parse(tipCtrl.text);
                                person = int.parse(personCtrl.text);
                                moneyshare = (money + tip) / person;
                              }
                            } else {
                              money = double.parse(moneyCtrl.text);
                              person = int.parse(personCtrl.text);
                              moneyshare = money / person;
                            }
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ShowMoneyShareUI(
                                          money: money,
                                          tip: tip,
                                          moneyshare: moneyshare,
                                          person: person,
                                        )));
                          },
                          icon: Icon(
                            Icons.calculate,
                            color: Colors.white70,
                          ),
                          label: Text(
                            'คำนวน',
                            style: GoogleFonts.itim(color: Colors.white70),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              fixedSize: Size.fromHeight(55.0)),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            moneyCtrl.text = '';
                            personCtrl.text = '';
                            tipCtrl.text = '';
                            checkStatus = false;
                          },
                          icon: Icon(
                            Icons.cancel,
                            color: Colors.white70,
                          ),
                          label: Text(
                            'ยกเลิก',
                            style: GoogleFonts.itim(
                                color: Color.fromARGB(255, 167, 167, 167)),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red[300],
                              fixedSize: Size.fromHeight(55.0)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
