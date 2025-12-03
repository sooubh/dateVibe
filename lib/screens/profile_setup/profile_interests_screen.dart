import 'package:flutter/material.dart';

class ProfileInterestsScreen extends StatefulWidget {
  const ProfileInterestsScreen({super.key});

  @override
  State<ProfileInterestsScreen> createState() => _ProfileInterestsScreenState();
}

class _ProfileInterestsScreenState extends State<ProfileInterestsScreen> {
  final List<String> _selectedInterests = [];
  final List<String> _categories = [
    "Creative",
    "Sports",
    "Foodie",
    "Going Out",
    "Staying In",
  ];
  String _selectedCategory = "Creative";

  final Map<String, List<String>> _interestsByCategory = {
    "Creative": [
      "Photography",
      "Painting",
      "Music",
      "Writing",
      "Art",
      "Design",
      "Dancing",
    ],
    "Sports": ["Soccer", "Basketball", "Tennis", "Swimming", "Yoga", "Gym"],
    "Foodie": ["Cooking", "Baking", "Coffee", "Wine", "Pizza", "Sushi"],
    "Going Out": ["Concerts", "Festivals", "Clubbing", "Bars", "Karaoke"],
    "Staying In": ["Movies", "Reading", "Gaming", "Board Games", "Netflix"],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: Theme.of(context).brightness == Brightness.dark
                ? [const Color(0xFF221019), const Color(0xFF1A0C14)]
                : [const Color(0xFFFFDAB9), const Color(0xFF87CEEB)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new),
                      onPressed: () => Navigator.pop(context),
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                    Expanded(
                      child: Text(
                        "Select Your Interests",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                        ),
                      ),
                    ),
                    const SizedBox(width: 48),
                  ],
                ),
              ),

              // Progress
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${_selectedInterests.length} of 5 selected",
                          style: TextStyle(
                            color: Theme.of(
                              context,
                            ).textTheme.bodyLarge?.color?.withOpacity(0.8),
                          ),
                        ),
                        Text(
                          "Step 3 of 4",
                          style: TextStyle(
                            color: Theme.of(
                              context,
                            ).textTheme.bodyLarge?.color?.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 6,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white.withOpacity(0.2)
                            : Colors.white.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: 0.75,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFFFF85A1), Color(0xFFB39DDB)],
                            ),
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Search Bar
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Container(
                  height: 56,
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white.withOpacity(0.1)
                        : Colors.white.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Theme.of(
                          context,
                        ).textTheme.bodyLarge?.color?.withOpacity(0.6),
                      ),
                      hintText: "Search for interests...",
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 16,
                      ),
                      hintStyle: TextStyle(
                        color: Theme.of(
                          context,
                        ).textTheme.bodyLarge?.color?.withOpacity(0.6),
                      ),
                    ),
                  ),
                ),
              ),

              // Categories
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: _categories.map((category) {
                    final isSelected = _selectedCategory == category;
                    return GestureDetector(
                      onTap: () => setState(() => _selectedCategory = category),
                      child: Container(
                        margin: const EdgeInsets.only(right: 24),
                        padding: const EdgeInsets.only(bottom: 8),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: isSelected
                                  ? const Color(0xFFFF85A1)
                                  : Colors.transparent,
                              width: 3,
                            ),
                          ),
                        ),
                        child: Text(
                          category,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isSelected
                                ? const Color(0xFFFF85A1)
                                : Theme.of(context).textTheme.bodyLarge?.color
                                      ?.withOpacity(0.6),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),

              // Interests Grid
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: (_interestsByCategory[_selectedCategory] ?? [])
                        .map((interest) {
                          final isSelected = _selectedInterests.contains(
                            interest,
                          );
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                if (isSelected) {
                                  _selectedInterests.remove(interest);
                                } else {
                                  if (_selectedInterests.length < 5) {
                                    _selectedInterests.add(interest);
                                  }
                                }
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                gradient: isSelected
                                    ? const LinearGradient(
                                        colors: [
                                          Color(0xFFFF85A1),
                                          Color(0xFFB39DDB),
                                        ],
                                      )
                                    : null,
                                color: isSelected
                                    ? null
                                    : (Theme.of(context).brightness ==
                                              Brightness.dark
                                          ? Colors.white.withOpacity(0.1)
                                          : Colors.white.withOpacity(0.4)),
                                borderRadius: BorderRadius.circular(24),
                                boxShadow: isSelected
                                    ? [
                                        BoxShadow(
                                          color: const Color(
                                            0xFFFF85A1,
                                          ).withOpacity(0.4),
                                          blurRadius: 8,
                                          offset: const Offset(0, 4),
                                        ),
                                      ]
                                    : [],
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (isSelected)
                                    const Padding(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Icon(
                                        Icons.check_circle,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  Text(
                                    interest,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: isSelected
                                          ? Colors.white
                                          : Theme.of(
                                              context,
                                            ).textTheme.bodyLarge?.color,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        })
                        .toList(),
                  ),
                ),
              ),

              // Save Button
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFFF85A1), Color(0xFFB39DDB)],
                      ),
                      borderRadius: BorderRadius.circular(28),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFFF85A1).withOpacity(0.4),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/profile_photos');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Save Profile"),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
