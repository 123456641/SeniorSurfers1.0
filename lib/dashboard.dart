import 'package:flutter/material.dart';
import 'package:senior_surfers/header_widget.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isWeb = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: const HeaderWidget(title: 'Senior Surfers'),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 1.0, top: 8.0, bottom: 8.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Dashboard',
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                      color: Color(0xFF27445D),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.settings, size: 30, color: Color(0xFF27445D)),
                    onPressed: () {
                      Navigator.pushNamed(context, '/settings');
                    },
                    tooltip: 'Settings',
                  ),
                ],
              ),
            ),
            Expanded(
              child: isWeb 
                  ? _buildWebLayout(context)
                  : _buildMobileLayout(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: _buildImageButtons(context),
    );
  }

  Widget _buildWebLayout(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildImageButtons(context).take(4).map((button) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SizedBox(
                  width: 250,
                  height: 250,
                  child: button,
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buildImageButtons(context).skip(4).take(3).map((button) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SizedBox(
                  width: 250,
                  height: 250,
                  child: button,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildImageButtons(BuildContext context) {
    return [
      ImageButton(
        imagePath: "assets/images/tutorial.png",
        label: "Tutorials",  // Added label
        onTap: () {
          Navigator.pushNamed(context, '/tutorials');
        },
      ),
      ImageButton(
        imagePath: "assets/images/practice.png",
        label: "Practice M",  // Added label
        onTap: () {
          Navigator.pushNamed(context, '/practice');
        },
      ),
      ImageButton(
        imagePath: "assets/images/tech_glossary.png",
        label: "Tech Glossary",  // Added label
        onTap: () {
          Navigator.pushNamed(context, '/techglossary');
        },
      ),
      ImageButton(
        imagePath: "assets/images/notification.png",
        label: "Notifications",  // Added label
        onTap: () {
          Navigator.pushNamed(context, '/notification');
        },
      ),
      ImageButton(
        imagePath: "assets/images/games.png",
        label: "Games",  // Added label
        onTap: () {
          Navigator.pushNamed(context, '/games');
        },
      ),
      ImageButton(
        imagePath: "assets/images/community_forum.png",
        label: "Community Forum",  // Added label
        onTap: () {
          Navigator.pushNamed(context, '/community');
        },
      ),
      ImageButton(
        imagePath: "assets/images/achievements.png",
        label: "Achievements",  // Added label
        onTap: () {
          Navigator.pushNamed(context, '/achievements');
        },
      ),
    ];
  }
}









class ImageButton extends StatefulWidget {
  final String imagePath;
  final String label;  // Added label property
  final VoidCallback? onTap;

  const ImageButton({super.key, required this.imagePath, this.onTap, required this.label}); // Added label to constructor

  @override
  State<ImageButton> createState() => _ImageButtonState();
}

class _ImageButtonState extends State<ImageButton> {
  bool _isHovered = false;

  void _handleTap() {
    if (widget.onTap != null) {
      widget.onTap!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: _handleTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: _isHovered ? (Matrix4.identity()..scale(1.05)) : Matrix4.identity(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: _isHovered ? Colors.black.withOpacity(0.1) : Colors.transparent,
            border: _isHovered ? Border.all(color: Colors.blue, width: 3) : null,
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    )
                  ]
                : null,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Stack(
                alignment: Alignment.bottomCenter,  // Keeping alignment for label at the bottom
                children: [
                  Image.asset(
                    widget.imagePath,
                    fit: BoxFit.cover,  // Ensure the image covers the space
                  ),
                  Positioned(
                    bottom: 10,  // Lifting the label a bit higher
                    left: 10,  // Move the label slightly to the left
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        widget.label,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
}
