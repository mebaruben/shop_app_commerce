class Categorie{
  final String title;
  final String image;

  Categorie({required this.title, required this.image});
}

final List<Categorie>categories=[
  Categorie(title: "Shoes", image: "assets/shoes.jpg"),
  Categorie(title: "Beauty", image: "assets/beauty.png"),
  Categorie(title: "PC", image: "assets/pc.jpg"),
  Categorie(title: "Mobile", image: "assets/mobile.jpg"),
  Categorie(title: "Watch", image: "assets/watch.png"),
];