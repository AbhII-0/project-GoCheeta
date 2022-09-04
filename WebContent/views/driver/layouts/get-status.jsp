<script type="text/javascript"
		src="${initParam['basePath']}/assets/js/jquery-3.4.1.min.js"></script>
<script >
console.log("driver_status");
var xhr = new XMLHttpRequest();

xhr.onreadystatechange = function () {
    if (xhr.readyState == XMLHttpRequest.DONE) {
//        alert(xhr.responseText);
        var jsonData = JSON.parse(xhr.responseText);
        if(jsonData.statusNew == true){
        	
        	var driver_status = jsonData.driver_status;
        	console.log(driver_status);
        	
        	if(driver_status == "ONLINE"){
        		$("#driverStatusIcon").addClass("fa-circle");
        		$("#driverStatusIcon").css("background-color", "black");
        		$("#driverStatusIcon").css("color", "#00ff0a");
        	}else if (driver_status == "IDLE") {
        		$("#driverStatusIcon").addClass("fa-moon");
        		$("#driverStatusIcon").css("background-color", "black");
        		$("#driverStatusIcon").css("color", "yellow");
			} else if (driver_status == "BUSY") {
        		$("#driverStatusIcon").addClass("fa-ban");
        		$("#driverStatusIcon").css("color", "black");
        		$("#driverStatusIcon").css("background-color", "#e91e63");
			}else{
				$("#driverStatusIcon").addClass("fa-circle");
        		$("#driverStatusIcon").css("background-color", "black");
        		$("#driverStatusIcon").css("color", "#9e9e9e");
			}


    	}else{
    		
    	}
}
}

xhr.open('GET', '/GoCheeta/driver/get-status');
xhr.setRequestHeader('Content-Type', 'application/json');
xhr.send();
</script>