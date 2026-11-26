import 'package:material_ui/material_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Points Counter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int teamAPoints = 0;
  int teamBPoints = 0;
  void addPointsToTeamA(int amount) {
    setState(() {
      teamAPoints += amount;
    });
  }

  void addPointsToTeamB(int amount) {
    setState(() {
      teamBPoints += amount;
    });
  }

  void rest() {
    setState(() {
      teamAPoints = 0;
      teamBPoints = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("point counter"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TeamColumn(
                teamName: 'Team A',
                score: teamAPoints,
                onAdd: addPointsToTeamA,
              ),
              VerticalDivider(width: 20),
              TeamColumn(
                teamName: 'Team B',
                score: teamBPoints,
                onAdd: addPointsToTeamB,
              ),
            ],
          ),
          Center(
            child: CustomButton(btnName: 'RESET', onTap: rest),
          ),
        ],
      ),
    );
  }
}

class TeamColumn extends StatelessWidget {
  const TeamColumn({
    super.key,
    required this.teamName,
    required this.score,
    required this.onAdd,
  });

  final String teamName;
  final int score;
  final void Function(int) onAdd;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(teamName, style: TextStyle(fontSize: 20)),

        Text('$score', style: TextStyle(fontSize: 80)),

        CustomButton(btnName: 'Add 1 Point', onTap: () => onAdd(1)),
        CustomButton(btnName: 'Add 2 Point', onTap: () => onAdd(2)),
        CustomButton(btnName: 'Add 3 Point', onTap: () => onAdd(3)),
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.btnName, this.onTap});
  final String btnName;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.all(8),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.deepOrange,
        ),
        child: Text(
          btnName,
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
      ),
    );
  }
}
