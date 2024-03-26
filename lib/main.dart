import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> name = ["Lumina", "Cecilia", "Nami", "Lumina"];
  int? selected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Hovering Image",
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(4, (index) {
            return Padding(
              padding: EdgeInsets.only(
                top: index % 2 == 0 ? 32 : 0,
                left: 8,
                right: 8,
              ),
              child: InkWell(
                onHover: (_) {
                  if (selected != index) {
                    if (_) selected = index;
                  } else {
                    if (!_) selected = null;
                  }
                  setState(() {});
                },
                onTap: () {
                  if (selected != index) {
                    selected = index;
                  }
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  height: 500,
                  width: selected != index ? 200 : 300,
                  color: Colors.white,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // if (selected != index)
                      //   GradientMap(
                      //     height: 500,
                      //     width: selected != index ? 200 : 300,
                      //     color1: Colors.orange[200]!,
                      //     color2: Colors.orange[200]!,
                      //     contrast: 0,
                      //     imageProvider:
                      //         AssetImage("assets/Frame ${index + 1}.png"),
                      //   ),
                      // if (selected == index)
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        height: 500,
                        width: selected != index ? 200 : 300,
                        child: Image.asset(
                          "assets/Frame ${index + 1}.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      if (selected != index)
                        Container(
                          height: 500,
                          width: 300,
                          color: Colors.black.withOpacity(0.75),
                        ),

                      AnimatedPositioned(
                        bottom: selected == index ? 16 : -100,
                        duration: const Duration(
                          milliseconds: 250,
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          // height: 48,
                          // width: 30,
                          child: Text(
                            name[index],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
