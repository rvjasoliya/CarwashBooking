class ProfileModel {
	ProfileModel({
		this.userId,
		this.userName,
		this.userMobile,
		this.userPassword,
		this.userType,
		this.userDesignation,
		this.userEmail,
		this.userPhoto,
		this.stateId,
		this.cityId,
		this.areaId,
		this.societyId,
		this.userAddress,
		this.otp,
		this.carId,
		this.packageId,
		this.packageStartDate,
		this.packageEndDate,
		this.userStatus,
		this.postDate,
		this.today_att,
	});

	String userId;
	String userName;
	String userMobile;
	String userPassword;
	String userType;
	String userDesignation;
	String userEmail;
	String userPhoto;
	String stateId;
	String cityId;
	String areaId;
	String societyId;
	String userAddress;
	String otp;
	String carId;
	String packageId;
	String packageStartDate;
	String packageEndDate;
	String userStatus;
	String postDate;
  int today_att;


	factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
		userId: json["user_id"],
		userName: json["user_name"],
		userMobile: json["user_mobile"],
		userPassword: json["user_password"],
		userType: json["user_type"],
		userDesignation: json["user_designation"],
		userEmail: json["user_email"],
		userPhoto: json["user_photo"] != "" ? json["user_photo"] : null,
		stateId: json["state_id"],
		cityId: json["city_id"],
		areaId: json["area_id"],
		societyId: json["society_id"],
		userAddress: json["user_address"],
		otp: json["otp"],
		carId: json["car_id"],
		packageId: json["package_id"],
		packageStartDate: json["package_start_date"],
		packageEndDate: json["package_end_date"],
		userStatus: json["user_status"],
		postDate: json["post_date"],
		today_att: json["today_att"],
	);


	Map<String, dynamic> toJson() => {
		"user_id": userId,
		"user_name": userName,
		"user_mobile": userMobile,
		"user_password": userPassword,
		"user_type": userType,
		"user_designation": userDesignation,
		"user_email": userEmail,
		"user_photo": userPhoto,
		"state_id": stateId,
		"city_id": cityId,
		"area_id": areaId,
		"society_id": societyId,
		"user_address": userAddress,
		"otp": otp,
		"car_id": carId,
		"package_id": packageId,
		"package_start_date": packageStartDate,
		"package_end_date": packageEndDate,
		"user_status": userStatus,
		"post_date": postDate,
		"today_att": today_att,
	};
}
