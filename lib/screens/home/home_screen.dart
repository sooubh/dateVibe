import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final List<Profile> _profiles = [
    Profile(
      name: "Jessica",
      age: 24,
      bio:
          "Lover of coffee and spontaneous adventures. Let's explore the city together!",
      imageUrl:
          "https://lh3.googleusercontent.com/aida-public/AB6AXuB18bVsatgqgjqt98qWG-eWiBjkhtp7Ds6y8IyKMHl-UzSKOI_QJw1ht35DViXC1LLGLsj5riKQScK5WoCXvgq-42LBh6iH_P6DtcONyN5O7Wa23tuNX0JGgOlDcLuoOku0dfiA7Y05-uatODYmHo2hQXZ4NRc000MW8-3WTEk6nj9LuImvj1Qe99BGyFv2MxxXsvKlGtYx4I57YTB7z6oQxSbEvpAK1KMO5QDyN0gLqIl8N8Kf8JhHnQ-drhQz4bGWhblhG-a6sfQ",
      distance: "5 miles away",
    ),
    Profile(
      name: "Liam",
      age: 28,
      bio: "Photographer and hiker. Always looking for the next great shot.",
      imageUrl:
          "https://lh3.googleusercontent.com/aida-public/AB6AXuCl3ZWkNjw6t8fywh4MQadpPs055VS_fuPf_Kr4ZJNBivl8ADQM3ACKf4eRRvZyNXIPbxVVNEI8nqwma-3HGyK9q6aIoJTCWUHQ6N2s7pOeo4121JNGhEOo_6PyexdeKpR3fwXFQTPFPUHqm8C_34349clTdJgynWrhFOOCpFJlrvEH-4InN12u9prHmleK0UPTjhKHcslrcnC7WPmemAcwxf6vezYSEznkfnJkE6GeWkj8r9QvmtIWCP-x8m06obcNXcCxk8TkT2o",
      distance: "12 miles away",
    ),
    Profile(
      name: "Sophia",
      age: 22,
      bio: "Art student. I love museums and painting.",
      imageUrl:
          "https://lh3.googleusercontent.com/aida-public/AB6AXuAxT06skvn1FGRtkDHBc0I7R2QJfaawCieZ7q0qcjDjyuUiJQPSan8q8QjGiLrVgABIV7hheX8PTe47wk1wFJw0avol80-tRKavFXOJMcUiC9Yr95fAbXVEWxNrOBRN9Q1PvAvnM1vu5iNMjco2vqVSEYWc_c-ZlrKFV-ILQl-BxE5ifR5tpY04I_Vc_2YHqfsY3KFILZPiSflbtlHgAn1a6FxnsPuT0QFYiE6KhvEp3rV24V3WclpNTE92GuOS1t3isVzZnRtQe_g",
      distance: "3 miles away",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? AppTheme.backgroundDark
          : AppTheme.backgroundLight,
      body: SafeArea(
        child: Column(
          children: [
            // Top App Bar
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // User Profile Picture
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                        image: NetworkImage(
                          "https://lh3.googleusercontent.com/aida-public/AB6AXuB5qpZsFfc3XAJAv2ASDTFcQf_HvhJAVOE2hdmhU4Kc5YCfctDcewa4D5CwsgkehbUK8Fb1gNetb0aO3zRQ0s1F5G-95irX8B86dL1HXz4HHX2pmzEhU67HC01DaqGQgfoJUR2XM1ZuFpTVxRgy5WETKGetTvaqpcUwtbazf8sQ3RaYXuQ-wXwQ4ajirgoE4ewN4bLx-Vvx6VQRBqa_mhp9M7p75BGRWRXvLrFj-_FL_e1QV6UmIp94-r1yLeEgfcZ2AavVZ5eVJXs",
                        ),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                  ),
                  // App Title
                  Text(
                    "DateVibe",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                  ),
                  // Chat Button
                  IconButton(
                    icon: const Icon(Icons.chat_bubble_outline),
                    onPressed: () {
                      Navigator.pushNamed(context, '/matches');
                    },
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                ],
              ),
            ),

            // Card Stack
            Expanded(
              child: _profiles.isEmpty
                  ? Center(
                      child: Text(
                        "No more profiles!",
                        style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                        ),
                      ),
                    )
                  : Stack(
                      children: _profiles.asMap().entries.map((entry) {
                        final index = entry.key;
                        final profile = entry.value;
                        final isTop = index == _profiles.length - 1;

                        return DraggableCard(
                          key: ValueKey(profile.name),
                          profile: profile,
                          isTop: isTop,
                          onSwipedRight: () {
                            _removeTopCard();
                            // Simulate a match for demo purposes
                            if (profile.name == "Jessica") {
                              Navigator.pushNamed(context, '/match_popup');
                            }
                          },
                          onSwipedLeft: () {
                            _removeTopCard();
                          },
                        );
                      }).toList(),
                    ),
            ),

            // Bottom Buttons
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Nope Button
                  _buildActionButton(
                    icon: Icons.close,
                    color: const Color(0xFFE57373), // Red/Pink
                    onPressed: () {
                      if (_profiles.isNotEmpty) {
                        // Trigger swipe left logic (simplified for button)
                        _removeTopCard();
                      }
                    },
                  ),
                  // Like Button
                  _buildActionButton(
                    icon: Icons.favorite,
                    color: AppTheme.primaryColor,
                    isLarge: true,
                    onPressed: () {
                      if (_profiles.isNotEmpty) {
                        // Trigger swipe right logic (simplified for button)
                        final profile = _profiles.last;
                        _removeTopCard();
                        if (profile.name == "Jessica") {
                          Navigator.pushNamed(context, '/match_popup');
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _removeTopCard() {
    setState(() {
      _profiles.removeLast();
    });
  }

  Widget _buildActionButton({
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
    bool isLarge = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: EdgeInsets.all(isLarge ? 24 : 16),
          backgroundColor: Colors.white,
          foregroundColor: color,
          elevation: 0,
        ),
        child: Icon(icon, size: isLarge ? 32 : 24),
      ),
    );
  }
}

class DraggableCard extends StatefulWidget {
  final Profile profile;
  final bool isTop;
  final VoidCallback onSwipedRight;
  final VoidCallback onSwipedLeft;

  const DraggableCard({
    super.key,
    required this.profile,
    required this.isTop,
    required this.onSwipedRight,
    required this.onSwipedLeft,
  });

  @override
  State<DraggableCard> createState() => _DraggableCardState();
}

class _DraggableCardState extends State<DraggableCard> {
  Offset _position = Offset.zero;
  double _angle = 0;

  final double _screenSize = 500; // Approximate width for calculations

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: widget.isTop
          ? GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  _position += details.delta;
                  _angle = (_position.dx / _screenSize) * 0.5;
                });
              },
              onPanEnd: (details) {
                if (_position.dx > 100) {
                  widget.onSwipedRight();
                } else if (_position.dx < -100) {
                  widget.onSwipedLeft();
                } else {
                  setState(() {
                    _position = Offset.zero;
                    _angle = 0;
                  });
                }
              },
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final center = constraints.biggest.center(Offset.zero);
                  final rotateMatrix = Matrix4.identity()
                    ..translate(center.dx, center.dy)
                    ..rotateZ(_angle)
                    ..translate(-center.dx, -center.dy)
                    ..translate(_position.dx, _position.dy);

                  return Transform(
                    transform: rotateMatrix,
                    alignment: Alignment.center,
                    child: _buildCardContent(context),
                  );
                },
              ),
            )
          : _buildCardContent(context), // Background cards don't move
    );
  }

  Widget _buildCardContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
          image: DecorationImage(
            image: NetworkImage(widget.profile.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
              stops: const [0.6, 1.0],
            ),
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${widget.profile.name}, ${widget.profile.age}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.profile.bio,
                style: const TextStyle(color: Colors.white70, fontSize: 16),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(Icons.location_on, color: Colors.white, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    widget.profile.distance,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Profile {
  final String name;
  final int age;
  final String bio;
  final String imageUrl;
  final String distance;

  Profile({
    required this.name,
    required this.age,
    required this.bio,
    required this.imageUrl,
    required this.distance,
  });
}
