sealed class BookingState {}

class BookingInitial extends BookingState {}

class FavoritChange extends BookingState {
  bool favorit;
  FavoritChange(this.favorit);
}

class AddressSucsuessState extends BookingState {}

class AddressErrorState extends BookingState {}

class DateChangeState extends BookingState {
  DateTime focusDay;
  DateTime selectedDay;
  DateChangeState(this.focusDay, this.selectedDay);
}

class TimeChangeState extends BookingState {
  String selected;
  TimeChangeState(this.selected);
}

class SetItem extends BookingState{}

class TimeSuccessState extends BookingState{}

class TimeErrorState extends BookingState{}

class InfoResetState extends BookingState{}
