import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sanalira_example/provider/bankProvider.dart';
import 'package:sanalira_example/screens/bankListPage.dart';
import 'package:sanalira_example/widgets/TextFormFieldContainer.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final _signUpFormKey = GlobalKey<FormState>();

  TextEditingController _signUpFirstNameController = TextEditingController();
  TextEditingController _signUpLastNameController = TextEditingController();
  TextEditingController _signUpEmailAddressController = TextEditingController();
  TextEditingController _signUpPasswordController = TextEditingController();
  TextEditingController _signUpPhoneNumberController = TextEditingController();

  bool? isChecked = false;

  String loginBackgound = "assets/loginBackground.png";
  String logo = "assets/sanaliraLogo.png";

  String companyName = "SanaLira";

  String bodyText1 = "SanaLira'ya ";
  String bodyText2 = "Yeni Üyelik";
  String bodyText3 = "Bilgilerinizi girip sözleşmeyi onaylayın.";

  String formName1 = "Ad";
  String formName2 = "Soyad";
  String formName3 = "E-posta";
  String formName4 = "Şifre";
  String formName5 = "Cep Telefonu Numaranız";

  String hintText1 = "Eşref IBAN";
  String hintText2 = "Yaşa";
  String hintText3 = "esrefyasa@monegon.com";
  String hintText4 = "**********";

  String formText1 = "Hesabınızı oluştururken ";
  String formText2 = "sözleşme ve koşulları ";
  String formText3 = "kabul etmeniz gerekir.";

  String formButtonText = "Giriş Yap";


  @override
  void initState() {
    isUser();
  }

  Future isUser() async {
    if(await context.read<BankProvider>().isUserLogIn() == true) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BankListPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(loginBackgound),
              fit: BoxFit.fill
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(48.0),
                  child: Row(
                    children: [
                      Spacer(),
                      Image.asset(logo, height: 64,),
                      SizedBox(width: 25,),
                      Text(companyName, style: Theme.of(context).textTheme.headline6?.copyWith(fontSize: 25)),
                      Spacer()
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)
                    ),
                    color: Color(0xff252D3D).withAlpha(230),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 25,),
                      Row(
                        children: [
                          Text(bodyText1, style: Theme.of(context).textTheme.headline6?.copyWith(color: Theme.of(context).primaryColor)),
                          Text(bodyText2, style: Theme.of(context).textTheme.headline6,),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Text(bodyText3, style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 15)),
                      Form(
                        key: _signUpFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 16, bottom: 4),
                              child: Text(formName1, style: Theme.of(context).textTheme.bodyText2,),
                            ),
                            TextFormFieldContainer(
                              widget: TextFormField(
                                decoration: InputDecoration(
                                  hintText: hintText1,
                                ),
                                style: Theme.of(context).textTheme.bodyText1,
                                controller: _signUpFirstNameController,
                                validator: (value) {
                                  value = value!.trim();
                                  if (value.length < 3 || value.length > 50) {
                                    return "En az 3 en çok 50 karakter girebilirsiniz.";
                                  }
                                  else{
                                    return null;
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8, bottom: 4),
                              child: Text(formName2, style: Theme.of(context).textTheme.bodyText2,),
                            ),
                            TextFormFieldContainer(
                              widget: TextFormField(
                                decoration: InputDecoration(
                                  hintText: hintText2,
                                ),
                                style: Theme.of(context).textTheme.bodyText1,
                                controller: _signUpLastNameController,
                                validator: (value) {
                                  value = value!.trim();
                                  if (value.length < 3 || value.length > 50) {
                                    return "En az 3 en çok 50 karakter girebilirsiniz.";
                                  }
                                  else{
                                    return null;
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8, bottom: 4),
                              child: Text(formName3, style: Theme.of(context).textTheme.bodyText2,),
                            ),
                            TextFormFieldContainer(
                                widget: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: hintText3,
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  style: Theme.of(context).textTheme.bodyText1,
                                  controller: _signUpEmailAddressController,
                                  validator: (value) {
                                    value = value!.trim();
                                    if (value.contains("@")) {
                                      return null;
                                    }
                                    else{
                                      return "Doğru bir e-posta giriniz.";
                                    }
                                  },
                                ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8, bottom: 4),
                              child: Text(formName4, style: Theme.of(context).textTheme.bodyText2,),
                            ),
                            TextFormFieldContainer(
                              widget: TextFormField(
                                decoration: InputDecoration(
                                  hintText: hintText4,
                                ),
                                style: Theme.of(context).textTheme.bodyText1,
                                obscureText: true,
                                controller: _signUpPasswordController,
                                validator: (value) {
                                  String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~+-]).{6,50}$';
                                  RegExp regExp = RegExp(pattern);
                                  if(regExp.hasMatch(value!)) {
                                    return null;
                                  }
                                  else {
                                    return "Şifre gerekli koşulları sağlamıyor.";
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8, bottom: 4),
                              child: Text(formName5, style: Theme.of(context).textTheme.bodyText2,),
                            ),
                            Row(
                              children: [
                                Container(
                                  constraints: BoxConstraints(
                                    minHeight: 50,
                                    minWidth: 75
                                  ),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 1
                                    )
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.flag),
                                      Text("+90"),
                                    ],
                                  )
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 8),
                                  constraints: BoxConstraints(
                                    maxWidth: MediaQuery.of(context).size.width - 115, //
                                    minWidth: MediaQuery.of(context).size.width / 2
                                  ),
                                  child: TextFormFieldContainer(
                                    widget: TextFormField(
                                      style: Theme.of(context).textTheme.bodyText1,
                                      keyboardType: TextInputType.number,
                                      controller: _signUpPhoneNumberController,
                                      validator: (value) {
                                        if (value!.length != 10) {
                                          return "10 rakam olmak zorunda.";
                                        }
                                        else{
                                          if (value[0] != "5") {
                                            return "Doğru bir telefon numarası giriniz.";
                                          }
                                          return null;
                                        }
                                      },
                                    ),
                                  )
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Checkbox(
                                  value: isChecked,
                                  checkColor: Colors.black,
                                  fillColor: MaterialStateProperty.all(Colors.white),
                                  shape: StadiumBorder(),
                                  onChanged: (value) {
                                    setState(() {
                                      isChecked = value;
                                    });
                                  },
                                ),
                                Expanded(
                                  child: Wrap(
                                    children: [
                                      Text(formText1),
                                      Text(formText2, style: TextStyle(color: Colors.green),),
                                      Text(formText3)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                              ),
                              color: Colors.green,
                              minWidth: double.infinity,
                              height: 50,
                              child: Text(formButtonText, style: TextStyle(color: Colors.white),),
                              onPressed: () async {

                                if(_signUpFormKey.currentState!.validate() && isChecked == true) {
                                  Map user = {
                                    "firstName": _signUpFirstNameController.text,
                                    "lastName": _signUpLastNameController.text,
                                    "emailAdress": _signUpEmailAddressController.text,
                                    "phoneNumber": _signUpPhoneNumberController.text
                                  };

                                  context.read<BankProvider>().createUser(user);

                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BankListPage()));
                                }
                              }
                            ),
                          ],
                        )
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
