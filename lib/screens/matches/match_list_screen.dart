import 'package:flutter/material.dart';

class MatchListScreen extends StatefulWidget {
  const MatchListScreen({super.key});

  @override
  State<MatchListScreen> createState() => _MatchListScreenState();
}

class _MatchListScreenState extends State<MatchListScreen> {
  final List<Map<String, String>> _newMatches = [
    {
      "name": "Chloe",
      "image":
          "https://lh3.googleusercontent.com/aida-public/AB6AXuBjiDAKYE107DNDVDnjdnghPVCwECTRLWsrZq5hg9iCvX6TdZVvVnojJnCKUBPOMOy-8amqPtrGRhtx0BXvYDVbOiqHndy8xEPeketjDp5LTSljieDhVs3NQe90TXvJ2LGflrLIUhQpDuT2IYCIO3lN0OPkGDroC3eSsCw1-1VAdUxqJrWazikUqrgeqzWbs5zLoC3KgZxnPEtyW0UaxoqdWiMa3MRgqA7eM45fkZCuYZM-LtCd0hpfsQF5TaURjhJqBRSkiEonK2Y",
    },
    {
      "name": "Liam",
      "image":
          "https://lh3.googleusercontent.com/aida-public/AB6AXuC2Z0YFw75X0Js6dvOzxc2WUxiL47RELhUabQLTvv3tVHIe5tNVDQHZLDA8W4p_1DEqrIKRprzdtON1HZuwZL31FEXI2Do3Gzwxb1vvwo2iJrEBi6OrZnkPR1Q1DP1JanERGGD_iVAO1I0YUMVU9PoZjbmzu_GVig8AwwdNiDGmuWom0NJ0yPh2actP_TgSJFkLUx-loJ4INkconICkgoYXUFlYQ5voQ5oAnC9hWIf98Yl3wZ2gQlIQjPLKXwhFpW4prlfJ9QZ--pw",
    },
    {
      "name": "Jordan",
      "image":
          "https://lh3.googleusercontent.com/aida-public/AB6AXuCQUnGRvVi_1aqiz1uj-tW1mfGmS5tfErjVvwv_CvGTSH5ZuVG-7Kanwuh4j6P9IdQtGPGyse58qUkdPeW8bFlZcEJpfReUSliFX0Gdhqy2RZEw0sF3myOZpgWNfVc_6D-sGnvRaxlwUabg246J80NEc5EAzXwihzUfSVudxWljeYChgX7osp9ehWE8Tslf6CM5LpNQ4LLwlrKxz2fgU39bfuBgrNEaoG8Z6RLJC0MpmHq9vL5wouT8fK4xShuKJyVINJK56yIDs7Q",
    },
    {
      "name": "Sophie",
      "image":
          "https://lh3.googleusercontent.com/aida-public/AB6AXuAmp2XWin0-_EhWxPsjbVSXqsLywaMHHRlopSm28pFC_Oef8PFGL7TDYnEfsbHEkEnND_QqMV2xQdyQ4Z0A36DaTmlFWnSx0d0x2wCcJhAEyS4OwXZ01k2eQvEbK_YzwkRyXF7CYIEqslOgVpARM118Se76Qcw747dHV7Sc0EwDDdCn0srisAkMAuD-w2QkqaTIBbnkk9nPVWKI4MTeDC9PjaWAGlRVia6JceMEWzJtoeLDKbsp3nWIF0KF7pRC6XizKa6aBSMMcJ4",
    },
    {
      "name": "Marco",
      "image":
          "https://lh3.googleusercontent.com/aida-public/AB6AXuCGzLvNTDuLCD960OYg1246UiHkzXOgso-bvLmbSLBua2zlr7LSZbp6MoOFjVd6JGn7FlctZWCRM2CkUmWxM3e1aKU0n73PvR6YYo-ggAxcJfFmpGMqRIVFIDkMWo3qBCf6KMb6FVANvg1Lg84P-C_tmnRmUtVRlIxWjKb2kQMx5_FdwogseYvd-jh7_Picn6-TlFEdpOwI6ktEyp-QjesFhzOy5kZXxUONFRmWNS-GeLQrUlC5xuDabFSak-9jtJPmhwPOUdXzZIU",
    },
  ];

  final List<Map<String, dynamic>> _messages = [
    {
      "name": "Jessica",
      "message": "Sounds like a plan! Can't wait.",
      "time": "9:41 PM",
      "unread": 2,
      "image":
          "https://lh3.googleusercontent.com/aida-public/AB6AXuB4iN2QLeIE3PrKtwbg6ir3ovF55b9AwIKiFWWoAB6FwYehCKcjgB7AyNxrL4Wa5mOYEkOIO8qDzt5YY4F2402XmuaY6cwANa9lObOfWQhwtu_8QxwMQynsq025Wdj3sv1urNsEGfePEK3APOwxbpSMrtWSy1F6-5EyQN-Pe5cenPknkL70VsBYimL0wTgCBNq5zIzNdF1e_Ql96hddCfFQvJ3fxehKs2buFfvqMg3x84dwZmpUA4mWjUnld6R9ngpJLb5hZjO3ox4",
      "isOnline": true,
    },
    {
      "name": "Alex",
      "message": "You sent a photo 📷",
      "time": "Yesterday",
      "unread": 0,
      "image":
          "https://lh3.googleusercontent.com/aida-public/AB6AXuDGy5_ScTIRW3wLUgJ8C46iNRekcMA6GQNXaW0xcs27TdsuS2BzfhsYItIgvnHvLdRLI_mgvVhUAlZmp7USd9iqvoqAJ-FIRCmQJJbTBnbsitDLbo8odb4UmTL6ResJfLzPUEp9PrH8Carg3mVKiPnDc9Jz_Oth4k5-L9SKUqowV8QtJDeojG_-usKXq_xlWqFHfK70R_jOj5-t-C0DaQEU4c1OoQgi4XhOFPuapBXTiGeb8f88efIJKwIIPANTr8fpJhpC66U07bE",
      "isOnline": false,
    },
    {
      "name": "Maya",
      "message": "Haha that's hilarious! 😂",
      "time": "8:15 PM",
      "unread": 1,
      "image":
          "https://lh3.googleusercontent.com/aida-public/AB6AXuBrvv0pWzwcZO4E7xYzfkf1obRiCuraifE2-4mQGlmUXQb-DoTqiFQllvWEClxvR9m6eTKPg_VJcHnrB2RBp381fsTf7IJ7Ei6OZx0mxXsaEnXRf3W2un33H1p2lMCR9y2mE4E1SPRHJWdbXAs5iOp_n5rKqCYPpisMo3_bOywr_2UosfTyMYub9tEQdzo7gqfK5ev2Gb9TB0EauZhf4WiVjLaJYmEGgiuijRVgzz76PGP93OrT5DrmHX6D8AGfiKiG3UfFiOElc2Y",
      "isOnline": true,
    },
    {
      "name": "David",
      "message": "How's your week going?",
      "time": "Mon",
      "unread": 0,
      "image":
          "https://lh3.googleusercontent.com/aida-public/AB6AXuBxs0QwYFCvCuCsKLj3yI6i4rxYd1jOf6KrHclS0nEsfGH5S4c6kxbSUUhWpGSGz-YaGcGvPitjHYzkem1PNjbHCBTpu9taXueJLRGT0XwDCwtYHLTuMrhUQc4fzxLHilpvuStC3hQ6Lx9l7cMPDrQCG6bFrjni434c5iXnkqO-4Gtx6HkpWRfjwk7z-4zrAzoTUFdmpl1SFyx3GcS59kSJrr5kLHjPgoiD5QgimqWUqRQ2zX7VQ-zzaQQLl0jSn9ygdTmvZ4lLe7c",
      "isOnline": false,
    },
    {
      "name": "Emily",
      "message": "Hey! I had a great time last night.",
      "time": "Sun",
      "unread": 0,
      "image":
          "https://lh3.googleusercontent.com/aida-public/AB6AXuDs9vejh3CLU7CqeEExsobAkYpg8R0U1CJpGLYL_W-HoOsjrVH_UvC-rU6Sg3Al1Dpnaes8ebMdGUuMUT4tKd8OJc1tzhTVJAb15fOylU25sWknqC0aT5Zow0a760QQSwCGqEo_uNW3U6Av7Yd4l1ASULrEEWEghHTQJxVdKJvCELQLP_ll_Fv43ksl6nrAVw5OEQdM7ZZMyl_RBrD-EbXC6HQZw8jgrJ1pkoOfqTSxaU98LFCUZJG6MU2i2vqdP652FRWNlSseKl0",
      "isOnline": true,
    },
  ];

  int _selectedIndex = 1; // Default to Matches tab

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
                : [const Color(0xFFFFDAB9), const Color(0xFFD8BFD8)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 40), // Placeholder for balance
                    Text(
                      "Matches",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white.withOpacity(0.1)
                            : Colors.black.withOpacity(0.05),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.search,
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                      ),
                    ),
                  ],
                ),
              ),

              // New Matches
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "New Matches",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: _newMatches.length,
                  itemBuilder: (context, index) {
                    final match = _newMatches[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [
                                  Theme.of(context).primaryColor,
                                  Colors.orange,
                                ],
                              ),
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(
                                  context,
                                ).scaffoldBackgroundColor,
                              ),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(match["image"]!),
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            match["name"]!,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(
                                context,
                              ).textTheme.bodyLarge?.color,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              // Messages
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.black.withOpacity(0.6)
                        : Colors.white.withOpacity(0.9),
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Messages",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(
                                context,
                              ).textTheme.bodyLarge?.color,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: _messages.length,
                          itemBuilder: (context, index) {
                            final message = _messages[index];
                            return ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              onTap: () {
                                Navigator.pushNamed(context, '/chat');
                              },
                              leading: Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 28,
                                    backgroundImage: NetworkImage(
                                      message["image"],
                                    ),
                                  ),
                                  if (message["isOnline"])
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Container(
                                        width: 12,
                                        height: 12,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Theme.of(
                                              context,
                                            ).scaffoldBackgroundColor,
                                            width: 2,
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              title: Text(
                                message["name"],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              subtitle: Text(
                                message["message"],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: message["unread"] > 0
                                      ? Theme.of(context).primaryColor
                                      : Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.color
                                            ?.withOpacity(0.6),
                                  fontWeight: message["unread"] > 0
                                      ? FontWeight.w600
                                      : FontWeight.normal,
                                ),
                              ),
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    message["time"],
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.color
                                          ?.withOpacity(0.5),
                                    ),
                                  ),
                                  if (message["unread"] > 0)
                                    Container(
                                      margin: const EdgeInsets.only(top: 4),
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: Text(
                                          message["unread"].toString(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.black.withOpacity(0.5)
              : Colors.white.withOpacity(0.7),
          border: Border(
            top: BorderSide(
              color: Theme.of(context).dividerColor.withOpacity(0.1),
            ),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
            if (index == 0) {
              Navigator.pushReplacementNamed(context, '/home');
            }
            // Other tabs logic
          },
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Theme.of(
            context,
          ).textTheme.bodyLarge?.color?.withOpacity(0.5),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined),
              label: "Discover",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Matches",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline),
              label: "Messages",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
