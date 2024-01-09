//Base URLs
const kHomeScreenBaseURL = "https://api.nytimes.com/svc/books/v3";
const kSearchBookBaseURL = "https://www.googleapis.com/books/v1";

//EndPoint
const kEndPointForHomeScreen = "/lists/overview.json";
const kEndPointForSearchBook = "/volumes";

//Query Params Keys
const kQueryParamsApiKey = "api-key";
const kQueryParamsKeyForPublishedDate = "published_date";
const kQueryParamsKeyForSearchBook = "q";

//Query Params Value
const kAPIValue = "R6rzBgYLcg0ztx64GN4r8WTWoyABGvKR";

String month() {
  if (DateTime.now().month.toString().length < 2) {
    return "0${DateTime.now().month}";
  }
  return "${DateTime.now().month}";
}

String day() {
  if (DateTime.now().day.toString().length < 2) {
    return "0${DateTime.now().day}";
  }
  return "${DateTime.now().day}";
}

String kPublishedDateValue = "${DateTime.now().year}-${month()}-${day()}";
