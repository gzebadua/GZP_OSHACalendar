<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Plant.aspx.vb" Inherits="Helix.Plant" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<title>Add Incident to Plant</title>
	<link href="./css/style.css" type="text/css" rel="stylesheet" />
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
							<a href="index.aspx">Home</a>
						</li>
					</ul>
					
				</div>
				
				<div id="buffer">
				</div>
				
				<div id="left-column-first">
				    <img class="img-left-nav" alt="" src="./img/img_left_nav.jpg" />
				</div>
				
				<div id="middle-column" align="justify">
				
					<div class="middle-column-title-standard">
					    <asp:LinkButton id="lnkBackToMain" runat="server" Font-Size="X-Small">Main</asp:LinkButton>
					    &nbsp;&gt;&nbsp;
					    <asp:Label id="lblPlant" runat="server" Font-Size="X-Small"></asp:Label>
					    &nbsp;&gt;&nbsp;
					    Add incident
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
					            <asp:Calendar id="Calendar1" runat="server" Font-Size="8pt" Font-Names="Verdana" 
					            ForeColor="#663399" Height="378px" Width="552px" BorderWidth="1px"
					            BackColor="#FFFFCC" DayNameFormat="FirstLetter" BorderColor="#FFCC66" ShowGridLines="True">
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
						 
						 <asp:UpdatePanel ID="updPnlEdit" runat="server" ChildrenAsTriggers="true" UpdateMode="Always">
                            
                            <ContentTemplate>
				                
				                <asp:Panel id="PnlEdit" runat="server" Height="808px" Width="544px" BackColor="LemonChiffon">
        							
					                <div >
        							    
					                    <br />
						                <br />
						                &nbsp;&nbsp;
						                <img src="img/add.gif" align="middle" border="0" alt="" />
						                &nbsp;&nbsp;&nbsp;&nbsp;
						                <asp:LinkButton id="lnkAdd" runat="server" Font-Size="X-Small">Add new Incident</asp:LinkButton>
						                <br />
						                <br />
        								
								        <asp:UpdateProgress runat="server" id="UpdateProgress2" AssociatedUpdatePanelID="updPnlData">
                                        <ProgressTemplate>
                                            <br />
                                            Please wait while we load the data...<br />
                                            <br />
                                        </ProgressTemplate>
                                        </asp:UpdateProgress>
                                        
                                        <asp:UpdatePanel ID="updPnlData" runat="server">
                                            <ContentTemplate>
                                            
                                                <asp:Panel id="pnlData" runat="server" Width="536px" Height="304px" BackColor="LemonChiffon" Visible="False">
                									
					                                <div>
                									
						                                <asp:Label id="lblDate" runat="server" Font-Size="X-Small" Width="264px" ForeColor="Red" Font-Names="Verdana" 
						                                Font-Bold="True" Font-Italic="True"></asp:Label>
						                                <br />
						                                <img src="img/Yellowdot.gif" alt="" />
						                                <asp:RadioButton id="ry" runat="server" Font-Size="X-Small" Font-Names="Verdana" 
						                                Text="OSHA non recordable" GroupName="RadioButtonList1">
						                                </asp:RadioButton>
						                                &nbsp;&nbsp;&nbsp;&nbsp;
						                                <img src="img/Red.gif" alt="" />
						                                <asp:RadioButton id="rr" runat="server" Font-Size="X-Small" Font-Names="Verdana" 
						                                Text="OSHA Recordable " GroupName="RadioButtonList1">
						                                </asp:RadioButton>
						                                <asp:RadioButtonList id="RadioButtonList1" runat="server" Width="32px" Visible="false" ></asp:RadioButtonList>
						                                <br />
						                                <asp:TextBox id="txtReason" runat="server" Width="440px" Height="120px" TextMode="MultiLine"></asp:TextBox>
						                                <br />
						                                <asp:Label id="lblErrRadio" runat="server" Font-Size="XX-Small" Width="240px" ForeColor="Red" Font-Names="Verdana"
						                                Visible="False">You have not selected the type of incident</asp:Label>
						                                <br />
						                                <asp:Label id="lblErrCon" runat="server" Font-Size="XX-Small" ForeColor="Red" Font-Names="Verdana" Visible="False"
						                                Font-Bold="True">Couldn't save the incident. Please try again.</asp:Label>
						                                <br />
						                                <asp:Label id="lblErrTxt" runat="server" Font-Size="XX-Small" ForeColor="Red" Font-Names="Verdana" Visible="False">You have not entered any description</asp:Label>
						                                <br />
						                                <br />
						                                <asp:Button id="btnCancel" runat="server" Text="Cancel"></asp:Button>
						                                <asp:Button id="btnSave" runat="server" Width="64px" Text="Save"></asp:Button>
                										
					                                </div>
                									
				                                </asp:Panel>
        				                        
                                            </ContentTemplate>
                                            
                                        </asp:UpdatePanel>
        								
				                        <br />
						                &nbsp;&nbsp;
						                <img src="img/delete.gif" alt="" />
						                &nbsp;&nbsp;&nbsp;&nbsp;
        								
						                <asp:LinkButton id="lnkDelete" runat="server" Font-Size="X-Small">Erase an incident</asp:LinkButton><br />
        								
								        <asp:UpdateProgress runat="server" id="UpdateProgress3" AssociatedUpdatePanelID="updPnlDetails">
                                        <ProgressTemplate>
                                            <br />
                                            Please wait while we load the data...<br />
                                            <br />
                                        </ProgressTemplate>
                                        </asp:UpdateProgress>
                						
			                            <asp:UpdatePanel ID="updPnlDetails" runat="server" ChildrenAsTriggers="true" UpdateMode="Always">
                                            
                                            <ContentTemplate>
                                            
				                                <asp:Panel id="pnlDetails" runat="server" Width="536px">
                        									
					                                <br />
                									
					                                <div>
                									
						                                <asp:Label id="lblDate2" runat="server" Font-Size="X-Small" Width="264px" ForeColor="Red" Font-Names="Verdana" Font-Bold="True"
						                                Font-Italic="True"></asp:Label>
						                                <br />
						                                <br />
						                                <asp:Label id="lblNothing" runat="server" Font-Size="X-Small" ForeColor="Red">There's no incidents to show in this day</asp:Label>
						                                <br />
						                                <asp:DataGrid id="DataGrid1" runat="server" Width="505px" Height="334px" BorderColor="#DEBA84" 
						                                BackColor="#DEBA84" BorderWidth="1px" BorderStyle="None" CellPadding="3" AutoGenerateColumns="False" 
						                                AllowPaging="True" CellSpacing="2">
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
										                                <asp:Panel id="Panel2" runat="server" Height="18px" Width="128px">
											                                <asp:Image id="ImageY" runat="server" ImageUrl="img/Yellowdot.gif"></asp:Image>
											                                <asp:Image id="ImageR" runat="server" ImageUrl="img/Red.gif"></asp:Image>
											                                <asp:Label id="Label1" runat="server" Font-Size="X-Small">Non OSHA</asp:Label>
										                                </asp:Panel>
									                                </ItemTemplate>
								                                </asp:TemplateColumn>
								                                <asp:BoundColumn DataField="incident" HeaderText="Incident">
									                                <HeaderStyle Font-Size="X-Small" HorizontalAlign="Center" Width="300px"></HeaderStyle>
									                                <ItemStyle Font-Size="XX-Small" HorizontalAlign="Center"></ItemStyle>
								                                </asp:BoundColumn>
								                                <asp:TemplateColumn>
									                                <HeaderStyle Width="50px"></HeaderStyle>
									                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
									                                <ItemTemplate>
										                                <asp:LinkButton id="lnkDelete" runat="server" Font-Size="XX-Small" ForeColor="Blue" CommandArgument="id"
											                                CommandName="Delete">Delete</asp:LinkButton>
									                                </ItemTemplate>
								                                </asp:TemplateColumn>
							                                </Columns>
							                                <PagerStyle HorizontalAlign="Center" ForeColor="#8C4510" Mode="NumericPages"></PagerStyle>
						                                </asp:DataGrid>
						                                <br />
						                                <br />
						                                <asp:Button id="btnCancel2" runat="server" Text="Close Detail View"></asp:Button>
        					                        
					                                </div>
                									
				                                </asp:Panel>
        				                
				                            </ContentTemplate>
        				
				                        </asp:UpdatePanel>
        							
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
