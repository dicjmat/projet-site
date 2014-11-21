Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports Microsoft.AspNet.Identity
Imports Microsoft.AspNet.Identity.EntityFramework
Imports Microsoft.AspNet.Identity.Owin
Imports Owin
Public Class Horaire
    Inherits System.Web.UI.Page
    Dim usr As ApplicationUser
    Dim bd As P2014_Equipe2_GestionHôtelièreEntities
    Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'If Not IsPostBack Then
        bd = New P2014_Equipe2_GestionHôtelièreEntities
        'End If
        usr = Context.GetOwinContext().GetUserManager(Of ApplicationUserManager)().FindByIdAsync(Context.User.Identity.GetUserId).Result

    End Sub

    Private Sub calendar1_SelectionChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles calendar1.SelectionChanged
        Dim hDeb As TimeSpan
        Dim hFin As TimeSpan
        Dim empl As Integer

        Dim emp = From em In bd.tblHoraire Where em.noEmpl = usr.Id Select em.dateHoraire, em.heureDebut, em.heureFin, em.noEmpl
        empl = emp.First.noEmpl
        Dim var = From ho In bd.tblHoraire Where ho.dateHoraire = calendar1.SelectedDate And ho.noEmpl = empl Select ho.heureDebut, ho.heureFin

        If var.Count <> 0 Then
            hDeb = var.First.heureDebut
            hFin = var.First.heureFin
            lblHoraire.Text = "Vous travaillez de " + hDeb.ToString + " à " + hFin.ToString + "."
        Else
            lblHoraire.Text = "Vous ne travaillez pas."
        End If

    End Sub

    Private Sub calendar1_DayRender(ByVal sender As Object, ByVal e As DayRenderEventArgs) Handles calendar1.DayRender
        Dim res = From el In bd.tblHoraire Where el.noEmpl = usr.Id Select el.dateHoraire

        calendar1.TodayDayStyle.BackColor = Drawing.Color.CadetBlue

        If res.ToList IsNot Nothing Then
            For Each el In res
                If e.Day.Date = el Then
                    e.Cell.BackColor = System.Drawing.Color.LightBlue
                End If
            Next
        End If
    End Sub
End Class