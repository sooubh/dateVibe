import 'package:flutter/material.dart';

class MatchPopupScreen extends StatefulWidget {
  const MatchPopupScreen({super.key});

  @override
  State<MatchPopupScreen> createState() => _MatchPopupScreenState();
}

class _MatchPopupScreenState extends State<MatchPopupScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..repeat(reverse: true);
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.2,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // Background with blur effect
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.black.withOpacity(0.8)
                  : Colors.white.withOpacity(0.8),
            ),
          ),

          // Content
          Center(
            child: Container(
              margin: const EdgeInsets.all(24),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.black.withOpacity(0.7)
                    : Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.white.withOpacity(0.2)),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).primaryColor.withOpacity(0.2),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "It's a Match!",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Avatars
                  SizedBox(
                    height: 160,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // User Avatar (Left)
                        Positioned(
                          left: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 4),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                            child: const CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage(
                                "https://lh3.googleusercontent.com/aida-public/AB6AXuB5qpZsFfc3XAJAv2ASDTFcQf_HvhJAVOE2hdmhU4Kc5YCfctDcewa4D5CwsgkehbUK8Fb1gNetb0aO3zRQ0s1F5G-95irX8B86dL1HXz4HHX2pmzEhU67HC01DaqGQgfoJUR2XM1ZuFpTVxRgy5WETKGetTvaqpcUwtbazf8sQ3RaYXuQ-wXwQ4ajirgoE4ewN4bLx-Vvx6VQRBqa_mhp9M7p75BGRWRXvLrFj-_FL_e1QV6UmIp94-r1yLeEgfcZ2AavVZ5eVJXs",
                              ),
                            ),
                          ),
                        ),
                        // Match Avatar (Right)
                        Positioned(
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 4),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                            child: const CircleAvatar(
                              radius: 50,
                              backgroundImage: NetworkImage(
                                "https://lh3.googleusercontent.com/aida-public/AB6AXuB18bVsatgqgjqt98qWG-eWiBjkhtp7Ds6y8IyKMHl-UzSKOI_QJw1ht35DViXC1LLGLsj5riKQScK5WoCXvgq-42LBh6iH_P6DtcONyN5O7Wa23tuNX0JGgOlDcLuoOku0dfiA7Y05-uatODYmHo2hQXZ4NRc000MW8-3WTEk6nj9LuImvj1Qe99BGyFv2MxxXsvKlGtYx4I57YTB7z6oQxSbEvpAK1KMO5QDyN0gLqIl8N8Kf8JhHnQ-drhQz4bGWhblhG-a6sfQ",
                              ),
                            ),
                          ),
                        ),
                        // Heart Icon
                        Positioned(
                          bottom: 0,
                          child: ScaleTransition(
                            scale: _scaleAnimation,
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFFEE2B8C),
                                    Color(0xFFA164E3),
                                  ],
                                ),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(
                                      0xFFEE2B8C,
                                    ).withOpacity(0.4),
                                    blurRadius: 10,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.favorite,
                                color: Colors.white,
                                size: 32,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),
                  Text(
                    "You and Jessica have liked each other.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(
                        context,
                      ).textTheme.bodyLarge?.color?.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Buttons
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFFEE2B8C), Color(0xFFA164E3)],
                        ),
                        borderRadius: BorderRadius.circular(28),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFEE2B8C).withOpacity(0.4),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/chat');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                        ),
                        child: const Text(
                          "Start Chat",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Keep Swiping",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                      ),
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
}
