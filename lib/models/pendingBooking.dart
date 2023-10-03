class PendingBooking {
  String id;
  String time;
  String washDetails;
  String Address;

  PendingBooking({this.id, this.time, this.washDetails, this.Address});
}

List<PendingBooking> pendingBookingList = [
  PendingBooking(
    id: '1',
    time: '10:00 AM',
    washDetails: 'Mechanical Repair',
    Address: 'D-25, Basant vihar, Padav Gwalior',
  ),
  PendingBooking(
    id: '2',
    time: '12:00 AM',
    washDetails: 'Mechanical Repair',
    Address: 'D-30, Basant vihar, Padav Gwalior',
  ),
];