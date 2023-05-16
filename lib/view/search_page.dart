import 'package:hotel/barallel_file.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final searchModel = Provider.of<SearchPlaceModel>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Search'),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildListTile( 'pick Location',searchModel.locat, Icons.location_on,
                  () {
                Navigator.push(context,
                  SlideBottomRoute(widget: const SearchPlace()),
                );
              }),
              buildListTile( 'Type of property',propType[searchModel.propNum], Icons.location_on, () {
                showmodBotSheet(
                    context,
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: propType.length,
                      itemBuilder: (context, index) => ListTile(
                        title: CustomText(propType[index]),
                        onTap: () {
                          searchModel.propNum = index;
                          navigatePop(context);
                        },
                      ),
                    ));
              }),
              
              buildListTile('Status',status[searchModel.statusNum],  Icons.home, () {
                showmodBotSheet(context,
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: status.length,
                      itemBuilder: (context, index) => ListTile(
                        title: CustomText(status[index]),
                        onTap: () {
                          searchModel.statusNum = index;
                          navigatePop(context);
                        },
                      ),
                    ));
              }),
              Container(width: 200,
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    navigateTo(context,
                      FindPage(stus:status[searchModel.statusNum],
                      pType:propType[searchModel.propNum]));
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ))),
                  child: const Text('Find',style: TextStyle(fontSize: 25),),
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}
