/**
 * 
 */

function validCheck(){
	if (document.getElementById("custNo").value == 0){
		alert("회원 번호가 입력되지 않음");
		return false;
	}
	if (document.getElementById("custName").value == 0){
		alert("회원 성명이 입력되지 않음");
		document.getElementById("custName").focus();
		return false;
	}
	if (document.getElementById("phone").value == 0){
		alert("회원 전화가 입력되지 않음");
		document.getElementById("phone").focus();
		return false;
	}
	if (document.getElementById("address").value == 0){
        alert("회원 주소가 입력되지 않았습니다.");
        return false;
    }
	if (document.getElementById("joinDate").value == 0){
        alert("가입일자가 입력되지 않았습니다.");
        return false;
    }
	if (document.getElementById("grade").value == 0){
        alert("고객 등급이 입력되지 않았습니다.");
        return false;
    }
	if (document.getElementById("city").value == 0){
        alert("도시코드가 입력되지 않았습니다.");
        return false;
    }
	
	return true;
}

function update(){
	if(validCheck()){
		alert("회원정보수정이 완료 되었습니다.");
		document.getElementById("join").submit();
	}
}

function register(){
	if(validCheck()){
		alert("회원정보가 등록 되었습니다.");
		document.getElementById("join").submit();
	}
}