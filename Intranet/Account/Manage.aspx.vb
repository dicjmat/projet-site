﻿Imports System
Imports System.Collections.Generic
Imports Microsoft.AspNet.Identity
Imports Microsoft.AspNet.Identity.EntityFramework
Imports Microsoft.AspNet.Identity.Owin
Imports Owin

Partial Public Class Manage
    Inherits System.Web.UI.Page
    Protected Property SuccessMessage() As String
        Get
            Return m_SuccessMessage
        End Get
        Private Set(value As String)
            m_SuccessMessage = value
        End Set
    End Property
    Private m_SuccessMessage As String

    Protected Property CanRemoveExternalLogins() As Boolean
        Get
            Return m_CanRemoveExternalLogins
        End Get
        Private Set(value As Boolean)
            m_CanRemoveExternalLogins = value
        End Set
    End Property
    Private m_CanRemoveExternalLogins As Boolean

    Private Function HasPassword(manager As ApplicationUserManager) As Boolean
        Dim appUser = manager.FindById(User.Identity.GetUserId())
        Return (appUser IsNot Nothing AndAlso appUser.PasswordHash IsNot Nothing)
    End Function

    Protected Sub Page_Load() Handles Me.Load
        If Not IsPostBack Then
            ' Déterminer les sections à afficher
            Dim manager = Context.GetOwinContext().GetUserManager(Of ApplicationUserManager)()
            Dim bd = New P2014_Equipe2_GestionHôtelièreEntities
            If HasPassword(manager) Then
                changePasswordHolder.Visible = True
            Else
                setPassword.Visible = True
                changePasswordHolder.Visible = False
            End If
            CanRemoveExternalLogins = manager.GetLogins(User.Identity.GetUserId()).Count() > 1

            ' Afficher le message de réussite
            Dim message = Request.QueryString("m")
            If message IsNot Nothing Then
                ' Enlever la chaîne de requête de l'action
                Form.Action = ResolveUrl("~/Account/Manage")
                SuccessMessage = If(message = "ChangePwdSuccess", "Votre mot de passe a été modifié.", If(message = "SetPwdSuccess", "Votre mot de passe a été défini.", If(message = "RemoveLoginSuccess", "Le compte a été supprimé.", [String].Empty)))
                SuccessMessagePlaceHolder.Visible = Not [String].IsNullOrEmpty(SuccessMessage)
            End If
            Dim usr As ApplicationUser = Context.GetOwinContext().GetUserManager(Of ApplicationUserManager)().FindByIdAsync(Context.User.Identity.GetUserId).Result
            Telephone.Text = usr.telephone
            TelephoneSup.Text = usr.telephoneSup
            Adresse.Text = usr.adresse
            CodePostal.Text = usr.codePostal
            Dim res = From vi In bd.tblVille
                      Where vi.codeProv = usr.province
                      Select vi

            Ville.DataSource = res.ToList
            Ville.DataValueField = "codeVille"
            Ville.DataTextField = "nomVille"
            Ville.DataBind()
            Ville.SelectedValue = usr.ville
        End If
    End Sub

    Protected Sub ChangePassword_Click(sender As Object, e As EventArgs)
        If IsValid Then
            Dim manager = Context.GetOwinContext().GetUserManager(Of ApplicationUserManager)()
            Dim result As IdentityResult = manager.ChangePasswordAsync(User.Identity.GetUserId(), CurrentPassword.Text, NewPassword.Text).Result
            If result.Succeeded Then
                Dim userInfo = manager.FindById(User.Identity.GetUserId())
                IdentityHelper.SignIn(manager, userInfo, isPersistent:=False)
                Response.Redirect("~/Account/Manage?m=ChangePwdSuccess")
            Else
                AddErrors(result)
            End If
        End If
    End Sub

    Protected Sub ChangeInfo_Click(sender As Object, e As EventArgs)
        If IsValid Then
            Dim manager = Context.GetOwinContext().GetUserManager(Of ApplicationUserManager)()
            Dim usr = manager.FindByIdAsync(User.Identity.GetUserId()).Result
            usr.telephone = Telephone.Text
            usr.telephoneSup = TelephoneSup.Text
            'usr.nom = Nom.Text
            'usr.prenom = Prenom.Text
            usr.ville = Ville.SelectedItem.Value
            usr.codePostal = CodePostal.Text
            usr.Email = Email.Text
            usr.adresse = Adresse.Text
            Dim result As IdentityResult = manager.UpdateAsync(usr).Result
            If result.Succeeded Then

            Else
                AddErrors(result)
            End If

            SuccessMessage = "Les informations ont été modifiées avec succès"
        End If
    End Sub

    Protected Sub SetPassword_Click(sender As Object, e As EventArgs)
        If IsValid Then
            ' Créer les informations de connexion locale et associer le compte local à l'utilisateur
            Dim manager = Context.GetOwinContext().GetUserManager(Of ApplicationUserManager)()
            Dim result As IdentityResult = manager.AddPassword(User.Identity.GetUserId(), password.Text)
            If result.Succeeded Then
                Response.Redirect("~/Account/Manage?m=SetPwdSuccess")
            Else
                AddErrors(result)
            End If
        End If
    End Sub

    Public Function GetLogins() As IEnumerable(Of UserLoginInfo)
        Dim manager = Context.GetOwinContext().GetUserManager(Of ApplicationUserManager)()
        Dim accounts = manager.GetLogins(User.Identity.GetUserId())
        CanRemoveExternalLogins = accounts.Count() > 1 Or HasPassword(manager)
        Return accounts
    End Function

    Public Sub RemoveLogin(loginProvider As String, providerKey As String)
        Dim manager = Context.GetOwinContext().GetUserManager(Of ApplicationUserManager)()
        Dim result = manager.RemoveLogin(User.Identity.GetUserId(), New UserLoginInfo(loginProvider, providerKey))
        Dim msg As String = String.Empty
        If result.Succeeded Then
            Dim userInfo = manager.FindById(User.Identity.GetUserId())
            IdentityHelper.SignIn(manager, userInfo, isPersistent:=False)
            msg = "?m=RemoveLoginSuccess"
        End If
        Response.Redirect("~/Account/Manage" & msg)
    End Sub

    Private Sub AddErrors(result As IdentityResult)
        For Each [error] As String In result.Errors
            ModelState.AddModelError("", [error])
        Next
    End Sub
End Class