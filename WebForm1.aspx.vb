Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Web.Configuration
Imports System.Data
Imports System.Drawing
Imports System.Web.Security
Imports System.IO
Imports Microsoft.Reporting.WebForms


Public Class WebForm1

    Inherits System.Web.UI.Page

    Dim juankonek As String = ConfigurationManager.ConnectionStrings("cims").ConnectionString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ReportViewer1.ProcessingMode = ProcessingMode.Local
            ReportViewer1.LocalReport.ReportPath = Server.MapPath("~/Report1.rdlc")
            Dim dsCustomers As DataSet1 = GetData1("select * from tbl_cims")
            Dim datasource As New ReportDataSource("DataSet1", dsCustomers.Tables(0))
            ReportViewer1.LocalReport.DataSources.Clear()
            ReportViewer1.LocalReport.DataSources.Add(datasource)
        End If
    End Sub

    Private Function GetData1(query As String) As DataSet1
        Dim conString As String = ConfigurationManager.ConnectionStrings("cims").ConnectionString
        Dim cmd As New SqlCommand(query)
        Using con As New SqlConnection(conString)
            Using sda As New SqlDataAdapter()
                cmd.Connection = con

                sda.SelectCommand = cmd
                Using dsCustomers As New DataSet1()
                    sda.Fill(dsCustomers, "DataTable1")
                    Return dsCustomers
                End Using
            End Using
        End Using
    End Function

End Class