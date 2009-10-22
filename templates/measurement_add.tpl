<b>Add</b>
<br>
<br>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
   <!--<caption>BerlinRoofNet Testbed</caption>-->
   <thead>
      <tr>
         <th align="left">Nodegroup</th>
         <th align="left">Config</th>
         <th align="left">Clickfile</th>
         <th align="left">Application</th>
         <th align="left">HostApplication</th>
         <th align="left">Runtime</th>
         <th align="left"></th>
      </tr>
   </thead>
   <tbody>
 	<form action="index.php" method="POST" enctype="multipart/form-data">
 	<input type="hidden" name="menu" value="measurement">
  	<input type="hidden" name="mode" value="operation">
     	<input type="hidden" name="operation" value="add">
	    <tr>
      	     	<td valign="top">
					<select name="group" size="1" onchange="changeGroup(this)">
		      			{section name=grouprow loop=$group_data}
        				{strip}
    					<option>{$group_data[grouprow].name}</option>
    					{/strip}
         				{/section}
					</select>
				</td>
     		 	<td valign="top">
					<select name="config" size="1">
		      			{section name=configrow loop=$config_data}
        				{strip}
    					<option>{$config_data[configrow].name}</option>
    					{/strip}
         				{/section}
					</select>
				</td>
     		 	<td valign="top">
     		 		<input type="hidden" name="MAX_FILE_SIZE" value="2000000">
				<input name="clickfile" type="file" size="10" maxlength="2000000">
     			</td>
     		 	<td valign="top">
     		 		<input type="hidden" name="MAX_FILE_SIZE" value="2000000">
				<input name="appfile" type="file" size="10" maxlength="2000000">
     			</td>
     		 	<td valign="top">
     		 		<input type="hidden" name="MAX_FILE_SIZE" value="2000000">
				<input name="hostappfile" type="file" size="10" maxlength="2000000">
     			</td>
     			<td valign="top">
					<input name="runtime" type="text" size="4" maxlength="4">
     			</td>
     			<td width="10"><input name="upload" type="submit" class="box" value=" Commit "></td>
    	        </tr>
	</form>
   </tbody>
</table>
<p>
<table id="nodeconfig" border="0" cellpadding="0" cellspacing="0" width="100%">
  <thead>
      <tr>
         <th align="left">Node</th>
         <th align="left">Config</th>
         <th align="left">Clickfile</th>
      </tr>
  </thead>
   <tbody>
         {section name=scfg loop=$snodecfg}
         <tr> 
            <td valign="top">
            {$snodecfg[scfg].name}            
            </td>
            <td valign="top">
              <select name="config" size="1">
		      			{section name=configrow loop=$config_data}
    					   <option>{$config_data[configrow].name}</option>
         				{/section}
					    </select>
            </td>
            <td valign="top">
              <input type="hidden" name="MAX_FILE_SIZE" value="2000000">
					    <input name="clickfile" type="file" size="10" maxlength="2000000">
            </td>
         </tr>
 				{/section}
   </tbody>      
</table>
