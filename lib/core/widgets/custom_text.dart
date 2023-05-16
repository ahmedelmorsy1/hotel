import 'package:hotel/barallel_file.dart';

class CustomText extends StatelessWidget {
  final String text;
  
  const CustomText( this.text,{super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text(text,
            ),
          const Divider(height: 10,),
        ],
      ),
    );
  }
}