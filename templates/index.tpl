<html>
<head>
<title>BerlinRootNet-Testbed - {$title}</title>

<link rel="stylesheet" href="format.css" type="text/css">
<script src="js/json2.js" type="text/javascript"></script>
<script src="js/ajax.js" type="text/javascript"></script>
<script src="js/highlightlinks.js" type="text/javascript"></script>
<script src="js/daytime.js" type="text/javascript"></script>
<script src="js/measurement.js" type="text/javascript"></script>
<script>
<!--
onload=HighlightLinks;
onload=daytime;
-->
</script>

</head>
<body bgcolor="#000000" text="white" topmargin="10" marginheight="10"  leftmargin="10" marginwidth="10">

<div align="center">

<table bgcolor="#e6e6e6"  cellspacing="0" cellpadding="0" border="0" width="100%" >
<tr>
	<td width="100%" ><table   cellspacing="1" cellpadding="0" border="0" width="100%">
		<tr>
			<td align="right"  width="100%" colspan="2" bgcolor="#646B84" class="topbar">
				<table cellspacing="0" cellpadding="0" border="0" >
					<tr>
						<td valign="top" align="right" >
							<form  name="showtime"><input size=10 name="date" class="date" size="7"></form>
						</td><td>&nbsp;&nbsp;</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td bgcolor="#6e7591" valign="top" width="175" rowspan="3" >

				<!--left side-->
				<table  border="0" cellpadding="0" cellspacing="0"  width="175"  >
					<tr>
						<td ><img src="images/space.gif" width="1" height="72" border="0" alt=""></td>
					</tr>
					<tr>
						<td valign="top" align="center" width="100%" >
							<table width="175" border="0" cellpadding="0" cellspacing="0"  id="menuleft" align="center" >
								<tr>
									<td class="rubrik">&nbsp;Men&uuml; </td>
								</tr>
								<tr>
									<td ><a href="index.php?menu=home">&nbsp;Home</a></td>
								</tr>
								<tr>
									<td><a href="index.php?menu=testbed&mode=show" >&nbsp;Testbed</a>
										{if $menu eq "testbed"}
										<table width="75" border="0" cellpadding="0" cellspacing="0"  id="menuleft" align="right" >
											<tr>
												<td><a href="index.php?menu=testbed&mode=group" >&nbsp;&raquo;&nbsp;Devicegroups</a></td>
											</tr>
											<tr>
												<td><a href="index.php?menu=testbed&mode=config" >&nbsp;&raquo;&nbsp;Deviceconfigs</a></td>
											</tr>
										</table>
									{/if}
									</td>
								</tr>
								<tr>
									<td ><a href="index.php?menu=measurement&mode=show" >&nbsp;Measurement</a>
										{if $menu eq "measurement"}
										<table width="75" border="0" cellpadding="0" cellspacing="0"  id="menuleft" align="right" >
											<tr>
												<td><a href="index.php?menu=measurement&mode=add" >&nbsp;&raquo;&nbsp;Add Measurement</a></td>
											</tr>
										</table>
										{/if}
									</td>
								</tr>
								<tr>
									<td><a href="index.php?menu=impressum" >&nbsp;Impressum</a></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>

			<td valign="middle" align="center" bgcolor="#9198ab" width="100%" height="72">
				<img src="images/brn.gif" width="468" height="60" border="1" alt="">
			</td>
		</tr>

		<tr>
			<td bgcolor="#6e7591" class="topbar"><img src="images/space.gif" width="20" height="1" border="0" alt="">{$title}</td>
		</tr>
		<tr>
			<td valign="top" bgcolor="#9198ab"  width="100%" height="450" >
		<br>

		<!-- Main -->
		<table border="0" cellpadding="0" cellspacing="0"  width="100%" >
			<tr>
				<!-- abstand links vom inhalt--> 
				<td width="20" ><img src="images/space.gif" width="20" height="1" border="0" alt=""></td>
				<!-- ende abstand links vom inhalt-->
				<td valign="top" width="100%">
				    {include file="$page.tpl"}
					<br>
					<!-- ende abstand nach unten-->
					
				</td><!-- abstand rechts vom inhalt-->   <td width="20" ><img src="images/space.gif" width="20" height="1" border="0" alt=""></td><!-- ende abstand rechts vom inhalt-->
			</tr>

		</table><!--ende hauptinhaltstabelle-->
	</td>
</tr>
<tr>
	<td  bgcolor="#646B84" class="topbar" >&nbsp;<span style="font-size:8pt">&nbsp;BerlinRoofNet</span></td>
	<td align="right"  bgcolor="#646B84" class="topbar" >
		<a href="javascript:history.go(-1);" onMouseOver="window.status='&nbsp;Zur&uuml;ck'; return true" onMouseOut="window.status=''" >
			<img src="images/b.gif" width="15" height="15" border="0" alt="" style="border:solid 1px silver" align="middle">
		</a>&nbsp;
		<a href="#" onMouseOver="window.status='&nbsp;Nach oben'; return true" onMouseOut="window.status=''">
			<img src="images/t.gif" width="15" height="15" border="0" alt="" style="border:solid 1px silver" align="middle">
		</a>&nbsp;&nbsp;
	</td>
</tr>
</table>
</div>
</body>
</html>
