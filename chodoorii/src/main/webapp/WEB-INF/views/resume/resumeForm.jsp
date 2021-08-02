<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<jsp:include page="../header/header.jsp"></jsp:include>
<link href="/publish/resume/css/resumeform.css" rel="stylesheet">
    <script src="/publish/resume/js/resumeform-pagejump.js"></script>

<body>



   <body>
    <div class="wrapper">
     
        <header>
            <span data-target="first-form" style="width: 200px; height: 50px; display: flex; justify-content: center; align-items: center; font-size: 1.2rem;" class="badge rounded-pill bg-primary ">자기소개</span>
            <span data-target="second-form" style="width: 200px; height: 50px; display: flex; justify-content: center; align-items: center; font-size: 1.2rem;"class="badge rounded-pill bg-secondary ">기술스택 및 SNS</span>
            <span data-target="third-form" style="width: 200px; height: 50px; display: flex; justify-content: center; align-items: center; font-size: 1.2rem;" class="badge rounded-pill bg-secondary ">포트폴리오</span>
        </header>
        <form method="POST" enctype="multipart/form-data" >
            <div class="meta-data-set" style="display: none;">
                <input type="hidden" name="background-color" value="">
                <input type="hidden" name="font-family" value="">
                <input type="hidden" name="font-color" value="">
                <input type="hidden" name="template-kind" value="">
            </div>
            <section class="first-form">

                <div class="form-section">
                    <h2 style="text-align: center;">자기소개에 사용될 사진을 올려주세요</h2>
                    <img src="/publish/resume/img/defaultpic.png" class="img-pic rounded mx-auto d-block" alt="...">
                    <input type="file" name="introduction_img_path" style="display: none;">
                    <div class="input-group" style="width: 800px; margin-top: 50px;">
                        <span class="input-group-text" id="inputGroup-sizing-sm">제목</span>
                        <input name="introduction_header" type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
                      </div>
                      <div class="input-group" style="width: 800px; margin-top: 50px;">
                        <span class="input-group-text">자기소개</span>
                        <textarea name="introduction_main" class="form-control" aria-label="With textarea" rows="10"></textarea>
                      </div>

                </div>
                
                <div class="button-wrapper">
                    <button class="backtolist-btn btn btn-primary">목록으로</button>
                    <button class="next-btn btn btn-primary">다음으로</button>
                </div>

            </section>
            <section class="second-form hidden">
                <div class="form-section">
                  
                    <div class="language" style="margin-bottom: 150px;width: 100%; height: 100px; display: flex; flex-direction: column; justify-content: center;align-items: center;">
                        <h2>사용가능한 기술을 선택해주세요. 최대 8개까지 선택 가능합니다</h2>
                        <div class="check">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" name="skil_set" type="checkbox" id="inlineCheckbox1" value="java">
                                <label class="form-check-label" for="inlineCheckbox1">자바</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" name="skil_set" type="checkbox" id="inlineCheckbox2" value="python">
                                <label class="form-check-label" for="inlineCheckbox2">파이썬</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" name="skil_set" type="checkbox" id="inlineCheckbox3" value="html">
                                <label class="form-check-label" for="inlineCheckbox3">HTML</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" name="skil_set" type="checkbox" id="inlineCheckbox3" value="css" >
                                <label class="form-check-label" for="inlineCheckbox3">CSS</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" name="skil_set" type="checkbox" id="inlineCheckbox3" value="javascript">
                                <label class="form-check-label" for="inlineCheckbox3">JavaScript</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" name="skil_set" type="checkbox" id="inlineCheckbox3" value="spring">
                                <label class="form-check-label" for="inlineCheckbox3">Spring</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" name="skil_set" type="checkbox" id="inlineCheckbox3" value="oracle">
                                <label class="form-check-label" for="inlineCheckbox3">Oracle</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" name="skil_set" type="checkbox" id="inlineCheckbox3" value="servlet">
                                <label class="form-check-label" for="inlineCheckbox3">JSP&Servlet</label>
                            </div>
                        </div>
                    </div>
                    <div class="sns-form" style="width: 40%; height: 300px; margin-top: 40px; display: flex; justify-content: center; flex-direction: column; align-items: center;">
                        <h2>SNS 주소를 입력해주세요.</h2>
                        <div class="input-group mb-3">
                            <span class="input-group-text" id="basic-addon1"><img src="/publish/resume/img/블로그.png" width="40px" height="40px"></span>
                            <input type="text" class="form-control" name="BLOG_ADDRESS" placeholder="블로그 주소를 적어주세요" aria-label="Username" name="blog_address" aria-describedby="basic-addon1">
                          </div>
                          <div class="input-group mb-3">
                            <span class="input-group-text" id="basic-addon1"><img src="/publish/resume/img/20210727_143131.png" width="40px" height="40px"></span>
                            <input type="text" class="form-control" placeholder="깃허브 주소를 적어주세요" name="github_address" aria-label="Username" aria-describedby="basic-addon1">
                          </div>
                          <div class="input-group mb-3">
                            <span class="input-group-text" id="basic-addon1"><img src="/publish/resume/img/인스타.png" width="40px" height="40px"></span>
                            <input type="text" class="form-control" placeholder="인스타 주소를 적어주세요" name="instagram_address" aria-label="Username" aria-describedby="basic-addon1">
                          </div>
                          <div class="input-group mb-3">
                            <span class="input-group-text" id="basic-addon1"><img src="/publish/resume/img/페이스북.png" width="40px" height="40px"></span>
                            <input type="text" class="form-control" placeholder="페이스북 주소를 적어주세요" name="facebook_address" aria-label="Username" aria-describedby="basic-addon1">
                          </div>
                    </div>

                </div>     
                <div class="button-wrapper">
                    <button class="previous-btn btn btn-primary">이전으로</button>
                    <button class="next-btn btn btn-primary">다음으로</button>
                </div>

            </section>
            <section class="third-form hidden">
                <div class="form-section" style="padding-left: 100px;">

                    <div class="portpolio-div" style="display: flex; width: 90%; margin-bottom: 10px; padding-left: 150px;">
                        <img width="180px" height="180px" src="/publish/resume/img/defaultpic.png" class="img-pic img-thumbnail" alt="...">
                        <input type="file" name ="portfolio_first_img" style="display: none;" />
                        <div style="display: flex; flex-direction: column; justify-content: flex-start; margin-left: 0; width: 70%;">
                            <div style="display: flex; flex-direction: column; width: 400px; margin-left: 0;">
                                <input name="portfolio_first_name" style="margin-left: 0; margin-bottom: 20px;" placeholder="제목을 입력해주세요"/>
                                <input name="portfolio_first_github" style="margin-left: 0; margin-bottom: 20px;" placeholder="github 주소를 입력해주세요"/>
                            </div>
                            <div style="width: 500px; margin-left :0">
                                <textarea name="portfolio_first_desc" rows="5" cols="70" style="margin-left: 0;" placeholder="내용을 입력해주세요"></textarea>
                            </div>
                        </div>
                    </div>

                    <div class="portpolio-div" style="display: flex; width: 90%; margin-bottom: 10px; padding-left: 150px;">
                        <img width="180px" height="180px" src="/publish/resume/img/defaultpic.png" class="img-pic img-thumbnail" alt="...">
                        <input type="file" name ="portfolio_second_img" style="display: none;" />
                        <div style="display: flex; flex-direction: column; justify-content: flex-start; margin-left: 0; width: 70%;">
                            <div style="display: flex; flex-direction: column; width: 400px; margin-left: 0;">
                                <input name="portfolio_second_name" style="margin-left: 0; margin-bottom: 20px;" placeholder="제목을 입력해주세요"/>
                                <input name="portfolio_second_github" style="margin-left: 0; margin-bottom: 20px;" placeholder="github 주소를 입력해주세요"/>
                            </div>
                            <div style="width: 500px; margin-left :0">
                                <textarea name="portfolio_second_desc"  rows="5" cols="70" style="margin-left: 0;" placeholder="내용을 입력해주세요"></textarea>
                            </div>
                        </div>
                    </div>
                        

                    <div class="portpolio-div" style="display: flex; width: 90%; margin-bottom: 10px; padding-left: 150px;">
                        <img width="180px" height="180px" src="/publish/resume/img/defaultpic.png" class="img-pic img-thumbnail" alt="...">
                        <input type="file" name ="portfolio_third_img" style="display: none;" />
                        <div style="display: flex; flex-direction: column; justify-content: flex-start; margin-left: 0; width: 70%;">
                            <div style="display: flex; flex-direction: column; width: 400px; margin-left: 0;">
                                <input name="portfolio_third_name" style="margin-left: 0; margin-bottom: 20px;" placeholder="제목을 입력해주세요"/>
                                <input name="portfolio_third_github" style="margin-left: 0; margin-bottom: 20px;" placeholder="github 주소를 입력해주세요"/>
                            </div>
                            <div style="width: 500px; margin-left :0">
                                <textarea name="portfolio_third_desc"  rows="5" cols="70" style="margin-left: 0;" placeholder="내용을 입력해주세요"></textarea>
                            </div>
                        </div>
                    </div>
                        
                        
                        
                </div>
                <div class="button-wrapper">
                    <button class="previous-btn btn btn-primary">이전으로</button>
                    <button class="submit-btn btn btn-primary" >제출하기</button>
                    <button class="preview-btn btn btn-primary">미리보기</button>
                </div>

            </section>


        </form>

    </div>
</body>
</html>
<script>
    window.addEventListener('load',function(){
        const form = document.querySelector('form');
        form.addEventListener('click',(e)=>{
            const target = e.target;
            if(target.nodeName!=="IMG") return;

            const inputFile = target.parentElement.querySelector('input[type="file"]');
            inputFile.click();

            inputFile.addEventListener('input',(e)=>{
                const input = inputFile.files[0];

                let fReader = new FileReader();
                fReader.readAsDataURL(input);
                fReader.onloadend=(e)=>{
                    target.src=e.target.result;

                }

            })
        })

    })
 
</script>
		
    
     

 
<jsp:include page="../header/footer.jsp"></jsp:include>

 
</body>
</html>

