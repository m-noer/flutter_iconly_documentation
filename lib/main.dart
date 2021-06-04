import 'package:flutter/material.dart';
import 'package:flutter_iconly/widgets/iconly_bold.dart';
import 'package:flutter_iconly/widgets/iconly_broken.dart';
import 'package:flutter_iconly/widgets/iconly_bulk.dart';
import 'package:flutter_iconly/widgets/iconly_curved.dart';
import 'package:flutter_iconly/widgets/iconly_light.dart';
import 'package:flutter_iconly/widgets/iconly_light_outline.dart';
import 'package:clipboard/clipboard.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Color(0xffFFB240),
          cardTheme: CardTheme(
            shadowColor: Colors.grey[100],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            alignLabelWithHint: true,
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.red, width: 0.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.red, width: 0.0),
            ),
            hintStyle: const TextStyle(color: Colors.grey),
            filled: true,
          )),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _searchController = TextEditingController();

  var iconly = Constants.iconlyData[0];

  int selectedStyle = 0;

  onSearchChanged(value) {
    setState(
      () {
        if (selectedStyle == 0) {
          iconly = Constants.iconlyLightData
              .where((element) => element.iconName.contains(value))
              .toList();
        } else if (selectedStyle == 1) {
          iconly = Constants.iconlyBoldData
              .where((element) => element.iconName.contains(value))
              .toList();
        } else if (selectedStyle == 2) {
          iconly = Constants.iconlyBrokenData
              .where((element) => element.iconName.contains(value))
              .toList();
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage("assets/images/logo.png"),
                    fit: BoxFit.contain,
                    width: size.width * 0.2,
                  ),
                  Chip(
                    label: Text(
                      "v2.3",
                      style: TextStyle(color: Color(0xffFF646A)),
                    ),
                    backgroundColor: Color(0xffFF646A0).withOpacity(0.2),
                  )
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 3,
                        spreadRadius: 1,
                        offset: const Offset(0, 2),
                      )
                    ]),
                child: TextField(
                  controller: _searchController,
                  onChanged: onSearchChanged,
                  decoration: InputDecoration(
                      hintText: "Search...",
                      prefixIcon: Icon(IconlyBroken.search),
                      fillColor: Colors.white),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedStyle = 0;
                        onSearchChanged(_searchController.text);
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            IconlyLight.heart,
                            color: selectedStyle == 0
                                ? Color(0xffFF646A)
                                : Colors.black,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Light",
                            style: TextStyle(
                              color: selectedStyle == 0
                                  ? Color(0xffFF646A)
                                  : Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedStyle = 1;
                        onSearchChanged(_searchController.text);
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            IconlyBold.heart,
                            color: selectedStyle == 1
                                ? Color(0xffFF646A)
                                : Colors.black,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Bold",
                            style: TextStyle(
                              color: selectedStyle == 1
                                  ? Color(0xffFF646A)
                                  : Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedStyle = 2;
                        onSearchChanged(_searchController.text);
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            IconlyBroken.heart,
                            color: selectedStyle == 2
                                ? Color(0xffFF646A)
                                : Colors.black,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Broken",
                            style: TextStyle(
                              color: selectedStyle == 2
                                  ? Color(0xffFF646A)
                                  : Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  itemCount: iconly.length,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 150.0,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return CardIconly(iconlyData: iconly[index]);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CardIconly extends StatefulWidget {
  const CardIconly({
    Key? key,
    required this.iconlyData,
  }) : super(key: key);

  final IconlyData iconlyData;

  @override
  _CardIconlyState createState() => _CardIconlyState();
}

class _CardIconlyState extends State<CardIconly> {
  late FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          FlutterClipboard.copy(widget.iconlyData.iconName);
          fToast.showToast(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.grey[850],
              ),
              child: Text(
                "${widget.iconlyData.iconName} copied",
                style: TextStyle(color: Colors.white),
              ),
            ),
            gravity: ToastGravity.BOTTOM,
            toastDuration: Duration(seconds: 2),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Icon(
                  widget.iconlyData.iconData,
                  size: 30,
                  color: Color(0xFF374BFF),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                widget.iconlyData.iconName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF374BFF),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
