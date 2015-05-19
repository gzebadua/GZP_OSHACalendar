<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="SeeCalendar.aspx.vb" Inherits="Helix.SeeCalendar" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<title>Add Incident to Plant</title>
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
	
	<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
    
		<div id="todo" align="center" style="height:auto;">
		
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
						<asp:LinkButton id="lnkBackToMain" runat="server" Font-Size="X-Small">Main</asp:LinkButton>
						&nbsp;&gt;&nbsp;
						<asp:Label id="lblPlant" runat="server" Font-Size="X-Small"></asp:Label>
						&nbsp;&gt;&nbsp;Check incidents
					</div>
					
					<div id="tablanews">
					
						<br />
						<asp:UpdateProgress runat="server" id="UpdateProgress0" AssociatedUpdatePanelID="updPnlCalendar">
                            <ProgressTemplate>
                                <br />
                                Please wait while we load the data...<br />
                                <br />
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                        
                        <asp:UpdatePanel ID="updPnlCalendar" runat="server" ChildrenAsTriggers="true" UpdateMode="Always">
                            <ContentTemplate>
						    
						        <asp:Calendar id="Calendar1" runat="server" Font-Size="8pt" Width="552px" Height="378px" 
					            BorderWidth="1px" BackColor="#FFFFCC" DayNameFormat="FirstLetter"
						        ForeColor="#663399" Font-Names="Verdana" BorderColor="#FFCC66" ShowGridLines="True">
							        <TodayDayStyle ForeColor="White" BackColor="#FFCC66"></TodayDayStyle>
							        <SelectorStyle BackColor="#FFCC66"></SelectorStyle>
							        <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC"></NextPrevStyle>
							        <DayHeaderStyle Height="1px" BackColor="#FFCC66"></DayHeaderStyle>
							        <SelectedDayStyle Font-Bold="True" BackColor="#CCCCFF"></SelectedDayStyle>
							        <TitleStyle Font-Size="9pt" Font-Bold="True" ForeColor="#FFFFCC" BackColor="#990000"></TitleStyle>
							        <OtherMonthDayStyle ForeColor="#CC9966"></OtherMonthDayStyle>
						        </asp:Calendar>
						    
						    </ContentTemplate>
						</asp:UpdatePanel>
						
						<br />
						<br />
						<br />
						
						<asp:UpdateProgress runat="server" id="UpdateProgress3" AssociatedUpdatePanelID="updPnlDetails">
                        <ProgressTemplate>
                            <br />
                            Please wait while we load the data...<br />
                            <br />
                        </ProgressTemplate>
                        </asp:UpdateProgress>
						
                        <asp:UpdatePanel ID="updPnlDetails" runat="server" ChildrenAsTriggers="true" UpdateMode="Always">
                            
                            <ContentTemplate>
                            
						        <asp:Panel id="pnlDetails" runat="server" Width="552px" Height="304px" BackColor="LemonChiffon" Visible="False">
        							
							        <div>
        							
								        <asp:Label id="lblDate" runat="server" Width="264px" Font-Names="Verdana" Font-Size="X-Small" ForeColor="Red" 
								        Font-Italic="True" Font-Bold="True"></asp:Label>
								        <asp:Button id="btnCancel" runat="server" Text="Close Detail View"></asp:Button>
								        <br />
								        <br />
								        <asp:Label id="lblNothing" runat="server" Font-Size="X-Small" ForeColor="Red">There's no incidents to show in this day</asp:Label>
								        <asp:DataGrid id="DataGrid1" runat="server"	Height="246px" Width="505px" Visible="False"
								        BorderColor="#DEBA84" BackColor="#DEBA84" BorderWidth="1px" BorderStyle="None" 
								        CellPadding="3" AutoGenerateColumns="False" AllowPaging="True" CellSpacing="2">
									        <FooterStyle ForeColor="#8C4510" BackColor="#F7DFB5"></FooterStyle>
									        <SelectedItemStyle Font-Bold="True" ForeColor="White" BackColor="#738A9C"></SelectedItemStyle>
									        <ItemStyle ForeColor="#8C4510" BackColor="#FFF7E7"></ItemStyle>
									        <HeaderStyle Font-Bold="True" ForeColor="White" BackColor="#A55129"></HeaderStyle>
									        <Columns>
										        <asp:BoundColumn Visible="False" DataField="iincidentid" HeaderText="ID"></asp:BoundColumn>
										        <asp:BoundColumn Visible="False" DataField="iincidenttypeid" HeaderText="Tipo"></asp:BoundColumn>
										        <asp:TemplateColumn HeaderText="Type">
											        <HeaderStyle Font-Size="X-Small" HorizontalAlign="Center" Width="120px"></HeaderStyle>
											        <ItemStyle HorizontalAlign="Center"></ItemStyle>
											        <ItemTemplate>
												        <asp:Panel id="pnlType" runat="server" Height="11px" Width="128px">
                                                            <asp:Image id="ImageY" runat="server" ImageUrl="img/Yellowdot.gif"></asp:Image>
                                                            <asp:Image id="ImageR" runat="server" ImageUrl="img/Red.gif"></asp:Image>&nbsp;
                                                            <asp:Label id="Label1" runat="server" Font-Size="X-Small">Non OSHA</asp:Label>
                                                        </asp:Panel>
											        </ItemTemplate>
										        </asp:TemplateColumn>
										        <asp:BoundColumn DataField="incident" HeaderText="Incident">
											        <HeaderStyle Font-Size="X-Small" HorizontalAlign="Center" Width="300px"></HeaderStyle>
											        <ItemStyle Font-Size="XX-Small" HorizontalAlign="Center"></ItemStyle>
										        </asp:BoundColumn>
									        </Columns>
									        <PagerStyle HorizontalAlign="Center" ForeColor="#8C4510" Mode="NumericPages"></PagerStyle>
								        </asp:DataGrid>
        							
							        </div>
        						
						        </asp:Panel>
						        
						    </ContentTemplate>
						
						</asp:UpdatePanel>
					
					</div>
					
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
