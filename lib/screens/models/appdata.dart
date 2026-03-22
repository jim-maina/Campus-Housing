class Listing {
  final String title;
  final String price;
  final String location;
  final String image;
  final String description;
  final List<String> amenities;

  Listing({
    required this.title,
    required this.price,
    required this.location,
    required this.image,
    this.description = "No description provided.",
    this.amenities = const [],
  });

  void operator [](String other) {}
}

class AppData {
  static List<Listing> listings = [
    Listing(
      title: 'Blue House',
      price: '3500',
      location: 'Nchiru',
      image: 'images/nchiru/bluehouse.jpg',
    ),
    Listing(
      title: 'Green House',
      price: '3000',
      location: 'Nchiru',
      image: 'images/nchiru/greenhouse.jpg',
    ),
    Listing(
      title: 'Orange House',
      price: '4000',
      location: 'Nchiru',
      image: 'images/nchiru/orangehouse.jpg',
    ),
    Listing(
      title: 'Villa House',
      price: '5000',
      location: 'Nchiru',
      image: 'images/nchiru/villahouse.jpg',
    ),
    Listing(
      title: 'Pink House',
      price: '6000',
      location: 'Nchiru',
      image: 'images/nchiru/pinkhouse.jpg',
    ),
    Listing(
      title: 'Mascan Studios',
      price: '4500',
      location: 'Mascan',
      image: 'images/mascan/mascan.jpg',
    ),
    Listing(
      title: 'Studio House',
      price: '5000',
      location: 'Mascan',
      image: 'images/mascan/studiohouse.jpg',
    ),
    Listing(
      title: 'Cozy House',
      price: '6000',
      location: 'Mascan',
      image: 'images/mascan/cozyhouse.jpg',
    ),
    Listing(
      title: 'Fun Villa',
      price: '5000',
      location: 'Mascan',
      image: 'images/mascan/funvilla.jpg',
    ),
    Listing(
      title: 'Campus Villa',
      price: '4000',
      location: 'Mascan',
      image: 'images/mascan/campusvilla.jpg',
    ),
    Listing(
      title: 'Unity Gardens',
      price: '4500',
      location: 'Alaban',
      image: 'images/alaban/unitygardens.jpg',
    ),
    Listing(
      title: 'Freedom House',
      price: '3000',
      location: 'Alaban',
      image: 'images/alaban/freedomhouse.jpg',
    ),
    Listing(
      title: 'Ubuntu House',
      price: '5000',
      location: 'Alaban',
      image: 'images/alaban/ubuntuhouse.jpg',
    ),
    Listing(
      title: 'Sunset Villa',
      price: '4000',
      location: 'Alaban',
      image: 'images/alaban/sunsetvilla.jpg',
    ),
    Listing(
      title: 'Commonwealth House',
      price: '7000',
      location: 'Alaban',
      image: 'images/alaban/commonwealthhouse.jpg',
    ),
    Listing(
      title: 'Qwetu Residences',
      price: '4500',
      location: 'Kunene',
      image: 'images/kunene/qweturesidences.jpg',
    ),
    Listing(
      title: 'Campus View',
      price: '6000',
      location: 'Kunene',
      image: 'images/kunene/campusview.jpg',
    ),
    Listing(
      title: 'Scholar Corners',
      price: '5500',
      location: 'Kunene',
      image: 'images/kunene/scholarcorners.jpg',
    ),
    Listing(
      title: 'NextDoor Residences',
      price: '4000',
      location: 'Kunene',
      image: 'images/kunene/nextdoorresidences.jpg',
    ),
    Listing(
      title: 'Student Square',
      price: '3000',
      location: 'Kunene',
      image: 'images/kunene/studentsquare.jpg',
    ),
    Listing(
      title: 'Unity Flats',
      price: '4500',
      location: 'Kianjae',
      image: 'images/kianjae/unityflats.jpg',
    ),
    Listing(
      title: 'Vibing Villa',
      price: '6000',
      location: 'Kianjae',
      image: 'images/kianjae/vibingvilla.jpg',
    ),
    Listing(
      title: 'Cornerstone Ridge',
      price: '3000',
      location: 'Kianjae',
      image: 'images/kianjae/cornerstoneridge.jpg',
    ),
    Listing(
      title: 'Study Yard Residences',
      price: '7000',
      location: 'Kianjae',
      image: 'images/kianjae/studyyardresidences.jpg',
    ),
    Listing(
      title: 'Campus Green',
      price: '5000',
      location: 'Kianjae',
      image: 'images/kianjae/campusgreen.jpg',
    ),
    Listing(
      title: 'Tajiri Residences',
      price: '6500',
      location: 'Kaithe',
      image: 'images/kaithe/tajiriresidences.jpg',
    ),
    Listing(
      title: 'Kaithe Studios',
      price: '4000',
      location: 'Kaithe',
      image: 'images/kaithe/studios.jpg',
    ),
    Listing(
      title: 'Fancy Flats',
      price: '3000',
      location: 'Kaithe',
      image: 'images/kaithe/fancyflats.jpg',
    ),
    Listing(
      title: 'Student Hub',
      price: '3000',
      location: 'Kaithe',
      image: 'images/kaithe/studenthub.jpg',
    ),
    Listing(
      title: 'Youth Villa',
      price: '7000',
      location: 'Kaithe',
      image: 'images/kaithe/youthvilla.jpg',
    ),
  ];

  static List<Listing> userListings = [];

  static List<Roommate> userRoommates = [];
}

class Roommate {
  final String name;
  final String course;
  final String gender;
  final String status;
  final String budget;
  final String bio;
  final String image;
  final List<String> habits;

  Roommate({
    required this.name,
    required this.course,
    required this.gender,
    required this.status,
    required this.budget,
    required this.bio,
    required this.image,
    required this.habits,
  });
}
