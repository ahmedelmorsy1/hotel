import 'package:hotel/barallel_file.dart';

class DetailsPage extends StatelessWidget {
  final dynamic content;
  const DetailsPage({
    Key? key,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(content['address']),
      ),
      body: SingleChildScrollView(
        child: Card(
            elevation: 0.5,
            shadowColor: Colors.black,
            color: const Color.fromARGB(255, 179, 201, 229),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: const Color.fromARGB(255, 116, 250, 163),
                          width: 1.0,
                        ),
                      ),
                      child: Image.network((content['image'].toString()),
                          width: MediaQuery.of(context).size.width),
                    ),
                    buildList('address', content['address'], () {}),
                    buildList('area', '${content['area']} m', () {}),
                    buildList(
                        'bathroom', content['bathroom'].toString(), () {}),
                    buildList('room', '${content['room']} rooms', () {}),
                    buildList('status', content['status'], () {}),
                    buildList('property', content['property'], () {}),
                    buildList('owner', content['owner'], () {}),
                    buildList('phone', content['phone'], () {}),
                    buildList('Garage',content['garage'] ? ' available' : ' not available',() {}),
                  ]),
            )),
      ),
    );
  }
}
