import 'package:flutter/material.dart';
import 'package:hotelnew/model/home/all_rooms.dart';
import 'package:hotelnew/model/home/response.dart';
import 'package:hotelnew/services/home/home_services.dart';
import 'package:hotelnew/utils/navigations.dart';
import 'package:hotelnew/view/screens/category/category_screen.dart';
import 'package:hotelnew/view/widgets/show_dialogs.dart';

class HomeViewModel extends ChangeNotifier {
  // =========>>>>>  VARIABLES  <<<<<==========
  List<AllRoomsModel> allRooms = [];
  bool isLoading = false;
  List<String> allCities = [];
  List<AllRoomsModel> categoryWiseList = [];

  // =========>>>>>  CONSTRUCTOR TO GET INITIAL VALUES  <<<<<==========
  HomeViewModel() {
    getAllRoom();
  }

  // =========>>>>>  TO FETCH ALL PROPERTIES  <<<<<==========
  Future<void> getAllRoom() async {
    isLoading = true;
    notifyListeners();
    AllRoomsResponse? roomResponse = await GetAllRoomsService().getAllRooms();
    if (roomResponse.isFailed == true) {
      ShowDialogs.popUp(roomResponse.errormessage ?? 'Something went wrong !!');
      _isLoadingFalse();
      return;
    } else if (roomResponse.dataList != null) {
      allRooms.clear();
      allRooms.addAll(roomResponse.dataList ?? []);
      _isLoadingFalse();
      return;
    } else {
      return;
    }
  }

  // =========>>>>>  TO GET ALL HOTELS  <<<<<==========
  void onHotelButton() {
    if (allRooms.isEmpty) {
      ShowDialogs.popUp('Properties are not availabe at this moment !!');
      return;
    } else {
      categoryWiseList.clear();
      for (int i = 0; i < allRooms.length; i++) {
        if (allRooms[i].category?.category?.toLowerCase().trim() == 'hotels') {
          categoryWiseList.add(allRooms[i]);
        }
      }
      categoryWiseList.isEmpty
          ? ShowDialogs.popUp('Hotels are not availabe at this moment !!')
          : Navigations.push(
              const CategoryScreen(categoryName: 'Hotels'),
            );
    }
  }

  // =========>>>>>  TO GET ALL HOME STAYS  <<<<<==========
  void onHomeStayButton() {
    if (allRooms.isEmpty) {
      ShowDialogs.popUp('Properties are not availabe at this moment !!');
      return;
    } else {
      categoryWiseList.clear();
      for (int i = 0; i < allRooms.length; i++) {
        if (allRooms[i].category?.category?.toLowerCase().trim() ==
            'homestay') {
          categoryWiseList.add(allRooms[i]);
        }
      }
      categoryWiseList.isEmpty
          ? ShowDialogs.popUp('Home Stays are not availabe at this moment !!')
          : Navigations.push(
              const CategoryScreen(categoryName: 'Home Stays'),
            );
    }
  }

// =========>>>>>  TO GET ALL RESORTS  <<<<<==========
  void onResortButton() {
    if (allRooms.isEmpty) {
      ShowDialogs.popUp('Properties are not availabe at this moment !!');
      return;
    } else {
      categoryWiseList.clear();
      for (int i = 0; i < allRooms.length; i++) {
        if (allRooms[i].category?.category?.toLowerCase().trim() == 'resort') {
          categoryWiseList.add(allRooms[i]);
        }
      }
      categoryWiseList.isEmpty
          ? ShowDialogs.popUp('Resorts are not availabe at this moment !!')
          : Navigations.push(
              const CategoryScreen(categoryName: 'Resorts'),
            );
    }
  }

// =========>>>>>  TO GET ALL AVAILABLE CITIES  <<<<<==========
  void fetchAllCities() {
    allCities.clear();
    ////  --->>>  loop to get every cities added
    for (int i = 0; i < allRooms.length; i++) {
      allCities.add(allRooms[i].property?.city?.trim() ?? '');
    }
    ////  --->>>   to remove duplicate cities
    allCities = allCities.toSet().toList();
    notifyListeners();
  }

// =========>>>>>  TO MAKE LOADING FALSE  <<<<<==========
  void _isLoadingFalse() {
    isLoading = false;
    notifyListeners();
  }
}
