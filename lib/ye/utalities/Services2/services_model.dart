class ServicesModel {
  final String img;
  final String job;
  ServicesModel({required this.img,required this.job});

  factory ServicesModel.fromJson(Map<String, dynamic> json){
   
     return ServicesModel( 
      img:json['img']??'',
      job:json['job']??'',
     );
  }
}