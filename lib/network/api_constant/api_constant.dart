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
String kPublishedDateValue =
    "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}";
