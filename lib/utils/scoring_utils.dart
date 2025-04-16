int calculateRiskScore(int clickedLinks, int ignoredWarnings) {
  return (clickedLinks * 10) + (ignoredWarnings * 5);
}