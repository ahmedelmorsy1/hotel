import '../barallel_file.dart';

class SearchPlace extends StatelessWidget {
  const SearchPlace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchModel = Provider.of<SearchPlaceModel>(context);

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(2.0),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close, size: 40),
          ),
        ),
        title: TextField(
          controller: searchModel.searchController,
          decoration: const InputDecoration(
            hintText: 'Search...',
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 1.0, style: BorderStyle.solid),
            ),
          ),
          onChanged: (value) => searchModel.query = value,
        ),
      ),
      body: StreamBuilder(
        stream: searchModel.queryController.stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: Text('Enter address'));
          }
          return StreamBuilder(
            stream: searchModel.searchResultsStream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot document = snapshot.data!.docs[index];
                  return GestureDetector(
                      onTap: () {
                        searchModel.locat = document['address'];
                         Navigator.pop(context);
                      },
                      child: customCard(document, context));
                },
              );
            },
          );
        },
      ),
    );
  }
}

// class SearchPlace extends StatefulWidget {
//   const SearchPlace({super.key});

//   @override
//   State<SearchPlace> createState() => _SearchPlaceState();
// }

// class _SearchPlaceState extends State<SearchPlace> {
//    final TextEditingController _searchController = TextEditingController();

//   final StreamController<String> _queryController = StreamController<String>.broadcast();

//   @override
//   void dispose() {
//     _searchController.dispose();
//     _queryController.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           IconButton(onPressed: ()=>navigatePop(context), icon: const Icon(Icons.close))
//         ],
//         title: TextField(
//           controller: _searchController,
//           decoration: const InputDecoration(
//             hintText: 'Search...',
//             border: InputBorder.none,
//           ),
//           onChanged: (value) => _queryController.add(value),
//         ),
//       ),
//       body: StreamBuilder(
//         stream: _queryController.stream,
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return const Center(child: Text('Enter a search query'));
//           }
//           Object? query = snapshot.data;
//           return StreamBuilder(
//             stream: FirebaseFirestore.instance.collection('details').where('address', isGreaterThanOrEqualTo: query).snapshots(),
//             builder: (context, snapshot) {
//               if (!snapshot.hasData) {
//                 return const Center(child: CircularProgressIndicator());
//               }
//               return ListView.builder(
//                 itemCount: snapshot.data!.docs.length,
//                 itemBuilder: (context, index) {
//                   DocumentSnapshot document = snapshot.data!.docs[index];
//                   return 
//                   ListTile(
//                     leading: Image.network((document['image'].toString()),),
//                     title: Text(document['address']),
//                   );
//                 },
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
// // class SearchPlace extends StatelessWidget {
// //   const SearchPlace({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return ChangeNotifierProvider(
// //       create: (_) => SearchPlaceModel(),
// //       child: Scaffold(
// //         appBar: AppBar(
// //           actions: [
// //             IconButton(
// //                 onPressed: () => Navigator.pop(context),
// //                 icon: const Icon(Icons.close))
// //           ],
// //           title: TextField(
// //             decoration: const InputDecoration(
// //               hintText: 'Search...',
// //               border: InputBorder.none,
// //             ),
// //             onChanged: (value) =>
// //                 context.read<SearchPlaceModel>().query = value,
// //           ),
// //         ),
// //         body: Consumer<SearchPlaceModel>(
// //           builder: (context, model, child) {
// //             if (model.query.isEmpty) {
// //               return const Center(child: Text('Enter a search query'));
// //             }
// //             return StreamBuilder(
// //               stream: model.searchResultsStream,
// //               builder: (context, snapshot) {
// //                 if (!snapshot.hasData) {
// //                   return const Center(child: CircularProgressIndicator());
// //                 }
// //                 return ListView.builder(
// //                   itemCount: snapshot.data!.docs.length,
// //                   itemBuilder: (context, index) {
// //                     DocumentSnapshot document = snapshot.data!.docs[index];
// //                     return ListTile(
// //                       leading: Image.network((document['image'].toString())),
// //                       title: Text(document['address']),
// //                     );
// //                   },
// //                 );
// //               },
// //             );
// //           },
// //         ),
// //       ),
// //     );
// //   }
// // }
