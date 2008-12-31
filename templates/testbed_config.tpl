<b>Config</b>
<br>
<br>
<table border="0" cellpadding="0" cellspacing="0" width="90%">
   <!--<caption>BerlinRoofNet Testbed</caption>-->
   <thead>
      <tr>
         <th align="left">Name</th>
         <th align="left">Channel</th>
         <th align="left">Macclone</th>
         <th align="left">Channelswitch</th>
         <th align="left">CCA</th>
         <th align="left">Power</th>
         <th align="left">Wifitype</th>
         <th align="left">Option</th>
      </tr>
   </thead>
   <tbody>
      {section name=row loop=$config_list}
         {strip}
          <tr>
          	<form action="index.php" method="POST">
          		<input type="hidden" name="menu" value="testbed">
      	  	 	<input type="hidden" name="mode" value="config">
      	     	<input type="hidden" name="operation" value="change">
          		<input type="hidden" name="id" value="{$config_list[row].id}">
          		<td valign="top">{$config_list[row].name}</td>
            	<td valign="top">{$config_list[row].channel}</td>
            	<td valign="top">{$config_list[row].macclone}</td>
            	<td valign="top">{$config_list[row].channelswitch}</td>
            	<td valign="top">{$config_list[row].cca}</td>
            	<td valign="top">{$config_list[row].power}</td>
            	<td valign="top">{$config_list[row].wifitype}</td>
            	<td width="10"><input name="change" type="submit" class="box" value=" Del "></td>
            </form>
          </tr>
         {/strip}
      {/section}
      	  <tr>
      	  	<form action="index.php" method="GET">
      	  	    <input type="hidden" name="menu" value="testbed">
      	  	 	<input type="hidden" name="mode" value="config">
      	     	<input type="hidden" name="operation" value="add">
      	    	<td valign="top"><input type="Text" name="name" size="10" maxlength="20"></td>
            	<td valign="top"><input type="Text" name="channel" size="3" maxlength="20"></td>
            	<td valign="top"><input type="Text" name="macclone" size="1" maxlength="20"></td>
            	<td valign="top"><input type="Text" name="channelswitch" size="1" maxlength="20"></td>
            	<td valign="top"><input type="Text" name="cca" size="1" maxlength="20"></td>
            	<td valign="top"><input type="Text" name="power" size="2" maxlength="20"></td>
            	<td valign="top"><input type="Text" name="wifitype" size="3" maxlength="20"></td>
            	<td width="10"><input name="add" type="submit" class="box" value=" Add "></td>
            </form>
          </tr>
   </tbody>
</table>
