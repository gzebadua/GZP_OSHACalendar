Public Partial Class index
    Inherits System.Web.UI.Page

    Dim dsIncidents As DataSet

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim fecha As String = getMySQLDate()

        Dim fecha1 As String = fecha.Substring(0, 6) & "01"
        Dim fecha2 As String = fecha.Substring(0, 6) & howManyDaysInMonth(fecha1)

        dsIncidents = getSQLQueryAsDataset("SELECT * FROM (SELECT * FROM incidents WHERE idate BETWEEN " & fecha1 & " AND " & fecha2 & " ORDER BY iincidenttypeid DESC) tmp1 GROUP BY idate")
        
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
        
        dsIncidents = getSQLQueryAsDataset("SELECT * FROM (SELECT * FROM incidents WHERE idate BETWEEN " & fecha1 & " AND " & fecha2 & " ORDER BY iincidenttypeid DESC) tmp1 GROUP BY idate")

    End Sub

    Private Sub lnkSee_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles lnkSee.Click
        pnlSee.Visible = True
        pnlAdd.Visible = False
    End Sub

    Private Sub lnkAdd_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles lnkAdd.Click
        pnlSee.Visible = False
        pnlAdd.Visible = True
    End Sub

    Private Sub SeeUSA1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SeeUSA1.Click
        Session("planta") = "Edinburg"
        Response.Redirect("SeeCalendar.aspx")
    End Sub

    Private Sub SeeUSA2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SeeUSA2.Click
        Session("planta") = "Imperial Valley"
        Response.Redirect("SeeCalendar.aspx")
    End Sub

    Private Sub SeeMX_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SeeMX.Click
        Session("planta") = "Sinaloa"
        Response.Redirect("SeeCalendar.aspx")
    End Sub

    Private Sub addUSA1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles addUSA1.Click
        Session("planta") = "Edinburg"
        Response.Redirect("Plant.aspx")
    End Sub

    Private Sub addUSA2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles addUSA2.Click
        Session("planta") = "Imperial Valley"
        Response.Redirect("Plant.aspx")
    End Sub

    Private Sub addMX_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles addMX.Click
        Session("planta") = "Sinaloa"
        Response.Redirect("Plant.aspx")
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


    Private Sub Calendar1_SelectionChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Calendar1.SelectionChanged

        pnlSee.Visible = True
        pnlAdd.Visible = False

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

        Dim dsCounts As DataSet
        dsCounts = getSQLQueryAsDataset("SELECT splant, COUNT(*) AS conteo FROM incidents WHERE idate ='" & fecha & "' GROUP BY splant")

        For i = 0 To dsCounts.Tables(0).Rows.Count - 1

            If dsCounts.Tables(0).Rows(i).Item(0) = "Edinburg" Then
                Qty1.Text = "(" & dsCounts.Tables(0).Rows(i).Item(1) & ")"
            ElseIf dsCounts.Tables(0).Rows(i).Item(0) = "Imperial Valley" Then
                Qty2.Text = "(" & dsCounts.Tables(0).Rows(i).Item(1) & ")"
            ElseIf dsCounts.Tables(0).Rows(i).Item(0) = "Sinaloa" Then
                Qty3.Text = "(" & dsCounts.Tables(0).Rows(i).Item(1) & ")"
            End If

        Next

        If dsCounts.Tables(0).Rows.Count = 0 Then
            Qty1.Text = "(0)"
            Qty2.Text = "(0)"
            Qty3.Text = "(0)"
        End If

        dsCounts.Dispose()

    End Sub

    
End Class