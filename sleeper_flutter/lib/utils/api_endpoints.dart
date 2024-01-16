// ignore_for_file: prefer_const_declarations, library_private_types_in_public_api

class APIEndpoints {
  static final String baseUrl =
      'https://sleeper-api-n4waezcoha-et.a.run.app/api/';
  static _APIEndpoints authEndPoints = _APIEndpoints();
}

class _APIEndpoints {
  final String register = 'auth/register';

  final String getAllFoods = 'foods';
  final String getOneFood = 'foods/:id';

  final String getAllExercises = 'exercises';
  final String getOneExercise = 'exercises/:id';

  final String inputDailyActivities = 'activities/daily';
  final String getAllDailyActivities = 'activities/daily';
  final String getOneDailyActivities = 'activities/daily/:id';

  final String getAllFeedbacks = 'feedbacks';
  final String getOneFeedback = 'feedbacks/:id';

  final String inputDailyFeedbacks = 'feedbacks/daily';
  final String inputWeeklyFeedbacks = 'feedbacks/weekly';

  final String getFoodRecommendations = 'recommendations/food';
  final String getExerciseReccomendations = 'recommendations/exercise';

  final String updateDataDevice = 'devices/smart-lamp';
}
