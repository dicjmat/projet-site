﻿Imports System.Threading.Tasks
Imports Microsoft.AspNet.Identity
Imports Microsoft.AspNet.Identity.EntityFramework
Imports Microsoft.AspNet.Identity.Owin
Imports Microsoft.Owin

' Configurer l'application que le gestionnaire des utilisateurs a utilisée dans cette application. UserManager est défini dans ASP.NET Identity et est utilisé par l'application.
Public Class ApplicationUserManager
    Inherits UserManager(Of ApplicationUser)
        Public Sub New(store As MonStore(Of ApplicationUser))
        MyBase.New(store)
    End Sub


    Public Overrides Function UpdateAsync(user As ApplicationUser) As Task(Of IdentityResult)
        Store.UpdateAsync(user)
        Return Task.FromResult(New IdentityResult("Votre modification a été prise en compte"))
    End Function
        Public Overrides Function FindAsync(userName As String, password As String) As Task(Of ApplicationUser)
            Dim usr = Store.FindByNameAsync(userName).Result

            If usr IsNot Nothing Then
                If usr.PasswordHash = password Then
                    Return Task.FromResult(usr)
                End If
            End If
            usr = Nothing
            Return Task.FromResult(usr)
        End Function

        Public Overrides Function ChangePasswordAsync(userId As String, currentPassword As String, newPassword As String) As Task(Of IdentityResult)
            Dim result = New IdentityResult("Mot de passe invalide")
            Dim usr As ApplicationUser = Me.FindByIdAsync(userId).Result

            If usr.PasswordHash = currentPassword Then
                usr.PasswordHash = newPassword
                Store.UpdateAsync(usr)
                Return Task.FromResult(New IdentityResult("Le mot de passe a bien été modifié"))
            End If
            Return Task.FromResult(result)
        End Function

        Public Shared Function Create(options As IdentityFactoryOptions(Of ApplicationUserManager), context As IOwinContext) As ApplicationUserManager
            Dim manager = New ApplicationUserManager(New MonStore(Of ApplicationUser)(context.[Get](Of ApplicationDbContext)()))
            ' Configurer la logique de validation pour les noms d'utilisateur
            manager.UserValidator = New UserValidator(Of ApplicationUser)(manager) With {
              .AllowOnlyAlphanumericUserNames = False,
              .RequireUniqueEmail = True
            }
            ' Configurer la logique de validation pour les mots de passe
            manager.PasswordValidator = New PasswordValidator() With {
              .RequiredLength = 6,
              .RequireNonLetterOrDigit = True,
              .RequireDigit = True,
              .RequireLowercase = True,
              .RequireUppercase = True
            }
            ' Inscrire les fournisseurs d'authentification à 2 facteurs. Cette application utilise le téléphone et les e-mails comme procédure de réception de code pour confirmer l'utilisateur. 
            ' Pour plus d'informations sur l'utilisation de l'authentification à 2 facteurs, consultez http://go.microsoft.com/fwlink/?LinkID=391935
            ' Vous pouvez indiquer votre propre fournisseur et vous connecter ici.
            manager.RegisterTwoFactorProvider("PhoneCode", New PhoneNumberTokenProvider(Of ApplicationUser)() With {
              .MessageFormat = "Your security code is: {0}"
            })
            manager.RegisterTwoFactorProvider("EmailCode", New EmailTokenProvider(Of ApplicationUser)() With {
              .Subject = "SecurityCode",
              .BodyFormat = "Your security code is: {0}"
            })
            manager.EmailService = New EmailService()
            manager.SmsService = New SmsService()
            Dim dataProtectionProvider = options.DataProtectionProvider
            If dataProtectionProvider IsNot Nothing Then
                manager.UserTokenProvider = New DataProtectorTokenProvider(Of ApplicationUser)(dataProtectionProvider.Create("ASP.NET Identity"))
            End If
            Return manager
        End Function
    End Class

    Public Class EmailService
        Implements IIdentityMessageService
        Public Function SendAsync(message As IdentityMessage) As Task Implements IIdentityMessageService.SendAsync
            ' Indiquez votre service de messagerie ici pour envoyer un e-mail.
            Return Task.FromResult(0)
        End Function
    End Class

    Public Class SmsService
        Implements IIdentityMessageService
        Public Function SendAsync(message As IdentityMessage) As Task Implements IIdentityMessageService.SendAsync
            ' Indiquez votre service de SMS ici pour envoyer un message texte.
            Return Task.FromResult(0)
        End Function
    End Class
