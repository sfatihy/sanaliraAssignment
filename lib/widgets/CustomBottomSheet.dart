import 'package:flutter/material.dart';
import 'package:sanalira_example/widgets/CustomBottomSheetContainer.dart';

class CustomBottomSheet extends StatelessWidget {

  final String bankAccountName;
  final String bankIban;
  final String descriptionNo;

  CustomBottomSheet({
    Key? key,
    required this.bankAccountName,
    required this.bankIban,
    required this.descriptionNo,
  }) : super(key: key);

  String bodyText1 = "Lütfen havale yaparken açıklama alanına yukarıdaki kodu yazmayı unutmayın.";
  String bodyText2 = "Eksik bilgi girilmesi sebebiyle tutarın askıda kalması durumunda, ücret kesintisi yapılacaktır.";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 50,
              height: 3,
              decoration: BoxDecoration(
                color: Color(0xFF141C2D),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
          const SizedBox(height: 25,),
          Text("Hesap Adı", style: Theme.of(context).textTheme.bodyText2,),
          const SizedBox(height: 5,),
          CustomBottomSheetContainer(text: bankAccountName),
          const SizedBox(height: 10,),
          Text("IBAN", style: Theme.of(context).textTheme.bodyText2,),
          const SizedBox(height: 5,),
          CustomBottomSheetContainer(text: bankIban),
          const SizedBox(height: 10,),
          Text("Açıklama", style: Theme.of(context).textTheme.bodyText2,),
          const SizedBox(height: 5,),
          CustomBottomSheetContainer(text: descriptionNo),
          const SizedBox(height: 15,),
          Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Color(0xFFF3F4F6),
            ),
            child: Text(bodyText1, style: TextStyle(color: Color(0xFFBCC2CE), fontSize: 12), textAlign: TextAlign.center,),
          ),
          const SizedBox(height: 15,),
          Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Color(0xFFFFF6F6),
            ),
            child: Text(bodyText2, style: TextStyle(color: Color(0xFFF64949), fontSize: 12), textAlign: TextAlign.center,),
          ),
        ],
      ),
    );
  }
}