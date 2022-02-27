import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:accounting/quote.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const FluentApp(
      debugShowCheckedModeBanner: false,
      title: 'عرض سعر البرنامج المحاسبي',
      home: MyHomePage(title: 'عرض سعر البرنامج المحاسبي'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var companyName = 'شركة مثال';
  var nProgAccounting = 1;
  var nProgFatora = 0;
  var nBae = 0;
  var nCashier = 0;
  var nServer = 0;
  var totalAfterDiscount = 0.0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    int _currentIndex = 0;

    return NavigationView(
      content: NavigationBody(
        index: _currentIndex,
      children: [
        ScaffoldPage(
          header: Container(
            color: const Color.fromRGBO(1, 93, 94, 1),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.title, style: const TextStyle(fontFamily: 'Cairo',fontSize: 18, color: Color(0xffffffff)), textDirection: TextDirection.rtl,),
                ],
              ),
            ),
          ),
          content:
      Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.fromLTRB(50.0,20.0,50.0,10.0),
                child:  Image.asset('assets/images/fatora/logo.png',width: 150, fit: BoxFit.contain,),
              ),


              Padding(
                padding: const EdgeInsets.fromLTRB(50.0,20.0,50.0,10.0),
                child: Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(child: Text(
                      'أدخل اسم المؤسسة',
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(fontFamily: 'Cairo',fontSize: 18, color: Color(0xff25626F)),
                    )),
                    SizedBox(
                      width: width*0.5,
                      child: TextBox(
                        textAlign: TextAlign.end,
                        onChanged: (val) {
                          setState(() {
                            companyName = val;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(50.0,20.0,50.0,10.0),
                child: Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      child: Text(
                      'أدخل عدد البرنامج المحاسبي',
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(fontFamily: 'Cairo',fontSize: 18, color: Color(0xff25626F)),
                    ),
                    ),
                    SizedBox(
                      width: width*0.5,
                      child: TextBox(
                        textAlign: TextAlign.end,
                        keyboardType: TextInputType.number,
                        onChanged: (val) {
                          setState(() {
                            nProgAccounting = int.tryParse(val)!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(50.0,20.0,50.0,10.0),
                child: Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(child: Text(
                      'أدخل عدد برنامج الفاتورة الالكترونية',
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(fontFamily: 'Cairo',fontSize: 18, color: Color(0xff25626F)),
                    )),
                    SizedBox(
                      width: width*0.5,
                      child: TextBox(
                        textAlign: TextAlign.end,
                        keyboardType: TextInputType.number,
                        onChanged: (val) {
                          setState(() {
                            nProgFatora = int.tryParse(val)!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(50.0,20.0,50.0,10.0),
                child: Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(child: Text(
                      'أدخل عدد أجهزة نقاط البيع نظام التشغيل أندرويد',
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(fontFamily: 'Cairo',fontSize: 18, color: Color(0xff25626F)),
                    )),
                    SizedBox(
                      width: width*0.5,
                      child: TextBox(
                        textAlign: TextAlign.end,
                        keyboardType: TextInputType.number,
                        onChanged: (val) {
                          setState(() {
                            nBae = int.tryParse(val)!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(50.0,20.0,50.0,10.0),
                child: Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(child: Text(
                      'أدخل عدد أجهزة الكاشير نظام التشغيل ويندوز',
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(fontFamily: 'Cairo',fontSize: 18, color: Color(0xff25626F)),
                    )),
                    SizedBox(
                      width: width*0.5,
                      child: TextBox(
                        textAlign: TextAlign.end,
                        keyboardType: TextInputType.number,
                        onChanged: (val) {
                          setState(() {
                            nCashier = int.tryParse(val)!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(50.0,20.0,50.0,10.0),
                child: Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(child: Text(
                      'حجز سيرفر لمدة عام (عدد)',
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(fontFamily: 'Cairo',fontSize: 18, color: Color(0xff25626F)),
                    )),
                    SizedBox(
                      width: width*0.5,
                      child: TextBox(
                        textAlign: TextAlign.end,
                        keyboardType: TextInputType.number,
                        onChanged: (val) {
                          setState(() {
                            nServer = int.tryParse(val)!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(50.0,20.0,50.0,10.0),
                child: Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(child: Text(
                      'الإجمالي بعد الخصم',
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(fontFamily: 'Cairo',fontSize: 18, color: Color(0xff25626F)),
                    )),
                    SizedBox(
                      width: width*0.5,
                      child: TextBox(
                        textAlign: TextAlign.end,
                        keyboardType: TextInputType.number,
                        onChanged: (val) {
                          setState(() {
                            totalAfterDiscount = double.tryParse(val)!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(50.0,20.0,50.0,10.0),
                child: Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FilledButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('تأكيد',
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(fontFamily: 'Cairo',fontSize: 18, color: Color(0xffffffff),),
                            ),
                            SizedBox(width: 10,),
                            Icon(FluentIcons.accept),
                          ],
                        ),
                        onPressed: () async{
                          // await printPdfSmall(context,companyName);
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QuoteScreen(
                                  companyName: companyName,
                                  nProgAccounting: nProgAccounting,
                                  nProgFatora: nProgFatora,
                                  nBae: nBae,
                                  nCashier: nCashier,
                                  nServer: nServer,
                                  totalAfterDiscount: totalAfterDiscount,
                                ),
                            ),
                          );
                        },
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
        ),
    ],
      ),
    );

      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async{
      //     // await printPdfSmall(context,companyName);
      //     await Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => QuoteScreen(
      //             companyName: companyName,
      //             nProgFatora: nProgFatora,
      //             nBae: nBae,
      //             nCashier: nCashier,
      //             nServer: nServer,
      //             totalAfterDiscount: totalAfterDiscount,
      //           )),
      //     );
      //   },
      //   tooltip: 'تأكيد',
      //   child: const Icon(Icons.done_all),
      // ),

  }
}
