
abstract class SocialLoginState {}

class SocialLoginInitialState extends SocialLoginState{}

class SocialLoginSuccessState extends SocialLoginState{
  final String uId;

  SocialLoginSuccessState(this.uId);
}

class SocialLoginLoadingState extends SocialLoginState{}

class SocialLoginChangeIconState extends SocialLoginState{}

class SocialLoginErrorState extends SocialLoginState{
  final String error ;

  SocialLoginErrorState(this.error);
}