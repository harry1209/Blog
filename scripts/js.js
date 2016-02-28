function addLoadEvent(func) {
  var oldonload = window.onload;
  if (typeof window.onload != 'function') {
    window.onload = func;
  } else {
    window.onload = function() {
      oldonload();
      func();
    }
  }
}

function showSection(id) {
  var divs = document.getElementsByTagName("div");
  for (var i=0; i<divs.length; i++ ) {
    if (divs[i].className.indexOf("reply-display") == -1) continue;
    if (divs[i].getAttribute("id") != id) {
      divs[i].style.display = "none";
    } else {
      divs[i].style.display = "block";
    }
  }
}

function prepareInternalnav() {
  if (!document.getElementsByTagName) return false;
  if (!document.getElementById) return false;
  if (!document.getElementById("content")) return false;
  var nav = document.getElementById("content");
  var links = nav.getElementsByTagName("a");
  for (var i=0; i<links.length; i++ ) {
    var replyId = links[i].getAttribute("href").split("#")[1];
    if (!document.getElementById(replyId)) continue;
    document.getElementById(replyId).style.display = "none";
    links[i].destination = replyId;
    links[i].onclick = function() {
      showSection(this.destination);
      return false;
    }
  }
}

function checkdata(form){
	if( form.name.value.length<1 ) {
     alert("\昵称不能为空 !!")
     form.name.focus()
     return false;
	}
	if( form.email.value.length<1 ) {
     alert("\请填写邮件 !!")
     form.email.focus()
     return false;
	}
	var email = form.email.value; 
 	var pattern = /^([a-zA-Z0-9._-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/; 
 	flag = pattern.test(email); 
 	if(!flag){ 
  	alert("email格式不正确!"); 
  	form.email.focus(); 
  	return false; 
 	} 
	if( form.content.value.length<1 ) {
     alert("\留言内容不能为空 !!")
     form.content.focus()
     return false;
	}
}

function checkdataReply(form){
	if( form.recontent.value.length<1 ) {
     alert("\回复内容不能为空 !!")
     form.recontent.focus()
     return false;
	}
}

addLoadEvent(prepareInternalnav);