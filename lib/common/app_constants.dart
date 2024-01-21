// Service

const bool applyMockMappings = false;
const String mockMappingFile = "assets/mocks/_mappings.json";

const int envProd = 1;
const int envStage = 2;
const int envDev = 3;
const int envLocal = 4;

int serviceEnvironment = envDev;

const String prodServiceBaseUrl = "http://app.tradeschool.co.in/api";
const String stageServiceBaseUrl = "https://vps.kishulsolutions.in/api";

// const String prodServiceBaseUrl = "http://app.tradeschool.co.in/api";
// const String stageServiceBaseUrl = "http://vps.kishulsolutions.in/api";

// const String devServiceBaseUrl = "https://tsdev.kishulsolutions.in/api";
const String devServiceBaseUrl = "https://tsdev.kishul.com/api";

// const String localServiceBaseUrl = "http://192.168.1.7:8000/api";
const String localServiceBaseUrl = "http://172.20.10.3:8000/api";
//
// Date

// const String datePatternDisplay = "dd.MM.yyyy hh:mm";
const String datePatternDisplay = "dd/MM/yyyy";
const String dateAndTimePatternDisplay = "dd MMM yyyy HH:mm a";
const String dateAndTimePatternDisplayInCommunityList = "dd MMM yyyy";
const String dateTimePatternDisplay = "MMM d, yyyy HH:mm:ss";
const String birthDatePatternDisplay = "YYYY-MM-DD";

// Validations, RegExp
const int minPasswordLength = 6;
const String containsAlphaNumeric = r'^.*(?=.*\d)(?=.*[a-zA-Z]).*$';
const String patternAlpha = "[a-zA-Z ]";
const String patternMobile = r'^\d{10}$';
const String patternEmail =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
