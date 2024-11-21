import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'onboarding.dart'; 
import 'color.dart';
import 'home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Check if onboarding is completed
  final prefs = await SharedPreferences.getInstance();
  final hasSeenOnboarding = prefs.getBool('hasSeenOnboarding') ?? false;

  runApp(MyApp(startupScreen: hasSeenOnboarding ? const MyHomePage(title: 'ShoeHub') : OnboardingScreen()));
}

class MyApp extends StatelessWidget {
  final Widget startupScreen;

  const MyApp({Key? key, required this.startupScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: shoehubtheme,
      home: startupScreen, // Set the initial screen
    );
  }
}

// TODO: Build a Shrine Theme (103)
final ThemeData shoehubtheme = _buildHubTheme();

ThemeData _buildHubTheme() {
  final ThemeData base = ThemeData.light(useMaterial3: true);
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: kuning,
      onPrimary: kShrineBrown900,
      secondary: hitam,
      error: error,
    ),
    textTheme: base.textTheme.apply(
      fontFamily: 'Poppins',
    ),
    // TODO: Add the text themes (103)
    // TODO: Decorate the inputs (103)
  );
}

// TODO: Build a Shrine Text Theme (103)
TextTheme _buildshoehubtexttheme(TextTheme base) {
  return base
      .copyWith(
        headlineSmall: base.headlineSmall!.copyWith(
          fontWeight: FontWeight.w500,
        ),
        titleLarge: base.titleLarge!.copyWith(
          fontSize: 18.0,
        ),
        bodySmall: base.bodySmall!.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
        bodyLarge: base.bodyLarge!.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
      )
      .apply(
        fontFamily: 'Poppins',
        displayColor: hitam,
        bodyColor: hitam,
      );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // TODO: Add text editing controllers (101)
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  // TODO: Add TextField widgets (101)
  // [Name]


  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
    });
  }


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              SizedBox(
                width: 300, // Adjust the width as needed
                height: 300, // Adjust the height as needed
                child: Image.asset('logo.png'), // Your logo asset
              ),

            const Text(
              'ShoeHub',style: TextStyle(fontFamily: 'Poppins', fontSize: 24),
            ),
              const Padding(
                padding: EdgeInsets.all(16.0)
              ),
              Padding(
                padding: const EdgeInsets.all(16.0), // Adjust the value as needed
                child: TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(labelText: 'Username'),
                ),
              ),

            // [Password] 

                
               const Padding(
                padding: const EdgeInsets.all(16.0)
              ),
              Padding(
                padding: const EdgeInsets.all(16.0), // Adjust the value as needed
                child: TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'Password'),
                ),
              ),

        

              // TODO: Add button bar (101)
              const Padding(
                padding: const EdgeInsets.all(16.0)
              ),
              OverflowBar(
                alignment: MainAxisAlignment.end,
                // TODO: Add a beveled rectangular border to CANCEL (103)
                children: <Widget>[
                  // TODO: Add buttons (101)
                                    // TODO: Add buttons (101)
              TextButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  _usernameController.clear();
                  _passwordController.clear();
                },
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).colorScheme.secondary, // Use foregroundColor instead of primary
                ),
              ),

              
              // TODO: Add an elevation to NEXT (103)
              // TODO: Add a beveled rectangular border to NEXT (103)
            ElevatedButton(
              child: const Text('NEXT'),
              onPressed: () {
                _usernameController.clear();
                _passwordController.clear();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: hitam, // Text color
                backgroundColor: kuning, // Button background color
                elevation: 5.0, // Shadow effect
              ),
            ),


              
                ],
              ),
              
          ],
          
        ),
      ),
    );
  }
}
