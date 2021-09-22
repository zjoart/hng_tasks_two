import 'package:flutter/material.dart';
import 'package:hngstagetwo/customfield.dart';
import 'package:hngstagetwo/inioluwa/loginpage.dart';
import 'package:hngstagetwo/inioluwa/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        initialRoute: 'login',
        routes: {
          'home': (context) => MyHomePage(),
          'login': (context) => LoginPage(),
          'signup': (context) => SignUpPage()
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController text = TextEditingController();
  final style = TextStyle();
  String? output;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: CircleAvatar(radius: 30, child: Image.asset('asset/hng.jpg')),
          centerTitle: true,
        ),
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                CustomField(
                    head: 'Input',
                    text: text,
                    hint: 'Enter input here.',
                    type: TextInputType.text),
                const SizedBox(height: 30),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      debugPrint('j');
                      getOutPut(text.text);
                    },
                    child: Container(
                        width: (MediaQuery.of(context).size.width / 100) * 30,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10)),
                        alignment: Alignment.center,
                        child: Text('Enter',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20))),
                  ),
                ),
                const SizedBox(height: 50),
                Text('Output',
                    style: TextStyle(
                        color: Color(0xFF262F3A),
                        fontSize: 17,
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 15),
                Container(
                  width: (MediaQuery.of(context).size.width / 100) * 100,
                  height: heightGet(output),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade500),
                      borderRadius: BorderRadius.circular(10)),
                  alignment: Alignment.center,
                  child: Text(output ?? '',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFF262F3A),
                          fontSize: 17,
                          fontWeight: FontWeight.w600)),
                ),
                const SizedBox(height: 50),
                Text('Links',
                    style: TextStyle(
                        color: Color(0xFF262F3A),
                        fontSize: 17,
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 15),
                Container(
                  width: (MediaQuery.of(context).size.width / 100) * 100,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade500),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                      'training.zuri.teamn\n\ninternship.zuri.team\n\nzuri.team',
                      style: TextStyle(
                          color: Color(0xFF262F3A),
                          fontSize: 17,
                          fontWeight: FontWeight.w600)),
                ),
              ],
            ),
          ),
        ));
  }

  double heightGet(String? output) {
    double h = 50;
    if (output != null) {
      if (output.length > 100) {
        h = 70;
      }
      if (output.length > 200) {
        h = 90;
      }
      if (output.length > 400) {
        h = 110;
      }
    }
    return h;
  }

  getOutPut(String text) {
    setState(() {
      output = text;
    });
  }
}
