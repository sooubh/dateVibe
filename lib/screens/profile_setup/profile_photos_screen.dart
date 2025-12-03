import 'package:flutter/material.dart';

class ProfilePhotosScreen extends StatefulWidget {
  const ProfilePhotosScreen({super.key});

  @override
  State<ProfilePhotosScreen> createState() => _ProfilePhotosScreenState();
}

class _ProfilePhotosScreenState extends State<ProfilePhotosScreen> {
  final List<String?> _photos = [
    "https://lh3.googleusercontent.com/aida-public/AB6AXuAUugdxk0HL8cGArQsTBvygfH-5bsrJqvJ3t31XdjudXuzUDiisLTww8ciUwuy2wQNBLFijeIKULhlwuzqhEgvZrMmMtvh5lu1vSSUXAIuD92he52A6_Yp929yLda2ZNzmuDUGyXCMqTWA-9Nfi6LeTvo2s2vxfIT5MuARB0R5f6JeVuYFcjbxHAN3x6zn_FqC8V4iD60a5CrUS4O1K6E3vh4757gj1yRQIFMIZNVABA31miks6YYt3gRCtitRihNeCzunILUqRyuw",
    "https://lh3.googleusercontent.com/aida-public/AB6AXuDEESTatolwTVMGvl0STqCDMX-s_F2_pNiMrhqGm1B_7MO7OxvSrYFwiJiDIpQ021EtMZzz6_Uzir1sLKTPwsty2HBbGj15pAwY3_IZku_EdHhkWEFK-5iRSaAlllMORDPRz7XXj1B4Ry-CvoOWUucwMN-YKeKmvYhHaJ7tn5cmTi_NHtnxdAZcaSGXlitwsBJG8MUo4tzk8100J1kDeQU6KT7N5eKCzmvp7yMqIpq9zULPh0Ix0lhGMAoOcFPBGu0TPeR_6uPPZms",
    "https://lh3.googleusercontent.com/aida-public/AB6AXuAyQUHpe8qKS4p25TDPByardaNVpDcYZMRl_TyTIGlFo1WriShPJVgPldZkqQtLHRkaFxTWT-gPG95uUA7AI3rWrfht_1KaHuRMMFo04d84tEDwTU2bgVBH4LzHydBVAI681ZeNNnyXLQvVc-BSEl2j2l3N9mi6SOUWepj4inib_R-d0UdnUUSLziiaIcnoZTJLq66ZJML25gkVxlYT-Hf3eX7tjFza56Q843kyl2DFCVgphl3-YxpvIvTx47lDxroJbuQqKSWXpDQ",
    null,
    null,
    null,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: Theme.of(context).brightness == Brightness.dark
                ? [const Color(0xFF221019), const Color(0xFF432233)]
                : [const Color(0xFFFFDAB9), const Color(0xFFFFC0CB)],
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
                        "Upload Your Photos",
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
                child: Container(
                  height: 6,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor:
                        0.6, // Step 4 of ? (Design says Step 3 of 5 in one place, but this is photos)
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      Text(
                        "Your profile starts with a great photo. Add at least 3.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(
                            context,
                          ).textTheme.bodyLarge?.color?.withOpacity(0.8),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Main Photo
                      _buildPhotoSlot(0, isMain: true),
                      const SizedBox(height: 12),

                      // Secondary Photos Grid
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              childAspectRatio: 1,
                            ),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return _buildPhotoSlot(index + 1);
                        },
                      ),
                    ],
                  ),
                ),
              ),

              // Next Button
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/home',
                        (route) => false,
                      );
                    },
                    child: const Text("Next"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPhotoSlot(int index, {bool isMain = false}) {
    final photoUrl = _photos[index];
    return AspectRatio(
      aspectRatio: isMain ? 4 / 5 : 1,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.black.withOpacity(0.2)
              : Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(16),
          border: photoUrl == null
              ? Border.all(
                  color: Theme.of(context).primaryColor.withOpacity(0.5),
                  style: BorderStyle
                      .solid, // Dashed border not directly supported without custom painter, solid for now
                  width: 2,
                )
              : null,
          image: photoUrl != null
              ? DecorationImage(
                  image: NetworkImage(photoUrl),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: Stack(
          children: [
            if (photoUrl == null)
              Center(
                child: Icon(
                  Icons.add_photo_alternate,
                  color: const Color(0xFF87CEEB), // Sky Blue
                  size: isMain ? 48 : 32,
                ),
              ),
            if (photoUrl != null)
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _photos[index] = null;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
              ),
            if (isMain && photoUrl != null)
              Positioned(
                bottom: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    "Main Photo",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
