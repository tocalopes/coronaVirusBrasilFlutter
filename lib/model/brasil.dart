class Brasil{
  String country;
  String lastUpdate;
  String confirmed;
  String deaths;
  String recovered;

  Brasil(Map<String, dynamic> br){
    this.country =  br["data"]["covid19Stats"][0]["country"].toString();
    this.lastUpdate = "${br["data"]["covid19Stats"][0]["lastUpdate"].toString().substring(8,10)}/${br["data"]["covid19Stats"][0]["lastUpdate"].toString().substring(5,7)}";
    this.confirmed = br["data"]["covid19Stats"][0]["confirmed"].toString();
    this.deaths = br["data"]["covid19Stats"][0]["deaths"].toString();
    this.recovered = br["data"]["covid19Stats"][0]["recovered"].toString();
  }

  Brasil.vazio();
}