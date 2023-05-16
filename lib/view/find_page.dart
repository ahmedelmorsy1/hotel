import 'package:hotel/barallel_file.dart';

class FindPage extends StatelessWidget {
  final String stus,pType;

  const FindPage( {super.key, required this.stus, required this.pType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('details')
              .where('status',
                  isEqualTo: stus)
              .where('property',
                  isEqualTo: pType)
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData ) {
              return const CircularProgressIndicator();
            }
            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                return GestureDetector(
                  onTap: ()=>navigateTo(context, DetailsPage(content: document)),
                  child: customCard(document, context));
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
