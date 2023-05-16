import 'package:hotel/barallel_file.dart';

showmodBotSheet(BuildContext context, Widget child) {
  showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: child));
      });
}

Widget buildListTile(
    String title, String subTitle, IconData icon, void Function()? tapHandler) {
  return Container(
    margin: const EdgeInsets.all(4),
    height: 90,
    width: 350,
    child: ListTile(
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 2),
        borderRadius: BorderRadius.circular(25),
      ),
      leading: CircleAvatar(child: Icon(icon, size: 26)),
      title: Text(
        title,
        // style: const TextStyle(fontSize: 24, fontFamily: 'RobotoCondensed'),
      ),
      subtitle: Text(subTitle),
      onTap: tapHandler,
    ),
  );
}
