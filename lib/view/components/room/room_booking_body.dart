// ignore_for_file: library_private_types_in_public_api, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:hotel_service/presenters/booking_view_contract.dart';
import 'package:hotel_service/view/components/room/room_booking_field.dart';
import 'package:hotel_service/view/components/room/room_booking_pay.dart';
import 'package:hotel_service/view/components/room/room_booking_request.dart';
import 'package:hotel_service/view/components/room/room_other_requirements.dart';
import 'package:hotel_service/models/hotel_data_model.dart';
import 'package:hotel_service/models/roomtype_model.dart';
import 'package:provider/provider.dart';
import '../../../data_sources/init.dart';
import '../../../models/booking_model.dart';
import '../../../models/room_model.dart';
import '../../../provider/booking_provider.dart';
import '../../../provider/search_provider.dart';
import '../global/dialog_window.dart';

class RoomBookingBody extends StatefulWidget {
  const RoomBookingBody({ Key? key, required this.roomTypeData, required this.hotelData }) : super(key: key);
  final RoomType roomTypeData;
  final HotelData hotelData;
  
  @override
  _RoomBookingBodyState createState() => _RoomBookingBodyState();
}

class _RoomBookingBodyState extends State<RoomBookingBody> implements BookingViewContract{
  BookingModel bookingRequest = BookingModel();
  DateTime now = DateTime.now();
  BookingPresenter? _bookingPresenter;

   @override
  onLoadError(String error) {
    setState(() {
      showDialog(
        context: context, 
        builder: (context) => DialogWindow(code: error)
      );
    });
  }
  
  @override
  onResponseBooking(String response) {
    setState(() {
      showDialog(
        context: context, 
        builder: (context) => DialogWindow(code: response)
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var bookingProvider = Provider.of<BookingProvider>(context);
    var searchProvider = Provider.of<SearchProvider>(context);
    // BUILD ROOM BOOKING BODY
    return Container(
      padding: const EdgeInsets.all(paddingLR),
      child: ListView(
        children: [
          BookingField(
            textController: context.watch<BookingProvider>().textControllers, 
            roomTypeName: widget.roomTypeData.name!,
          ),
          RoomOtherRequirements(textEditingController: context.watch<BookingProvider>().textRequirements,),
          RoomBookingRequest(
            roomType: widget.roomTypeData, 
            hotelData: widget.hotelData,
          ),
          RoomBookingPay(roomType: widget.roomTypeData,),
          SizedBox(
            height: 50,
            child: RaisedButton(
              onPressed: context.watch<BookingProvider>().pressBookingButton ? 
              () => postDataBooking(
                context,
                DateTime(now.year, now.month, now.day).toUtc().toIso8601String(),
                DateTime(now.year, now.month, now.day + 1).toUtc().toIso8601String(),          
                bookingProvider.textRequirements.text, 
                widget.roomTypeData.id!, 
                bookingProvider.textControllers['country']!.text, 
                bookingProvider.textControllers['email']!.text, 
                "${bookingProvider.textControllers['firstName']!.text} ${bookingProvider.textControllers['lastName']!.text}", 
                bookingProvider.textControllers['phone']!.text, 
                widget.roomTypeData.rooms!, 
                2, 
                searchProvider.rooms[2], 
                widget.roomTypeData.hotel!, 
                searchProvider.rooms[2], 
                widget.roomTypeData.rooms![0].price!.nightlyPrice!, 
                widget.roomTypeData.id!
              ) 
              : null,
              color: colorPrimary,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              child: const Center(
                child: Text(
                  "Thực hiện đặt phòng", 
                  style: TextStyle(color: colorWhite, fontSize: 17),
                )
              ),
            ),
          )
        ],
      ),
    );
  }
  // FUNC TO SEND DATO POST TO SERVER
  void postDataBooking (
    BuildContext context,
    String dataCheckin, 
    String dataCheckout, 
    String description,
    String cardID, 
    String country, 
    String email, 
    String name, 
    String phone, 
    List<Rooms> rooms,
    int night,
    int childrent, 
    String hotel, 
    int infants,
    int price, 
    String roomType
  ) async {
    List<RoomsBooking> listRoomBooking = [];
    for (Rooms item in rooms){
      RoomsBooking temp = RoomsBooking(
        children: childrent,
        hotel: widget.roomTypeData.hotel,
        id: item.id,
        price: item.price!.nightlyPrice! * night,
        roomType: item.roomType,
        infants: infants
      );
      listRoomBooking.add(temp);
    }
    bookingRequest = BookingModel(
      dateCheckin: dataCheckin,
      dateCheckout: dataCheckout,
      description: description,
      info: Info(
        cardId: cardID,
        country: country,
        email: email,
        name: name,
        phone: phone,
      ),
      rooms: listRoomBooking,
    );
    _bookingPresenter = BookingPresenter(this);
    _bookingPresenter!.postRepestBooking(bookingRequest);
  }
}