Imports System.Data
Imports System.Data.OleDb
Imports MySql.Data.MySqlClient


Public Module Utilities

    Dim servidor As String = "webhelix.db.7462515.hostedresource.com"
    Dim usuario As String = "webhelix"
    Dim password As String = "MemoZebadua4"
    Dim database As String = "webhelix"


    Public Function StringConnection() As String

        Return "Server=" & servidor & ";Database=" & database & ";Port=3306;" & _
        "Uid=" & usuario & ";Pwd=" & password & ";Connect Timeout=90;"

    End Function



    Public Function getSQLQueryAsDataset(ByVal query As String) As DataSet

        Dim objCon As MySqlConnection

        objCon = New MySqlConnection(StringConnection())

        Dim objDA As New MySqlDataAdapter(query, objCon)
        Dim dsDatos As New DataSet

        Try

            objDA.Fill(dsDatos)

        Catch ex As Exception
            'Nothing
        Finally

            objCon.Close()
            objCon.Dispose()
            objDA.Dispose()

        End Try

        Return dsDatos

    End Function


    Public Function getSQLQueryAsInteger(ByVal query As String) As Integer

        Dim objCon As MySqlConnection

        objCon = New MySqlConnection(StringConnection())

        Dim objCmd As New MySqlCommand(query, objCon)
        Dim objRdr As MySqlDataReader

        Try

            objCon.Open()
            objRdr = objCmd.ExecuteReader
            objRdr.Read()
            If objRdr.HasRows Then
                Return CInt(objRdr(0))
            Else
                Return 0
            End If

        Catch ex As Exception

            Return 0

        Finally

            objCon.Close()
            objCon.Dispose()
            objCmd.Dispose()

        End Try

    End Function


    Public Function getSQLQueryAsString(ByVal query As String) As String

        Dim objCon As MySqlConnection

        objCon = New MySqlConnection(StringConnection())

        Dim objCmd As New MySqlCommand(query, objCon)
        Dim objRdr As MySqlDataReader

        Try

            objCon.Open()
            objRdr = objCmd.ExecuteReader
            objRdr.Read()
            If objRdr.HasRows Then
                Return objRdr(0)
            Else
                Return ""
            End If

        Catch ex As Exception

            Return ""

        Finally

            objCon.Close()
            objCon.Dispose()
            objCmd.Dispose()

        End Try

    End Function


    Public Function getSQLQueryAsBoolean(ByVal query As String) As Boolean

        Dim objCon As MySqlConnection

        objCon = New MySqlConnection(StringConnection())

        Dim objCmd As New MySqlCommand(query, objCon)
        Dim objRdr As MySqlDataReader

        Try

            objCon.Open()
            objRdr = objCmd.ExecuteReader
            objRdr.Read()
            If objRdr.HasRows Then
                Return CBool(objRdr(0))
            Else
                Return False
            End If

        Catch ex As Exception

            Return False

        Finally

            objCon.Close()
            objCon.Dispose()
            objCmd.Dispose()

        End Try

    End Function


    Public Function executeSQLCommand(ByVal query As String) As Boolean

        Try

            Dim objCon As MySqlConnection

            objCon = New MySqlConnection(StringConnection())

            Dim objCmd As New MySqlCommand(query, objCon)

            objCon.Open()
            objCmd.CommandText = query
            objCmd.Connection = objCon
            objCmd.ExecuteNonQuery()

            objCon.Close()
            objCon.Dispose()
            objCmd.Dispose()

            Return True

        Catch ex As Exception

            Return False

        End Try

    End Function



    Public Function getAppTime() As String

        'Get time HH:mm:SS style from the application

        Dim tempStr1 As String
        Dim tempStr2 As String

        tempStr1 = ""

        With Date.Now

            tempStr2 = .Hour
            If Len(tempStr2) = 1 Then tempStr2 = "0" & tempStr2
            tempStr1 = tempStr1 & tempStr2 & ":"
            tempStr2 = .Minute
            If Len(tempStr2) = 1 Then tempStr2 = "0" & tempStr2
            tempStr1 = tempStr1 & tempStr2 & ":"
            tempStr2 = .Second
            If Len(tempStr2) = 1 Then tempStr2 = "0" & tempStr2
            tempStr1 &= tempStr2

        End With

        Return tempStr1.Trim

    End Function


    Public Function getAppDate() As String

        'Get date YYYYMMDD style from the application

        Dim tempStr1 As String
        Dim tempStr2 As String

        Dim output As String

        tempStr1 = ""

        With Date.Now

            tempStr1 &= .Year
            tempStr2 = .Month
            If Len(tempStr2) = 1 Then tempStr2 = "0" & tempStr2
            tempStr1 &= tempStr2
            tempStr2 = .Day
            If Len(tempStr2) = 1 Then tempStr2 = "0" & tempStr2
            tempStr1 = tempStr1 & tempStr2 & " "
            tempStr2 = .Hour
            If Len(tempStr2) = 1 Then tempStr2 = "0" & tempStr2
            tempStr1 = tempStr1 & tempStr2 & ":"
            tempStr2 = .Minute
            If Len(tempStr2) = 1 Then tempStr2 = "0" & tempStr2
            tempStr1 = tempStr1 & tempStr2 & ":"
            tempStr2 = .Second
            If Len(tempStr2) = 1 Then tempStr2 = "0" & tempStr2
            tempStr1 &= tempStr2

        End With

        output = Left(tempStr1, 4) & "-" & Right(Left(tempStr1, 6), 2) & "-" & Right(Left(tempStr1, 8), 2) & " "

        Return output.Trim.Replace("-", "").Replace("/", "").Replace("\", "")

    End Function


    Public Function getMySQLDate() As String

        Try
            Dim tmp1 As String = getSQLQueryAsString("SELECT DATE_FORMAT(now(),'%Y%m%d')")

            If tmp1 = "" Then
                Return getAppDate()
            Else
                Return tmp1
            End If

        Catch ex As Exception
            Return getAppDate()
        End Try

    End Function


    Public Function getMySQLTime() As String

        Try
            Dim tmp1 As String = getSQLQueryAsString("SELECT DATE_FORMAT(now(),'%H:%i:%s')")

            If tmp1 = "" Then
                Return getAppTime()
            Else
                Return tmp1
            End If

        Catch ex As Exception
            Return getAppTime()
        End Try


    End Function


    Public Function convertDDdashMMdashYYYYtoYYYYMMDD(ByVal giventext As String) As String

        Dim output As String = ""
        Dim tempYear As String = ""
        Dim tempMonth As String = ""
        Dim tempDay As String = ""

        With giventext

            tempYear &= Right(giventext, 4)
            giventext = giventext.Replace(tempYear, "")
            tempMonth = Right(giventext, 3)
            tempMonth = tempMonth.Replace("-", "").Replace("/", "")
            giventext = giventext.Replace(Right(giventext, 3), "")
            tempDay = giventext.Replace("-", "").Replace("/", "")

            If Len(tempMonth) = 1 Then tempMonth = "0" & tempMonth

            If Len(tempDay) = 1 Then tempDay = "0" & tempDay

        End With

        output = tempYear & tempMonth & tempDay

        Return output

    End Function


    Public Function convertYYYYMMDDtoDDhyphenMMhyphenYYYY(ByVal giventext As String) As String

        Dim output As String = ""
        Dim tempYear As String = ""
        Dim tempMonth As String = ""
        Dim tempDay As String = ""

        With giventext

            tempYear &= Left(giventext, 4)
            giventext = giventext.Replace(tempYear, "")
            tempMonth = Left(giventext, 2)
            giventext = giventext.Replace(tempMonth, "")
            tempDay = giventext

            If Len(tempMonth) = 1 Then tempMonth = "0" & tempMonth

            If Len(tempDay) = 1 Then tempDay = "0" & tempDay

        End With

        output = tempDay & "-" & tempMonth & "-" & tempYear

        Return output

    End Function


    Public Function howManyDaysBetween(ByVal date1 As Date, ByVal date2 As Date) As Integer

        Dim days As Long

        days = DateDiff(DateInterval.Day, date1, date2)

        Return days

    End Function


    Public Function howManyDaysInMonth(ByVal date1 As Integer) As Integer

        Dim tmp1 As String
        tmp1 = date1

        Return System.DateTime.DaysInMonth(tmp1.Substring(0, 4), tmp1.Substring(4, 2))

    End Function


    Sub cleanSession(ByVal page As System.Web.UI.Page)
        page.Session.Clear()
    End Sub


End Module
