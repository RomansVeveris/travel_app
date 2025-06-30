
import 'package:travel_app/models/trips_model.dart';
import 'package:travel_app/models/locals_model.dart';

class ScreenController {
  int _pageIndex = 0;
  late void Function(int) _onPageChange;


  LocalsModel? _selectedLocal;
  late void Function(LocalsModel) _onLocalSelected;

  TripsModel? _selectedTrip;
  late void Function(TripsModel) _onTripSelect;
  
  int get pageIndex => _pageIndex;
  TripsModel? get selectedTrip => _selectedTrip;
  LocalsModel? get selectedLocal => _selectedLocal;

  void bindCallback(void Function(int) callback) {
    _onPageChange = callback;
  }

  void bindTripSelectCallback(void Function(TripsModel) callback) {
    _onTripSelect = callback;
  }

  void bindLocalSelectCallback(void Function(LocalsModel) callback) {
    _onLocalSelected = callback;
  }

  void selectLocal(LocalsModel local) {
    _selectedLocal = local;
    _onLocalSelected(local);
  }

  void setPageIndex(int index) {
    _pageIndex = index;
    _onPageChange(index);
  }

  void selectTrip(TripsModel trip) {
    _selectedTrip = trip;
    _onTripSelect(trip);
  }
}

