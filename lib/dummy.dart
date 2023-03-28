//TODO 뭔가 더 효율적인 방식으로 문제목록을 불러올 수 있게 하면 좋겠는데.. 이건 너무 수동적인 set이 요구됨.
class QuizData {
  String question = "";
  var options; //객관식 option 4개가 담긴 list {String, boolean}
  bool isDescriptive = false; //주관식 여부
  List<String> ans = []; //주관식 답변인정 string 모음

  //q is question, a,b,c,d is option and a is right ans among them.
  //if desc is True, a be answer and b,c,d is dummy.
  void set_data(String q, String a, String b, String c, String d, bool desc) {
    question = q;
    isDescriptive = desc;
    if (isDescriptive) {
      //주관식 case
      ans.add(a);
      ans.add(a.toUpperCase());
      ans.add(a.toLowerCase());
    } else {
      //객관식 case
      options.add({a, true});
      options.add({b, false});
      options.add({c, false});
      options.add({d, false});
    }
  }

  //서술형 채점
  bool checkAns(String input) {
    return ans.contains(input);
  }
}
