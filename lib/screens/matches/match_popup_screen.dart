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
                  ? const Color(0xFF221019).withOpacity(0.9)
                  : const Color(0xFFF8F6F7).withOpacity(0.9),
            ),
          ),

          // Confetti Animation (Simple Custom Implementation)
          ...List.generate(20, (index) => _buildConfetti(index)),

          // Content
          Center(
            child: Container(
              margin: const EdgeInsets.all(24),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.black.withOpacity(0.4)
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
                      fontSize: 48,
                      fontWeight: FontWeight.w900,
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                      letterSpacing: -1,
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
                          left: 10,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white.withOpacity(0.7),
                                width: 4,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Theme.of(
                                    context,
                                  ).primaryColor.withOpacity(0.3),
                                  blurRadius: 15,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: const CircleAvatar(
                              radius: 55,
                              backgroundImage: NetworkImage(
                                "https://lh3.googleusercontent.com/aida-public/AB6AXuAFr3zC83Sfx2_EN42KYrjzDQMpGmmRpMRCvwyo6QpTpCPQPd5u8yC5_ES05YalQmmxogHSeuoBrqcDrDxllKqz4SS81pgGZE6ByqsBI12DFrQEjmiCi1rh1sSXkF9BwljOYOPqx3Nj6JfSVOQhJJPKJGil1e8tI8Q5DdMBFvJCJFVCe_8e4W5ApwjIItB8L-qQW6tt6fJFDN067oEiCTCcjUeNfTp6UeMzC_XIXrWCRHpna0dRAfV5ZcQpk1BvHChtU9c5DgTBy80",
                              ),
                            ),
                          ),
                        ),
                        // Match Avatar (Right)
                        Positioned(
                          right: 10,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white.withOpacity(0.7),
                                width: 4,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.purple.withOpacity(0.3),
                                  blurRadius: 15,
                                  spreadRadius: 2,
                                ),
                              ],
                            ),
                            child: const CircleAvatar(
                              radius: 55,
                              backgroundImage: NetworkImage(
                                "https://lh3.googleusercontent.com/aida-public/AB6AXuAmZvZfaQIBQoUIEeuexZm2nmLSM_VpZopnGeYUOqX37M8Hnsi4G1IzYRq5hLgi-ppLCoboIVZLrOxh67uKd1-OEXJqkDuDWjiGUi1YKMFF5QXAq4y30ITFHWcAtSA_1ln-oJTgw47SSYqQYh4JASsGmCRRwZvkQ_UubzxPrbSrCfLUYL_ELRfotFqzMgTbPo4JfKiSwMlyqeKhDrEjwro-mdaq5qiqk7H81TpiS5Inp9QB8kA9OogCHfjrMZ8l4U-vNpR0tF4W_Mo",
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
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFFEE2B8C),
                                    Color(0xFFA164E3),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(
                                      0xFFEE2B8C,
                                    ).withOpacity(0.4),
                                    blurRadius: 12,
                                    offset: const Offset(0, 4),
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
                    "You and Jane have liked each other.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
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
                            color: Colors.white,
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
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
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

  Widget _buildConfetti(int index) {
    // Simple mock confetti
    return Positioned(
      top: -20,
      left: (index * 20).toDouble() % 400,
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: 1),
        duration: Duration(milliseconds: 2000 + (index * 100)),
        builder: (context, value, child) {
          return Transform.translate(
            offset: Offset((index % 2 == 0 ? 50 : -50) * value, 800 * value),
            child: Transform.rotate(
              angle: value * 10,
              child: Container(
                width: 8,
                height: 8,
                color: index % 3 == 0
                    ? Colors.red
                    : index % 3 == 1
                    ? Colors.blue
                    : Colors.yellow,
              ),
            ),
          );
        },
      ),
    );
  }
}
