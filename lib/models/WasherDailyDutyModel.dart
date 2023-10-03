class WasherDailyDutyModel {
  String calendarId;
  String userId;
  String userName;
  String vehicleNum;
  String packageId;
  String serviceDate;
  String serviceInteriorId;
  String serviceExteriorId;
  String shortName;
  String bookingId;
  String time;
  String service_interior_name;
  String service_exterior_name;

  WasherDailyDutyModel({
    this.calendarId,
    this.userId,
    this.userName,
    this.vehicleNum,
    this.packageId,
    this.serviceDate,
    this.serviceInteriorId,
    this.serviceExteriorId,
    this.shortName,
    this.bookingId,
    this.time,
    this.service_interior_name,
    this.service_exterior_name,
  });

  WasherDailyDutyModel.fromJson(Map<String, dynamic> json)
      : calendarId = json['calendar_id'],
        userId = json['user_id'],
        userName = json['user_name'],
        vehicleNum = json['vehicle_num'],
        packageId = json['package_id'],
        serviceDate = json['service_date'],
        serviceInteriorId = json['service_interior_id'],
        serviceExteriorId = json['service_exterior_id'],
        shortName = json['short_name'],
        bookingId = json['Booking Id'],
        time = json['Time'],
        service_interior_name = json['service_interior_name'],
        service_exterior_name = json['service_exterior_name'];

  Map<String, dynamic> toJson() => {
        'calendar_id': this.calendarId,
        'user_id': this.userId,
        'user_name': this.userName,
        'vehicle_num': this.vehicleNum,
        'package_id': this.packageId,
        'service_date': this.serviceDate,
        'service_interior_id': this.serviceInteriorId,
        'service_exterior_id': this.serviceExteriorId,
        'short_name': this.shortName,
        'Booking Id': this.bookingId,
        'Time': this.time,
        'service_interior_name': this.service_interior_name,
        'service_exterior_name': this.service_exterior_name,
      };
}
