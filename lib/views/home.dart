part of '../pages.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color favColor = Colors.grey;

  void handleFavButtonPress() {
    setState(() {
      if (favColor == Colors.grey) {
        favColor = Colors.red;
      } else {
        favColor = Colors.grey;
      }
    });
  }

  void handleBuyButtonPress() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const Buy()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade300,
        title: const Text('Mission 1',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      floatingActionButton: FloatingActionButton.extended(
          heroTag: "btn1",
          label: const Text("Buy Now"),
          onPressed: () {
            handleBuyButtonPress();
          }),
      body: Stack(children: <Widget>[
        Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
              Colors.red.shade300,
              Colors.white,
            ]))),
        Column(
          children: <Widget>[
            const Flexible(
              flex: 2,
              child: Image(
                width: double.infinity,
                image: AssetImage('assets/images/ferrari.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            Flexible(
              flex: 1,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: MediaQuery.of(context).size.width * 0.25,
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage('assets/images/ferrari1.jpg'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: MediaQuery.of(context).size.width * 0.25,
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage('assets/images/ferrari2.jpg'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: MediaQuery.of(context).size.width * 0.25,
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage('assets/images/ferrari3.jpg'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: MediaQuery.of(context).size.width * 0.25,
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage('assets/images/ferrari4.jpg'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
                flex: 4,
                child: Column(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Text("Ferrari F1-75",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center),
                    ),
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.only(
                            bottom: 10.0, left: 10.0, right: 10.0),
                        children: const <Widget>[
                          Text(
                            "The Ferrari F1-75 is a Formula One racing car designed and constructed by Scuderia Ferrari and is competing in the 2022 Formula One World Championship. The name refers to the 75th anniversary since the first Ferrari production car rolled out of the factory in Maranello. \n",
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            "The car is driven by Charles Leclerc and Carlos Sainz Jr. The chassis is Ferrari's first single seater under the 2022 FIA Technical Regulations.[3] The F1-75 currently has four wins, from the Bahrain, the Australian, the British and the Austrian Grands Prix, and 14 podiums from its 16 races. The car made its competitive debut at the 2022 Bahrain Grand Prix. \n",
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            "Compared to the winless 2020 and 2021 cars, the F1-75 was notably more competitive, as the team took pole and victory at the first race in Bahrain. This feat was repeated in Australia, despite the team's reluctance to add updates to the car. Compared to its main rival, the Red Bull RB18, the F1-75 often displayed superior cornering speeds, but the RB18 was better on the straights. Leclerc took four consecutive poles from Miami to Baku, but the team failed to convert any of these poles to wins through a combination of unreliability and poor strategy. At the British Grand Prix, Sainz took pole and won his first Formula One race. At the following race in Austria, the F1-75 took another victory with Leclerc, who achieved his 5th Grand Prix victory. \n",
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          ],
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: FloatingActionButton(
              heroTag: "btn2",
              backgroundColor: Colors.white,
              onPressed: () {
                handleFavButtonPress();
              },
              child: Icon(
                Icons.favorite,
                color: favColor,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
