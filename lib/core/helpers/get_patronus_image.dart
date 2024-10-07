String getPatronusImage(String patronus) {
  switch (patronus) {
    case "stag":
      return "assets/images/patronus/stag.jpg";
    case "otter":
      return "assets/images/patronus/otter.jpg";
    case "phoenix":
      return "assets/images/patronus/phoenix.jpg";
    case "hare":
      return "assets/images/patronus/hare.jpg";
    case "wolf":
      return "assets/images/patronus/wolf.jpg";
    case "horse":
      return "assets/images/patronus/horse.jpg";
    case "fox":
      return "assets/images/patronus/fox.jpg";
    case "Jack Russell terrier":
      return "assets/images/patronus/terrier.jpg";
    case "tabby cat":
      return "assets/images/patronus/cat.jpg";
    case "doe":
      return "assets/images/patronus/doe.jpg";
    case "dog":
      return "assets/images/patronus/dog.jpg";
    default:
      return 'there is no image';
  }
}
