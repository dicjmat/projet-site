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
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Context.User.Identity.GetUserId IsNot Nothing <> 0 Then
            Dim usr As ApplicationUser = Context.GetOwinContext().GetUserManager(Of ApplicationUserManager)().FindByIdAsync(Context.User.Identity.GetUserId).Result
            nom = usr.nom
            prenom = usr.prenom
        End If


    End Sub
End Class