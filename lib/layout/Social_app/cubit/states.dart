abstract class SocialStates {}

class SocialInitialStates extends SocialStates{}


class SocialGetUserLoadingStates extends SocialStates{}
class SocialGetUserSuccessStates extends SocialStates{}
class SocialGetUserErrorStates extends SocialStates{

  final String error;
  SocialGetUserErrorStates(this.error);
}


class SocialGetAllUserLoadingStates extends SocialStates{}
class SocialGetAllUserSuccessStates extends SocialStates{}
class SocialGetAllUserErrorStates extends SocialStates{

  final String error;
  SocialGetAllUserErrorStates(this.error);
}


class SocialChangeBottomNavStates extends SocialStates{}


class SocialAddNewPostStates extends SocialStates{}


class SocialImagePickedProfileSuccessStates extends SocialStates{}
class SocialImagePickedProfileErrorStates extends SocialStates{}


class SocialImagePickedCoverSuccessStates extends SocialStates{}
class SocialImagePickedCoverErrorStates extends SocialStates{}


class SocialUploadImageProfileSuccessStates extends SocialStates{}
class SocialUploadImageProfileErrorStates extends SocialStates{}


class SocialUploadImageCoverSuccessStates extends SocialStates{}
class SocialUploadImageCoverErrorStates extends SocialStates{}


class SocialCreatePostLoadingStates extends SocialStates{}
class SocialCreatePostSuccessStates extends SocialStates{}
class SocialCreatePostErrorStates extends SocialStates{}


class SocialImagePickedPostSuccessStates extends SocialStates{}
class SocialImagePickedPostErrorStates extends SocialStates{}


class SocialRemovePostImageStates extends SocialStates{}


class SocialGetPostsLoadingStates extends SocialStates{}
class SocialGetPostsSuccessStates extends SocialStates{}
class SocialGetPostsErrorStates extends SocialStates{
  final String error;
  SocialGetPostsErrorStates(this.error);}


class SocialLikePostsSuccessStates extends SocialStates{}
class SocialLikePostsErrorStates extends SocialStates{

  final String error;
  SocialLikePostsErrorStates(this.error);
}


class SocialSendMessageSuccessStates extends SocialStates{}
class SocialSendMessageErrorStates extends SocialStates{}


class SocialGetMessageSuccessStates extends SocialStates{}
class SocialGetMessageErrorStates extends SocialStates{}