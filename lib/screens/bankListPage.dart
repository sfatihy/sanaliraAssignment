import 'package:flutter/material.dart';
import 'package:sanalira_example/model/bankModel.dart';
import 'package:provider/provider.dart';
import 'package:sanalira_example/provider/bankProvider.dart';
import 'package:sanalira_example/widgets/CustomBottomSheet.dart';

class BankListPage extends StatelessWidget {
  BankListPage({Key? key}) : super(key: key);

  String logo = "assets/sanaliraLogo.png";

  String cardTitle = "Türk Lirası";
  String cardSubtitle = "TL";
  String cardTrailing = "234 ₺";

  String bodyText1 = "Türk lirası yatırmak için banka seçiniz.";
  String bodyText2 = "Havale / EFT ile para gönderin.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Container(
            margin: EdgeInsets.only(left: 16, top: 8, bottom: 8),
            padding: EdgeInsets.only(left: 8,right: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Icon(Icons.arrow_back, color: Colors.black,),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color(0xffF3F4F6),
        elevation: 0,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 16, top: 8, bottom: 8),
            padding: EdgeInsets.only(left: 8,right: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Icon(Icons.notifications),
          ),
          Container(
            margin: EdgeInsets.only(right: 16, top: 8, bottom: 8),
            padding: EdgeInsets.only(left: 8,right: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Icon(Icons.settings),
          ),
        ],
        actionsIconTheme: IconThemeData(
          color: Colors.black
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                color: Colors.white,
                child: ListTile(
                  leading: Image.asset(logo, width: 48,),
                  title: Text(cardTitle),
                  subtitle: Text(cardSubtitle, style: Theme.of(context).textTheme.bodyText2),
                  trailing: Text(cardTrailing, style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 16),),
                )
              ),
              SizedBox(height: 10,),
              Text(bodyText1, style: Theme.of(context).textTheme.bodyText2,),
              SizedBox(height: 10,),
              FutureBuilder<BankModel>(
                future: context.read<BankProvider>().getBankData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {

                      List<Datum> banks = snapshot.data!.data;

                      return Expanded(
                        child: ListView.builder(
                          itemCount: snapshot.data?.data.length,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              margin: EdgeInsets.only(bottom: 10),
                              child: ListTile(
                                leading: Image.asset(logo),
                                title: Text(banks[index].bankName, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Color(0xFF141C2D), fontWeight: FontWeight.w600, fontSize: 12),),
                                subtitle: Text(bodyText2, style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 12)),
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                                    ),
                                    backgroundColor: Colors.white,
                                    builder: (BuildContext context) {
                                    return CustomBottomSheet(
                                      bankAccountName: banks[index].bankAccountName,
                                      bankIban: banks[index].bankIban,
                                      descriptionNo: banks[index].descriptionNo,
                                    );
                                  });
                                },
                              ),
                            );
                        }),
                      );
                    }
                    else {
                      return Text(snapshot.error.toString());
                    }
                  }
                  else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
              })
            ],
          ),
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Bir"),
          BottomNavigationBarItem(icon: Icon(Icons.transform), label: "İki"),
          BottomNavigationBarItem(icon: Icon(Icons.menu, color: Colors.transparent), label: "Üç"),
          BottomNavigationBarItem(icon: Icon(Icons.credit_card), label: "Dört"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Beş"),
        ],
        currentIndex: 3,
      ),
      floatingActionButton: const FloatingActionButton(
        child: Icon(Icons.menu_sharp),
        onPressed: null,
        elevation: 4,
        backgroundColor: Color(0xFF252741),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
