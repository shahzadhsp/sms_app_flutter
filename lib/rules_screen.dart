import 'package:flutter/material.dart';

class RulesScreen extends StatefulWidget {
  const RulesScreen({super.key});

  @override
  State<RulesScreen> createState() => _RulesScreenState();
}

class _RulesScreenState extends State<RulesScreen> {
  String _selectedSims = 'sim1';
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - kToolbarHeight;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Rules Screen',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.02,
            ),
            Text(
              'Name',
              style: TextStyle(color: Colors.blue, fontSize: 18),
            ),
            // SizedBox(
            //   height: height * 0.01,
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 34.0),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: 'Enter your Rule',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 3),
                        borderRadius: BorderRadius.circular(16.0))),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            const Text(
              'History',
              style: TextStyle(fontSize: 18, color: Colors.blue),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                color: Colors.pinkAccent,
                height: height * 0.5,
                width: width * 0.8,
                child: const Center(
                    child: Text(
                  'Show History here',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w500),
                )),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Text('Filter',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 18)),
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              color: Colors.pink,
              height: height * 0.5,
              width: width * 0.8,
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Sim',
                          style: TextStyle(fontSize: 20),
                        )),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        //color: Colors.blue,
                        width: 104,
                        child: ListTile(
                          leading: Radio<String>(
                            value: 'All',
                            groupValue: _selectedSims,
                            onChanged: (value) {
                              setState(() {
                                _selectedSims = value!;
                              });
                            },
                          ),
                          title: Text(
                            'All',
                          ),
                        ),
                      ),
                      Container(
                        width: 104,
                        // color: Colors.red,
                        child: ListTile(
                          leading: Radio<String>(
                            value: 'Sim1',
                            groupValue: _selectedSims,
                            onChanged: (value) {
                              setState(() {
                                _selectedSims = value!;
                              });
                            },
                          ),
                          title: const Text('Sim1'),
                        ),
                      ),
                      Container(
                        width: 104,
                        //color: Colors.green,
                        child: ListTile(
                          leading: Radio<String>(
                            value: 'Sim2',
                            groupValue: _selectedSims,
                            onChanged: (value) {
                              setState(() {
                                _selectedSims = value!;
                              });
                            },
                          ),
                          title: const Text('Sim2'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.015,
                  ),
                  Column(
                    children: [
                      Text(
                        'Sender',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: height * 0.015,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Enter your number',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(width: 3),
                                borderRadius: BorderRadius.circular(16.0))),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Text(
              'Action',
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
            Container(
              color: Colors.pink,
              height: height * 0.5,
              width: width * 0.8,
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Forwarder as Sms',
                          style: TextStyle(fontSize: 20),
                        )),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  SizedBox(
                    height: height * 0.015,
                  ),
                  Column(
                    children: [
                      Text(
                        'Send to',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: height * 0.015,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Enter your number',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(width: 3),
                                borderRadius: BorderRadius.circular(16.0))),
                      ),
                    ],
                  )
                ],
              ),
            ),
            // SizedBox(
            //   height: height * 0.01,
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  color: Colors.pink,
                  child: TextButton(
                      onPressed: () {
                        
                      },
                      child: Text(
                        'Save',
                        style: TextStyle(color: Colors.black),
                      ))),
            )
          ],
        ),
      ),
    );
  }
}
