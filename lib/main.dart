import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_astro24/BottomNavigationBar.dart';
import 'package:online_astro24/Chat_With_Astro/ChatWithAstro.dart';
import 'package:online_astro24/DrawerContent/MyWalletScreen.dart';
import 'package:online_astro24/HoroscopeScreen/SignDetailsScreen.dart';
import 'package:online_astro24/HoroscopeScreen/SignScreen.dart';
import 'package:online_astro24/LogIn_SignUp_Otp/Login.dart';
import 'package:online_astro24/LogIn_SignUp_Otp/OtpScreen.dart';
import 'package:online_astro24/LogIn_SignUp_Otp/SignUp.dart';
import 'package:online_astro24/Notification/NotificationScreen.dart';
import 'package:online_astro24/PaymentScreen/finalPaymentScreen.dart';
import 'package:online_astro24/ProductDetailsScreen.dart';
import 'package:online_astro24/ProfileScreen.dart';
import 'package:online_astro24/Widgets/Theme.dart';
import 'package:online_astro24/utils/setup.dart';
import 'package:online_astro24/SplashScreen/splash.dart';
import 'PaymentScreen/orderSucessFullScreen.dart';
import 'package:online_astro24/Astro_Report/Astro_Reports.dart';
import 'package:online_astro24/Astro_Report/ReportIntakeForm.dart';
import 'package:online_astro24/Astro_Report/getAstro.dart';
import 'package:online_astro24/Talk_To_Astrologer/Talk_to_Astro.dart';
import 'package:online_astro24/Astro_Video_Call/Astro_Video_Call.dart';
import 'package:online_astro24/AskQuestion/Ask_Question_Astro.dart';
import 'package:online_astro24/AskQuestion/Ask_Question.dart';
import 'package:online_astro24/Cart_Screen/CartScreen.dart';
import 'package:online_astro24/DrawerContent/UserList.dart';
import 'package:online_astro24/DrawerContent/Question_history.dart';
import 'providers/products.dart';
import 'package:provider/provider.dart';


void main() {

  runApp(Myapp());
}

class Myapp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Color(pinkColor)
    ));

    return MultiProvider(providers: [
        ChangeNotifierProvider(
        create: (context) => Products(),),

    ],
      child: MaterialApp(
          theme: MyTheme.lightTheme(context),
        debugShowCheckedModeBanner: false,
        initialRoute: Splash.splash,
        routes: {
          BottomNavigation.bottomNavigationScreen:(context) => BottomNavigation(),
          Splash.splash: (context) => Splash(),
          Login.login: (context) => Login(),
          ChatNowScreen.chatNow: (context) => ChatNowScreen(),
          SignScreen.signScreen: (context) => SignScreen(),
          NotificationScreen.notification: (context) => NotificationScreen(),
          OrderSuccessFullScreen.orderSuccessScreen: (context) => OrderSuccessFullScreen(),
          FinalPaymentScreen.finalPaymentScreen:(context) => FinalPaymentScreen(),
          ReportIntakeForm.reportIntakeForm:(context) => ReportIntakeForm(),
          AstroReportType.astroReport:(context) => AstroReportType(),
          SignDetailsScreen.signDetailScreen:(context) => SignDetailsScreen(),
          GetAstro.getAstro:(context) => GetAstro(),
          TalkToAstro.talkToAstro:(context) => TalkToAstro(),
          AstroVideoCall.astroVideoCall:(context) => AstroVideoCall(),
          AskQuestionAstro.askQuestionastro:(context) => AskQuestionAstro(),
          MyWallet.myWallet:(context) => MyWallet(),
          AskQuestionScreen.askQuestionScreen:(context) => AskQuestionScreen(),
          CartScreen.cartScreen:(context) => CartScreen(),
          ProfileScreen.profile:(context) => ProfileScreen(),
          UserList.userList:(context) => UserList(),
          QuestionHistory.questionHistory:(context) => QuestionHistory(),
          ProductDetails.productDetailScreen:(context) => ProductDetails(),
        },
      ),
    );
  }
}
