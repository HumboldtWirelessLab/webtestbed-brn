function changeGroup(select) {
  var value = select.options[select.options.selectedIndex].value;
	var session = new Object();
	session['group'] = value;
	sendQuery('nodeconfig.php', session, updateGroup);
}

function updateGroup() {
  document.getElementById('nodeconfig').innerHTML = xmlHttp.responseText;
}
