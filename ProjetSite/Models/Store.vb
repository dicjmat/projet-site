﻿Imports Microsoft.AspNet.Identity
Imports System.Threading.Tasks
Public Class Store(Of TUser As ApplicationUser)

    Implements IUserPasswordStore(Of ApplicationUser)
    Implements IUserLoginStore(Of ApplicationUser)

    Private _applicationDbContext As ApplicationDbContext

    Sub New(applicationDbContext As ApplicationDbContext)
        ' TODO: Complete member initialization 
        _applicationDbContext = applicationDbContext
    End Sub

    Public Function AddLoginAsync(user As ApplicationUser, login As UserLoginInfo) As Task Implements IUserLoginStore(Of ApplicationUser, String).AddLoginAsync

    End Function

    Public Function FindAsync(login As UserLoginInfo) As Task(Of ApplicationUser) Implements IUserLoginStore(Of ApplicationUser, String).FindAsync

    End Function

    Public Function GetLoginsAsync(user As ApplicationUser) As Task(Of IList(Of UserLoginInfo)) Implements IUserLoginStore(Of ApplicationUser, String).GetLoginsAsync

    End Function

    Public Function RemoveLoginAsync(user As ApplicationUser, login As UserLoginInfo) As Task Implements IUserLoginStore(Of ApplicationUser, String).RemoveLoginAsync

    End Function

    Public Function CreateAsync(user As ApplicationUser) As Task Implements IUserStore(Of ApplicationUser, String).CreateAsync

    End Function

    Public Function DeleteAsync(user As ApplicationUser) As Task Implements IUserStore(Of ApplicationUser, String).DeleteAsync

    End Function

    Public Function FindByIdAsync(userId As String) As Task(Of ApplicationUser) Implements IUserStore(Of ApplicationUser, String).FindByIdAsync

    End Function

    Public Function FindByNameAsync(userName As String) As Task(Of ApplicationUser) Implements IUserStore(Of ApplicationUser, String).FindByNameAsync

    End Function

    Public Function UpdateAsync(user As ApplicationUser) As Task Implements IUserStore(Of ApplicationUser, String).UpdateAsync

    End Function

#Region "IDisposable Support"
    Private disposedValue As Boolean ' Pour détecter les appels redondants

    ' IDisposable
    Protected Overridable Sub Dispose(disposing As Boolean)
        If Not Me.disposedValue Then
            If disposing Then
                ' TODO: supprimez l'état managé (objets managés).
            End If

            ' TODO: libérez les ressources non managées (objets non managés) et substituez la méthode Finalize() ci-dessous.
            ' TODO: définissez les champs volumineux à null.
        End If
        Me.disposedValue = True
    End Sub

    ' TODO: substituez Finalize() uniquement si Dispose(ByVal disposing As Boolean) ci-dessus comporte du code permettant de libérer des ressources non managées.
    'Protected Overrides Sub Finalize()
    '    ' Ne modifiez pas ce code. Ajoutez du code de nettoyage dans Dispose(ByVal disposing As Boolean) ci-dessus.
    '    Dispose(False)
    '    MyBase.Finalize()
    'End Sub

    ' Ce code a été ajouté par Visual Basic pour permettre l'implémentation correcte du modèle pouvant être supprimé.
    Public Sub Dispose() Implements IDisposable.Dispose
        ' Ne modifiez pas ce code. Ajoutez du code de nettoyage dans Dispose(disposing As Boolean) ci-dessus.
        Dispose(True)
        GC.SuppressFinalize(Me)
    End Sub
#End Region

    Public Function GetPasswordHashAsync(user As ApplicationUser) As Task(Of String) Implements IUserPasswordStore(Of ApplicationUser, String).GetPasswordHashAsync

    End Function

    Public Function HasPasswordAsync(user As ApplicationUser) As Task(Of Boolean) Implements IUserPasswordStore(Of ApplicationUser, String).HasPasswordAsync

    End Function

    Public Function SetPasswordHashAsync(user As ApplicationUser, passwordHash As String) As Task Implements IUserPasswordStore(Of ApplicationUser, String).SetPasswordHashAsync

    End Function
End Class
