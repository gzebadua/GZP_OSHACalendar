Public Partial Class SeeCalendar
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

        End If

        Dim fecha As String = getMySQLDate()

        Dim fecha1 As String = fecha.Substring(0, 6) & "01"
        Dim fecha2 As String = fecha.Substring(0, 6) & howManyDaysInMonth(fecha1)

        dsIncidents = getSQLQueryAsDataset("SELECT * FROM (SELECT * FROM incidents WHERE idate BETWEEN " & fecha1 & " AND " & fecha2 & " AND splant ='" & Session("planta") & "' ORDER BY iincidenttypeid DESC) tmp1 GROUP BY idate")


    End Sub


    Sub setDisplay()

        Dim iY As System.Web.ui.WebControls.Image
        Dim iR As System.Web.ui.WebControls.Image
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
                    lY.Visible = True
                    lY.Text = "Non OSHA"

                End If

            Next

        End With

    End Sub


    Private Sub Calendar1_SelectionChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Calendar1.SelectionChanged

        pnlDetails.Visible = True

        If Calendar1.SelectedDate <= Calendar1.TodaysDate Then

            DataGrid1.Visible = True

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
        pnlDetails.Visible = False
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


End Class