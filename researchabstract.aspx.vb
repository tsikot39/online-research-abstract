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

Public Class researchabstract
    Inherits System.Web.UI.Page

    Dim juankonek As String = ConfigurationManager.ConnectionStrings("researchabstract").ConnectionString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim currentNumberOfUsers As Integer = Global_asax.CurrentNumberOfUsers
        Dim totalNumberOfUsers As Integer = Global_asax.TotalNumberOfUsers
        'lblCurrentNumberOfUsers.Text = currentNumberOfUsers.ToString()
        lblTotalNumberOfUsers.Text = totalNumberOfUsers.ToString()

        Response.Cache.SetCacheability(HttpCacheability.NoCache)

        Dim strPrevPage As String = ""

        'If Request.UrlReferrer = Nothing Then
        '    Response.Redirect("login.aspx")
        'End If

        'If strPrevPage = "" Then
        '    strPrevPage = Request.UrlReferrer.Segments(Request.UrlReferrer.Segments.Length - 1)
        'End If

        'If Not IsPostBack Then
        '    BindData()
        'End If

        'If Not Me.Page.User.Identity.IsAuthenticated Then
        '    FormsAuthentication.RedirectToLoginPage()
        'End If

        'Dim sqlcon As New SqlConnection(juankonek)
        'sqlcon.Open()
        'Dim sqlcom As New SqlCommand("select Username from Users where Username = '" & System.Web.HttpContext.Current.User.Identity.Name & "'", sqlcon)
        'Dim dr As SqlDataReader = sqlcom.ExecuteReader

        'If dr.Read Then
        '    lbllogin.Text = dr.Item("Username").ToString
        '    dr.Close()
        'End If
        'sqlcon.Close()
    End Sub

    Private Sub BindData()
        gvsearch.DataSource = Nothing
        gvsearch.DataBind()
        Dim consearch As New SqlConnection(juankonek)
        consearch.Open()
        Dim comsearch As New SqlCommand("select * from tbl_abstract ORDER BY docno desc", consearch)
        Dim dt As DataTable = GetData(comsearch)
        gvsearch.DataSource = dt
        gvsearch.DataBind()
        consearch.Close()
        consearch.Dispose()
    End Sub

    Protected Sub OnPageIndexChanging(sender As Object, e As GridViewPageEventArgs)
        gvsearch.PageIndex = e.NewPageIndex
        'BindData()
        Dim sqlsource As New SqlDataSource
        sqlsource.ID = "sqlsource"
        Me.Page.Controls.Add(sqlsource)
        sqlsource.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("researchabstract").ConnectionString
        sqlsource.SelectCommand = "select * from tbl_abstract where title like '%" + txtsearch.Text + "%' OR author like '%" + txtsearch.Text + "%' or abstract like '%" + txtsearch.Text + "%' or keywords like '%" + txtsearch.Text + "%' ORDER BY docno desc"
        gvsearch.DataSource = sqlsource
        gvsearch.DataBind()
    End Sub

    Private Function GetData(ByVal cmd As SqlCommand) As DataTable
        Dim dt As DataTable = New DataTable
        Dim con As SqlConnection = New SqlConnection(juankonek)
        Dim sda As SqlDataAdapter = New SqlDataAdapter
        cmd.Connection = con
        con.Open()
        sda.SelectCommand = cmd
        sda.Fill(dt)
        Return dt
    End Function

    Private Sub btnsearch_Click(sender As Object, e As EventArgs) Handles btnsearch.Click
        If txtsearch.Text.Length = 0 Then
            BindData()
            gvsearch.DataSource = Nothing
        Else
            Dim sqlsource As New SqlDataSource
            sqlsource.ID = "sqlsource"
            Me.Page.Controls.Add(sqlsource)
            sqlsource.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("researchabstract").ConnectionString
            sqlsource.SelectCommand = "select * from tbl_abstract where title like '%" + txtsearch.Text + "%' OR author like '%" + txtsearch.Text + "%' or abstract like '%" + txtsearch.Text + "%' or keywords like '%" + txtsearch.Text + "%' ORDER BY docno desc"
            gvsearch.DataSource = sqlsource
            gvsearch.DataBind()
        End If
    End Sub

End Class