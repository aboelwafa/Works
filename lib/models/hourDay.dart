class HourDay
{
  String?email;
  String?day;
  String?date;
  dynamic startTime;
  dynamic endTime;
  dynamic count;

  HourDay({
    this.email,
    this.day,
    this.date,
    this.startTime,
    this.endTime,
    this.count,

  });
  HourDay.fromjson(Map<String,dynamic>json)
  {
    email=json['email'];
    day=json['day'];
    date=json['date'];
    startTime=json['startTime'];
    endTime=json['endTime'];
    count=json['count'];


  }
  Map<String,dynamic> toMpa()
  {
    return
      {
        'email':email,
        'day':day,
        'date':date,
        'startTime':startTime,
        'endTime':endTime,
        'count':count,

      };
  }
}