import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const NetworkImage(
              'https://lh3.googleusercontent.com/aida-public/AB6AXuDE720LrOBekkErTBc2ZP_Lp075Mm82qNZjvajAQojREgw7XVsBABOVifVVs-OlIHc9qrCMhNJ5PFjPd114vrVQRXavBvPO9Z2xBXBTgYr-gMoX_tte95IXVXS-lREjHEirsmTYnXhn6qxgkvThf5HFSgvPUlRcjzKOzJGsiTCmpaqwa-h272nu7-_ZJEqUV5abLgZGnpBaQa50Y2C6JaaPW-BFypjjSTGo3glJlrncr3QJ3P7kjbeTwhsal8WVxZo1-qLUxjQGT8E',
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.darken,
            ),
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: Theme.of(context).primaryColor,
                      size: 48,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "DateVibe",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Card
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.black.withOpacity(0.4)
                          : Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(
                            context,
                          ).primaryColor.withOpacity(0.1),
                          blurRadius: 24,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Join the Vibe",
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 24),

                        // Toggle
                        Container(
                          height: 48,
                          decoration: BoxDecoration(
                            color: Theme.of(
                              context,
                            ).primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () => setState(() => _isLogin = false),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: !_isLogin
                                          ? Theme.of(
                                              context,
                                            ).scaffoldBackgroundColor
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(24),
                                      boxShadow: !_isLogin
                                          ? [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(
                                                  0.1,
                                                ),
                                                blurRadius: 4,
                                              ),
                                            ]
                                          : [],
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: !_isLogin
                                            ? Theme.of(
                                                context,
                                              ).textTheme.bodyLarge?.color
                                            : Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () => setState(() => _isLogin = true),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: _isLogin
                                          ? Theme.of(
                                              context,
                                            ).scaffoldBackgroundColor
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(24),
                                      boxShadow: _isLogin
                                          ? [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(
                                                  0.1,
                                                ),
                                                blurRadius: 4,
                                              ),
                                            ]
                                          : [],
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: _isLogin
                                            ? Theme.of(
                                                context,
                                              ).textTheme.bodyLarge?.color
                                            : Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Inputs
                        _buildTextField(
                          context,
                          label: "Email Address",
                          icon: Icons.mail_outline,
                          placeholder: "Enter your email",
                        ),
                        const SizedBox(height: 16),
                        _buildTextField(
                          context,
                          label: "Password",
                          icon: Icons.lock_outline,
                          placeholder: "Enter your password",
                          isPassword: true,
                        ),
                        const SizedBox(height: 24),

                        // Button
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/otp');
                            },
                            child: Text(_isLogin ? "Login" : "Create Account"),
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Divider
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                color: Theme.of(
                                  context,
                                ).primaryColor.withOpacity(0.2),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: Text(
                                "or",
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: Theme.of(
                                  context,
                                ).primaryColor.withOpacity(0.2),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),

                        // Social Login
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildSocialButton(
                              'https://lh3.googleusercontent.com/aida-public/AB6AXuCu_GjWEtdcRQCe_6m50S76zQcsjrolIgrgwG-Y3kZvOMwgT0VpDjn6MbOaJTx1jYynQEsUvvtDiOBPhnKWH-VkaPUEnf5Q93gHqLMoxBb4WrKYMBAaCvUVw91f9HrsVuyTMHZOzqlCS5h_atZlHQqhBzd6fPCF7DvG_6gNnodxSn-SgV30uMGosvzfrpzOG-4Yxk0NYG9AvnDaSQHzWuhF--tV7LQfanzupbGkU9uGMeGB7uYPQVLy1W-u-wLqyZhOjucnSdpn3-M',
                            ),
                            const SizedBox(width: 16),
                            _buildSocialButton(
                              'https://lh3.googleusercontent.com/aida-public/AB6AXuALFolUSLK2hlTtsl8aRuwJVmjibKVMyF5ze_TCVURYsaEumKLY9dekJ8iqlWP4Vd_jhNO-VPZqEewS5WdKEw088TYl5pgSBobJGLNbfZzszzbb0M66mH0MIQpqxcIF5D0TeSnTzSXjkmFj9JgRA0BRUnxuKXibG-ofxnRVUVFDYdsy4535p3xZlxxgIs28SQ9DyXUUN-6npAZ4bYZ1dEQO1w5yyzCAKSiWlZzs1N9ED1AT_g759kEJW1sL6wm19mZa0gjdtk41ZzE',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "By continuing, you agree to our Terms of Service and Privacy Policy.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    BuildContext context, {
    required String label,
    required IconData icon,
    required String placeholder,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            obscureText: isPassword,
            decoration: InputDecoration(
              prefixIcon: Icon(icon, color: Theme.of(context).primaryColor),
              hintText: placeholder,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSocialButton(String iconUrl) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Image.network(iconUrl),
    );
  }
}
