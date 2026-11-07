
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/activity.dart';
import '../../data/models/generatedIternaryTrip.dart';
import '../../data/models/tripDay.dart';

class GeneratedTripScreen extends StatefulWidget {
  const GeneratedTripScreen({super.key});

  @override
  State<GeneratedTripScreen> createState() =>
      _GeneratedTripScreenState();
}

class _GeneratedTripScreenState extends State<GeneratedTripScreen> {
  int selectedDayIndex = 0;

  static const Color primaryColor = Color(0xFF246B5B);
  static const Color backgroundColor = Color(0xFFF7F8F6);

  @override
  Widget build(BuildContext context) {
    final generatedTrip =
    ModalRoute.of(context)!.settings.arguments
    as GeneratedIternaryTrip;

    final days = generatedTrip.tripDays ?? [];

    if (days.isEmpty) {
      return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: const Text('Your Trip'),
        ),
        body: const Center(
          child: Text('No activities available for this trip.'),
        ),
      );
    }

    // حماية لو عدد الأيام اتغير
    if (selectedDayIndex >= days.length) {
      selectedDayIndex = 0;
    }

    final currentDay = days[selectedDayIndex];
    final activities = currentDay.activities ?? [];

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Header
            SliverToBoxAdapter(
              child: _buildHeader(context, days.length),
            ),

            // Day selector
            SliverToBoxAdapter(
              child: _buildDaySelector(days),
            ),

            // Day information
            SliverToBoxAdapter(
              child: _buildDayHeader(currentDay),
            ),

            // Activities
            if (activities.isEmpty)
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Center(
                    child: Text('No activities for this day.'),
                  ),
                ),
              )
            else
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 30),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      final activity = activities[index];

                      return _buildActivityCard(
                        activity,
                        index,
                        activities.length,
                      );
                    },
                    childCount: activities.length,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, int totalDays) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 25),
      decoration: const BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.auto_awesome,
                color: Colors.white,
              ),
              const SizedBox(width: 8),
              const Text(
                'AI TRIP PLANNER',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          const Text(
            'Your Adventure\nStarts Here!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 29,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              _headerInfo(
               Icons. calendar_month,
                '$totalDays Days',
              ),
              const SizedBox(width: 20),
              _headerInfo(
                Icons.location_on_outlined,
                'Egypt',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _headerInfo(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.white70, size: 18),
        const SizedBox(width: 6),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
          ),
        ),
      ],
    );
  }

  Widget _buildDaySelector(List<TripDay> days) {
    return SizedBox(
      height: 100.h,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: days.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final isSelected = selectedDayIndex == index;
          final day = days[index];

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedDayIndex = index;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: 75,
              decoration: BoxDecoration(
                color: isSelected ? primaryColor : Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: isSelected
                      ? primaryColor
                      : Colors.grey.shade200,
                ),
                boxShadow: [
                  if (isSelected)
                    BoxShadow(
                      color: primaryColor.withOpacity(0.15),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 0,
                    child: Text(
                      'DAY',
                      style: TextStyle(
                        color: isSelected
                            ? Colors.white70
                            : Colors.grey,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Expanded(
                    flex: 0,
                    child: Text(
                      '${day.day ?? index + 1}',
                      style: TextStyle(
                        color: isSelected
                            ? Colors.white
                            : primaryColor,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDayHeader(TripDay day) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            day.title ?? 'Explore the city',
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF26332F),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'Discover your planned activities for this day.',
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityCard(
      Activity activity,
      int index,
      int totalActivities,
      ) {
    final icon = _getCategoryIcon(activity.category);

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Timeline
          SizedBox(
            width: 38,
            child: Column(
              children: [
                Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    color: primaryColor,
                    size: 18,
                  ),
                ),
                if (index != totalActivities - 1)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: primaryColor.withOpacity(0.2),
                    ),
                  ),
              ],
            ),
          ),

          const SizedBox(width: 10),

          // Activity card
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 18),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: Colors.grey.shade100,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.035),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 15,
                        color: primaryColor,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        activity.time ?? 'Flexible time',
                        style: const TextStyle(
                          color: primaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      _categoryBadge(activity.category),
                    ],
                  ),
                  const SizedBox(height: 13),

                  Text(
                    activity.placeName ?? 'Unknown place',
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF26332F),
                    ),
                  ),
                  const SizedBox(height: 8),

                  Text(
                    activity.description ?? '',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 13,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoryBadge(String? category) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 9,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.08),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        category ?? 'Activity',
        style: const TextStyle(
          color: primaryColor,
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  IconData _getCategoryIcon(String? category) {
    switch (category?.toLowerCase()) {
      case 'history':
      case 'historical':
      case 'attraction':
        return Icons.account_balance;

      case 'food':
      case 'restaurant':
        return Icons.restaurant;

      case 'shopping':
        return Icons.shopping_bag_outlined;

      case 'transportation':
      case 'transport':
        return Icons.directions_car;

      case 'nightlife':
        return Icons.nightlife;

      default:
        return Icons.place_outlined;
    }
  }
}
