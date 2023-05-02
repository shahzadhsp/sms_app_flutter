import 'package:flutter/material.dart';
import 'package:sms_app_flutter/rules_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - kToolbarHeight;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Home Screen'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RulesScreen(),
                      ));
                },
                child: Container(
                  height: height * 0.1,
                  width: width * 0.8,
                  color: const Color(0xffff00bb),
                  child: const Center(
                    child: Text(
                      'Rule No1',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RulesScreen(),
                      ));
                },
                child: Container(
                  height: height * 0.1,
                  width: width * 0.8,
                  color: const Color(0xffff00bb),
                  child: const Center(
                    child: Text(
                      'Rule No2',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.03,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RulesScreen(),
                      ));
                },
                child: Container(
                  color: const Color(0xffff00bb),
                  height: height * 0.1,
                  width: width * 0.8,
                  child: Icon(Icons.add),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
