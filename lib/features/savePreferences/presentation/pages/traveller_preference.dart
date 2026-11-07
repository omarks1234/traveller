/*import 'package:flutter/material.dart';
List<String> countries = ["Egypt" , "U.S.A " , "China"] ;
String selectedVal = "Egypt" ;
budget selectedBudget = budget.low;
TripStyle selectedTripStyle = TripStyle.relaxed;
List<String> favInterests = [] ;
bool selectedHistoryValue = false ;
bool selectedFoodValue = false ;
bool selectedShoppingValue = false ;
bool selectedNightlifeValue = false ;
class TravellerPreference extends StatefulWidget{
  @override
  State<TravellerPreference> createState() => _TravellerPreferenceState();
}

class _TravellerPreferenceState extends State<TravellerPreference> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Text("Where do you want to go ?"),
              DropdownButtonFormField<String>(
                items: countries.map((country)
                {
                  return DropdownMenuItem(
                    child: Text(country),
                    value: selectedVal,
                     );
                }).toList(),
                onChanged: (value){
                  setState(() {
                    selectedVal = value! ;
                  });
                },
              ),
              Text("How many days will you stay ?"),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  hintText: "Enter number of days",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                ),
              ),
              Text("Your budget ?"),
              RadioListTile<budget>(
                title: Text("Low"),
                value:  budget.low,
                groupValue: selectedBudget,
                onChanged: (value){
                  setState(() {
                    selectedBudget = value!;
                  });

                },

              ),
              RadioListTile<budget>(
                value: budget.medium,
                groupValue: selectedBudget,
                onChanged: (value) {
                  setState(() {
                    selectedBudget = value!;
                  });
                },
                title: const Text('medium'),
              ),
              RadioListTile<budget>(
                value: budget.high,
                groupValue: selectedBudget,
                onChanged: (value) {
                  setState(() {
                    selectedBudget = value!;
                  });
                },
                title: const Text('Luxury'),
              ),

              Text("What do you like ?"),
              CheckboxListTile(
                title: Text("History"),
                value: selectedHistoryValue,

                onChanged: (value) {
                  selectedHistoryValue = value!;
                  setState(() {
                    if(selectedHistoryValue == true)
                   favInterests.add("History");

                    else
                      favInterests.remove("History");
                  });
                }
              ),
              CheckboxListTile(
                title: Text("Food"),
                value: selectedFoodValue,

                onChanged: (value) {
                  selectedFoodValue = value!;
                  setState(() {
                    if(selectedFoodValue == true)

                   favInterests.add("Food");
                    else
                      favInterests.remove("Food");

                  });
                }
              ),
              CheckboxListTile(
                title: Text("Shopping"),
                value: selectedShoppingValue,
                onChanged: (value) {
                  selectedShoppingValue = value!;
                  setState(() {
                    if(selectedShoppingValue == true)
                   favInterests.add("Shopping");
                    else
                      favInterests.remove("Shopping");
                  });
                }
              ),
              CheckboxListTile(
                title: Text("Nightlife"),
                value: selectedNightlifeValue,
                onChanged: (value) {
                  selectedNightlifeValue = value!;
                  setState(() {
                    if(selectedNightlifeValue == true)
                   favInterests.add("Nightlife");
                    else
                      favInterests.remove("Nightlife");
                  });
                }
              ),

              Text("Trip Style"),
              RadioListTile<TripStyle>(
                title: Text("Relaxed"),
                value:  TripStyle.relaxed,
                groupValue: selectedTripStyle,
                onChanged: (value) {
                  setState(() {
                    selectedTripStyle = value!;
                  });
                }

              ),
              RadioListTile<TripStyle>(
                title: Text("Balanced"),
                value:  TripStyle.balanced,
                groupValue: selectedTripStyle,
                onChanged: (value) {
                  setState(() {
                    selectedTripStyle = value!;
                  });
                }
              ),
              RadioListTile<TripStyle>(
                title: Text("Busy"),
                value:  TripStyle.busy,
                groupValue: selectedTripStyle,
                onChanged: (value) {
                  setState(() {
                    selectedTripStyle = value!;
                  });
                }
              ),



            ],
          ),
        ),
      ),
    );
  }
}

enum budget{
  low ,
  medium ,
  high
}
enum TripStyle {
  relaxed,
  balanced,
  busy,
}*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traveller/DI/field_injection.dart';
import 'package:traveller/core/resources/routes_manager/route_manager.dart';
import 'package:traveller/core/resources/routes_manager/routes.dart';
import 'package:traveller/features/savePreferences/data/models/userPreferenceModel.dart';
import 'package:traveller/features/savePreferences/presentation/manager/choose_experience_cubit.dart';
import 'package:traveller/features/savePreferences/presentation/manager/create_trip_cubit.dart';
import 'package:traveller/features/savePreferences/presentation/manager/save_preferences_cubit.dart';

class TravellerPreference extends StatefulWidget {
  const TravellerPreference({super.key});

  @override
  State<TravellerPreference> createState() => _TravellerPreferenceState();
}

class _TravellerPreferenceState extends State<TravellerPreference> {
  final List<String> countries = ["Egypt", "U.S.A", "China"];
  String? tripId = "123";
  String selectedVal = "Egypt";

  Budget selectedBudget = Budget.low;

  TripStyle selectedTripStyle = TripStyle.relaxed;

  final List<String> interests = ["History", "Food", "Shopping", "Nightlife"];

  final List<String> favInterests = [];

  int numberOfDays = 1;

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<CreateTripCubit>(),
          ),
          BlocProvider(
            create: (context) => getIt<SavePreferencesCubit>(),
          ),
        ],

        child: Scaffold(
          backgroundColor: const Color(0xFFF7F8FA),

          appBar: AppBar(
            elevation: 0,
            // عشان ميعملش خيال
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black,
            title: const Text(
              "Plan Your Trip",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            centerTitle: true,
          ),

          body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Tell us what you prefer",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 8),

                Text(
                  "We will use your preferences to create a trip that suits you.",
                  style: TextStyle(fontSize: 15, color: Colors.grey.shade600),
                ),

                const SizedBox(height: 25),

                // ================= DESTINATION =================
                _buildSectionTitle(
                  icon: Icons.location_on_outlined,
                  title: "Where do you want to go?",
                ),

                const SizedBox(height: 12),

                _buildCard(
                  child: DropdownButtonFormField<String>(
                    value: selectedVal,

                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.public),
                      labelText: "Destination",
                      border: InputBorder.none,
                    ),

                    items: countries.map((country) {
                      return DropdownMenuItem<String>(
                        value: country,
                        child: Text(country),
                      );
                    }).toList(),

                    onChanged: (value) {
                      if (value == null) return;

                      setState(() {
                        selectedVal = value;
                      });
                    },
                  ),
                ),

                const SizedBox(height: 25),

                // ================= DAYS =================
                _buildSectionTitle(
                  icon: Icons.calendar_month_outlined,
                  title: "How many days will you stay?",
                ),

                const SizedBox(height: 12),

                _buildCard(
                  child: TextFormField(
                    keyboardType: TextInputType.number,

                    onChanged: (value) {
                      numberOfDays = int.tryParse(value) ?? 1;
                    },

                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.calendar_today_outlined),
                      labelText: "Number of days",
                      hintText: "Example: 5",
                      border: InputBorder.none,
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                // ================= BUDGET =================
                _buildSectionTitle(
                  icon: Icons.account_balance_wallet_outlined,
                  title: "What's your budget?",
                ),

                const SizedBox(height: 12),

                _buildCard(
                  padding: EdgeInsets.zero,
                  child: Column(
                    children: [
                      _buildRadioTile(
                        title: "Low",
                        subtitle: "Save money",
                        icon: Icons.savings_outlined,
                        value: Budget.low,
                      ),

                      const Divider(height: 1),

                      _buildRadioTile(
                        title: "Medium",
                        subtitle: "Balanced spending",
                        icon: Icons.account_balance_wallet_outlined,
                        value: Budget.medium,
                      ),

                      const Divider(height: 1),

                      _buildRadioTile(
                        title: "Luxury",
                        subtitle: "Premium experience",
                        icon: Icons.diamond_outlined,
                        value: Budget.high,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // ================= INTERESTS =================
                _buildSectionTitle(
                  icon: Icons.favorite_border,
                  title: "What do you like?",
                ),

                const SizedBox(height: 12),

                Wrap(
                  spacing: 10,
                  runSpacing: 10,

                  children: interests.map((interest) {
                    final isSelected = favInterests.contains(interest);

                    return FilterChip(
                      label: Text(interest),

                      selected: isSelected,

                      avatar: Icon(_getInterestIcon(interest), size: 18),

                      onSelected: (selected) {
                        setState(() {
                          if (selected) {
                            favInterests.add(interest);
                          } else {
                            favInterests.remove(interest);
                          }
                        });
                      },

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),

                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 25),

                // ================= TRIP STYLE =================
                _buildSectionTitle(
                  icon: Icons.directions_walk_outlined,
                  title: "What's your trip style?",
                ),

                const SizedBox(height: 12),

                _buildCard(
                  padding: EdgeInsets.zero,
                  child: Column(
                    children: [
                      _buildRadioTile(
                        title: "Relaxed",
                        subtitle: "Take your time and enjoy",
                        icon: Icons.spa_outlined,
                        value: TripStyle.relaxed,
                      ),

                      const Divider(height: 1),

                      _buildRadioTile(
                        title: "Balanced",
                        subtitle: "Explore and relax",
                        icon: Icons.balance_outlined,
                        value: TripStyle.balanced,
                      ),

                      const Divider(height: 1),

                      _buildRadioTile(
                        title: "Busy",
                        subtitle: "See as many places as possible",
                        icon: Icons.flash_on_outlined,
                        value: TripStyle.busy,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 35),

                // ================= CONTINUE =================
                MultiBlocListener(listeners: [
       BlocListener<CreateTripCubit , CreateTripState>(
         listener: (context, state){
          if (state is CreateTripSuccessState) {
                 tripId = state.tripId;
                 context.read<SavePreferencesCubit>().savePreference({
                   "destination": selectedVal,
                   "numberOfDays": numberOfDays,
                   "budget": selectedBudget.name,
                   "interests": favInterests,
                   "tripStyle": selectedTripStyle.name,
                 });

          }
         }
       ),
                  BlocListener<SavePreferencesCubit , SavePreferencesState>(
                    listener: (context, state){

                      if (state is SavePreferencesSuccessState) {
                        Navigator.pushNamed(context, RoutesName.attractions , arguments: tripId  );
                      }
                    },
                  ),


    ], child: SizedBox(
                    width: double.infinity,
                    height: 55,
                    child:BlocBuilder<SavePreferencesCubit, SavePreferencesState>(
                        builder: (context, state) {
                          if (state is SavePreferencesLoadingState) {
                            return Center(child: CircularProgressIndicator());
                          }
                          if (state is SavePreferencesErrorState) {
                            return Center(
                                child: Text(
                                  state.errorMessage,
                                  style: TextStyle(color: Colors.red),
                                ));}
                          return ElevatedButton(
                            onPressed: () {
                              context.read<CreateTripCubit>().createTrip({
                                "destination": selectedVal,
                                "numberOfDays": numberOfDays,
                                "budget": selectedBudget.name,
                                "interests": favInterests,
                                "tripStyle": selectedTripStyle.name,
                              });
                             // كنت حاطت هناfunction ال save preference          


                            },

                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white,

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),

                            child: const Text(
                              "Continue",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        })







               )


                      ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // SECTION TITLE
  // ============================================================

  Widget _buildSectionTitle({required IconData icon, required String title}) {
    return Row(
      children: [
        Icon(icon, size: 22, color: Colors.black87),

        const SizedBox(width: 8),

        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  // ============================================================
  // CARD
  // ============================================================

  Widget _buildCard({required Widget child, EdgeInsets? padding}) {
    return Container(
      width: double.infinity,

      padding: padding ?? const EdgeInsets.all(8),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(16),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: child,
    );
  }

  // ============================================================
  // RADIO TILE
  // ============================================================

  Widget _buildRadioTile<T>({
    required String title,
    required String subtitle,
    required IconData icon,
    required T value,
  }) {
    final bool isSelected;

    if (value is Budget) {
      isSelected = selectedBudget == value;
    } else {
      isSelected = selectedTripStyle == value;
    }

    return InkWell(
      borderRadius: BorderRadius.circular(16),

      onTap: () {
        setState(() {
          if (value is Budget) {
            selectedBudget = value;
          } else if (value is TripStyle) {
            selectedTripStyle = value;
          }
        });
      },

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),

        child: Row(
          children: [
            Container(
              width: 45,
              height: 45,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),

                color: isSelected ? Colors.black12 : Colors.grey.shade100,
              ),

              child: Icon(icon, color: Colors.black87),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 3),

                  Text(
                    subtitle,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                  ),
                ],
              ),
            ),

            Radio<T>(
              value: value,
              groupValue: value is Budget
                  ? selectedBudget as T
                  : selectedTripStyle as T,
              onChanged: (newValue) {
                setState(() {
                  if (newValue is Budget) {
                    selectedBudget = newValue;
                  } else if (newValue is TripStyle) {
                    selectedTripStyle = newValue;
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // INTEREST ICON
  // ============================================================

  IconData _getInterestIcon(String interest) {
    switch (interest) {
      case "History":
        return Icons.account_balance_outlined;

      case "Food":
        return Icons.restaurant_outlined;

      case "Shopping":
        return Icons.shopping_bag_outlined;

      case "Nightlife":
        return Icons.nightlife_outlined;

      default:
        return Icons.favorite_border;
    }
  }
}

enum Budget { low, medium, high }

enum TripStyle { relaxed, balanced, busy }
