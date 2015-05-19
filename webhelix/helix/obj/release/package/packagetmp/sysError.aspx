<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="sysError.aspx.vb" Inherits="Helix.sysError" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<title>Oops!! - General Error</title>
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
		<script type="text/javascript">
			function gaia_setFocus() {
				var f = null;
				if (document.getElementById) { 
					f = document.getElementById("Form1");
					if (f.txtUsername.value == null || f.txtUsername.value == "") { 
						f.txtUsername.focus();
					} else {
							f.txtPassword.focus();
						
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
					
					<div id="buffer">
					</div>
					
					<div id="left-column-first">
						<img class="img-left-nav" src="./img/img_left_nav.jpg" alt="" />
					</div>
					
					<div id="middle-column" align="justify">
					
						<div class="middle-column-title-standard">
						    Ooops!!&nbsp; - General Error
						</div>
						
						<div id="tablanews" style="width: 393px; position: relative; height: 464px">
							
							<br />
							<asp:HyperLink id="hlLogin" style="z-index: 102; left: 248px; position: absolute; top: 168px" runat="server"
								Height="24px" Width="113px" Font-Size="X-Small" CssClass="hlink" NavigateUrl="index.aspx">Go to Main Page
							</asp:HyperLink>
							<img style="z-index: 103; left: 16px; position: absolute; top: 16px" src="img/bits.gif" alt="" />
							<asp:Label id="lblServer" style="z-index: 106; left: 152px; position: absolute; top: 24px"
							runat="server" Font-Size="Medium" Font-Names="Verdana" Font-Bold="True" ForeColor="Navy">Whoa!!</asp:Label>
							<asp:Label id="lblWhat" style="z-index: 107; left: 152px; position: absolute; top: 64px" runat="server"
							Font-Size="X-Small" Width="224px" Height="68px">We are sorry, you may have caused unintentionally an error on the system. Please start over whatever you were doing and try again.</asp:Label>
							
						</div>
						
					</div>
					
					<div id="right-column">
						
					</div>
					
					<div id="footer">
						Copyright ©2006
						&nbsp;&nbsp;
						Helix Solutions
						&nbsp;|&nbsp;&nbsp;
						All rights reserved.
					</div>
					
				</div>
			</div>
		</form>
	</body>
</html>
