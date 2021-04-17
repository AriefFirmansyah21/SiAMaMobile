part of 'pages.dart';

class SignInPage extends StatefulWidget {
  static String tag = 'UserLogin';
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  var nimController = new TextEditingController();
  var passwordController = new TextEditingController();
  //bool isLoading = false;
  ApiResponse apiResponse;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          // action: <Widget>[
          //   TextButton(
          //     child: Text('Approve'),
          //     onPressed: () {
          //       Navigator.of(context).pop();
          //     },
          //   ),
          // ],
        );
      },
    );
  }

  void authentication() {
    UserModel userModel = new UserModel(
        nim: nimController.text, password: passwordController.text);

    // dialog alert

    var requestBody = jsonEncode(userModel.toJson());
    UserLoginServices.authentication(requestBody).then((value) {
      final result = value;
      if (result.success == true && result.code == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TransferPage()),
        );
      } else {
        _showMyDialog();
      }
    }).catchError((error) {
      // String err = error.toString();
    });
    print(requestBody);
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Sign In',
      subtitle: "SIAMA",
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Center(
                child: new Image.asset(
                  "assets/screen.png",
                  height: 150.0,
                  width: 300.0,
                ),
              ),
              Container(
                width: double.infinity,
                margin:
                    EdgeInsets.fromLTRB(defaultMargin, 26, defaultMargin, 6),
                child: Text(
                  "NIM",
                  style: whiteFontStyle2,
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: "0C3B2E".toColor())),
                child: TextField(
                  controller: nimController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: whiteFontStyle3,
                      hintText: 'Masukan NIM'),
                ),
              ),
              Container(
                width: double.infinity,
                margin:
                    EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
                child: Text(
                  "Password",
                  style: whiteFontStyle2,
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: "0C3B2E".toColor())),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: whiteFontStyle3,
                      hintText: 'Masukan  password'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 1),
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                child:
                    //isLoading
                    //  ? SpinKitFadingCircle(size: 45, color: Colors.black)
                    RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/forgot_page');
                  },
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  color: Colors.white,
                  child: Text(
                    'Forgot Password?',
                    style: GoogleFonts.dmSans(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 5),
                height: 45,
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                child:
                    // isLoading
                    //  ? SpinKitFadingCircle(
                    //      size: 45,
                    //        color: mainColor,
                    //      )
                    RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home_page');
                  },
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  color: newColor,
                  child: Text(
                    'Sign In',
                    style: GoogleFonts.dmSans(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 24),
                height: 45,
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                child:
                    //isLoading
                    //    ? SpinKitFadingCircle(
                    //        size: 45,
                    //        color: greenColor,
                    //      )
                    RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/sign_up_page');
                  },
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  color: yellowColor,
                  child: Text(
                    'Registrasi',
                    style: GoogleFonts.poppins(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
