import 'package:hotel/barallel_file.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Hotel app')),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('details').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  shrinkWrap: true,
                  reverse: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    QueryDocumentSnapshot content = snapshot.data!.docs[index];
                    return GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        SlideBottomRoute(
                          widget: DetailsPage(content: content),
                        ),
                      ),
                      child: Card(
                          elevation: 0.5,
                          shadowColor: Colors.black,
                          color: const Color.fromARGB(255, 179, 201, 229),
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Image.network((content['image'].toString()),
                                      height: 200,
                                      width: MediaQuery.of(context).size.width),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text('address: ${content['address']}'),
                                        Text('area: ${content['area']} m'),
                                      ]),
                                  const SizedBox(height: 10),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text('${content['bathroom']} bathroom'),
                                        Text('${content['room']} rooms'),
                                        Text('price: ${content['price']}\$'),
                                      ]),
                                ]),
                          )),
                    );
                  });
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
      floatingActionButton: Container(
        decoration: ShapeDecoration(
          color: const Color.fromARGB(255, 55, 50, 89),
            shape: RoundedRectangleBorder(
          side: const BorderSide(width: 2),
          borderRadius: BorderRadius.circular(50),
        )),
        child: TextButton(
            onPressed: () {
              navigateTo(context, const SearchPage());
            },
            child: const Icon(Icons.search,color: Colors.white,),),
      ),
    ));
  }
}
