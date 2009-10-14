	/**
	 * Objekt zum Datenaustausch mit dem Server
	 */
	var xmlHttp = null;
	//Mozilla, Opera, Safari sowie Internet Explorer 7
	if (typeof XMLHttpRequest != 'undefined') {
		xmlHttp = new XMLHttpRequest();
	}
	if (!xmlHttp) {
  // Internet Explorer 6 und älter
		try {
			xmlHttp  = new ActiveXObject("Msxml2.XMLHTTP");
		} catch(e) {
			try {
 				xmlHttp  = new ActiveXObject("Microsoft.XMLHTTP");
			} catch(e) {
				xmlHttp  = null;
			}
		}
	}
	if(xmlHttp == null) alert("AJAX is not supported!");

	function sendQuery(url, q, responseFkt) {
		xmlHttp.open("POST", url, true);
		xmlHttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		xmlHttp.onreadystatechange = responseFkt;
		xmlHttp.send("data="+JSON.stringify(q));
	}