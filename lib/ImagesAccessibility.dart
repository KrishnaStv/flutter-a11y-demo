import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

class ImageAccessibilitychecks extends StatelessWidget {

  var activeImagePath = new AssetImage('assets/images/sendemailbutton.png');
  var infoImagePath = new AssetImage('assets/images/img.png');
  var decorativeImagePath = new AssetImage('assets/images/decorativeimage.png');
  var isGERadioButtonSelected = false;

  @override
  Widget build(BuildContext context) {

    var decorativeImage = new Image(
      image: decorativeImagePath,
      fit: BoxFit.cover,
      width: 180,
      height: 150,
    );

    var activeImage = new Image(
      image: activeImagePath,
      width: 180,
      height: 150,
    );

    var infoImage = new Image(
      image: infoImagePath,
      fit: BoxFit.cover,
      width: 180,
      height: 150,
    );

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Accessibility Checks'),),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Container(
              child: Semantics(
                child: Text("Exclude Semantics",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                header: true,
              ),
            ),

            Semantics(
              excludeSemantics: true,
              child: MaterialButton(
                onPressed: () {},
                color: Colors.blue,
                textColor: Colors.white,
                child: Text("Not Accessible"),
              ),
            ),
            SizedBox(
              height: 35,
            ),

            Container(
              child: Semantics(
                child: Text("Active Image",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                header: true,
              ),
            ),

            Semantics(
              child: Container(
                child: GestureDetector(
                  onTap: () {
                    final scaffold = ScaffoldMessenger.of(context);
                    scaffold.showSnackBar(
                      SnackBar(
                        content: Text("Active image tap actions"),
                        action: SnackBarAction(label: 'Okay',
                            onPressed: scaffold.hideCurrentSnackBar),
                      ),
                    );
                  },
                  child: activeImage,
                )
              ),
              // label: 'Send E-mail',
            ),

            SizedBox(
              height: 15,
            ),
            Container(
              child: Semantics(
                child: Text("Informative Image",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                header: true,
              ),
            ),

            Semantics(
              child: Container(
                  child: infoImage
              ),
              // label: '50% off shop now',
            ),

            SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Text(
                'Custom Actions',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),

            Semantics(
              child: ElevatedButton(
                child: Text('Tap to Sound'),
                onPressed: () {
                  debugPrint("default action performed");
                  final scaffold = ScaffoldMessenger.of(context);
                  scaffold.showSnackBar(
                    SnackBar(
                      content: Text("Its Default Action"),
                      action: SnackBarAction(label: 'Okay', onPressed: scaffold.hideCurrentSnackBar),
                    ),
                  );
                },
              ),
              // customSemanticsActions: {
              //   CustomSemanticsAction(label: "Custom Action"): () {
              //     debugPrint("custom action performed");
              //     final scaffold = ScaffoldMessenger.of(context);
              //     scaffold.showSnackBar(
              //       SnackBar(
              //         content: Text("Its Custom Action"),
              //         action: SnackBarAction(label: 'Okay', onPressed: scaffold.hideCurrentSnackBar),
              //       ),
              //     );
              //   },
              // },
            ),
          ],
        ),
      ),
    );
  }
}