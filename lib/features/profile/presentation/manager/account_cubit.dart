import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipes/features/auth/data/models/user_model.dart';
import 'package:food_recipes/features/profile/data/repo/profile_repo.dart';
import 'package:image_picker/image_picker.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit(this.profileRepo) : super(AccountInitial());
  ProfileRepo profileRepo;

  static AccountCubit get(context) => BlocProvider.of<AccountCubit>(context);

  var formKey = GlobalKey<FormState>();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();

  Future<void> getUserData() async {
    emit(GetAccountDataLoading());
    var result = await profileRepo.getUserData();
    result.fold(
      (error) =>emit(GetAccountDataFailure(error.error)),
      (userModel) {
        name.text = userModel.name;
        password.text = userModel.password;
        confirmPassword.text = userModel.password;
        phone.text = userModel.phone;
        emit(GetAccountDataSuccess(userModel));
      },
    );
  }

  Future<void> updateUserData() async {
    emit(EditAccountLoading());
    User user = FirebaseAuth.instance.currentUser!;
    var result = await profileRepo.updateUserData(
      userModel: UserModel(
        name: name.text,
        phone: phone.text,
        email: user.email!,
        userId: user.uid,
        password: password.text,
        image: newUserImageUrl ?? user.photoURL ?? 'https://cdn-icons-png.flaticon.com/512/149/149071.png',
      ),
    );
    print(user.uid);
    result.fold(
      (error) => emit(EditAccountFailure(error.error)),
      (message) {
        emit(EditAccountSuccess(message));
      },
    );
  }

  XFile? pickedImage;
  final picker = ImagePicker();

  Future pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      pickedImage = XFile(pickedFile.path);
      emit(SelectNewImageSuccessfullyState());
      uploadNewUserImage();
    } else {
      emit(NoNewImageSelectedState());
    }
  }

  String? newUserImageUrl;

  uploadNewUserImage() async {
    emit(UploadNewUserImageLoadingState());
    var data = await profileRepo.uploadNewUserImage(image: pickedImage!);
    data.fold(
          (failure) => emit(UploadNewUserImageErrorState(failure.error)),
          (imageUrl) {
        newUserImageUrl = imageUrl;
        emit(UploadNewUserImageSuccessfullyState(imageUrl));
      },
    );
  }

  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined;
    getUserData();
    emit(ChangePasswordVisibility());
  }


  @override
  Future<void> close() {
    phone.dispose();
    password.dispose();
    confirmPassword.dispose();
    name.dispose();
    return super.close();
  }
}
