import 'package:hotel/barallel_file.dart';

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void navigatePop(context) => Navigator.pop(context);

// void showBottom(BuildContext context, var tex , void Function()? tap) {
//   showmodBotSheet(
//       context,
//       ListView.builder(
//         shrinkWrap: true,
//         itemCount: tex.length,
//         itemBuilder: (context, index) => ListTile(
//           title: CustomText(tex[index]),
//           onTap: tap,
//         ),
//       ));
// }

Widget buildListView(List<dynamic> itemList, Function(int) onTapCallback) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: itemList.length,
        itemBuilder: (context, index) => ListTile(
            title: CustomText(itemList[index]),
            onTap: () {
                onTapCallback(index);
            },
        ),
    );
}

Widget buildList( String title, String subTitle, void Function()? tap) {
  return Column(
    children: [
      ListTile(
          subtitle: Text(subTitle,style: const TextStyle(color: Colors.black,fontSize: 20),),
          title:  Text(title),
          onTap: tap),
          const Divider(thickness: 0.5,color: Colors.grey,)
    ],
  );
}

Widget buildListTwo( String title, String subTitle, void Function()? tap ,
 String title1, String subTitle1, void Function()? tap1) {
  return SizedBox(
    width: 400,
    child: Row(
      children: [
        SizedBox(
          width: 180,
          child: ListTile(
              subtitle: Text(subTitle,style: const TextStyle(color: Colors.black,fontSize: 18),),
              title:  Text(title),
              onTap: tap),
        ),
            const VerticalDivider(thickness: 0.5,color: Colors.grey,),
            SizedBox(width: 180,
              child: ListTile(
              subtitle: Text(subTitle1,style: const TextStyle(color: Colors.black,fontSize: 18),),
              title:  Text(title1),
              onTap: tap1),
            ),
      ],
    ),
  );
}
