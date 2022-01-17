abstract class ShareFeedBackStates{}

class ShareFeedBackInitialState extends ShareFeedBackStates{}

class ShareFeedBackSuccessEndState extends ShareFeedBackStates{}

class ShareFeedBackErrorEndState extends ShareFeedBackStates{

  final String error;

  ShareFeedBackErrorEndState(this.error);

}