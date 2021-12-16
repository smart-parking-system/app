
class Review {
  final int id;
  final String image;
  final String title;
  final String subtitle;
  final String time;
  final String rating;

  const Review({this.image, this.id, this.title, this.subtitle, this.time, this.rating});
}

class ReviewList {
  static List<Review> list() {
    const list = <Review> [
      Review(
        id: 1,
        image: 'assets/images/user1.png',
        title: 'Max',
        subtitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        time: '1 day ago',
        rating: '5'
      ),
      Review(
        id: 2,
        image: 'assets/images/user2.png',
        title: 'Ars',
        subtitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        time: '7 day ago',
        rating: '4'
      ),
      Review(
        id: 3,
        image: 'assets/images/user3.png',
        title: 'Denys',
        subtitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        time: '1 month ago',
        rating: '5'
      ),
      Review(
        id: 4,
        image: 'assets/images/user4.png',
        title: 'Vitaliy',
        subtitle: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        time: '2 month ago',
        rating: '4'
      ),
    ];
    return list;
  }
}