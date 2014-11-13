Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Public Class Horaire
    Inherits System.Web.UI.Page

    Dim bd As P2014_Equipe2_GestionHôtelièreEntities
    Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'If Not IsPostBack Then
        bd = New P2014_Equipe2_GestionHôtelièreEntities
        'End If

    End Sub

    Private Sub calendar1_SelectionChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles calendar1.SelectionChanged
        Dim hDeb As TimeSpan
        Dim hFin As TimeSpan
        Dim empl As Integer

        Dim emp = From em In bd.tblHoraire Where em.noEmpl = 1001 Select em
        empl = emp.Single.noEmpl
        Dim var = From ho In bd.tblHoraire Where ho.dateHoraire = calendar1.SelectedDate And ho.noEmpl = empl Select ho
        hDeb = var.Single.heureDebut
        hFin = var.Single.heureFin

        lbltest.Text = "Vous travaillez de " + hDeb.ToString + "à " + hFin.ToString + "aujourd'hui."
    End Sub
End Class