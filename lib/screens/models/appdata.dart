class Listing {
  final bool isFromFile;
  final String title;
  final String price;
  final String location;
  final String image;
  final String description;
  final String phone;
  final List<String> amenities;

  Listing({
    this.isFromFile = false,
    required this.title,
    required this.price,
    required this.location,
    required this.image,
    this.description = "No description provided.",
    required this.phone,
    this.amenities = const [],
  });

  void operator [](String other) {}
}

class AppData {
  static String? loggedInLandlordPhone;
  static List<Listing> listings = [
    Listing(
      title: 'Blue House',
      price: '3500',
      phone: '0712345678',
      location: 'Nchiru',
      image: 'images/nchiru/bluehouse.jpg',
    ),
    Listing(
      title: 'Green House',
      price: '3000',
      location: 'Nchiru',
      phone: '0712345678',
      image: 'images/nchiru/greenhouse.jpg',
    ),
    Listing(
      title: 'Orange House',
      price: '4000',
      location: 'Nchiru',
      phone: '0712345678',
      image: 'images/nchiru/orangehouse.jpg',
    ),
    Listing(
      title: 'Villa House',
      price: '5000',
      location: 'Nchiru',
      phone: '0712345678',
      image: 'images/nchiru/villahouse.jpg',
    ),
    Listing(
      title: 'Pink House',
      price: '6000',
      location: 'Nchiru',
      phone: '0712345678',
      image: 'images/nchiru/pinkhouse.jpg',
    ),
    Listing(
      title: 'Mascan Studios',
      price: '4500',
      location: 'Mascan',
      phone: '0712345678',
      image: 'images/mascan/mascan.jpg',
    ),
    Listing(
      title: 'Studio House',
      price: '5000',
      location: 'Mascan',
      phone: '0712345678',
      image: 'images/mascan/studiohouse.jpg',
    ),
    Listing(
      title: 'Cozy House',
      price: '6000',
      location: 'Mascan',
      phone: '0712345678',
      image: 'images/mascan/cozyhouse.jpg',
    ),
    Listing(
      title: 'Fun Villa',
      price: '5000',
      location: 'Mascan',
      phone: '0712345678',
      image: 'images/mascan/funvilla.jpg',
    ),
    Listing(
      title: 'Campus Villa',
      price: '4000',
      location: 'Mascan',
      phone: '0712345678',
      image: 'images/mascan/campusvilla.jpg',
    ),
    Listing(
      title: 'Unity Gardens',
      price: '4500',
      location: 'Alaban',
      phone: '0712345678',
      image: 'images/alaban/unitygardens.jpg',
    ),
    Listing(
      title: 'Freedom House',
      price: '3000',
      location: 'Alaban',
      phone: '0712345678',
      image: 'images/alaban/freedomhouse.jpg',
    ),
    Listing(
      title: 'Ubuntu House',
      price: '5000',
      location: 'Alaban',
      phone: '0712345678',
      image: 'images/alaban/ubuntuhouse.jpg',
    ),
    Listing(
      title: 'Sunset Villa',
      price: '4000',
      location: 'Alaban',
      phone: '0712345678',
      image: 'images/alaban/sunsetvilla.jpg',
    ),
    Listing(
      title: 'Commonwealth House',
      price: '7000',
      location: 'Alaban',
      phone: '0712345678',
      image: 'images/alaban/commonwealthhouse.jpg',
    ),
    Listing(
      title: 'Qwetu Residences',
      price: '4500',
      location: 'Kunene',
      phone: '0712345678',
      image: 'images/kunene/qweturesidences.jpg',
    ),
    Listing(
      title: 'Campus View',
      price: '6000',
      location: 'Kunene',
      phone: '0712345678',
      image: 'images/kunene/campusview.jpg',
    ),
    Listing(
      title: 'Scholar Corners',
      price: '5500',
      location: 'Kunene',
      phone: '0712345678',
      image: 'images/kunene/scholarcorners.jpg',
    ),
    Listing(
      title: 'NextDoor Residences',
      price: '4000',
      location: 'Kunene',
      phone: '0712345678',
      image: 'images/kunene/nextdoorresidences.jpg',
    ),
    Listing(
      title: 'Student Square',
      price: '3000',
      location: 'Kunene',
      phone: '0712345678',
      image: 'images/kunene/studentsquare.jpg',
    ),
    Listing(
      title: 'Unity Flats',
      price: '4500',
      location: 'Kianjae',
      phone: '0712345678',
      image: 'images/kianjae/unityflats.jpg',
    ),
    Listing(
      title: 'Vibing Villa',
      price: '6000',
      location: 'Kianjae',
      phone: '0712345678',
      image: 'images/kianjae/vibingvilla.jpg',
    ),
    Listing(
      title: 'Cornerstone Ridge',
      price: '3000',
      location: 'Kianjae',
      phone: '0712345678',
      image: 'images/kianjae/cornerstoneridge.jpg',
    ),
    Listing(
      title: 'Study Yard Residences',
      price: '7000',
      location: 'Kianjae',
      phone: '0712345678',
      image: 'images/kianjae/studyyardresidences.jpg',
    ),
    Listing(
      title: 'Campus Green',
      price: '5000',
      location: 'Kianjae',
      phone: '0712345678',
      image: 'images/kianjae/campusgreen.jpg',
    ),
    Listing(
      title: 'Tajiri Residences',
      price: '6500',
      location: 'Kaithe',
      phone: '0712345678',
      image: 'images/kaithe/tajiriresidences.jpg',
    ),
    Listing(
      title: 'Kaithe Studios',
      price: '4000',
      location: 'Kaithe',
      phone: '0712345678',
      image: 'images/kaithe/studios.jpg',
    ),
    Listing(
      title: 'Fancy Flats',
      price: '3000',
      location: 'Kaithe',
      phone: '0712345678',
      image: 'images/kaithe/fancyflats.jpg',
    ),
    Listing(
      title: 'Student Hub',
      price: '3000',
      location: 'Kaithe',
      phone: '0712345678',
      image: 'images/kaithe/studenthub.jpg',
    ),
    Listing(
      title: 'Youth Villa',
      price: '7000',
      location: 'Kaithe',
      phone: '0712345678',
      image: 'images/kaithe/youthvilla.jpg',
    ),
  ];

  static List<Listing> userListings = [];

  static List<Roommate> userRoommates = [];
}

class Roommate {
  final bool isFromFile;
  final String name;
  final String phone;
  final String course;
  final String gender;
  final String status;
  final String budget;
  final String bio;
  final String image;
  final List<String> habits;

  Roommate({
    this.isFromFile = false,
    required this.name,
    required this.phone,
    required this.course,
    required this.gender,
    required this.status,
    required this.budget,
    required this.bio,
    required this.image,
    required this.habits,
  });
}
