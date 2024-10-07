String getHouseImage(String house) {
  switch (house) {
    case "Gryffindor":
      return "assets/images/houses/gryffindor.jpg";
    case "Slytherin":
      return "assets/images/houses/slytherin.jpeg";
    case "Ravenclaw":
      return "assets/images/houses/ravenclaw.jpeg";
    case "Hufflepuff":
      return "assets/images/houses/hufflepuff.jpeg";
    default:
      return 'there is no image';
  }
}
