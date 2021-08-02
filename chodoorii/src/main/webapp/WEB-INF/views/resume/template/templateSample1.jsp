<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>자기소개템플릿1</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <style>
      * {margin: 0; padding: 0;}
      div {width: 100vw; height: 100vh;}
     
    /* resumeTemBox1 */
    #resumeTemBox1 {
      background: #FEAC5E;
      background: -webkit-linear-gradient(to right, #4BC0C8, #C779D0, #FEAC5E);
      background: linear-gradient(to right, #4BC0C8, #C779D0, #FEAC5E);
      display: -webkit-flex;
      display: flex;
      -webkit-align-items: center;
      align-items: center;
      -webkit-justify-content: center;
      justify-content: center;
    }
    #INTRODUCTION_IMG_PATH {
      max-width: 800px;
      margin-left: 70px;
      -webkit-flex: 1;
      flex: 1
    }
    #INTRODUCTION_HEADER {
      -webkit-flex: 1;
      flex: 1;
      margin-top: auto;
      margin-left: 100px;
      vertical-align: middle;
    }
    #INTRODUCTION_HEADER h1 {
      margin-top: 50%;
      font-family: "Apple SD Gothic Neo", sans-serif;
      font-weight: 700;
      font-size: 64px;
      line-height: 1.5;
      color: #fff;
      text-align: center;
    }
    #INTRODUCTION_MAIN p {
      font-family: "Apple SD Gothic Neo", sans-serif;
      font-weight: 400;
      font-size: 18px;
      line-height: 1.5;
      color: #fff;
      text-align: center;
      margin-top: 30%;
    }
    #portfoliosite {
      text-decoration: none;
      color: #7319F3;
      font-weight: 600;
    }
    #portfoliosite:hover {
      color: yellow;
    }
    /* resumeTemBox2 */
    #resumeTemBox2 {
      background: #70e1f5;
      background: -webkit-linear-gradient(to right, #ffd194, #70e1f5);
      background: linear-gradient(to right, #ffd194, #70e1f5);
    }
    #resumeTemBox2 h1 {
        padding-top: 200px;
      font-family: "Apple SD Gothic Neo", sans-serif;
      font-weight: 400;
      font-size: 64px;
      line-height: 1.5;
      color: white;
      text-align: center;
    }
    .SKIL_SET {
      display: -webkit-flex;
      display: flex;
      margin-top: 150px;
    }
    .SKIL_SET_BOX {
      -webkit-flex: 1;
      flex: 1;
      text-align: center;
      -webkit-align-items: center;
      align-items: center;
      -webkit-justify-content: center;
      justify-content: center;
    }
    .SKIL_SET_BOX_img {
      max-width: 100px;
      display : inline;
    }
    
    
    /* resumeTemBox3 */
    #resumeTemBox3 {
      background: #eee;
    }
    #resumeTemBox3 h1 {
      padding-top: 80px;
      font-family: "Apple SD Gothic Neo", sans-serif;
      font-weight: 700;
      font-size: 64px;
      line-height: 1.5;
      color: black;
      text-align: center;
    }
    #resumeTemBox3 h1 span {
      font-family: 'Palanquin Dark', sans-serif;
      font-weight: 400;
    }
    .tmicontainer {
      display: -webkit-flex;
      display: flex;
      margin-top: 80px;
    }
    .tmilist {
      -webkit-flex: 1;
      flex: 1;
      text-align: center;
      -webkit-align-items: center;
      align-items: center;
      -webkit-justify-content: center;
      justify-content: center;
    }
    .tmilist p {
      font-family: "Apple SD Gothic Neo", sans-serif;
      font-weight: 400;
      color: black;
      font-size: 25px;
      line-height: 5.5;
    }
    .tmilist p:hover {
      font-size: 0;
    }
    .tmilist p:hover::before {
      font-size: 25px;
      font-weight: bold;
      color: #7319F3;
    }
    .tmilist #tmi1:hover:before {    
      content: '이미숙';
    }
    .tmilist #tmi2:hover:before {
      content: '010-0000-0000';
    }
    .tmilist #tmi3:hover:before {
      content: 'misugar_@gamail.com';
    }
    .tmilist #tmi4:hover:before {
      content: '1993.09.18';
    }
    .tmilist #tmi5:hover:before {
      content: '수원';
    }

     /* resumeTemBox5 */
     #resumeTemBox5 {
      background: #70e1f5;
      background: -webkit-linear-gradient(to right, #ffd194, #70e1f5);
      background: linear-gradient(to right, #ffd194, #70e1f5);
    }
    .PORTFOLIOTem h1 {
     
      padding-top: 140px;
      padding-left: 50px;
      font-family: "Apple SD Gothic Neo", sans-serif;
      font-weight: 700;
      font-size: 64px;
      line-height: 1.5;
      color: white;
      text-align: center;
    }
    .PORTFOLIOTem {
      display: -webkit-flex;
      
    }
    .PORTFOLIO {
      -webkit-flex: 1;
      flex: 1;
      text-align: center;
      -webkit-align-items: center;
      align-items: center;
      -webkit-justify-content: center;
      justify-content: center;
      padding-top: 20%;
      text-align: center;
    }
    .PORTFOLIO_FIRST_IMG {
      max-width: 300px;
      display : inline;
    }

    /* resumeTemBox6 */
    #resumeTemBox6 {
      background: #B993D6;
      background: -webkit-linear-gradient(to right, #8CA6DB, #B993D6);
      background: linear-gradient(to right, #8CA6DB, #B993D6);
      height: 100%;
    }
    #resumeTemBox6 h1 {
      padding-top: 140px;
      font-family: "Apple SD Gothic Neo", sans-serif;
      font-weight: 700;
      font-size: 64px;
      line-height: 1.5;
      color: white;
      text-align: center;
    }
    .imglist {
      text-align: center;
    }
    .imglist img {
      width: 100px;
      margin-top: 140px;
      padding: 50px;
    }
    .imglist a {
      text-decoration: none;
    }
  </style>  
  
  </head>
  <body>
    
      <!--메인 1페이지-->
      <div id="resumeTemBox1">
        <img id="INTRODUCTION_IMG_PATH" src="/publish/resume/img/사진.JPG" alt="">
        <div id="INTRODUCTION_HEADER">
          <h1>프론트 개발자를 위한</h1>
        </div>  
        <div id="INTRODUCTION_MAIN">
        <p> Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tempore quis aspernatur quae hic doloremque ad officiis autem deserunt, <br>
            tempora et tenetur sunt dolorem cupiditate voluptate qui perferendis quam quisquam molestiae.<br>
            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tempore quis aspernatur quae hic doloremque ad officiis autem deserunt, <br>
            tempora et tenetur sunt dolorem cupiditate voluptate qui perferendis quam quisquam molestiae.<br> 
            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tempore quis aspernatur quae hic doloremque ad officiis autem deserunt, <br>
            tempora et tenetur sunt dolorem cupiditate voluptate qui perferendis quam quisquam molestiae.<br> 
            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tempore quis aspernatur quae hic doloremque ad officiis autem deserunt, <br>
            tempora et tenetur sunt dolorem cupiditate voluptate qui perferendis quam quisquam molestiae.<br>
            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tempore quis aspernatur quae hic doloremque ad officiis autem deserunt, <br>
            tempora et tenetur sunt dolorem cupiditate voluptate qui perferendis quam quisquam molestiae.<br>   </p>
        
        </div>
      </div>


      <!--메인 2페이지-->
      <div id="resumeTemBox2">
        <h1>이런 프로그램을 공부했어요. &#128154;</h1>
        <div class="SKIL_SET">
          <div class="SKIL_SET_BOX">
            <img class="SKIL_SET_BOX_img" src="/publish/resume/img/스프링.JPG" alt="">    
          </div>
          <div class="SKIL_SET_BOX">
            <img class="SKIL_SET_BOX_img" src="/publish/resume/img/오라클.JPG" alt="">
          </div>
          <div class="SKIL_SET_BOX">
            <img class="SKIL_SET_BOX_img" src="/publish/resume/img/자바.JPG" alt="">
          </div>
          <div class="SKIL_SET_BOX">
            <img class="SKIL_SET_BOX_img" src="/publish/resume/img/자바서블릿.JPG" alt="">    
          </div>
          <div class="SKIL_SET_BOX">
            <img class="SKIL_SET_BOX_img" src="/publish/resume/img/자바스크립트.JPG" alt="">
          </div>
          <div class="SKIL_SET_BOX">
            <img class="SKIL_SET_BOX_img" src="/publish/resume/img/파이썬.JPG" alt="">
          </div>
          <div class="SKIL_SET_BOX">
            <img class="SKIL_SET_BOX_img" src="/publish/resume/img/HTML.JPG" alt="">    
          </div>
          <div class="SKIL_SET_BOX">
            <img class="SKIL_SET_BOX_img" src="/publish/resume/img/CSS.JPG" alt="">
          </div>
        </div>
      </div>

      <!--메인 3페이지-->
      <div id="resumeTemBox3">
        <h1><span>필독항목</span>  &#128221;</h1>
        <div class="tmicontainer">
          <div class="tmilist">
            <p id="tmi1">이름</p>     
            <p id="tmi2">전화번호</p>
            <p id="tmi3">메일</p>
            <p id="tmi4">생일</p>
            <p id="tmi5">거주지</p>
          </div>
          
        </div>
      </div>
      
      
      

      <!--메인 4페이지-->
      <div id="resumeTemBox5">
      <div class="PORTFOLIOTem">
        <h1>PORTFOLIO</h1>
          <div class="PORTFOLIO">
            <img class="PORTFOLIO_FIRST_IMG" src="/publish/resume/img/회사.JPG" alt="">
            <a href="#"><p class="PORTFOLIO_FIRST_GITHUB">깃허브 </p></a>
            <a href="#"><p class="PORTFOLIO_FIRST_URL">URL</p></a>
            <p class="PORTFOLIO_FIRST_NAME"> 이름</p>
          </div>
          <div class="PORTFOLIO">
            <img class="PORTFOLIO_FIRST_IMG" src="/publish/resume/img/회사.JPG" alt="">
            <a href="#"><p class="PORTFOLIO_FIRST_GITHUB">깃허브 </p></a>
            <a href="#"><p class="PORTFOLIO_FIRST_URL">URL</p></a>
            <p class="PORTFOLIO_FIRST_NAME"> 이름</p>
          </div>
          <div class="PORTFOLIO">
            <img class="PORTFOLIO_FIRST_IMG" src="/publish/resume/img/회사.JPG" alt="">
            <a href="#"><p class="PORTFOLIO_FIRST_GITHUB">깃허브 </p></a>
            <a href="#"><p class="PORTFOLIO_FIRST_URL">URL</p></a>
           <p class="PORTFOLIO_FIRST_NAME"> 이름</p>
          </div>
        </div>   
      </div>

      
      <!--메인 5페이지-->
      <div id="resumeTemBox6">
        <h1>저에 대해 더 궁금하시다면?&#129303;</h1>
        <div class="imglist">
          <a href="#">
            <img src="/publish/resume/img/블로그.png" alt="">
          </a>
          <a href="#">
            <img src="/publish/resume/img/인스타.png" alt="">
          </a>
          <a href="#">
            <img src="/publish/resume/img/카카오톡.JPG" alt="">
          </a>
          <a href="#">
            <img src="/publish/resume/img/깃허브.JPG" alt="">
          </a>
        </div>
      </div> 
  </body>
</html>