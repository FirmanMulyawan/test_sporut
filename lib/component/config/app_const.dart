import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConst {
  static String appName = "Money Expense";
  static bool isDebuggable = true;
  static String appUrl = dotenv.env['API_LINK']!;
  static String defaultLocale = "id-ID";

  static String path = 'assets/';

  // icon
  static String iconAngleLeft = '${path}icons/uil_angle-left-b.svg';
  static String iconArrow = '${path}icons/uil_arrow.svg';
  static String iconBasketball = '${path}icons/uil_basketball.svg';
  static String iconBookOpen = '${path}icons/uil_book-open.svg';
  static String iconCalendarAlt = '${path}icons/uil_calendar-alt.svg';
  static String iconCarSideview = '${path}icons/uil_car-sideview.svg';
  static String iconClapperBoard = '${path}icons/uil_clapper-board.svg';
  static String iconGift = '${path}icons/uil_gift.svg';
  static String iconHome = '${path}icons/uil_home.svg';
  static String iconMultiply = '${path}icons/uil_multiply.svg';
  static String iconPizzaSlice = '${path}icons/uil_pizza-slice.svg';
  static String iconUilPlus = '${path}icons/uil_plus.svg';
  static String iconRssAlt = '${path}icons/uil_rss-alt.svg';
  static String iconShoppingCart = '${path}icons/uil_shopping-cart.svg';

  // image
  // static String bgSplash = '${path}icons/bg_splash.png';
}
