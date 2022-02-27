import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:path_provider_windows/path_provider_windows.dart';
import 'package:accounting/main.dart';
import 'package:screenshot/screenshot.dart';

import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart ' as pw;

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({Key? key,
    required this.companyName,
    required this.nProgAccounting,
    required this.nProgFatora,
    required this.nBae,
    required this.nCashier,
    required this.nServer,
    required this.totalAfterDiscount}) : super(key: key);

  final String companyName;
  final int nProgAccounting;
  final int nProgFatora;
  final int nBae;
  final int nCashier;
  final int nServer;
  final double totalAfterDiscount;

  @override
  _QuoteScreenState createState() => _QuoteScreenState();

}

class _QuoteScreenState extends State<QuoteScreen> {

  Uint8List? _imageFile;

  //Create an instance of ScreenshotController
  ScreenshotController screenshotController = ScreenshotController();
  var total = 0;

  @override
  void initState() {
    setState(() {
      if(widget.nProgAccounting>0 && widget.nProgFatora>0 && widget.nBae>0 && widget.nCashier>0 && widget.nServer>0) {
        total = (widget.nProgAccounting*12500) + (widget.nProgFatora*1950) + (widget.nBae*1800) + (widget.nCashier*3500) + (widget.nServer*800);
      } else if(widget.nProgAccounting>0 && widget.nProgFatora==0 && widget.nBae==0 && widget.nCashier==0 && widget.nServer==0) {
        total = (widget.nProgAccounting*12500);
      } else if(widget.nProgAccounting>0 && widget.nProgFatora>0 && widget.nBae==0 && widget.nCashier==0 && widget.nServer==0) {
        total = (widget.nProgAccounting*12500) + (widget.nProgFatora*1950);
      } else if(widget.nProgAccounting>0 && widget.nProgFatora==0 && widget.nBae>0 && widget.nCashier==0 && widget.nServer==0) {
        total = (widget.nProgAccounting*12500) + (widget.nBae*1800);
      } else if(widget.nProgAccounting>0 && widget.nProgFatora==0 && widget.nBae==0 && widget.nCashier>0 && widget.nServer==0) {
        total = (widget.nProgAccounting*12500) + (widget.nCashier*3500);
      } else if(widget.nProgAccounting>0 && widget.nProgFatora==0 && widget.nBae==0 && widget.nCashier==0 && widget.nServer>0) {
        total = (widget.nProgAccounting*12500) + (widget.nServer*800);
      } else if(widget.nProgAccounting>0 && widget.nProgFatora>0 && widget.nBae>0 && widget.nCashier==0 && widget.nServer==0) {
        total = (widget.nProgAccounting*12500) + (widget.nProgFatora*1950) + (widget.nBae*1800);
      } else if(widget.nProgAccounting>0 && widget.nProgFatora>0 && widget.nBae==0 && widget.nCashier>0 && widget.nServer==0) {
        total = (widget.nProgAccounting*12500) + (widget.nProgFatora*1950) + (widget.nCashier*3500);
      } else if(widget.nProgAccounting>0 && widget.nProgFatora>0 && widget.nBae==0 && widget.nCashier==0 && widget.nServer>0) {
        total = (widget.nProgAccounting*12500) + (widget.nProgFatora*1950) + (widget.nServer*800);
      } else if(widget.nProgAccounting>0 && widget.nProgFatora==0 && widget.nBae>0 && widget.nCashier>0 && widget.nServer==0) {
        total = (widget.nProgAccounting*12500) + (widget.nBae*1800) + (widget.nCashier*3500);
      } else if(widget.nProgAccounting>0 && widget.nProgFatora==0 && widget.nBae==0 && widget.nCashier>0 && widget.nServer>0) {
        total = (widget.nProgAccounting*12500) + (widget.nCashier*3500) + (widget.nServer*800);
      } else if(widget.nProgAccounting>0 && widget.nProgFatora==0 && widget.nBae>0 && widget.nCashier==0 && widget.nServer>0) {
        total = (widget.nProgAccounting*12500) + (widget.nBae*1800) + (widget.nServer*800);
      } else if(widget.nProgAccounting>0 && widget.nProgFatora==0 && widget.nBae>0 && widget.nCashier>0 && widget.nServer>0) {
        total = (widget.nProgAccounting*12500) + (widget.nBae*1800) + (widget.nCashier*3500) + (widget.nServer*800);
      } else if(widget.nProgAccounting>0 && widget.nProgFatora>0 && widget.nBae>0 && widget.nCashier>0 && widget.nServer==0) {
        total = (widget.nProgAccounting*12500) + (widget.nProgFatora*1950) + (widget.nBae*1800) + (widget.nCashier*3500);
      } else if(widget.nProgAccounting>0 && widget.nProgFatora>0 && widget.nBae==0 && widget.nCashier>0 && widget.nServer>0) {
        total = (widget.nProgAccounting*12500) + (widget.nProgFatora*1950) + (widget.nCashier*3500) + (widget.nServer*800);
      } else if(widget.nProgAccounting>0 && widget.nProgFatora>0 && widget.nBae>0 && widget.nCashier==0 && widget.nServer>0) {
        total = (widget.nProgAccounting*12500) + (widget.nProgFatora*1950) + (widget.nBae*1800) + (widget.nServer*800);
      } else {
        total = 0;
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () async {
                    await Navigator.push(context, MaterialPageRoute(builder: (context) => const MyHomePage(title:  'عرض سعر البرنامج المحاسبي',)));
                  },
                  icon: const Icon(Icons.reset_tv, color: Colors.green, size: 50,),
                ),

                SizedBox(width: width*0.2,),

                IconButton(
                    onPressed: () {
                      screenshotController.capture().then((Uint8List? image) {
                        //Capture Done
                        setState(() {
                          _imageFile = image;
                          getPdf(context, _imageFile!);
                          // print(image);
                        });
                      }).catchError((onError) {
                        print(onError);
                      });
                    },
                    icon: const Icon(Icons.print, color: Colors.orange, size: 50,),
                ),
              ],
            ),
            SizedBox(height: height*0.05,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Screenshot(
                    controller: screenshotController,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/accounting/01.png',width: 210*2, fit: BoxFit.contain,),
                        Stack(
                          textDirection: TextDirection.rtl,
                            children: [
                          Image.asset('assets/images/accounting/02.png',width: 210*2, fit: BoxFit.contain,),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0,148,145,0),
                                child: Text(widget.companyName,textAlign: TextAlign.center, textDirection: TextDirection.rtl, style: const TextStyle(fontFamily: 'Cairo',fontSize: 16, color: Color(0xff25626F)),),
                              ),
                            ],
                        ),
                        Image.asset('assets/images/accounting/03.png',width: 210*2, fit: BoxFit.contain,),
                        Image.asset('assets/images/accounting/04.png',width: 210*2, fit: BoxFit.contain,),
                        Image.asset('assets/images/accounting/05.png',width: 210*2, fit: BoxFit.contain,),
                        Image.asset('assets/images/accounting/06.png',width: 210*2, fit: BoxFit.contain,),
                        Image.asset('assets/images/accounting/07.png',width: 210*2, fit: BoxFit.contain,),
                        Image.asset('assets/images/accounting/08.png',width: 210*2, fit: BoxFit.contain,),
                        Image.asset('assets/images/accounting/09.png',width: 210*2, fit: BoxFit.contain,),
                        Image.asset('assets/images/accounting/10.png',width: 210*2, fit: BoxFit.contain,),
                        Image.asset('assets/images/accounting/11.png',width: 210*2, fit: BoxFit.contain,),
                        Image.asset('assets/images/accounting/12.png',width: 210*2, fit: BoxFit.contain,),
                        Image.asset('assets/images/accounting/13.png',width: 210*2, fit: BoxFit.contain,),
                        Stack(
                          textDirection: TextDirection.rtl,
                          children: [
                            Image.asset('assets/images/accounting/14.png',width: 210*2, fit: BoxFit.contain,),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0,42,145,0),
                              child: Text(
                                widget.companyName,textAlign: TextAlign.center,
                                textDirection: TextDirection.rtl,
                                style: const TextStyle(fontFamily: 'Cairo',fontSize: 14, color: Color(0xff25626F)),
                              ),
                            ),
                            if(widget.nProgAccounting>0)
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0,110,0,0),
                                child: Row(
                                  children: [
                                    const Text('12500',
                                      textAlign: TextAlign.center,
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                    const SizedBox(width: 55,),
                                    Text(widget.nProgAccounting.toString(),
                                        textAlign: TextAlign.center,
                                        textDirection: TextDirection.rtl,
                                        style: const TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                    const SizedBox(width: 35,),
                                    const Text('نظام محاسبي متكامل يضم شجرة'
                                        '\nالحسابات والميزانية ومراكز التكلفة',
                                      textAlign: TextAlign.right,
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                    const SizedBox(width: 20,),
                                    const Text('1',
                                      textAlign: TextAlign.center,
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                    const SizedBox(width: 75,),

                                  ],
                                ),
                              ),

                            if(widget.nProgFatora>0 && widget.nBae>0 && widget.nCashier>0 && widget.nServer>0)
                              Column(
                                children: [


                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,155,0,0),
                                    child: Row(
                                      children: [
                                        const Text('1950',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 55,),
                                        Text(widget.nProgFatora.toString(),
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: const TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 75,),
                                        const Text('نظام المبيعات المتكامل',
                                          textAlign: TextAlign.right,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 20,),
                                        const Text('2',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 75,),
                                      ],
                                    ),
                                  ),



                                  Padding(
                                padding: const EdgeInsets.fromLTRB(0,10,0,0),
                                child: Row(
                                  children: [
                                    const Text('1800',
                                      textAlign: TextAlign.center,
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                    const SizedBox(width: 55,),
                                    Text(widget.nBae.toString(),
                                      textAlign: TextAlign.center,
                                      textDirection: TextDirection.rtl,
                                      style: const TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                    const SizedBox(width: 30,),
                                    const Text('جهاز نقاط البيع بنظام تشغيل أندرويد',
                                      textAlign: TextAlign.right,
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                    const SizedBox(width: 20,),
                                    const Text('3',
                                      textAlign: TextAlign.center,
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                    const SizedBox(width: 75,),
                                  ],
                                ),
                              ),



                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,10,0,0),
                                    child: Row(
                                      children: [
                                        const Text('3500',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 55,),
                                        Text(widget.nCashier.toString(),
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: const TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 48,),
                                        const Text('جهاز كاشير بنظام تشغيل ويندوز',
                                          textAlign: TextAlign.right,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 20,),
                                        const Text('4',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 75,),
                                      ],
                                    ),
                                  ),




                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,10,0,0),
                                    child: Row(
                                      children: [
                                        const Text('800',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 55,),
                                        Text(widget.nServer.toString(),
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: const TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 95,),
                                        const Text('حجز سيرفر لمدة عام',
                                          textAlign: TextAlign.right,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 20,),
                                        const Text('5',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 75,),
                                      ],
                                    ),
                                  ),



                                ],
                              ),


                            if(widget.nProgFatora>0 && widget.nBae==0 && widget.nCashier==0 && widget.nServer==0)
                              Column(
                                children: [

                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,155,0,0),
                                    child: Row(
                                      children: [
                                        const Text('1950',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 55,),
                                        Text(widget.nProgFatora.toString(),
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: const TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 75,),
                                        const Text('نظام المبيعات المتكامل',
                                          textAlign: TextAlign.right,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 20,),
                                        const Text('2',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 75,),
                                      ],
                                    ),
                                  ),

                                ],
                              ),


                            if(widget.nProgFatora>0 && widget.nBae>0 && widget.nCashier==0 && widget.nServer==0)
                              Column(
                                children: [


                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,155,0,0),
                                    child: Row(
                                      children: [
                                        const Text('1950',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 55,),
                                        Text(widget.nProgFatora.toString(),
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: const TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 75,),
                                        const Text('نظام المبيعات المتكامل',
                                          textAlign: TextAlign.right,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 20,),
                                        const Text('2',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 75,),
                                      ],
                                    ),
                                  ),



                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,10,0,0),
                                    child: Row(
                                      children: [
                                        const Text('1800',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 55,),
                                        Text(widget.nBae.toString(),
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: const TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 30,),
                                        const Text('جهاز نقاط البيع بنظام تشغيل أندرويد',
                                          textAlign: TextAlign.right,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 20,),
                                        const Text('3',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 75,),
                                      ],
                                    ),
                                  ),

                                ],
                              ),


                            if(widget.nProgFatora>0 && widget.nBae>0 && widget.nCashier>0 && widget.nServer==0)
                              Column(
                                children: [


                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,155,0,0),
                                    child: Row(
                                      children: [
                                        const Text('1950',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 55,),
                                        Text(widget.nProgFatora.toString(),
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: const TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 75,),
                                        const Text('نظام المبيعات المتكامل',
                                          textAlign: TextAlign.right,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 20,),
                                        const Text('2',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 75,),
                                      ],
                                    ),
                                  ),



                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,10,0,0),
                                    child: Row(
                                      children: [
                                        const Text('1800',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 55,),
                                        Text(widget.nBae.toString(),
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: const TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 30,),
                                        const Text('جهاز نقاط البيع بنظام تشغيل أندرويد',
                                          textAlign: TextAlign.right,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 20,),
                                        const Text('3',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 75,),
                                      ],
                                    ),
                                  ),



                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,10,0,0),
                                    child: Row(
                                      children: [
                                        const Text('3500',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 55,),
                                        Text(widget.nCashier.toString(),
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: const TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 48,),
                                        const Text('جهاز كاشير بنظام تشغيل ويندوز',
                                          textAlign: TextAlign.right,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 20,),
                                        const Text('4',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 75,),
                                      ],
                                    ),
                                  ),

                                ],
                              ),


                            if(widget.nProgFatora>0 && widget.nBae==0 && widget.nCashier>0 && widget.nServer==0)
                              Column(
                                children: [


                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,155,0,0),
                                    child: Row(
                                      children: [
                                        const Text('1950',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 55,),
                                        Text(widget.nProgFatora.toString(),
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: const TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 75,),
                                        const Text('نظام المبيعات المتكامل',
                                          textAlign: TextAlign.right,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 20,),
                                        const Text('2',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 75,),
                                      ],
                                    ),
                                  ),


                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,10,0,0),
                                    child: Row(
                                      children: [
                                        const Text('3500',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 55,),
                                        Text(widget.nCashier.toString(),
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: const TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 48,),
                                        const Text('جهاز كاشير بنظام تشغيل ويندوز',
                                          textAlign: TextAlign.right,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 20,),
                                        const Text('3',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 75,),
                                      ],
                                    ),
                                  ),

                                ],
                              ),


                            if(widget.nProgFatora>0 && widget.nBae==0 && widget.nCashier==0 && widget.nServer>0)
                              Column(
                                children: [


                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,155,0,0),
                                    child: Row(
                                      children: [
                                        const Text('1950',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 55,),
                                        Text(widget.nProgFatora.toString(),
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: const TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 75,),
                                        const Text('نظام المبيعات المتكامل',
                                          textAlign: TextAlign.right,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 20,),
                                        const Text('2',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 75,),
                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,10,0,0),
                                    child: Row(
                                      children: [
                                        const Text('800',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 55,),
                                        Text(widget.nServer.toString(),
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: const TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 95,),
                                        const Text('حجز سيرفر لمدة عام',
                                          textAlign: TextAlign.right,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 20,),
                                        const Text('3',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 75,),
                                      ],
                                    ),
                                  ),



                                ],
                              ),



                            if(widget.nProgFatora>0 && widget.nBae==0 && widget.nCashier>0 && widget.nServer>0)
                              Column(
                                children: [


                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,155,0,0),
                                    child: Row(
                                      children: [
                                        const Text('1950',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 55,),
                                        Text(widget.nProgFatora.toString(),
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: const TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 75,),
                                        const Text('نظام المبيعات المتكامل',
                                          textAlign: TextAlign.right,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 20,),
                                        const Text('2',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 75,),
                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,10,0,0),
                                    child: Row(
                                      children: [
                                        const Text('3500',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 55,),
                                        Text(widget.nCashier.toString(),
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: const TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 48,),
                                        const Text('جهاز كاشير بنظام تشغيل ويندوز',
                                          textAlign: TextAlign.right,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 20,),
                                        const Text('3',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 75,),
                                      ],
                                    ),
                                  ),




                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,10,0,0),
                                    child: Row(
                                      children: [
                                        const Text('800',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 55,),
                                        Text(widget.nServer.toString(),
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: const TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 95,),
                                        const Text('حجز سيرفر لمدة عام',
                                          textAlign: TextAlign.right,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 20,),
                                        const Text('4',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 75,),
                                      ],
                                    ),
                                  ),



                                ],
                              ),



                            if(widget.nProgFatora>0 && widget.nBae>0 && widget.nCashier==0 && widget.nServer>0)
                              Column(
                                children: [


                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,155,0,0),
                                    child: Row(
                                      children: [
                                        const Text('1950',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 55,),
                                        Text(widget.nProgFatora.toString(),
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: const TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 75,),
                                        const Text('نظام المبيعات المتكامل',
                                          textAlign: TextAlign.right,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 20,),
                                        const Text('2',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 75,),
                                      ],
                                    ),
                                  ),



                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,10,0,0),
                                    child: Row(
                                      children: [
                                        const Text('1800',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 55,),
                                        Text(widget.nBae.toString(),
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: const TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 30,),
                                        const Text('جهاز نقاط البيع بنظام تشغيل أندرويد',
                                          textAlign: TextAlign.right,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 20,),
                                        const Text('3',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 75,),
                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,10,0,0),
                                    child: Row(
                                      children: [
                                        const Text('800',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 55,),
                                        Text(widget.nServer.toString(),
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: const TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 95,),
                                        const Text('حجز سيرفر لمدة عام',
                                          textAlign: TextAlign.right,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 20,),
                                        const Text('4',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 75,),
                                      ],
                                    ),
                                  ),



                                ],
                              ),



                            if(widget.nProgFatora==0 && widget.nBae>0 && widget.nCashier>0 && widget.nServer>0)
                              Column(
                                children: [

                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,155,0,0),
                                    child: Row(
                                      children: [
                                        const Text('1800',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 55,),
                                        Text(widget.nBae.toString(),
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: const TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 30,),
                                        const Text('جهاز نقاط البيع بنظام تشغيل أندرويد',
                                          textAlign: TextAlign.right,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 20,),
                                        const Text('2',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 75,),
                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,10,0,0),
                                    child: Row(
                                      children: [
                                        const Text('3500',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 55,),
                                        Text(widget.nCashier.toString(),
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: const TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 48,),
                                        const Text('جهاز كاشير بنظام تشغيل ويندوز',
                                          textAlign: TextAlign.right,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 20,),
                                        const Text('3',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 75,),
                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,10,0,0),
                                    child: Row(
                                      children: [
                                        const Text('800',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 55,),
                                        Text(widget.nServer.toString(),
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: const TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 95,),
                                        const Text('حجز سيرفر لمدة عام',
                                          textAlign: TextAlign.right,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 20,),
                                        const Text('4',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 75,),
                                      ],
                                    ),
                                  ),

                                ],
                              ),



                            if(widget.nProgFatora==0 && widget.nBae>0 && widget.nCashier==0 && widget.nServer==0)
                              Column(
                                children: [

                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,155,0,0),
                                    child: Row(
                                      children: [
                                        const Text('1800',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 55,),
                                        Text(widget.nBae.toString(),
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: const TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 30,),
                                        const Text('جهاز نقاط البيع بنظام تشغيل أندرويد',
                                          textAlign: TextAlign.right,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 20,),
                                        const Text('2',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 75,),
                                      ],
                                    ),
                                  ),

                                ],
                              ),

                            if(widget.nProgFatora==0 && widget.nBae>0 && widget.nCashier>0 && widget.nServer==0)
                              Column(
                                children: [

                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,155,0,0),
                                    child: Row(
                                      children: [
                                        const Text('1800',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 55,),
                                        Text(widget.nBae.toString(),
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: const TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 30,),
                                        const Text('جهاز نقاط البيع بنظام تشغيل أندرويد',
                                          textAlign: TextAlign.right,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 20,),
                                        const Text('2',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 75,),
                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,10,0,0),
                                    child: Row(
                                      children: [
                                        const Text('3500',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 55,),
                                        Text(widget.nCashier.toString(),
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: const TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 48,),
                                        const Text('جهاز كاشير بنظام تشغيل ويندوز',
                                          textAlign: TextAlign.right,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 20,),
                                        const Text('3',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 75,),
                                      ],
                                    ),
                                  ),

                                ],
                              ),


                            if(widget.nProgFatora==0 && widget.nBae>0 && widget.nCashier==0 && widget.nServer>0)
                              Column(
                                children: [

                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,155,0,0),
                                    child: Row(
                                      children: [
                                        const Text('1800',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 55,),
                                        Text(widget.nBae.toString(),
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: const TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 30,),
                                        const Text('جهاز نقاط البيع بنظام تشغيل أندرويد',
                                          textAlign: TextAlign.right,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 20,),
                                        const Text('2',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 75,),
                                      ],
                                    ),
                                  ),


                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,10,0,0),
                                    child: Row(
                                      children: [
                                        const Text('800',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 55,),
                                        Text(widget.nServer.toString(),
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: const TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 95,),
                                        const Text('حجز سيرفر لمدة عام',
                                          textAlign: TextAlign.right,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 20,),
                                        const Text('3',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 75,),
                                      ],
                                    ),
                                  ),

                                ],
                              ),


                            if(widget.nProgFatora==0 && widget.nBae==0 && widget.nCashier>0 && widget.nServer>0)
                              Column(
                                children: [

                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,155,0,0),
                                    child: Row(
                                      children: [
                                        const Text('3500',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 55,),
                                        Text(widget.nCashier.toString(),
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: const TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 48,),
                                        const Text('جهاز كاشير بنظام تشغيل ويندوز',
                                          textAlign: TextAlign.right,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 20,),
                                        const Text('2',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 75,),
                                      ],
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,10,0,0),
                                    child: Row(
                                      children: [
                                        const Text('800',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 55,),
                                        Text(widget.nServer.toString(),
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: const TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 95,),
                                        const Text('حجز سيرفر لمدة عام',
                                          textAlign: TextAlign.right,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 20,),
                                        const Text('3',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 75,),
                                      ],
                                    ),
                                  ),

                                ],
                              ),

                            if(widget.nProgFatora==0 && widget.nBae==0 && widget.nCashier>0 && widget.nServer==0)
                              Column(
                                children: [

                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,155,0,0),
                                    child: Row(
                                      children: [
                                        const Text('3500',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 55,),
                                        Text(widget.nCashier.toString(),
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: const TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 48,),
                                        const Text('جهاز كاشير بنظام تشغيل ويندوز',
                                          textAlign: TextAlign.right,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 20,),
                                        const Text('2',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 75,),
                                      ],
                                    ),
                                  ),

                                ],
                              ),

                            if(widget.nProgFatora==0 && widget.nBae==0 && widget.nCashier==0 && widget.nServer>0)
                              Column(
                                children: [

                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,155,0,0),
                                    child: Row(
                                      children: [
                                        const Text('800',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 55,),
                                        Text(widget.nServer.toString(),
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: const TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 95,),
                                        const Text('حجز سيرفر لمدة عام',
                                          textAlign: TextAlign.right,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 20,),
                                        const Text('2',
                                          textAlign: TextAlign.center,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(fontFamily: 'Cairo',fontSize: 10, color: Color(0xff25626F)),),
                                        const SizedBox(width: 75,),
                                      ],
                                    ),
                                  ),

                                ],
                              ),



                            Padding(
                              padding: const EdgeInsets.fromLTRB(0,365,120,0),
                              child: Text(
                                '${total.toString()}  ريال ',
                                textAlign: TextAlign.center,
                                textDirection: TextDirection.rtl,
                                style: const TextStyle(fontFamily: 'Cairo',fontSize: 12, color: Color(0xff25626F)),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.fromLTRB(0,415,200,0),
                              child: Text(
                                widget.totalAfterDiscount == 0.0 ?   '${total.toString()}  ريال ' : '${widget.totalAfterDiscount.toString()}  ريال ',
                                textAlign: TextAlign.center,
                                textDirection: TextDirection.rtl,
                                style: const TextStyle(fontFamily: 'Cairo',fontSize: 14, color: Color(0xffffffff)),
                              ),
                            ),



                          ],
                        ),
                        // Image.asset('assets/images/fatora/14.png',width: 210*2, fit: BoxFit.contain,),
                      ],
                    ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future getPdf(BuildContext contextt, Uint8List screenShot) async {
  pw.Document pdf = pw.Document();
  pdf.addPage(
    pw.MultiPage(
      // cm = (72.0 / 2.54)
      pageFormat:  const PdfPageFormat(21.0 * (72.0 / 2.54), 415.8 * (72.0 / 2.54)),
      build: (context) {
        return [
          pw.Expanded(
          // change this line to this:
            child: pw.Image(pw.MemoryImage(screenShot), fit: pw.BoxFit.contain, width: MediaQuery.of(contextt).size.width*0.575),
            // child: pw.Image(PdfImage.file(pdf.document, bytes: screenShot), fit: pw.BoxFit.contain)
        )
        ];
      },
    ),
  );

  final PathProviderWindows provider = PathProviderWindows();
  var path = '';
  try {
    path = (await provider.getDownloadsPath())!;
  } catch (exception) {
    path = 'Failed to get downloads directory: $exception';
  }
  final String fullPath = '$path/AlRaedahAccountingQoute.pdf';
  final File file = File(fullPath);
  await file.writeAsBytes(await pdf.save());

  FlutterToastr.show("تم حفظ ملف عرض السعر في التنزيلات", contextt, duration: FlutterToastr.lengthShort, position:  FlutterToastr.center, backgroundColor: Colors.green);

  // File pdfFile = File('Your path + File name');
  // pdfFile.writeAsBytesSync(pdf.save());
}
