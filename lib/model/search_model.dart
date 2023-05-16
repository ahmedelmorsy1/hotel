import 'package:hotel/barallel_file.dart';
class SearchPlaceModel extends ChangeNotifier {
  final TextEditingController searchController = TextEditingController();

  final StreamController<String> queryController =
      StreamController<String>.broadcast();

  String _query = '';

  String get query => _query;

int _statusNum = 0;

  int get statusNum => _statusNum;
  set statusNum(int value) {
    _statusNum = value;
    notifyListeners();
  }

   int _propNum = 0;

  int get propNum => _propNum;

  set propNum(int value) {
    _propNum = value;
    notifyListeners();
  }
    String _locat ='damanhour';

  String get locat => _locat;

  set locat(String value) {
    _locat = value;
    notifyListeners();
  }

  set query(String value) {
    _query = value;
    queryController.add(value);
    notifyListeners();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> get searchResultsStream =>
      FirebaseFirestore.instance
          .collection('details')
          .where('address', isGreaterThanOrEqualTo: query).where('address', isLessThan: '${query}z')
          .snapshots();

  // Stream<QuerySnapshot<Map<String, dynamic>>> get searchResults =>
  //     FirebaseFirestore.instance
  //         .collection('details')
  //         .where('address', isGreaterThanOrEqualTo: query)
  //         .where('status', isEqualTo: query)
  //         .where('property', isEqualTo: query)
  //         .snapshots();
  
  @override
  void dispose() {
    searchController.dispose();
    queryController.close();
    super.dispose();
  }
}