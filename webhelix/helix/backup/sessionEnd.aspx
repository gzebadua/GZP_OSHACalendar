<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="sessionEnd.aspx.vb" Inherits="Helix.sessionEnd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
	<title>Ooops!! - Session Timeout</title>
	<link rel="stylesheet" type="text/css" href="./css/style.css" />
	<style type="text/css">
        .style1 { font-size: 12px; font-family: Verdana; }
	</style>
	<script type="text/javascript">
	var isIE4up = (document.all) ? 1 : 0;
	var isIE5 = (isIE4up && navigator.appVersion.indexOf("MSIE 5") != -1) ? 1 : 0;
	var isIE6 = (isIE4up && navigator.appVersion.indexOf("MSIE 6") != -1) ? 1 : 0;
	function validateInput(e, strPattern)
	{
		var chr = (isIE4up || isIE6 || isIE6)?e.keyCode:e.which;
		var ch = String.fromCharCode(chr);
 
		if (chr != 13 && chr !=  8 )
		{
			var re = new RegExp(strPattern);
 
			if (ch.search(re) == -1)
			{
				if(isIE4up || isIE6 || isIE6)
				{
					e.returnValue = false;
				}
				else
				{
					e.preventDefault();
				}
			}
		}
	}
	</script>
</head>
<body>

	<form id="Form1" method="post" runat="server">
	
		<div id="todo" align="center">
		
			<div id="wrap" align="center">
				
				<div id="header-banner">
					
				</div>
				
				<div id="header-nav-bottom">
					<ul>
						<li>
							<a href="index.aspx">Home</a></li>
					</ul>
				</div>
				
				<div id="buffer"></div>
				
				<div id="left-column-first">
					<img class="img-left-nav" src="./img/img_left_nav.jpg" alt="" />
				</div>
				
				<div id="middle-column" align="justify">
					
					<div class="middle-column-title-standard">
						Ooops!! - Session Timeout
					</div>
					
					<div id="tablanews" style="width: 393px; position: relative; height: 464px">
						
						<br />
						<object style="z-index: 104; left: 32px; position: absolute; top: 16px" codeBase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0"
							height="222" width="320" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" viewastext>
							<param name="_cx" value="8467" />
							<param name="_cy" value="5874" />
							<param name="FlashVars" value="" />
							<param name="Movie" value="img/noright.swf" />
							<param name="Src" value="img/noright.swf" />
							<param name="WMode" value="Window" />
							<param name="Play" value="-1" />
							<param name="Loop" value="-1" />
							<param name="Quality" value="High" />
							<param name="SAlign" value="" />
							<param name="Menu" value="-1" />
							<param name="Base" value="" />
							<param name="AllowScriptAccess" value="always" />
							<param name="Scale" value="ShowAll" />
							<param name="DeviceFont" value="0" />
							<param name="EmbedMovie" value="0" />
							<param name="BGColor" value="" />
							<param name="SWRemote" value="" />
							<param name="MovieData" value="" />
							<param name="SeamlessTabbing" value="1" />
							<param name="Profile" value="0" />
							<param name="ProfileAddress" value="" />
							<param name="ProfilePort" value="0" />
							<embed src="img/noright.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="320" height="222">
							</embed>
						</object>
						<asp:Label id="lblNoRight" style="z-index: 105; left: 56px; position: absolute; top: 272px"
							runat="server" Height="36px" Width="280px" Font-Size="XX-Small" CssClass="labellarge">We are sorry, but your session has ended.</asp:Label>
						<asp:HyperLink id="hlLogin" style="z-index: 107; left: 224px; position: absolute; top: 336px" runat="server"
							Height="24px" Width="154px" Font-Size="X-Small" CssClass="hlink" NavigateUrl="index.aspx">Go to Main Page now!</asp:HyperLink>
					</div>
				</div>
				
				<div id="right-column">
					
					
				</div>
				
				<div id="footer">
					Copyright ©2006&nbsp;&nbsp;Helix 
					Solutions &nbsp;|&nbsp;&nbsp;All Rights Reserved
				</div>
				
			</div>
			
		</div>
		
	</form>
	
</body>
</html>
