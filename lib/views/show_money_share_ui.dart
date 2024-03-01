// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowMoneyShareUI extends StatefulWidget {
  double? money, tip, moneyshare;
  int? person;

  ShowMoneyShareUI(
      {super.key, this.money, this.tip, this.moneyshare, this.person});

  @override
  State<ShowMoneyShareUI> createState() => _ShowMoneyShareUIState();
}

class _ShowMoneyShareUIState extends State<ShowMoneyShareUI> {
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
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
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
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              'จำนวนเงินที่จะหาร',
              style: GoogleFonts.itim(
                  color: Colors.red,
                  fontSize: MediaQuery.of(context).size.width * 0.05),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              widget.money!.toStringAsFixed(2),
              style: GoogleFonts.itim(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: MediaQuery.of(context).size.width * 0.07),
            ),
            Text(
              'บาท',
              style: GoogleFonts.itim(
                color: Colors.red,
                fontSize: MediaQuery.of(context).size.width * 0.05,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text(
              'จำนวนคนที่จะหาร',
              style: GoogleFonts.itim(
                  color: Colors.red,
                  fontSize: MediaQuery.of(context).size.width * 0.05),
            ),
            Text(
              widget.person!.toString(),
              style: GoogleFonts.itim(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: MediaQuery.of(context).size.width * 0.07),
            ),
            Text(
              'คน',
              style: GoogleFonts.itim(
                  color: Colors.red,
                  fontSize: MediaQuery.of(context).size.width * 0.05),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text(
              'จำนวนเงินทิป',
              style: GoogleFonts.itim(
                  color: Colors.red,
                  fontSize: MediaQuery.of(context).size.width * 0.05),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              widget.tip!.toStringAsFixed(2),
              style: GoogleFonts.itim(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: MediaQuery.of(context).size.width * 0.07),
            ),
            Text(
              'บาท',
              style: GoogleFonts.itim(
                  color: Colors.red,
                  fontSize: MediaQuery.of(context).size.width * 0.05),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text(
              'แชร์เงินกันคนละ',
              style: GoogleFonts.itim(
                  color: Colors.red,
                  fontSize: MediaQuery.of(context).size.width * 0.05),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.height * 0.08,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 231, 92, 82),
                borderRadius: BorderRadius.circular(5.0),
              ),
              alignment: Alignment.center,
              child: Text(
                widget.moneyshare!.toStringAsFixed(2),
                style: GoogleFonts.itim(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: MediaQuery.of(context).size.width * 0.07),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              'บาท',
              style: GoogleFonts.itim(
                  color: Colors.red,
                  fontSize: MediaQuery.of(context).size.width * 0.05),
            ),
          ]),
        ),
      ),
    );
  }
}
