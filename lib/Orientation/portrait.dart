import 'package:flutter/material.dart';

portrait(BuildContext context, String expression, String answer,
    List<String> buttontxt, Function Button) {
  return Container(
    width: double.infinity,
    decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
      Color.fromARGB(255, 192, 225, 252),
      Colors.white,
      Color.fromARGB(255, 192, 225, 252),
    ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 90, 0, 0),
            width: double.infinity,
            decoration: const BoxDecoration(color: Colors.transparent),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        expression,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 28,
                            color: Colors.grey[800],
                            letterSpacing: 1),
                      ),
                    )),
                Align(
                    alignment: Alignment.bottomRight,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        answer,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.5,
                        ),
                        maxLines: 1,
                      ),
                    ))
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: GridView.builder(
                itemCount: buttontxt.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, crossAxisSpacing: 8, mainAxisSpacing: 8),
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return Button(const Color.fromARGB(255, 93, 204, 23),
                        buttontxt[index], Colors.white, index, 12.0);
                  }
                  if (index == 1) {
                    return Button(Colors.red, buttontxt[index], Colors.white,
                        index, 12.0);
                  }
                  if (index == 4 ||
                      index == 5 ||
                      index == 6 ||
                      index == 8 ||
                      index == 9 ||
                      index == 10 ||
                      index == 12 ||
                      index == 13 ||
                      index == 14 ||
                      index == 16 ||
                      index == 17 ||
                      index == 18) {
                    return Button(Colors.white, buttontxt[index],
                        const Color.fromARGB(255, 3, 183, 255), index, 12.0);
                  }

                  return Button(const Color.fromARGB(255, 3, 183, 255),
                      buttontxt[index], Colors.white, index, 12.0);
                }),
          )
        ],
      ),
    ),
  );
}
