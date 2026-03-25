class Listing {
  final String title;
  final String price;
  final String location;
  final String image;
  final String description;
  final String phone;
  final List<String> amenities;

  Listing({
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
      location: 'Nchiru',
      image: 'images/nchiru/bluehouse.jpg',
      phone: '0700000000',
    ),
    Listing(
      title: 'Green House',
      price: '3000',
      location: 'Nchiru',
      image: 'images/nchiru/greenhouse.jpg',
      phone: '0700000000',
    ),
    Listing(
      title: 'Orange House',
      price: '4000',
      location: 'Nchiru',
      image: 'images/nchiru/orangehouse.jpg',
      phone: '0700000000',
    ),
    Listing(
      title: 'Villa House',
      price: '5000',
      location: 'Nchiru',
      image: 'images/nchiru/villahouse.jpg',
      phone: '0700000000',
    ),
    Listing(
      title: 'Pink House',
      price: '6000',
      location: 'Nchiru',
      image: 'images/nchiru/pinkhouse.jpg',
      phone: '0700000000',
    ),
    Listing(
      title: 'Mascan Studios',
      price: '4500',
      location: 'Mascan',
      image: 'images/mascan/mascan.jpg',
      phone: '0700000000',
    ),
    Listing(
      title: 'Studio House',
      price: '5000',
      location: 'Mascan',
      image: 'images/mascan/studiohouse.jpg',
      phone: '0700000000',
    ),
    Listing(
      title: 'Cozy House',
      price: '6000',
      location: 'Mascan',
      image: 'images/mascan/cozyhouse.jpg',
      phone: '0700000000',
    ),
    Listing(
      title: 'Fun Villa',
      price: '5000',
      location: 'Mascan',
      image: 'images/mascan/funvilla.jpg',
      phone: '0700000000',
    ),
    Listing(
      title: 'Campus Villa',
      price: '4000',
      location: 'Mascan',
      image: 'images/mascan/campusvilla.jpg',
      phone: '0700000000',
    ),
    Listing(
      title: 'Unity Gardens',
      price: '4500',
      location: 'Alaban',
      image: 'images/alaban/unitygardens.jpg',
      phone: '0700000000',
    ),
    Listing(
      title: 'Freedom House',
      price: '3000',
      location: 'Alaban',
      image: 'images/alaban/freedomhouse.jpg',
      phone: '0700000000',
    ),
    Listing(
      title: 'Ubuntu House',
      price: '5000',
      location: 'Alaban',
      image: 'images/alaban/ubuntuhouse.jpg',
      phone: '0700000000',
    ),
    Listing(
      title: 'Sunset Villa',
      price: '4000',
      location: 'Alaban',
      image: 'images/alaban/sunsetvilla.jpg',
      phone: '0700000000',
    ),
    Listing(
      title: 'Commonwealth House',
      price: '7000',
      location: 'Alaban',
      image: 'images/alaban/commonwealthhouse.jpg',
      phone: '0700000000',
    ),
    Listing(
      title: 'Qwetu Residences',
      price: '4500',
      location: 'Kunene',
      image: 'images/kunene/qweturesidences.jpg',
      phone: '0700000000',
    ),
    Listing(
      title: 'Campus View',
      price: '6000',
      location: 'Kunene',
      image: 'images/kunene/campusview.jpg',
      phone: '0700000000',
    ),
    Listing(
      title: 'Scholar Corners',
      price: '5500',
      location: 'Kunene',
      image: 'images/kunene/scholarcorners.jpg',
      phone: '0700000000',
    ),
    Listing(
      title: 'NextDoor Residences',
      price: '4000',
      location: 'Kunene',
      image: 'images/kunene/nextdoorresidences.jpg',
      phone: '0700000000',
    ),
    Listing(
      title: 'Student Square',
      price: '3000',
      location: 'Kunene',
      image: 'images/kunene/studentsquare.jpg',
      phone: '0700000000',
    ),
    Listing(
      title: 'Unity Flats',
      price: '4500',
      location: 'Kianjae',
      image: 'images/kianjae/unityflats.jpg',
      phone: '0700000000',
    ),
    Listing(
      title: 'Vibing Villa',
      price: '6000',
      location: 'Kianjae',
      image: 'images/kianjae/vibingvilla.jpg',
      phone: '0700000000',
    ),
    Listing(
      title: 'Cornerstone Ridge',
      price: '3000',
      location: 'Kianjae',
      image: 'images/kianjae/cornerstoneridge.jpg',
      phone: '0700000000',
    ),
    Listing(
      title: 'Study Yard Residences',
      price: '7000',
      location: 'Kianjae',
      image: 'images/kianjae/studyyardresidences.jpg',
      phone: '0700000000',
    ),
    Listing(
      title: 'Campus Green',
      price: '5000',
      location: 'Kianjae',
      image: 'images/kianjae/campusgreen.jpg',
      phone: '0700000000',
    ),
    Listing(
      title: 'Tajiri Residences',
      price: '6500',
      location: 'Kaithe',
      image: 'images/kaithe/tajiriresidences.jpg',
      phone: '0700000000',
    ),
    Listing(
      title: 'Kaithe Studios',
      price: '4000',
      location: 'Kaithe',
      image: 'images/kaithe/studios.jpg',
      phone: '0700000000',
    ),
    Listing(
      title: 'Fancy Flats',
      price: '3000',
      location: 'Kaithe',
      image: 'images/kaithe/fancyflats.jpg',
      phone: '0700000000',
    ),
    Listing(
      title: 'Student Hub',
      price: '3000',
      location: 'Kaithe',
      image: 'images/kaithe/studenthub.jpg',
      phone: '0700000000',
    ),
    Listing(
      title: 'Youth Villa',
      price: '7000',
      location: 'Kaithe',
      image: 'images/kaithe/youthvilla.jpg',
      phone: '0700000000',
    ),
  ];

  static List<Listing> userListings = [];

  static List<Roommate> userRoommates = [];
}

class Roommate {
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
