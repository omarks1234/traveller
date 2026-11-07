import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';

import 'package:firebase_ai/firebase_ai.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:traveller/features/chooseExperience/data/models/trip.dart';
@singleton
class AiTripService {

  final GenerativeModel _model =
  FirebaseAI.googleAI().generativeModel(
    model: 'gemini-3.8-flash',
    generationConfig: GenerationConfig(
      responseMimeType: 'application/json',
      responseSchema: itinerarySchema,
    ),
  );

  Future<Map<String, dynamic>> generateItinerary(
      Trip trip,
      ) async {
    final tripData = jsonEncode(trip.toJson());
    final uid = FirebaseAuth.instance.currentUser!.uid;

    final savedPreferences = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get();

    final preferences = savedPreferences.data()?['userPreferenceModel'];
    final preferenceData = jsonEncode(preferences);
print("#########$tripData.");
print("#########$preferenceData.");
    final prompt = '''
You are a travel planner specializing in Egypt.

Use the following trip preferences:
$tripData
$preferenceData
Create an itinerary for exactly the selected number of days.

Requirements:
- Respect the destination, budget, interests, and trip style.

- Prioritize the attractions, foods, and transportation selected by the user.

- Organize activities in a practical geographical visiting order .

Complete all planned activities and days in the current city before moving to another city.

- Include 2  activities per day.

- Write all titles and descriptions in English.

- Keep each activity description Approximately maximum 10 words.

- Use real and recognizable place names.

- Do not invent latitude or longitude.

- Return exactly the requested number of days.

- Number the days sequentially, starting from 1
''';

    final response = await _model.generateContent([
      Content.text(prompt),
    ]);

    final result = response.text;

    if (result == null || result.isEmpty) {
      throw Exception('AI returned an empty response');
    }

    return jsonDecode(result) as Map<String, dynamic>;
  }
}

final itinerarySchema = Schema.object(
  properties: {
    'days': Schema.array(
      items: Schema.object(
        properties: {
          'day': Schema.integer(),
          'title': Schema.string(),
          'activities': Schema.array(
            items: Schema.object(
              properties: {
                'time': Schema.string(),
                'placeName': Schema.string(),
                'description': Schema.string(),
                'category': Schema.string(),
              },
            ),
          ),
        },
      ),
    ),
  },
);




