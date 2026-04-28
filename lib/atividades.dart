import 'package:flutter/material.dart';
void main(){

  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home()
  ));

}

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(padding: EdgeInsets.only(right: 0)),
            Text(
              "Assistente Acadêmico",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),

            FloatingActionButton(
              onPressed: null,
              backgroundColor: Colors.white,
              shape: const CircleBorder(),

              child: Icon(
                Icons.settings,
                size: 25,
                color: const Color(0xFF1E3050),
              ),
            )
          ],
        ),

        toolbarHeight: 60,
        centerTitle: true,
        backgroundColor: const Color(0xFF1E3050),

      ),
      body: Container(
        color: Colors.white,
        child: Container(
            width: 370,
            margin: EdgeInsets.fromLTRB(20, 20, 20, 230),
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.black12),
                color: Colors.white,
                borderRadius: BorderRadius.circular(12)
            ),
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 15)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(right: 20)),
                    Text(
                      "Atividades",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 21
                      ),
                    ),
                  ],
                ),

                Padding(padding: EdgeInsets.all(5)),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.only(right: 20)),
                    Text(
                      "Visão rápida das próximas entregas e prazos.",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black45
                      ),
                    )
                  ],
                ),

                Padding(padding: EdgeInsets.all(20)),

                Container(
                  margin: EdgeInsets.only(left: 10, right: 10, bottom: 15),
                  height: 80,
                  width: 320,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black12),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Padding(padding: EdgeInsets.only(bottom: 10)),
                          Text(
                            "\t\tRedação",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "\t\tPrazo: 30/4/2026",
                            style: TextStyle(
                                color: Colors.black45,
                                fontSize: 13
                            ),
                          ),
                        ],
                      ),

                      Column( children: [

                        Padding(padding: EdgeInsets.only(bottom: 29)),
                        Text(
                            "Pendente    ",
                            style: TextStyle(
                              backgroundColor: Colors.black12,
                              color: const Color(0xFF1E3050),
                            )
                        )

                      ],
                      )
                    ],
                  ),
                ),

                Padding(padding: EdgeInsets.all(3)),

                Container(
                  margin: EdgeInsets.only(left: 10, right: 10, bottom: 15),
                  height: 80,
                  width: 320,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black12),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Padding(padding: EdgeInsets.only(bottom: 10)),
                          Text(
                            "\t\tAtt. Física",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "\t\tPrazo: 3/5/2026",
                            style: TextStyle(
                                color: Colors.black45,
                                fontSize: 13
                            ),
                          ),
                        ],
                      ),
                      Column( children: [

                        Padding(padding: EdgeInsets.only(bottom: 29)),
                        Text(
                            "Pendente    ",
                            style: TextStyle(
                              backgroundColor: Colors.black12,
                              color: const Color(0xFF1E3050),
                            )
                        )
                      ],
                      )
                    ],
                  ),
                ),

                Padding(padding: EdgeInsets.all(3)),

                Container(
                  margin: EdgeInsets.only(left: 10, right: 10, bottom: 15),
                  height: 80,
                  width: 320,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black12),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Padding(padding: EdgeInsets.only(bottom: 10)),
                          Text(
                            "\t\tGeografia",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "\t\tPrazo: 12/5/2026",
                            style: TextStyle(
                                color: Colors.black45,
                                fontSize: 13
                            ),
                          ),
                        ],
                      ),
                      Column( children: [

                        Padding(padding: EdgeInsets.only(bottom: 29)),
                        Text(
                            "Pendente    ",
                            style: TextStyle(
                              backgroundColor: Colors.black12,
                              color: const Color(0xFF1E3050),
                            )
                        )
                      ],
                      )
                    ],
                  ),
                )
              ],
            )
        ),
      ),


      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.only(bottom: 10),
        child: Row (
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                IconButton(onPressed: null, icon: Icon(Icons.notifications_none), iconSize: 30,),
                Text(
                  "Lembretes",
                  style: TextStyle(
                      fontSize: 11
                  ),
                )
              ],
            ),
            Column(
              children: [
                IconButton(onPressed: null, icon: Icon(Icons.list_alt_outlined, color: const Color(0xFF1E3050)), iconSize: 30),
                Text(
                  "Atividades",
                  style: TextStyle(
                      fontSize: 11
                  ),
                )
              ],
            ),
            Column(
              children: [
                IconButton(onPressed: null, icon: Icon(Icons.group_outlined), iconSize: 30,),
                Text(
                  "Grupos",
                  style: TextStyle(
                      fontSize: 11
                  ),
                )
              ],
            ),
            Column(
              children: [
                IconButton(onPressed: null, icon: Icon(Icons.person_outline), iconSize: 30,),
                Text(
                  "Perfil",
                  style: TextStyle(
                      fontSize: 11
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
