<b>Overview</b>
<br>
<br>
<table border="0" cellpadding="0" cellspacing="0" width="70%">
   <!--<caption>BerlinRoofNet Testbed</caption>-->
   <thead>
      <tr>
         <th align="left">Name</th>
         <th align="left">Place</th>
         <th align="left">State</th>
         <th align="left">Comment</th>
         <th align="left">Option</th>
      </tr>
   </thead>
   <tbody>
      {section name=row loop=$table_data}
         {strip}
          <tr>
          	<form action="index.php" method="POST">
          		<input type="hidden" name="menu" value="testbed">
          		<input type="hidden" name="mode" value="device">
          		<input type="hidden" name="operation" value="change">
          		<input type="hidden" name="id" value="{$table_data[row].id}">
            	<td valign="top">{$table_data[row].name}</td>
            	<td valign="top">{$table_data[row].place}</td>
            	<td valign="top">{$table_data[row].state}</td>
                <td valign="top">{$table_data[row].comment}</td>
                <td width="10"><input name="change" type="submit" class="box" value=" Del "></td>
            </form>
          </tr>
         {/strip}
      {/section}
      	  <tr>
      	  	<form action="index.php" method="POST">
      	  	<input type="hidden" name="menu" value="testbed">
      	  	<input type="hidden" name="mode" value="device">
      	    <input type="hidden" name="operation" value="add">
      	    <td valign="top"><input type="Text" name="name" size="20" maxlength="20"></td>
            <td valign="top"><input type="Text" name="place" size="20" maxlength="20"></td>
            <td valign="top">
				<select name="state" size="1">
		      		{section name=staterow loop=$state_data}
        			{strip}
    				<option>{$state_data[staterow].statename}</option>
    				{/strip}
         			{/section}
				</select>
      		</td>
      		<td valign="top"><input type="Text" name="comment" size="20" maxlength="20"></td>
            <td width="10"><input name="add" type="submit" class="box" value=" Add "></td>
      		</form>
          </tr>
   </tbody>
</table>
