<b>Overview</b>
<br>
<br>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
   <thead>
      <tr>
         <th align="left">ID</th>
         <th align="left">Devicegroup</th>
         <th align="left">Clickfile</th>
         <th align="left">Configname</th>
         <th align="left">User</th>
         <th align="left">Runtime</th>
         <th align="left">State</th>
         <th align="left">Result</th>
      </tr>
   </thead>
   <tbody>
      {section name=row loop=$meas_data}
         {strip}
          <tr>
          		<td valign="top">{$meas_data[row].id}</td>
            	<td valign="top">{$meas_data[row].devicegroup}</td>
            	<td valign="top">{$meas_data[row].clickfilename}</td>
                <td valign="top">{$meas_data[row].configname}</td>
                <td valign="top">{$meas_data[row].username}</td>
                <td valign="top">{$meas_data[row].runtime}</td>
                <td valign="top">{$meas_data[row].state}</td>
                {if ( $meas_data[row].resultfile != "" ) }
                	<td valign="top"><a href="{$meas_data[row].resultfile}">Result</a></td>
                {else}
                	<td valign="top">None</td>
                {/if}
          </tr>
         {/strip}
      {/section}
   </tbody>
</table>

