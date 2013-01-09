	<div id="footer">
{if isset($mysql)}
		{#Number_of_MySQL_queries#}: {$mysql.count}<br>
		{#Time_of_MySQL_queries#}: {$mysql.time}
{/if}
	</div>
</div>
</div>
<!-- &copy; 2012 FreedomHead http://freedomwow.ru-->
<!--[if lte IE 6]></td><th class="ie6layout-th"></th></tr></table><![endif]-->
{php}
function GetMicroTime()
{
        list($microseconds, $seconds) = explode(" ", microtime());
        return ((float)$microseconds + (float)$seconds);
} 

$nStartTime = GetMicroTime(); 
$nEndTime = GetMicroTime();
$szGeneratedTime = "Page generated in " .
                    number_format(($nEndTime - $nStartTime), 6) .
                    " seconds.";
echo "<!-- $szGeneratedTime -->\r\n";
echo "<!-- Затрачено оперативной памяти ".round(memory_get_peak_usage()/(1024*1024),3)." MB -->\r\n";
$Contents = ob_get_contents(); 
echo "<!-- Общий размер файла: ".strlen($Contents)." байт -->";
{/php}
</body>
</html>
