<b>Devicegroup</b>
<br>
<br>
<table border="0" cellpadding="0" cellspacing="0" width="90%">
   <!--<caption>BerlinRoofNet Testbed</caption>-->
   <thead>
      <tr>
         <th align="left">Name</th>
         <th align="left">Devices</th>
         <th align="left">Option</th>
      </tr>
   </thead>
   <tbody>
      {section name=row loop=$group_list}
         {strip}
          <tr>
          	<form action="index.php" method="GET">
      	  	    <input type="hidden" name="menu" value="testbed">
      	  	 	<input type="hidden" name="mode" value="group">
      	     	<input type="hidden" name="operation" value="change">
      	     	<input type="hidden" name="id" value="{$group_list[row].id}">
          		<td valign="top">{$group_list[row].name}</td>
            	<td valign="top">{$group_list[row].devices}</td>
            	<td width="10"><input name="change" type="submit" class="box" value=" Del "></td>
            </form>
          </tr>
         {/strip}
      {/section}
      	  <tr>
      	  	<form action="index.php" method="GET">
      	  	    <input type="hidden" name="menu" value="testbed">
      	  	 	<input type="hidden" name="mode" value="group">
      	     	<input type="hidden" name="operation" value="add">
      	    	<td valign="top"><input type="Text" name="name" size="10" maxlength="20"></td>
            	<td valign="top">
            		{section name=row loop=$device_list}
         			{strip}
          				<input type="checkbox" name="device[]" value="{$device_list[row].id}">{$device_list[row].name}<br>
            		{/strip}
      				{/section}
      				
            	</td>
            	<td width="10"><input name="add" type="submit" class="box" value=" Add "></td>
            </form>
          </tr>
   </tbody>
</table>
