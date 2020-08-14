import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hashinclude/localWidgets.dart';

class Questions extends StatefulWidget {
  @override
  _QuestionsState createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  String _dropDownValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
//            width: MediaQuery.of(context).size.width,
//            height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFCD37FF), Color(0xFF40C9FF)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: ListView(children: [
            Column(children: [
//              Image.asset(
//                'images/background.png',
//                width: MediaQuery.of(context).size.width,
//                height: MediaQuery.of(context).size.height,
//              ),
              Padding(
                padding: const EdgeInsets.only(top: 22.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 320,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(36),
                            topRight: Radius.circular(36)),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF5254D8),
                          ),
                          hintText: 'Search',
                          suffixIcon: Icon(
                            Icons.search,
                            color: Color(0xFF5254D8),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Notific(
                        nav: '/notification',
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                  right: 278.0,
                  left: 30,
                  top: 30,
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    dropdownColor: Color(0xFF7277F1),
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                      size: 25,
                    ),
                    hint: _dropDownValue == null
                        ? Text('Dropdown')
                        : Text(_dropDownValue,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontSize: 20,
                            )),
                    isExpanded: true,
                    iconSize: 30.0,
                    style: TextStyle(color: Colors.white),
                    items: [
                      'New',
                      'Popular',
                    ].map(
                      (val) {
                        return DropdownMenuItem<String>(
                          value: val,
                          child: Text(val),
                        );
                      },
                    ).toList(),
                    onChanged: (val) {
                      setState(
                        () {
                          _dropDownValue = val;
                        },
                      );
                    },
                  ),
                ),
              ),
              QueCards(),
              QueCards(),
              QueCards(),
              QueCards(),
              QueCards(),
            ]),
          ]),
        ),
      ),
    );
  }
}
