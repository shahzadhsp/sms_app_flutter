import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:telephony/telephony.dart';

class FilterScreen extends StatefulWidget {
  //const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String sms = "";
  Telephony telephony = Telephony.instance;
  String myadress = '';
  String mybody = '';
  late int mydata;
  // sms forwarder controller
  final forwarderController = TextEditingController();
  //sms receiver controlloer
  final receiveController = TextEditingController();
  // double validNumber = 03044978989;
  late SharedPreferences pref;
  List<String> list = <String>[];
//   final SmsSendStatusListener listener = (SendStatus status) {
// // Handle the status
//   };
  @override
  void initState() {
    assighnInstance();
    telephony.listenIncomingSms(
      onNewMessage: (SmsMessage message) {
        print(
            "address ----> ${message.address}"); //+977981******67, sender nubmer
        print(message.body); //sms text
        print(message.date); //1659690242000, timestamp
        setState(() {
          sms = message.body.toString();
          myadress = message.address!;
          mybody = message.body!;
          mydata = message.date!;
          if (myadress == receiveController.text) {
            sendsms();
            print('Message Forward Successfully');
          } else {
            print('Not forward please');
          }
        });
      },
      listenInBackground: false,
    );
    super.initState();
  }

  //is a key-value storage system provided by the Flutter
  //framework that allows developers to store and
  //retrieve data in a persistent way
  assighnInstance() async {
    pref = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - kTextTabBarHeight;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: receiveController,
                decoration: const InputDecoration(
                    hintText: 'Enter Receive number like +923044978989',
                    hintStyle: TextStyle(fontSize: 16)),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    receiveController.text;
                    //  sendController.clear();
                  });
                },
                child: const Text('Sve Button')),
            SizedBox(
              height: height * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                    hintText: 'Enter Forwarder number +923044978989',
                    hintStyle: TextStyle(fontSize: 16)),
                //  keyboardType: TextInputType.number,
                controller: forwarderController,
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            ElevatedButton(
                onPressed: () {
                  String phoneNumber = forwarderController.text.trim();
                  list.add(phoneNumber);
                  pref.setStringList('phone', list);
                  list = pref.getStringList('phone')!;
                //  List oldlist = pref.getStringList('phone');

                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Number Added')));
                  forwarderController.clear();
                  FocusManager.instance.primaryFocus!.unfocus();
                },
                child: const Text('Save Number')),
          ],
        ),
      ),
    );
  }

  sendsms() async {
    final SmsSendStatusListener listener = (SendStatus status) {
      print(status.toString());
    };
    SharedPreferences pref = await SharedPreferences.getInstance();
// Check if a device is capable of sending SMS
    bool? canSendSms = await telephony.isSmsCapable;
    print(canSendSms.toString());
// Get sim state
    SimState simState = await telephony.simState;
    print(simState.toString());
    List<String>? oldlist = pref.getStringList('phone');
    List<Future> newFuturesList = [];
    for (int i = 0; i < oldlist!.length; i++) {
      newFuturesList.add(
        telephony.sendSms(
            to: oldlist[i].toString(),
            message: mybody.toString(),
            statusListener: listener),
      );
    }
    await Future.wait(newFuturesList).then((value) {
      print('----- Message Forwaded -----');
    }).onError((error, stackTrace) {
      print(error);
      print(stackTrace);
    });
  }
}
