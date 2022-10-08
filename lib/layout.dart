import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ui/home.dart';
import 'routes.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  _LayoutState createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  MyRoute? myCurrentRoute;
  bool isFullScreen = false;
  bool isFirstScreen = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: _buildDrawer(context),
      body: SafeArea(
        child: Stack(
          children: [
            Navigator(
              key: _navigatorKey,
              initialRoute: '/',
              onGenerateRoute: _onGenerateRoute,
            ),
            IconButton(
              color: isFirstScreen ? Colors.white : Colors.grey[900],
              icon: const Icon(
                Icons.settings,
              ),
              onPressed: () {
                _scaffoldKey.currentState!.openDrawer();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            if (myCurrentRoute != null)
              Container(
                color: Colors.grey[900],
                child: Row(
                  children: [
                    SizedBox(
                      height: 42,
                      width: 42,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          size: 20,
                        ),
                        onPressed: () {
                          setState(() {
                            myCurrentRoute = null;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          myCurrentRoute!.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 42,
                      height: 42,
                    )
                  ],
                ),
              ),
            Expanded(
              child: myCurrentRoute == null
                  ? ListView.builder(
                      itemCount: Routes.routes.length,
                      itemBuilder: (BuildContext context, int index) {
                        MyRoute route = Routes.routes[index];

                        return ListTile(
                          title: Text(
                            route.title,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              myCurrentRoute = route;
                            });
                          },
                        );
                      },
                    )
                  : Padding(
                      padding: const EdgeInsets.all(10),
                      child: myCurrentRoute!.setting.build(() {
                        setState(() {
                          isFirstScreen = false;
                        });
                        _navigatorKey.currentState!
                            .pushReplacementNamed(myCurrentRoute!.path);
                      }),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _createDrawerBottomButton(
                        icon: Icons.screen_rotation_alt,
                        onPressed: () {
                          if (MediaQuery.of(context).orientation ==
                              Orientation.landscape) {
                            SystemChrome.setPreferredOrientations([
                              DeviceOrientation.portraitUp,
                            ]);
                          } else {
                            SystemChrome.setPreferredOrientations([
                              DeviceOrientation.landscapeLeft,
                            ]);
                          }
                        }),
                    _createDrawerBottomButton(
                        icon: Icons.fullscreen,
                        onPressed: () {
                          if (!isFullScreen) {
                            SystemChrome.setEnabledSystemUIMode(
                                SystemUiMode.manual,
                                overlays: []);
                            isFullScreen = true;
                          } else {
                            SystemChrome.setEnabledSystemUIMode(
                                SystemUiMode.edgeToEdge);
                            isFullScreen = false;
                          }
                        }),
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createDrawerBottomButton(
      {required IconData icon, required Function onPressed}) {
    return TextButton(
        style: IconButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.grey[800],
        ),
        child: Icon(
          icon,
          size: 18,
        ),
        onPressed: () {
          onPressed();
        });
  }

  Route _onGenerateRoute(RouteSettings settings) {
    Widget? screen;

    for (MyRoute route in Routes.routes) {
      if (route.path == settings.name) {
        screen = route.buildScreen(route.setting.json);
        break;
      }
    }

    screen ??= const HomeScreen();

    _scaffoldKey.currentState!.closeDrawer();

    return MaterialPageRoute<dynamic>(
      builder: (context) {
        return screen!;
      },
      settings: settings,
    );
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    super.dispose();
  }
}
