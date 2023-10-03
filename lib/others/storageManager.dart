import 'package:carwash_booking/models/profileModel.dart';
import 'package:get_storage/get_storage.dart';

class StorageManager{

  GetStorage gs = GetStorage();

  saveProfile({profile}){
    gs.write('profile', profile);
    //getProfile();
  }

  getProfile() {
    if(gs.read('profile') != null) {
      profileData = ProfileModel.fromJson(gs.read('profile'));
    }
    return gs.read('profile');
  }

  removeProfile(){
    gs.remove('profile');
  }

}

StorageManager storageManager = StorageManager();
ProfileModel profileData;