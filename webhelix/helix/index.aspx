<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="index.aspx.vb" Inherits="Helix.index" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<title>Main Page</title>
<link rel="stylesheet" type="text/css" href="./css/style.css" />
<style type="text/css">
    .style1 { font-size: 12px; font-family: Verdana; }
</style>
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
							Welcome!!
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
                                    <asp:Calendar id="Calendar1" runat="server" Width="400px" Height="306px"
						            Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" BackColor="#FFFFCC" 
						            DayNameFormat="FirstLetter" BorderWidth="1px" BorderColor="#FFCC66" ShowGridLines="True">
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
							<asp:Label id="lblInstructions0" runat="server" Font-Size="X-Small">Please choose the desired option:</asp:Label>
							<br />
							<br />
							<br />
							
							<div>
							    
							    <img src="img/eye.gif" border="0" align="middle" alt="" />&nbsp;
							    <asp:LinkButton id="lnkSee" runat="server" Font-Size="X-Small" Width="264px">See Plant Incidents</asp:LinkButton>
								
								<asp:UpdateProgress runat="server" id="UpdateProgress1" AssociatedUpdatePanelID="updPnlSee">
                                <ProgressTemplate>
                                    <br />
                                    Please wait while we load the data...<br />
                                    <br />
                                </ProgressTemplate>
                                </asp:UpdateProgress>
								
								<asp:UpdatePanel ID="updPnlSee" runat="server" ChildrenAsTriggers="true" UpdateMode="Always">
                                <ContentTemplate>
							        <asp:Panel id="pnlSee" runat="server" Visible="False">
    									
								        <div>
    									    
								            <br />
									        <asp:Label id="lblInstructions" runat="server" Font-Names="Verdana" Font-Size="X-Small">Please select the plant from you want to see the incidents:</asp:Label>
									        <br />
									        <br />
									        <img src="img/golddot.gif" border="0" alt="" />
									        <asp:LinkButton id="SeeUSA1" runat="server" Font-Size="X-Small" ForeColor="Maroon">Edinburg</asp:LinkButton>
									        <asp:Label id="Qty1" runat="server" Font-Names="Verdana" Font-Size="X-Small"></asp:Label>
									        <br />
									        <br />
									        <img src="img/golddot.gif" border="0" alt="" />
									        <asp:LinkButton id="SeeUSA2" runat="server"	Font-Size="X-Small" ForeColor="Maroon">Imperial Valley</asp:LinkButton>
									        <asp:Label id="Qty2" runat="server" Font-Names="Verdana" Font-Size="X-Small"></asp:Label>
									        <br />
									        <br />
									        <img src="img/golddot.gif" border="0" alt="" />
									        <asp:LinkButton id="SeeMX" runat="server" Font-Size="X-Small" ForeColor="Maroon">Sinaloa</asp:LinkButton>
									        <asp:Label id="Qty3" runat="server" Font-Names="Verdana" Font-Size="X-Small"></asp:Label>
									        <br />
    										
								        </div>
    									
							        </asp:Panel>
							
                                </ContentTemplate>
                                </asp:UpdatePanel>
							    <br />
								<br />
								<br />
								
							    &nbsp;&nbsp;<img src="img/add.gif" border="0" align="middle" alt="" />&nbsp;&nbsp;&nbsp;
							    <asp:LinkButton id="lnkAdd" runat="server" Font-Size="X-Small" Width="216px">Add Plant Incidents</asp:LinkButton>
								
								<asp:UpdateProgress runat="server" id="UpdateProgress2" AssociatedUpdatePanelID="updPnlAdd">
                                <ProgressTemplate>
                                    <br />
                                    Please wait while we load the data...<br />
                                    <br />
                                </ProgressTemplate>
                                </asp:UpdateProgress>
                                
								<asp:UpdatePanel ID="updPnlAdd" runat="server" ChildrenAsTriggers="true" UpdateMode="Always">
                                <ContentTemplate>
                                
							        <asp:Panel id="pnlAdd" runat="server" Visible="False">
    								
								        <div>
    									    
								            <br />
								            <asp:Label id="lblInstructions2" runat="server" Font-Size="X-Small" Font-Names="Verdana">Please select the plant from you want to add an incident:</asp:Label>
									        <br />
									        <br />
									        <img src="img/golddot.gif" alt="" />
									        <asp:LinkButton id="addUSA1" runat="server" Font-Size="X-Small" ForeColor="Maroon">Edinburg</asp:LinkButton>
									        <br />
									        <img src="img/golddot.gif" alt="" />
									        <asp:LinkButton id="addUSA2" runat="server" Font-Size="X-Small" ForeColor="Maroon">Imperial Valley</asp:LinkButton>
									        <br />
									        <img src="img/golddot.gif" alt="" />
									        <asp:LinkButton id="addMX" runat="server" Font-Size="X-Small" ForeColor="Maroon">Sinaloa</asp:LinkButton>
									        <br />
    										
								        </div>
    									
							        </asp:Panel>
							    
							</ContentTemplate>
							</asp:UpdatePanel>
								
								
						</div>
							
						<br />
						<br />
						<br />
							
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
