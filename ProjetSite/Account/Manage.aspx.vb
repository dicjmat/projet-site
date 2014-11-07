﻿Imports System.Collections.Generic

Imports Microsoft.AspNet.Membership.OpenAuth

Public Class Manage
    Inherits System.Web.UI.Page

    Private successMessageTextValue As String
    Protected Property SuccessMessageText As String
        Get
            Return successMessageTextValue
        End Get
        Private Set(value As String)
            successMessageTextValue = value
        End Set
    End Property

    Private canRemoveExternalLoginsValue As Boolean
    Protected Property CanRemoveExternalLogins As Boolean
        Get
            Return canRemoveExternalLoginsValue
        End Get
        Set(value As Boolean)
            canRemoveExternalLoginsValue = value
        End Set
    End Property

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ' Déterminer les sections à afficher
            Dim hasLocalPassword = OpenAuth.HasLocalPassword(User.Identity.Name)
            setPassword.Visible = Not hasLocalPassword
            changePassword.Visible = hasLocalPassword

            CanRemoveExternalLogins = hasLocalPassword

            ' Afficher le message de réussite
            Dim message = Request.QueryString("m")
            If Not message Is Nothing Then
                ' Enlever la chaîne de requête de l'action
                Form.Action = ResolveUrl("~/Account/Manage")

                Select Case message
                    Case "ChangePwdSuccess"
                        SuccessMessageText = "Votre mot de passe a été modifié."
                    Case "SetPwdSuccess"
                        SuccessMessageText = "Votre mot de passe a été défini."
                    Case "RemoveLoginSuccess"
                        SuccessMessageText = "La connexion externe a été supprimée."
                    Case Else
                        SuccessMessageText = String.Empty
                End Select

                successMessage.Visible = Not String.IsNullOrEmpty(SuccessMessageText)
            End If
        End If

        
    End Sub

    Protected Sub setPassword_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        If IsValid Then
            Dim result As SetPasswordResult = OpenAuth.AddLocalPassword(User.Identity.Name, password.Text)
            If result.IsSuccessful Then
                Response.Redirect("~/Account/Manage?m=SetPwdSuccess")
            Else
                
                ModelState.AddModelError("NewPassword", result.ErrorMessage)
                
            End If
        End If
    End Sub

    
    Public Function GetExternalLogins() As IEnumerable(Of OpenAuthAccountData)
        Dim accounts = OpenAuth.GetAccountsForUser(User.Identity.Name)
        CanRemoveExternalLogins = CanRemoveExternalLogins OrElse accounts.Count() > 1
        Return accounts
    End Function

    Public Sub RemoveExternalLogin(ByVal providerName As String, ByVal providerUserId As String)
        Dim m = If(OpenAuth.DeleteAccount(User.Identity.Name, providerName, providerUserId), "?m=RemoveLoginSuccess", String.Empty)
        Response.Redirect("~/Account/Manage" & m)
    End Sub
    

    Protected Shared Function ConvertToDisplayDateTime(ByVal utcDateTime As Nullable(Of DateTime)) As String
        ' Vous pouvez modifier cette méthode afin de convertir la date/heure UTC par la référence et la mise en forme
        ' d'affichage souhaitées. Ici, nous la convertissons au fuseau horaire et à la mise en forme du serveur
        ' sous la forme d'une chaîne date courte et heure complète, à l'aide de la culture du thread actuelle.
        Return If(utcDateTime.HasValue, utcDateTime.Value.ToLocalTime().ToString("G"), "[never]")
    End Function
End Class