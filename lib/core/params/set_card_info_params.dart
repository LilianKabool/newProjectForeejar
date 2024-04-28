class SetCardInfoParams{
  final String nb;
  final String code;

  SetCardInfoParams({required this.nb, required this.code});

Map<String,dynamic>toJson()=>{
  "nb":nb,
  "code":code
};
}