import 'dart:io';

import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';
import '../../../main.dart';
import 'package:flutter/material.dart';

class Fruitdetc extends StatefulWidget {
  @override
  _Fruitdetc createState() => _Fruitdetc();
}

class _Fruitdetc extends State<Fruitdetc> {
  bool isWorking = false;
  String resultat = "";
  String affiche = "";
  String fruit = "";
  double val;
  CameraController cameraController;
  CameraImage imgCamera;

  initCamera() {
    cameraController = CameraController(cameras[0], ResolutionPreset.medium);
    cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {
        cameraController.startImageStream((image) {
          if (!isWorking) {
            isWorking = true;
            imgCamera = image;
            runModelOnStreamFrames();
          }
        });
      });
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/model.tflite",
      labels: "assets/vegt.txt",
    );
  }

  runModelOnStreamFrames() async {
    var recon = await Tflite.runModelOnFrame(
      bytesList: imgCamera.planes.map((e) {
        return e.bytes;
      }).toList(),
      imageHeight: imgCamera.height,
      imageWidth: imgCamera.width,
      imageMean: 127.5,
      imageStd: 127.5,
      rotation: 90,
      numResults: 1,
      threshold: 0.1,
      asynch: true,
    );
    resultat = "";
    affiche = "";
    recon.forEach((res) {
      affiche += res["label"] +
          " " +
          (res["confidence"] as double).toStringAsFixed(2) +
          "\n\n";
      val = res["confidence"] as double;
      fruit = res["label"];
      if (val > 1) {
        Navigator.of(context).pop(fruit);
      }
    });
    setState(() {
      affiche;
    });
    //Navigator.of(context).pop(affiche);
    isWorking = false;
  }

  void initState() {
    super.initState();
    loadModel();
  }

  @override
  void dispose() async {
    super.dispose();
    await Tflite.close();
    cameraController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/back.jpg'), fit: BoxFit.fill)),
            child: Column(
              children: [
                Stack(
                  children: [
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 100),
                        height: 220,
                        width: 320,
                      ),
                    ),
                    Center(
                      // ignore: deprecated_member_use
                      child: FlatButton(
                          onPressed: () {
                            initCamera();
                          },
                          child: Container(
                              margin: EdgeInsets.only(top: 35),
                              height: 270,
                              width: 360,
                              child: imgCamera == null
                                  ? Container(
                                      height: 270,
                                      width: 360,
                                      child: Icon(
                                        Icons.photo_camera_front,
                                        color: Colors.blueAccent,
                                        size: 40,
                                      ),
                                    )
                                  : AspectRatio(
                                      aspectRatio:
                                          cameraController.value.aspectRatio,
                                      child: CameraPreview(cameraController),
                                    ))),
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 55.0),
                    child: SingleChildScrollView(
                        child: Text(
                      affiche,
                      style: TextStyle(
                          backgroundColor: Colors.black,
                          fontSize: 25.0,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
