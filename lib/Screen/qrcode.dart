
import 'package:flutter/material.dart';
import 'package:flutter_qrcode_scanner/flutter_qrcode_scanner.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';


const flashOn = 'FLASH ON';
const flashOff = 'FLASH OFF';
const frontCamera = 'FRONT CAMERA';
const backCamera = 'BACK CAMERA';

class QRCode extends StatefulWidget {
  const QRCode({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRCode();
}

class _QRCode extends State<QRCode> {
  String qrText = '';
  var flashState = flashOn;
  var cameraState = frontCamera;
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        (Color(0XFF4FC3F7)),
                        Color(0XFF81D4FA),
                        Color(0XFFB3E5FC)
                      ])),
              child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 35, left: 50, right: 50),
                          child: Image.asset("images/facechk_logo.png"),
                          height: 30,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Container(
                            child: Text(
                              "Visitor Management System",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white),
                            )),
                      ]))),


          SizedBox(
            height: 15,
          ),
          Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "QR Code Scanner",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.blue[900]),
                ),
              )),

          Flexible(
            flex: 4,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Color(0XFF4FC3F7),
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: 300,
              ),
            ),
          ),
          Flexible(
            flex:1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(8),
                    child: ElevatedButton(

                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Back', style: TextStyle(fontSize: 20)),
                    ),

                  ),
                  Container(
                    margin: EdgeInsets.all(8),
                    child: ElevatedButton(
                        onPressed: () {
                          if (controller != null) {
                            controller.toggleFlash();
                            if (_isFlashOn(flashState)) {
                              setState(() {
                                flashState = flashOff;
                              });
                            } else {
                              setState(() {
                                flashState = flashOn;
                              });
                            }
                          }
                        },
                        child:
                        // Text(flashState, style: TextStyle(fontSize: 20)),
                        Icon(
                          Icons.flash_on,
                          color: Colors.white,
                          size: 30,
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.all(8),
                    child: ElevatedButton(
                      onPressed: () {
                        if (controller != null) {
                          controller.flipCamera();
                          if (_isBackCamera(cameraState)) {
                            setState(() {
                              cameraState = frontCamera;
                            });
                          } else {
                            setState(() {
                              cameraState = backCamera;
                            });
                          }
                        }
                      },
                      child:
                      Text(cameraState, style: TextStyle(fontSize: 20)),
                    ),
                  )
                ],
              )
              ,

            ),
          )
        ],
      ),
    );
  }

  bool _isFlashOn(String current) {
    return flashOn == current;
  }

  bool _isBackCamera(String current) {
    return backCamera == current;
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = scanData;
        print("qr------$qrText");

        var data_string=qrText.split("/");
        // print("qrTextstring----$data_string") ;

        var data=data_string.elementAt(6);
        print("our id----- $data");
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>WebView(initialUrl: "https://www.google.com/",))
        );


      });
    });
  }

  // openURL() async{
  //   if(await canLaunch(qrText)){
  //     await launch(qrText);
  //   }else{
  //     throw 'could not launch URL';
  //   }
  // }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}



