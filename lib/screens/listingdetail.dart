import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ListingDetailPage extends StatefulWidget {
  final Map<String, dynamic> houseData;

  const ListingDetailPage({super.key, required this.houseData});

  @override
  State<ListingDetailPage> createState() => _ListingDetailPageState();
}

class _ListingDetailPageState extends State<ListingDetailPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  Future<void> _callLandlord(String phone) async {
    final Uri url = Uri.parse("tel:$phone");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      debugPrint('Could not launch dialer for $phone');
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isFromFile = widget.houseData['isFromFile'] ?? false;
    // Get the list of images for the gallery (either from file paths or asset paths)
    final List<dynamic> imageList =
        widget.houseData['images'] ?? [widget.houseData['img']];

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 350, // Increased height for better gallery viewing
            pinned: true,
            backgroundColor: Colors.pinkAccent,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  // SWIPEABLE IMAGE GALLERY
                  PageView.builder(
                    controller: _pageController,
                    onPageChanged: (int page) =>
                        setState(() => _currentPage = page),
                    itemCount: imageList.length,
                    itemBuilder: (context, index) {
                      final String path = imageList[index];
                      return isFromFile
                          ? Image.file(
                              File(path),
                              fit: BoxFit.cover,
                              errorBuilder: (context, e, s) =>
                                  _buildErrorPlaceholder(),
                            )
                          : Image.asset(
                              path,
                              fit: BoxFit.cover,
                              errorBuilder: (context, e, s) =>
                                  _buildErrorPlaceholder(),
                            );
                    },
                  ),

                  // --- PAGE INDICATOR (Dots) ---
                  if (imageList.length > 1)
                    Positioned(
                      bottom: 20,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          imageList.length,
                          (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            height: 8,
                            width: _currentPage == index ? 24 : 8,
                            decoration: BoxDecoration(
                              color: _currentPage == index
                                  ? Colors.white
                                  : Colors.white54,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            leading: IconButton(
              icon: const CircleAvatar(
                backgroundColor: Colors.black26,
                child: Icon(Icons.arrow_back, color: Colors.white),
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- TITLE & PRICE ---
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          widget.houseData['title'] ?? "Unnamed Property",
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        "Ksh ${widget.houseData['price']}",
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.pinkAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // --- LOCATION ---
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 16,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        widget.houseData['location'] ?? "Location unknown",
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  const Divider(height: 40),

                  // --- DESCRIPTION ---
                  const Text(
                    "Description",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.houseData['description'] ??
                        "No description provided.",
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // --- AMENITIES ---
                  const Text(
                    "Amenities",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    children:
                        (widget.houseData['amenities'] as List<dynamic>?)?.map((
                          item,
                        ) {
                          return Chip(
                            label: Text(item.toString()),
                            backgroundColor: Colors.pinkAccent.withOpacity(
                              0.05,
                            ),
                            side: BorderSide.none,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          );
                        }).toList() ??
                        [
                          const Text(
                            "Standard utilities included",
                            style: TextStyle(
                              color: Colors.grey,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                  ),
                  const SizedBox(height: 120),
                ],
              ),
            ),
          ),
        ],
      ),

      // --- STICKY BOTTOM BUTTON ---
      bottomSheet: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.pinkAccent,
            minimumSize: const Size(double.infinity, 55),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: () => _callLandlord(widget.houseData['phone'] ?? ""),
          icon: const Icon(Icons.phone, color: Colors.white),
          label: const Text(
            "Contact Landlord",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildErrorPlaceholder() {
    return Container(
      color: Colors.grey[200],
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.broken_image_outlined, color: Colors.grey, size: 50),
            SizedBox(height: 8),
            Text("Image unavailable", style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
