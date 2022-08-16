import 'package:flutter/semantics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TableDataAccessibility extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Accessibility Checks"),),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Container(
              child: Semantics(
                child: Text("Table Data",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                header: true,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Center(
                child: Column(
                  children: [
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Semantics(
                          header: true,
                          child: Text(
                            'Company',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Semantics(
                          header: true,
                          child: Text(
                            'Jun 2018',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Semantics(
                          header: true,
                          child: Text(
                            'Jun 2019',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Divider(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Semantics(
                          label: 'Company: ',
                          child: Text('Maruthi'),
                        ),
                        Semantics(
                          label: 'June 2018 cost:',
                          child: Text('1.34L'),
                        ),
                        Semantics(
                          label: 'June 2019 cost',
                          child: Text('1.10L'),
                        ),
                      ],
                    ),

                    Divider(),

                    MergeSemantics(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Semantics(
                            label: 'Company: ',
                            child: Text('Hundai'),
                          ),
                          Semantics(
                            label: 'June 2018 cost:',
                            child: Text('0.45L'),
                          ),
                          Semantics(
                            label: 'June 2019 cost:',
                            child: Text('0.42L'),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 45,
                    ),
                    Container(
                      child: Semantics(
                        child: Text("Reading Order",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        header: true,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),

                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                    Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Semantics(
                                        child: Text("First Name"),
                                        sortKey: OrdinalSortKey(1),
                                      ),
                                    ),
                                    Semantics(
                                      child:  TextFormField(
                                        keyboardType: TextInputType.emailAddress,
                                        maxLines: 1,
                                        minLines: 1,
                                        decoration: InputDecoration(
                                            isDense: true,
                                            border: OutlineInputBorder(),),
                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter First name';
                                          } else {
                                            debugPrint('Value is $value');
                                          }
                                        },
                                      ),
                                      label: 'First name',
                                      sortKey: OrdinalSortKey(2),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Semantics(
                                        child: Text("Last Name"),
                                        sortKey: OrdinalSortKey(3),
                                      ),
                                    ),
                                    Semantics(
                                      child:  TextFormField(
                                        keyboardType: TextInputType.emailAddress,
                                        maxLines: 1,
                                        minLines: 1,
                                        decoration: InputDecoration(
                                            isDense: true,
                                            border: OutlineInputBorder(),),
                                        validator: (String? value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter last name';
                                          } else {
                                            debugPrint('Value is $value');
                                          }
                                        },
                                      ),
                                      label: 'Last name',
                                      sortKey: OrdinalSortKey(4),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      padding: EdgeInsets.only(left: 10, right: 10),
                    ),
                    ],
                  ),
                ),
                    SizedBox(
                      height: 10,
                    ),

                    MaterialButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Future.delayed(Duration(milliseconds: 300), () {
                            SemanticsService.announce(
                                "Registration Successfull", TextDirection.ltr);
                          });
                        }
                      },
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text('CREATE ACCOUNT'),
                    ),


                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}