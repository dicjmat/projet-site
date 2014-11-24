Imports System
Imports System.Linq
Imports System.Web
Imports Microsoft.AspNet.Identity
Imports Microsoft.AspNet.Identity.EntityFramework
Imports Microsoft.AspNet.Identity.Owin
Imports Owin

Partial Public Class ResetPassword
    Inherits System.Web.UI.Page

    Protected Property StatusMessage() As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    End Sub

    Protected Sub Reset_Click(sender As Object, e As EventArgs)
        'Dim code As String = IdentityHelper.GetCodeFromRequest(Request)
        'If code IsNot Nothing Then
        Dim manager = Context.GetOwinContext().GetUserManager(Of ApplicationUserManager)()
        Dim user = manager.FindByIdAsync(Context.User.Identity.GetUserId).Result
        If user Is Nothing Then
            ErrorMessage.Text = "Aucun utilisateur trouvé"
            Return
        End If

        Dim result = manager.ChangePasswordAsync(user.Id, user.PasswordHash, Password.Text).Result
        If Not result.Succeeded Then
            user.premiereConnexion = False
            manager.UpdateAsync(user)
            IdentityHelper.SignIn(manager, user, False)
            Response.Redirect("~")
            Return
        End If
        ErrorMessage.Text = result.Errors.FirstOrDefault()
        Return
        'End If

        ErrorMessage.Text = "Une erreur s'est produite"
    End Sub
End Class