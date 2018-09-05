import 'package:myapp/model/UserModel.dart';
import 'package:myapp/redux/UserReducer.dart';


class GlobalState{
  UserModel userModel;

  ///构造方法
  GlobalState({this.userModel});
}

///创建 Reducer
///源码中 Reducer 是一个方法 typedef State Reducer<State>(State state, dynamic action);
///我们自定义了 appReducer 用于创建 store
GlobalState appReducer(GlobalState state, action) {
  return GlobalState(
    userModel: UserReducer(state.userModel, action),

  );
}