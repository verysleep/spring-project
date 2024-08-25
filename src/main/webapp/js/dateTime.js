/**
 * 날짜와 시간에 대한 표시와 처리
 */
 
 // 날짜로 표시하는 처리
 // timeStemp : Long type 의 시간 정보 데이터
 function toDate(timeStemp, separChar) {
 	if(!separChar) separChar = "-";
 	let dateObj = new Date(timeStemp);
 	
 	let yy = dateObj.getFullYear();
 	let mm = dateObj.getMonth() + 1; //월은 0~11까지 사용.
 	let dd = dateObj.getDate();
 	
 	let dateStr = yy + separChar +  ((mm > 9 ?  '' : '0') + mm) + separChar + dd;
 	
 	console.log("dateTime.js - dateStr : " + dateStr);
 	
 	return dateStr;
 }
 
 // 시간으로 표시하는 처리
 // timeStemp : Long type 의 시간 정보 데이터
 function toTime(timeStemp) {
 	let dateObj = new Date(timeStemp);
 	
 	let hh = dateObj.getHours();
 	let mi = dateObj.getMinutes();
 	let ss = dateObj.getSeconds();
 	
 	// console.log("dateTime.js - hh : " + hh + ", dateTime.js - mi : " + mi + ", dateTime.js - ss : " + ss);
 	// console.log(((hh > 9 ? '' : '0') + hh) + ":" + 
	//		      ((mi > 9 ? '' : '0') + mi) + ":" + 
	//		      ((ss > 9 ? '' : '0') + ss));
	       
 	let timeStr = ((hh > 9 ? '' : '0') + hh) + ":" + 
			      ((mi > 9 ? '' : '0') + mi) + ":" + 
			      ((ss > 9 ? '' : '0') + ss);
 	
 	return timeStr;
 }

 // 날짜와 시간 표시하는 처리
 // 24시간이 지나지 않았으면 시간을, 지났으면 날짜를 표시한다
 function toDateTime(timeStemp){
 	// console.log("dateTime.js - timeStemp : " + timeStemp);
 	// 현재 날짜 객체
 	let today = new Date();
	let gap = today.getTime() - timeStemp; // 1000 초 단위의 지나간 시간이 나온다.
 	// console.log("dateTime.js - gap : " + gap);
 	
	// 지나간 시간이 24 시간 보다 작은 경우(24시간이 안 지남) - 시간 표시
	if(gap < (1000 * 60 * 60 * 24)) {
		let str = toTime(timeStemp);
		// console.log("dateTime.js - str : " + str);
		return toTime(timeStemp);
	}
	// 24 시간이 지난 경우 날짜 표시
	else return toDate(timeStemp, "-");
 }
 