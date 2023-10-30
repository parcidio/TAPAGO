import 'package:flutter/material.dart';

/// Flutter code sample for [NavigationBar].

void main() => runApp(const NavigationBarApp());

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: NavigationExample(), debugShowCheckedModeBanner: false);
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Color.fromRGBO(16, 93, 63, 0.25),
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.wallet),
            icon: Icon(Icons.wallet_outlined),
            label: 'wallet',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.graphic_eq),
            icon: Icon(Icons.graphic_eq_outlined),
            label: 'Analise',
          ),
        ],
      ),
      body: <Widget>[
        Container(
            color: Colors.white,
            alignment: Alignment.center,
            child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  leading: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50?s=70s'),
                      )),
                  actions: <Widget>[
                    IconButton(
                      icon:
                          const Icon(Icons.notifications, color: Colors.black),
                      tooltip: 'Show Snackbar',
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content:
                              Text('This is a snackbar for the notification'),
                          duration: Duration(seconds: 2),
                        ));
                      },
                    ),
                    Card(
                        elevation: 1,
                        color: Colors.grey.shade200,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                        ),
                        child: InkWell(
                          splashColor: Color.fromRGBO(16, 93, 63, 0.25),
                          onTap: () {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content:
                                  Text('This is a snackbar for the QR code'),
                              duration: Duration(seconds: 2),
                            ));
                            debugPrint('Card tapped.');
                          },
                          child: const SizedBox(
                            width: 40,
                            child: Center(
                              child: Icon(Icons.qr_code_scanner_rounded,
                                  color: Colors.black),
                            ),
                          ),
                        )),
                  ],
                ),
                body: Column(children: <Widget>[
                  const Text("O teu balanco desponivel"),
                  const Text("KWZ 21,050.00"),
                  Flexible(
                    child: GridView.count(
                      // Create a grid with 2 columns. If you change the scrollDirection to
                      // horizontal, this produces 2 rows.
                      crossAxisCount: 2,
                      // Generate 100 widgets that display their index in the List.
                      children: List.generate(4, (index) {
                        return Center(
                          child: Card(
                            clipBehavior: Clip.hardEdge,
                            elevation: 0,
                            color: Color.fromRGBO(16, 93, 63, 0.25),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Theme.of(context).colorScheme.outline,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                            ),
                            child: const SizedBox(
                              width: 300,
                              height: 300,
                              child: Column(children: <Widget>[
                                Icon(Icons.store),
                                Text('Outlined Card')
                              ]),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                    child: ListView(
                      // This next line does the trick.
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          width: 160,
                          color: Colors.red,
                        ),
                        Container(
                          width: 160,
                          color: Colors.blue,
                        ),
                        Container(
                          width: 160,
                          color: Colors.green,
                        ),
                        Container(
                          width: 160,
                          color: Colors.yellow,
                        ),
                        Container(
                          width: 160,
                          color: Colors.orange,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        Container(
                          width: 160,
                          color: Colors.red,
                        ),
                        Container(
                          width: 160,
                          color: Colors.blue,
                        ),
                        Container(
                          width: 160,
                          color: Colors.green,
                        ),
                        Container(
                          width: 160,
                          color: Colors.yellow,
                        ),
                        Container(
                          width: 160,
                          color: Colors.orange,
                        ),
                      ],
                    ),
                  ),
                ]))),
        Container(
          color: Colors.white12,
          alignment: Alignment.center,
          child: const Text('Wallet'),
        ),
        Container(
          color: Colors.white12,
          alignment: Alignment.center,
          child: const Text('Analise'),
        ),
      ][currentPageIndex],
    );
  }
}
