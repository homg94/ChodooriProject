<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="./header/header.jsp"></jsp:include>
<body>

    <div class="wrapper">
    
        <div class="row first">
            <div class="content">
                <h1 style="font-weight: 700;">당신의 처음을 응원합니다.</h1>
                <span>지금 시작하세요</span>
                <button type="button" class="signup btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    시작하기
                </button>
            </div>
        </div>

        <div class="row second">

        </div>

        <div class="row third">

        </div>
    </div>
	

        <!--공통 Footer-->

 
<jsp:include page="./header/footer.jsp"></jsp:include>

 
</body>
</html>
<script>
  window.addEventListener('load',function(){
    
	  
	 
	  
    const lookupForm = document.querySelector('.id-lookup');
    const lookUpBtn = lookupForm.querySelector('button');
    const pwlookupForm = document.querySelector('.pw-lookupForm');
    const lookUpPwBtn = pwlookupForm.querySelector('button');

    lookUpBtn.addEventListener('click',(e)=>{
      const email = lookupForm.querySelector('input').value 
      const url = "/email/lookupid/"+email;
      alert("요청이 완료되었습니다");
      findUserIdByEmail(url).catch((result)=>alert(result));
    }

    )

    lookUpPwBtn.addEventListener('click',(e)=>{
      const email = pwlookupForm.querySelector('input[type="email"]').value 
      const id = pwlookupForm.querySelector('input[type="text"]').value
      const url = "/email/lookuppw?email="+email+"&id="+id;

	
      if(confirm("비밀번호를 찾으시겠습니까?")){
   		alert("요청이 완료되었습니다")
      findUserIdByEmail(url).catch(result=>alert(result));
      }else{
        alert("취소되었습니다.")
      }
})


    
    function findUserIdByEmail(url){
      return new Promise((resolve,reject)=>{
        const http = new XMLHttpRequest();
        http.open("GET",url);
        http.timeout=5000;
        http.send(null);


        http.onload=()=>{
          if(http.status===200){
            resolve(http.responseText);
          }else{
            reject(http.responseText)
          }
        }

        http.ontimeout=()=>{
          reject("현재 부하가 많습니다. 잠시 후에 다시 시도해주세요");
        }

      })
    }



  })
</script>



