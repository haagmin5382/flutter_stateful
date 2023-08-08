import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool showTile = true;

  void toggleTitle() {
    setState(() {
      showTile = !showTile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showTile ? const MyLargeTitle() : const Text('nothing'),
              IconButton(
                onPressed: toggleTitle,
                icon: const Icon(Icons.remove_red_eye),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  // MyLargeTitle에서 부모 요소의 theme의 값에 접근하길 원한다.
  // 부모 요소와 대화할 수 있길 원한다.
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  @override
  void initState() {
    super.initState();
    print('initState!');
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose!");
  }

  @override
  Widget build(BuildContext context) {
    print("Build!"); // build 메서드는 initState 이 후에 실행된다.
    // context는 Text 이전에 있는 모든 상위 요소들에 대한 정보이다.
    // BuildContext 덕분에 아주 먼 곳의 요소에 접근할 수 있다.
    // BuildContext는 위젯 트리에서 위젯의 위치를 제공하고 이를 통해 상위 요소 데이터에 접근할 수 있다.
    return Text(
      'My Large Title',
      style: TextStyle(
          fontSize: 30,
          color:
              Theme.of(context).textTheme.titleLarge?.color), // null safety 적용
    );
  }
}
