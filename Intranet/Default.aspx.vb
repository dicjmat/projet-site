Imports System
Imports System.Collections.Generic
Imports Microsoft.AspNet.Identity
Imports Microsoft.AspNet.Identity.EntityFramework
Imports Microsoft.AspNet.Identity.Owin
Imports Owin
Public Class _Default
    Inherits Page
    Protected nom As String
    Protected prenom As String
    Dim usr As ApplicationUser
    Dim bd As P2014_Equipe2_GestionHôtelièreEntities
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Context.User.Identity.GetUserId IsNot Nothing <> 0 Then
            Dim usr As ApplicationUser = Context.GetOwinContext().GetUserManager(Of ApplicationUserManager)().FindByIdAsync(Context.User.Identity.GetUserId).Result
            nom = usr.nom
            prenom = usr.prenom
        End If

        bd = New P2014_Equipe2_GestionHôtelièreEntities
        Dim comuni As String

        usr = Context.GetOwinContext().GetUserManager(Of ApplicationUserManager)().FindByIdAsync(Context.User.Identity.GetUserId).Result

        lblIntro.Text = "Bonjour " + usr.prenom + " " + usr.nom + ", bienvenue sur votre Intranet."

        Dim noHotell As Integer = (From ho In bd.tblEmploye Where ho.noEmpl = usr.Id Select ho.noHotel).Single

        Dim com = From comu In bd.tblCommunique Where comu.noHotel = noHotell Select comu.titreCommunique, comu.contCommunique


        If com.ToList.Count <> 0 Then
            For Each el In com.ToList
                comuni = el.titreCommunique + " " + el.contCommunique
                communique.Controls.Add(New LiteralControl(comuni + "<br/>"))
            Next
        Else
            communique.Controls.Add(New LiteralControl("Vous n'avez aucun communiqué"))
        End If

    End Sub
End Class