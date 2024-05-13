Imports System.Web
Imports System.Web.SessionState
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Web.Configuration
Imports System.Data
Imports System.Drawing
Imports System.Web.Security
Imports System.IO

Public Class Global_asax
    Inherits System.Web.HttpApplication

    Private Shared _totalNumberOfUsers As Integer = 0
    Private Shared _currentNumberOfUsers As Integer = 0

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Get the Total Number of Users from the database.
        ' Build connectionstring. Modify path to db, if necessary
        Dim connectionString As String = "Data Source=10.0.0.10;Initial Catalog=Research Abstract;User ID=sa;Password=q1w2e3X"

        ' Build SELECT statement
        Dim sql As String = "SELECT NumberOfHits FROM tbl_pagecounter WHERE CounterType = 'UserCounter'"

        Dim conn As SqlConnection = New SqlConnection(connectionString)
        Dim cmd As SqlCommand = New SqlCommand(sql, conn)

        ' Open the connection, and execute the SQL statement.
        cmd.Connection.Open()
        Dim reader As SqlDataReader = cmd.ExecuteReader()
        If reader.Read() Then
            _totalNumberOfUsers = reader.GetInt32(0)
        Else
            _totalNumberOfUsers = 0
        End If

        ' Close the reader and the connection
        reader.Close()
        cmd.Connection.Close()
    End Sub

    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Increase the two counters.
        _totalNumberOfUsers += 1
        _currentNumberOfUsers += 1

        ' Save the Total Number of Users to the database.
        ' Build connectionstring. Modify path to db, if necessary
        Dim connectionString As String = "Data Source=10.0.0.10;Initial Catalog=Research Abstract;User ID=sa;Password=q1w2e3X"

        ' Build UPDATE statement
        Dim sql As String = "UPDATE tbl_pagecounter SET NumberOfHits = '" & _totalNumberOfUsers & "' WHERE CounterType = 'UserCounter'"

        Dim conn As SqlConnection = New SqlConnection(connectionString)
        Dim cmd As SqlCommand = New SqlCommand(sql, conn)

        ' Open the connection, and execute the SQL statement.
        cmd.Connection.Open()
        cmd.ExecuteNonQuery()
        cmd.Connection.Close()
    End Sub

    Sub Application_BeginRequest(ByVal sender As Object, ByVal e As EventArgs)
    End Sub

    Sub Application_AuthenticateRequest(ByVal sender As Object, ByVal e As EventArgs)
    End Sub

    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        _currentNumberOfUsers -= 1
    End Sub

    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
    End Sub
    Public Shared ReadOnly Property TotalNumberOfUsers() As Integer
        Get
            Return _totalNumberOfUsers
        End Get
    End Property
    Public Shared ReadOnly Property CurrentNumberOfUsers() As Integer
        Get
            Return _currentNumberOfUsers
        End Get
    End Property

End Class