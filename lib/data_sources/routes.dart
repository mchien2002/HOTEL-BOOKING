import 'package:get/get.dart';
import 'package:hotel_service/view/detail_screens/room_booking_screen.dart';
import 'package:hotel_service/view/detail_screens/room_detail_screen.dart';
import 'package:hotel_service/view/detail_screens/room_utilities_screen.dart';
import 'package:hotel_service/view/register_screens/hotel_login_screen.dart';
import 'package:hotel_service/view/register_screens/otp_register_screen.dart';
import 'package:hotel_service/view/search_screens/research_component_screen.dart';
import 'package:hotel_service/view/search_screens/search_filter_screen.dart';
import 'package:hotel_service/view/search_screens/search_hotel_screen.dart';
import 'package:hotel_service/view/search_screens/search_location_screen.dart';
import 'package:hotel_service/view/search_screens/search_quantity_screen.dart';
import 'package:hotel_service/view/search_screens/search_showmore_screen.dart';
import 'package:hotel_service/view/system_screens/splash_screen.dart';

class RoutesClass {
  // region SYSTEM SCREEN
  static String home = '/';

  static String getHomeRoute() => home;
  //endregion

  // region SEARCH SCREEN
  static String search = '/search';
  static String searchFilter = "/filter";
  static String reSearchFilter = "/research-filter";
  static String searchLocation = "/search-location";
  static String searchQuantity = "/search-quantity";
  static String searchShowMore = "/search-showmore";

  static String getSearchHomeRoute() => search;
  static String getSearchFilterRoute(String location, String room) =>
      "$searchFilter?location=$location?room=$room";
  static String getReSearchFilterRoute() => reSearchFilter;
  static String getSearchLocation() => searchLocation;
  static String getSearchQuantity() => searchQuantity;
  static String getSearchShowMoreRoute() => searchShowMore;
  //endregion

  // region REGISTER SCREEN
  static String login = "/login";
  static String confirmOTP = "/otp";

  static String getLoginRoute() => login;
  static String getConfirmOTPRoute(String phone) => "$confirmOTP?$phone";
  //endregion

  // region DETAIL SCREEN
  static String hotelDetail = '/hotel-detail';
  static String roomBooking = "/booking";
  static String utilities = "/utilities";

  static String getHotelDetailRoute(String id) => "$hotelDetail?$id";
  static String getRoomBookingRoute(String id) => "$roomBooking?$id";
  static String getUtilitiesRoute(String id) => "$utilities?$id";
  //endregion

  static List<GetPage> routes = [
    // region SEARCH PAGE
    GetPage(
        page: () => const SearchHotelScreen(),
        name: search,
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 400)),
    GetPage(name: searchFilter, page: () => const SearchFilterScreen()),
    GetPage(name: reSearchFilter, page: () => const ReSearchComponentScreen()),
    GetPage(name: searchLocation, page: () => const SearchLocationScreen()),
    GetPage(name: searchQuantity, page: () => const SearchQuantityScreen()),
    GetPage(
        name: searchShowMore,
        page: () {
          SearchShowMoreScreen pickMap = Get.arguments;
          return pickMap;
        }),
    //endregion

    // region DETAIL PAGE
    GetPage(
        name: hotelDetail,
        page: () {
          RoomDetailScreen pickMap = Get.arguments;
          return pickMap;
        },
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 400)),
    GetPage(
        name: roomBooking,
        page: () {
          RoomBookingScreen pickMap = Get.arguments;
          return pickMap;
        },
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 400)),
    GetPage(
        name: utilities,
        page: () {
          RoomUtilitiesScreen pickMap = Get.arguments;
          return pickMap;
        },
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 400)),
    //endregion

    // region SYSTEM PAGE
    GetPage(
      page: () => const SplashScreen(),
      name: home,
    ),
    //endregion

    // REGISTER PAGE
    GetPage(name: login, page: () => const HotelLoginScreen()),
    GetPage(name: confirmOTP, page: () => const OTPRegisterScreen()),
    //endregion
  ];
}
