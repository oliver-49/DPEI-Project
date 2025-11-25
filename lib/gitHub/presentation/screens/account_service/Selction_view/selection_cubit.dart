import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:fixit/firebase/role_mode.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectionState {
  final String? selectedRole;
  final bool navigateNext;
  final String? errorMessage;

  SelectionState({
    this.selectedRole,
    this.navigateNext = false,
    this.errorMessage,
  });

  SelectionState copyWith({
    String? selectedRole,
    bool? navigateNext,
    String? errorMessage,
  }) {
    return SelectionState(
      selectedRole: selectedRole ?? this.selectedRole,
      navigateNext: navigateNext ?? this.navigateNext,
      errorMessage: errorMessage,
    );
  }
}

class SelectionCubit extends Cubit<SelectionState> {
  SelectionCubit() : super(SelectionState());

  void selectOption(String role) {
    emit(state.copyWith(selectedRole: role, errorMessage: null));
  }

  void onNextTapped() async {
  if (state.selectedRole == null) {
    emit(state.copyWith(errorMessage: 'من فضلك اختار دورك'));
    return;
  }

  try {
     String roleValue = state.selectedRole == 'Service Provider'
        ? 'provider'
        : 'customer';
    // await RoleMode().updateUserRole(roleValue);
    // final uid = FirebaseAuth.instance.currentUser!.uid;

    // // تحويل اسم الدور من واجهة المستخدم إلى قيمة مختصرة
    // String roleValue = state.selectedRole == 'Service Provider'
    //     ? 'provider'
    //     : 'customer';

    // await FirebaseFirestore.instance.collection('users').doc(uid).update({
    //   'role': roleValue,
    // });

    emit(state.copyWith(navigateNext: true, errorMessage: null));
  } catch (e) {
    emit(state.copyWith(errorMessage: "Error saving role: $e"));
  }
}


  void resetNavigation() {
    emit(state.copyWith(navigateNext: false));
  }
}
