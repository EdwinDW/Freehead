{include file='header.tpl'}

		<div id="main">

			<div id="main-precontents"></div>
			<div id="main-contents" class="main-contents">
			
			<h2>{#Website_reputation#}</h2>
			<hr>

			<br />
			{#Website_reputation_desc1#}
			<br /><br />
			{#Website_reputation_desc2#}  <a href="/?website-achievements">{#Website_reputation_link1#}</a>!
			<br /><br />
			{#Website_reputation_desc3#}
			<br /><br />
			{#Website_reputation_desc4#}
			<br /><br />

			<b><h3>{#Reputation_criteria#}</h3></b>
			<table width="500px" border="1px">
			<tr><td width="70%">Registering an account</td><td width="30%" align="right">100 reputation</td></tr>
			<tr><td width="70%">Daily visit</td><td width="30%" align="right">5 reputation</td></tr>
			<tr><td width="70%">Posting a comment</td><td width="30%" align="right">1 reputation</td></tr>
			<tr><td width="70%">Your comment was voted up (each upvote)</td><td width="30%" align="right">5 reputation</td></tr>
			<tr><td width="70%">Submitting a screenshot</td><td width="30%" align="right">5 reputation</td></tr>
			<tr><td width="70%">Submitting a guide (approved)</td><td width="30%" align="right">100 reputation</td></tr>
			<tr><td width="70%">Earning a <font color="brown">Copper</font> <a href="/?website-achievements">website achievement</a></td><td width="30%" align="right">2 reputation</td></tr>
			<tr><td width="70%">Earning a Silver <a href="/?website-achievements">website achievement</a</td><td width="30%" align="right">25 reputation</td></tr>
			<tr><td width="70%">Earning a <font color="gold">Gold</font> <a href="/?website-achievements">website achievement</a></td><td width="30%" align="right">50 reputation</td></tr>
			</table>
			<br /><br />
					<font size="3px"><b>{#Reputation_history#}</b></font>
				<hr>
				<br />
				<table width="100%" border="1px">
				<tr>
				<th>Reputation Action</th>
				<th>Amount</th>
				<th>Date</th>
				{assign var=username value=$user.name}
				{php}
				$username = $this->_tpl_vars['username'];
				$query = "
				SELECT * 
				FROM account_reputation 
				WHERE 
					username LIKE '$username' 
					ORDER BY id
				";
				$gh = mysql_query($query) or die(mysql_error());
				while($gethistory = mysql_fetch_array($gh))
				{
				$action = $gethistory['reason'];
				echo '<tr><td width="33%"><center>';
				if ($action == 1) { echo 'Registering an account'; }
				elseif ($action == 2) { echo 'Daily visit'; }
				elseif ($action == 3) { echo 'Posting a comment'; }
				elseif ($action == 4) { echo 'Your comment was voted up (each upvote)'; }
				elseif ($action == 5) { echo 'Submitting a screenshot'; }
				elseif ($action == 6) { echo 'Submitting a guide (approved)'; }
				elseif ($action == 7) { echo 'Earning a <font color="brown">Copper</font> <a href="/?website-achievements">website achievement</a>'; }
				elseif ($action == 8) { echo 'Earning a Silver <a href="/?website-achievements">website achievement</a>'; }
				elseif ($action == 9) { echo 'Earning a <font color="gold">Gold</font> <a href="/?website-achievements">website achievement</a>'; }
				else { echo 'Achievement not found'; }
				echo '</center></td><td width="33%">';
				echo "<center><font color='green'>+";
				echo $gethistory['reputation'];
				echo '</font></center></td><td width="33%"><center>';
				echo $gethistory['date'];
				echo '</center></td></tr>';
				}
				echo '</table>';
				{/php}
				</div>

			</div>
		</div>

{include file='footer.tpl'}