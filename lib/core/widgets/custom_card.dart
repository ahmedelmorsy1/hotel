import '../../barallel_file.dart';

Widget customCard(document, BuildContext context) {
  return Card(
      elevation: 0.5,
      shadowColor: Colors.black,
      color: const Color.fromARGB(255, 179, 201, 229),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Image.network((document['image'].toString()),
              height: 150, width: MediaQuery.of(context).size.width),
          buildList('address', document['address'], () {}),
          buildListTwo('area', '${document['area']} m', () {}, 'bathroom',
              document['bathroom'].toString(), () {}),
          buildListTwo('room', '${document['room']} rooms', () {}, 'status',
              document['status'], () {}),
          buildListTwo('property', document['property'], () {},'Garage',
              document['garage'] ? ' available' : ' not available', () {},),
          buildListTwo( 'owner',document['owner'], () {},'phone', document['phone'], () async{            
          }, ),
        ]),
      ));
}
