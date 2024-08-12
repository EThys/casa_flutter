

class OnBoardingModel{
  final String lottieURL;
  final String title;
  final String subtitle;

  OnBoardingModel(this.title,this.lottieURL,this.subtitle);
}

List <OnBoardingModel> OnBoardingItems=[
  OnBoardingModel(
      "Trouver votre futur maison sans vous déplacer",
      "asset/work.json",
      ""
  ),
  OnBoardingModel(
      "En un clic, mettez votre proprieté en location",
      "asset/search.json",
      ""
  ),
  OnBoardingModel(
      "Trouver le choix pafait pour votre famille",
      "asset/family.json",
      ""
  )
];