import 'package:myapp/model/UserModel.dart';
import 'package:redux/redux.dart';

final UserReducer = combineReducers<UserModel>([
  TypedReducer<UserModel, UpdateUserAction>(_updateLoaded),
]);

/// 如果有 UpdateUserAction 发起一个请求时
/// 就会调用到 _updateLoaded
/// _updateLoaded 这里接受一个新的userInfo，并返回
UserModel _updateLoaded(UserModel user, action) {
  user = action.userModel;
  return user;
}

///定一个 UpdateUserAction ，用于发起 userInfo 的的改变
///类名随你喜欢定义，只要通过上面TypedReducer绑定就好
class UpdateUserAction {
  final UserModel userModel;
  UpdateUserAction(this.userModel);
}
