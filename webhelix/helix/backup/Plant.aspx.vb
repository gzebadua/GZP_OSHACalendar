Imports System.IO

Partial Public Class Plant
    Inherits System.Web.UI.Page

    Dim dsIncidents As DataSet

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

            If Session("planta") = "" Then
                Response.Redirect("index.aspx")
            End If

            lblPlant.Text = Session("planta")
            lblNothing.Visible = False
            lnkBackToMain.Visible = True
            PnlEdit.Visible = False

        End If

        Dim fecha As String = getMySQLDate()

        Dim fecha1 As String = fecha.Substring(0, 6) & "01"
        Dim fecha2 As String = fecha.Substring(0, 6) & howManyDaysInMonth(fecha1)

        dsIncidents = getSQLQueryAsDataset("SELECT * FROM (SELECT * FROM incidents WHERE idate BETWEEN " & fecha1 & " AND " & fecha2 & " AND splant ='" & Session("planta") & "' ORDER BY iincidenttypeid DESC) tmp1 GROUP BY idate")

    End Sub


    Private Sub Calendar1_VisibleMonthChanged(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.MonthChangedEventArgs) Handles Calendar1.VisibleMonthChanged

        Dim fecha As String = getMySQLDate()

        Dim fecha1 As String = fecha.Substring(0, 4)
        Dim fecha2 As String = fecha.Substring(0, 4)

        If e.NewDate.Month.ToString.Length = 1 Then
            fecha1 = fecha1 & "0" & e.NewDate.Month
            fecha2 = fecha2 & "0" & e.NewDate.Month
        Else
            fecha1 = fecha1 & e.NewDate.Month
            fecha2 = fecha2 & e.NewDate.Month
        End If

        fecha1 = fecha1 & "01"
        fecha2 = fecha2 & howManyDaysInMonth(fecha1)

        dsIncidents = getSQLQueryAsDataset("SELECT * FROM (SELECT * FROM incidents WHERE idate BETWEEN " & fecha1 & " AND " & fecha2 & " AND splant ='" & Session("planta") & "' ORDER BY iincidenttypeid DESC) tmp1 GROUP BY idate")

    End Sub


    Sub setDisplay()

        Dim iY As System.Web.UI.WebControls.Image
        Dim iR As System.Web.UI.WebControls.Image
        Dim lY As Label
        'Dim lR As Label

        With DataGrid1

            For i As Integer = 0 To .Items.Count - 1

                iY = .Items(i).FindControl("ImageY")
                iR = .Items(i).FindControl("ImageR")
                lY = .Items(i).FindControl("Label1")

                If .Items(i).Cells(1).Text = "1" Then

                    iY.Visible = False
                    iR.Visible = True
                    lY.Visible = True
                    lY.Text = "OSHA"

                Else

                    iY.Visible = True
                    iR.Visible = False
                    lY.Visible = False
                    lY.Text = "Non OSHA"

                End If

            Next

        End With

    End Sub


    Private Sub Calendar1_SelectionChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Calendar1.SelectionChanged

        PnlEdit.Visible = True
        pnlDetails.Visible = True

        If Calendar1.SelectedDate <= Calendar1.TodaysDate Then

            lblDate2.Text = Calendar1.SelectedDate.ToLongDateString
            lblDate.Text = Calendar1.SelectedDate.ToLongDateString

            Dim fecha As String = Calendar1.SelectedDate.Year

            If Calendar1.SelectedDate.Month.ToString.Length = 1 Then
                fecha = fecha & "0" & Calendar1.SelectedDate.Month
            Else
                fecha = fecha & Calendar1.SelectedDate.Month
            End If

            If Calendar1.SelectedDate.Day.ToString.Length = 1 Then
                fecha = fecha & "0" & Calendar1.SelectedDate.Day
            Else
                fecha = fecha & Calendar1.SelectedDate.Day
            End If

            DataGrid1.DataSource = getSQLQueryAsDataset("SELECT * FROM incidents WHERE idate = '" & fecha & "' AND splant = '" & Session("planta") & "'")
            DataGrid1.DataBind()

            setDisplay()

            If DataGrid1.Items.Count = 0 Then

                DataGrid1.Visible = False
                lblNothing.Visible = True

            End If

        Else

            'Huh??! Now you are a psychic or what?? 
            'How the %$#& do you know tommorrow someone will have an accident?
            'Hahahaha
            DataGrid1.Visible = False
            lblNothing.Visible = True

        End If

    End Sub


    Private Sub btnCancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnCancel.Click

        ry.Checked = False
        rr.Checked = False
        txtReason.Text = ""
        lblErrCon.Visible = False
        lblErrTxt.Visible = False
        lblErrRadio.Visible = False
        pnlData.Visible = False

    End Sub


    Public Shared Sub OpenPopUp(ByVal opener As System.Web.UI.WebControls.WebControl, ByVal PagePath As String, ByVal windowName As String, ByVal width As Integer, ByVal height As Integer)

        Dim clientScript As String
        Dim windowAttribs As String

        windowAttribs = "width=" & width & "px," & _
                  "height=" & height & "px," & _
                  "left='+((screen.width -" & width & ") / 2)+'," & _
                  "top='+ (screen.height - " & height & ") / 2+'"

        clientScript = "window.open('" & PagePath & "','" & windowName & "','" & windowAttribs & "');return false;"

        opener.Attributes.Add("onClick", clientScript)


    End Sub


    Private Sub btnSave_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSave.Click

        If ry.Checked = False And rr.Checked = False Then

            'Alert: You haven't selected a type!!!
            lblErrRadio.Visible = True
            Exit Sub

        End If

        txtReason.Text = txtReason.Text.Trim()
        txtReason.Text = txtReason.Text.Trim("<", ">", "'")

        If txtReason.Text = "" Then

            'Alert: There's no description!!
            lblErrTxt.Visible = True
            Exit Sub

        End If


        Dim valida1 As Boolean = True
        Dim osha As String

        If ry.Checked = True Then
            'If the Yellow one is selected
            osha = "0"

        Else
            'If the Red one is selected (we already validated if theres none selected)
            osha = "1"
        End If

        Dim fecha As String = Calendar1.SelectedDate.Year

        If Calendar1.SelectedDate.Month.ToString.Length = 1 Then
            fecha = fecha & "0" & Calendar1.SelectedDate.Month
        Else
            fecha = fecha & Calendar1.SelectedDate.Month
        End If

        If Calendar1.SelectedDate.Day.ToString.Length = 1 Then
            fecha = fecha & "0" & Calendar1.SelectedDate.Day
        Else
            fecha = fecha & Calendar1.SelectedDate.Day
        End If

        Dim newid As Integer = getSQLQueryAsInteger("SELECT IF(MAX(iincidentid)+1 IS NULL, 1, MAX(iincidentid)+1) FROM incidents")

        valida1 = executeSQLCommand("INSERT INTO incidents VALUES(" & newid & ", '" & Session("planta") & "', '" & fecha & "', '" & txtReason.Text & "', '" & osha & "')")

        If valida1 = False Then
            lblErrCon.Visible = True
            Exit Sub
        Else

            ry.Checked = False
            rr.Checked = False
            txtReason.Text = ""
            lblErrCon.Visible = False
            lblErrTxt.Visible = False
            lblErrRadio.Visible = False

            pnlData.Visible = False

            pnlDetails.Visible = True

            DataGrid1.Visible = True

            Dim fecha1 As String = fecha.Substring(0, 6) & "01"
            Dim fecha2 As String = fecha.Substring(0, 6) & howManyDaysInMonth(fecha1)

            dsIncidents = getSQLQueryAsDataset("SELECT * FROM (SELECT * FROM incidents WHERE idate BETWEEN " & fecha1 & " AND " & fecha2 & " AND splant ='" & Session("planta") & "' ORDER BY iincidenttypeid DESC) tmp1 GROUP BY idate")

            DataGrid1.DataSource = getSQLQueryAsDataset("SELECT * FROM incidents WHERE idate = '" & fecha & "' AND splant = '" & Session("planta") & "'")
            DataGrid1.DataBind()

            setDisplay()

            If DataGrid1.Items.Count = 0 Then

                DataGrid1.Visible = False
                lblNothing.Visible = True

            End If

            'Dim HtmlFile As String
            'Dim txtWriter As TextWriter = New StringWriter
            'Server.Execute("indexB.aspx", txtWriter)
            'HtmlFile = txtWriter.ToString()
            ''HtmlFile = HtmlFile.Replace("indexB.aspx", "Spec.aspx")
            ''Response.Write(txtWriter.ToString())
            'Dim writer4 As System.IO.StreamWriter = New System.IO.StreamWriter(System.IO.File.Open(".\index.htm", IO.FileMode.Create))
            'writer4.Write(HtmlFile)
            'writer4.Flush()
            'writer4.Close()

        End If

    End Sub


    Private Sub Calendar1_DayRender(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DayRenderEventArgs) Handles Calendar1.DayRender

        If e.Day.Date > Calendar1.TodaysDate Then
            e.Cell.BackColor = System.Drawing.Color.Gray
            Exit Sub
        End If

        If e.Day.IsOtherMonth = True Then
            Exit Sub
        End If

        Try

            If dsIncidents.Tables(0).Rows.Count = 0 Then
                e.Cell.BackColor = System.Drawing.Color.LimeGreen
                Exit Sub
            End If

            For i = 0 To dsIncidents.Tables(0).Rows.Count - 1

                Dim fecha As String = e.Day.Date.Year

                If e.Day.Date.Month.ToString.Length = 1 Then
                    fecha = fecha & "0" & e.Day.Date.Month
                Else
                    fecha = fecha & e.Day.Date.Month
                End If

                If e.Day.DayNumberText.ToString.Length = 1 Then
                    fecha = fecha & "0" & e.Day.DayNumberText
                Else
                    fecha = fecha & e.Day.DayNumberText
                End If

                If dsIncidents.Tables(0).Rows(i).Item(2) = fecha Then

                    If dsIncidents.Tables(0).Rows(i).Item(4) = "1" Then
                        e.Cell.BackColor = System.Drawing.Color.Red
                        Exit For
                    Else
                        e.Cell.BackColor = System.Drawing.Color.Yellow
                        Exit For
                    End If

                Else

                    e.Cell.BackColor = System.Drawing.Color.LimeGreen

                End If

            Next

        Catch ex As Exception

            Exit Sub

        End Try

    End Sub


    Private Sub lnkBackToMain_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles lnkBackToMain.Click
        Response.Redirect("index.aspx")
    End Sub


    Private Sub DataGrid1_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataGridCommandEventArgs) Handles DataGrid1.ItemCommand

        If e.CommandName = "Delete" Then

            executeSQLCommand("DELETE FROM incidents WHERE iincidentid = " & e.Item.Cells(0).Text)

            Dim fecha As String = Calendar1.SelectedDate.Year

            If Calendar1.SelectedDate.Month.ToString.Length = 1 Then
                fecha = fecha & "0" & Calendar1.SelectedDate.Month
            Else
                fecha = fecha & Calendar1.SelectedDate.Month
            End If

            If Calendar1.SelectedDate.Day.ToString.Length = 1 Then
                fecha = fecha & "0" & Calendar1.SelectedDate.Day
            Else
                fecha = fecha & Calendar1.SelectedDate.Day
            End If

            Dim fecha1 As String = fecha.Substring(0, 6) & "01"
            Dim fecha2 As String = fecha.Substring(0, 6) & howManyDaysInMonth(fecha1)

            dsIncidents = getSQLQueryAsDataset("SELECT * FROM (SELECT * FROM incidents WHERE idate BETWEEN " & fecha1 & " AND " & fecha2 & " AND splant ='" & Session("planta") & "' ORDER BY iincidenttypeid DESC) tmp1 GROUP BY idate")

            DataGrid1.DataSource = getSQLQueryAsDataset("SELECT * FROM incidents WHERE idate='" & fecha & "' AND splant = '" & Session("planta") & "'")
            DataGrid1.DataBind()

            setDisplay()

            If DataGrid1.Items.Count = 0 Then
                DataGrid1.Visible = False
                lblNothing.Visible = True
            End If

            'Dim HtmlFile As String
            'Dim txtWriter As TextWriter = New StringWriter
            'Server.Execute("indexB.aspx", txtWriter)
            'HtmlFile = txtWriter.ToString()
            ''HtmlFile = HtmlFile.Replace("indexB.aspx", "Spec.aspx")
            ''Response.Write(txtWriter.ToString())
            'Dim writer4 As System.IO.StreamWriter = New System.IO.StreamWriter(System.IO.File.Open(".\index.htm", IO.FileMode.Create))
            'writer4.Write(HtmlFile)
            'writer4.Flush()
            'writer4.Close()

        End If

    End Sub


    Private Sub lnkAdd_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles lnkAdd.Click

        PnlEdit.Visible = True
        pnlData.Visible = True

        Dim fecha As String = Calendar1.SelectedDate.Year

        If Calendar1.SelectedDate.Month.ToString.Length = 1 Then
            fecha = fecha & "0" & Calendar1.SelectedDate.Month
        Else
            fecha = fecha & Calendar1.SelectedDate.Month
        End If

        If Calendar1.SelectedDate.Day.ToString.Length = 1 Then
            fecha = fecha & "0" & Calendar1.SelectedDate.Day
        Else
            fecha = fecha & Calendar1.SelectedDate.Day
        End If

        DataGrid1.DataSource = getSQLQueryAsDataset("SELECT * FROM incidents WHERE idate='" & fecha & "' AND splant = '" & Session("planta") & "'")
        DataGrid1.DataBind()

        setDisplay()

        If DataGrid1.Items.Count = 0 Then
            DataGrid1.Visible = False
            lblNothing.Visible = True
        End If

    End Sub


    Private Sub lnkDelete_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles lnkDelete.Click

        PnlEdit.Visible = True
        pnlDetails.Visible = True

        Dim fecha As String = Calendar1.SelectedDate.Year

        If Calendar1.SelectedDate.Month.ToString.Length = 1 Then
            fecha = fecha & "0" & Calendar1.SelectedDate.Month
        Else
            fecha = fecha & Calendar1.SelectedDate.Month
        End If

        If Calendar1.SelectedDate.Day.ToString.Length = 1 Then
            fecha = fecha & "0" & Calendar1.SelectedDate.Day
        Else
            fecha = fecha & Calendar1.SelectedDate.Day
        End If

        Dim fecha1 As String = fecha.Substring(0, 6) & "01"
        Dim fecha2 As String = fecha.Substring(0, 6) & howManyDaysInMonth(fecha1)

        dsIncidents = getSQLQueryAsDataset("SELECT * FROM (SELECT * FROM incidents WHERE idate BETWEEN " & fecha1 & " AND " & fecha2 & " AND splant ='" & Session("planta") & "' ORDER BY iincidenttypeid DESC) tmp1 GROUP BY idate")

        DataGrid1.DataSource = getSQLQueryAsDataset("SELECT * FROM incidents WHERE idate = '" & fecha & "' AND splant = '" & Session("planta") & "'")
        DataGrid1.DataBind()

        setDisplay()

        If DataGrid1.Items.Count = 0 Then
            DataGrid1.Visible = False
            lblNothing.Visible = True
        End If

    End Sub


    Private Sub btnCancel2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnCancel2.Click

        'PnlEdit.Visible = False
        pnlDetails.Visible = False

    End Sub


End Class