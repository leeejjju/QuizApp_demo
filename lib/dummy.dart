import 'dart:math';

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

// 파일에서 퀴즈 데이터를 읽어와 QuizData의 리스트를 만들고 저장. 매 회차 사용될 10개의 문제를 랜덤하게 뽑아줌.
class QuizBundles {
  static int numOfQuiz = 10;
  static List<QuizData> allQuizzes = []; //all quiz from csv file
  List<QuizData> selectedQuizzes =
      []; //selected [numOfQuiz] randomly from allQuizs

  //read csv and fill allQuizs[]
  static void getQuiz() {
    //TODO read csv file in asset dir, and make and push QuizDatas into allQuizs
  }

  //selected [numOfQuiz] randomly from allQuizs and fill them to selectedQuiz[]
  void selectQuiz() {
    selectedQuizzes.clear();
    List<int> randNum = [];

    Random random = new Random();
    //select unique 10 rand num
    while (randNum.length < 10) {
      int rand = random.nextInt(11);
      if (!randNum.contains(rand)) {
        randNum.add(rand);
      }
    }
    print('Random quiz numbers this time: $randNum\n');

    //이게맞나싶은데... 일단 셀렉된 QuizData를 selectedQuizs데이터에 넣기
    for (int i = 0; i < numOfQuiz; i++) {
      QuizData tmp = new QuizData();
      tmp.question = allQuizzes[randNum[i]].question;
      tmp.options = allQuizzes[randNum[i]].options;
      tmp.isDescriptive = allQuizzes[randNum[i]].isDescriptive;
      tmp.ans = allQuizzes[randNum[i]].ans;
      selectedQuizzes.add(tmp);
    }
  }
}
