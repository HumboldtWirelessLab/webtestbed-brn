  <thead>
      <tr>
         <th align="left">Node</th>
         <th align="left">Config</th>
         <th align="left">Clickfile</th>
      </tr>
  </thead>
   <tbody>
         {section name=scfg loop=$group_data}
         <tr> 
            <td valign="top">
            {$group_data[scfg].name}            
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
