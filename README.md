# ChatBot Using OPENAI API
 > OPEN AI API KEY를 사용하여 ChatGPT를 핸드폰에서 앱으로 이용할 수 있는 Flutter 앱 
  
  ## About Project
  어플개발공부를 할때 혹은 다른분야의 모르는 것이 있을 때 많은 도움을 받는 ChatGPT를 직접 나의 핸드폰에서 내가 필요로하는 기능 몇가지를 추가하여 나의 인공지능 비서를 만들어 보고자 시작하게 되었다. 
<br><br/>

 ## Stack
* Dart / Flutter
<br><br/>

 ## Usage
* OPEN AI API KEY 발급
<br><br/>


<img width="1434" alt="스크린샷 2023-04-21 오후 11 22 48" src="https://user-images.githubusercontent.com/106796843/233660850-6e308cd1-8329-451f-937a-22e629376f98.png">

<br><br/>

* http 통신으로 open ai 연동
<br><br/>

<pre>
<code>
String token = "Bearer ${dotenv.env['API_KEY']}";

  var response = await http.post(
      Uri.parse(
          "https://api.openai.com/v1/engines/text-davinci-003/completions"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": token,
      },
      body: jsonEncode({
        "prompt": input,
        "temperature": 0.5,
        "max_tokens": 1024,
        "top_p": 1,
        "frequency_penalty": 0,
        "presence_penalty": 0
      }));
</code>
</pre>

<br><br/>


## Coments
  아직 기능 추가에 대해서 반영하지 않았다. 기능추가 부분이 완료가 되면 다시 업데이트 할 예정이다. 
  <br><br/>
  <br><br/>
  
## result 
  
  <br><br/>
<p align="center"><img width="351" alt="스크린샷 2023-04-21 오후 10 58 25" src="https://user-images.githubusercontent.com/106796843/233655093-9b35cac8-a829-45fd-bdc8-a60545a56532.png" height="700px" width="300px"></p>

<br><br/>





