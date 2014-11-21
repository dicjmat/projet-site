Imports Microsoft.AspNet.Identity
Imports System.Threading.Tasks
Public Class MonStore(Of TUser As ApplicationUser)
    Implements IUserStore(Of ApplicationUser)
    Implements IUserPasswordStore(Of ApplicationUser)
    Implements IUserLoginStore(Of ApplicationUser)

    Private bd As New P2014_Equipe2_GestionHôtelièreEntities
    Private _applicationDbContext As ApplicationDbContext
    'Private bd As New P

    Sub New(applicationDbContext As ApplicationDbContext)
        ' TODO: Complete member initialization 
        _applicationDbContext = applicationDbContext
    End Sub

    Public Function AddLoginAsync(user As ApplicationUser, login As UserLoginInfo) As Task Implements IUserLoginStore(Of ApplicationUser, String).AddLoginAsync

    End Function

    Public Function FindAsync(login As UserLoginInfo) As Task(Of ApplicationUser) Implements IUserLoginStore(Of ApplicationUser, String).FindAsync

    End Function

    Public Function GetLoginsAsync(user As ApplicationUser) As Task(Of IList(Of UserLoginInfo)) Implements IUserLoginStore(Of ApplicationUser, String).GetLoginsAsync
        Dim l = New List(Of UserLoginInfo)
        Dim info = New UserLoginInfo("BlaBla", "asdh45528975k")
        l.Add(info)
        Return Task.FromResult(DirectCast(l, IList(Of UserLoginInfo)))
    End Function

    Public Function RemoveLoginAsync(user As ApplicationUser, login As UserLoginInfo) As Task Implements IUserLoginStore(Of ApplicationUser, String).RemoveLoginAsync

    End Function

    Public Function CreateAsync(user As ApplicationUser) As Task Implements IUserStore(Of ApplicationUser, String).CreateAsync
        Dim usr As New ApplicationUser
        usr.PasswordHash = user.PasswordHash
        usr.UserName = user.UserName
        usr.Id = user.Id
        Return Task.FromResult(usr)
    End Function

    Public Function DeleteAsync(user As ApplicationUser) As Task Implements IUserStore(Of ApplicationUser, String).DeleteAsync

    End Function

    Public Function FindByIdAsync(userId As String) As Task(Of ApplicationUser) Implements IUserStore(Of ApplicationUser, String).FindByIdAsync
        Dim res = From el In bd.tblLogin
                  Join em In bd.tblEmploye
                  On em.noEmpl Equals el.noEmpl
                  Where el.noEmpl = userId
                  Select el.mdp, el.utilisateur, em.nomEmpl, em.prenEmpl, em.adrEmpl, em.noTelEmpl, em.noCellEmpl, el.noEmpl, el.premiereConnexion

        Dim usr As New ApplicationUser
        usr.PasswordHash = res.First.mdp
        usr.UserName = res.First.utilisateur
        usr.Id = res.First.noEmpl
        usr.prenom = res.First.prenEmpl
        usr.nom = res.First.nomEmpl
        usr.adresse = res.First.adrEmpl
        usr.telephone = res.First.noTelEmpl
        usr.telephoneSup = res.First.noCellEmpl
        usr.premiereConnexion = res.First.premiereConnexion
        Return Task.FromResult(usr)
    End Function

    Public Function FindByNameAsync(userName As String) As Task(Of ApplicationUser) Implements IUserStore(Of ApplicationUser, String).FindByNameAsync
        Dim res = From el In bd.tblLogin
                  Join em In bd.tblEmploye
                  On em.noEmpl Equals el.noEmpl
                  Where el.utilisateur = userName
                  Select el.mdp, el.utilisateur, em.nomEmpl, em.prenEmpl, em.adrEmpl, em.noTelEmpl, em.noCellEmpl, el.noEmpl

        Dim usr As New ApplicationUser
        usr.PasswordHash = res.First.mdp
        usr.UserName = res.First.utilisateur
        usr.Id = res.First.noEmpl
        usr.prenom = res.First.prenEmpl
        usr.nom = res.First.nomEmpl
        usr.adresse = res.First.adrEmpl
        usr.telephone = res.First.noTelEmpl
        usr.telephoneSup = res.First.noCellEmpl
        Return Task.FromResult(usr)
    End Function


    Public Function UpdateAsync(user As ApplicationUser) As Task Implements IUserStore(Of ApplicationUser, String).UpdateAsync
        Dim login = From el In bd.tblLogin
                    Where el.noEmpl = user.Id
                    Select el

        Dim emp = From el In bd.tblEmploye
                  Where el.noEmpl = user.Id
                  Select el

        login.First.mdp = user.PasswordHash
        login.First.utilisateur = user.UserName
        emp.Single.nomEmpl = user.nom
        emp.Single.prenEmpl = user.prenom
        emp.Single.adrEmpl = user.adresse
        emp.Single.noTelEmpl = user.telephone
        emp.Single.noCellEmpl = user.telephoneSup
        bd.SaveChanges()
        Return Task.FromResult(True)
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
#Region "UserPassword"
    Public Function GetPasswordHashAsync(user As ApplicationUser) As Task(Of String) Implements IUserPasswordStore(Of ApplicationUser, String).GetPasswordHashAsync
        Return Task.FromResult(user.PasswordHash)
    End Function

    Public Function HasPasswordAsync(user As ApplicationUser) As Task(Of Boolean) Implements IUserPasswordStore(Of ApplicationUser, String).HasPasswordAsync
        If user.PasswordHash IsNot Nothing Then
            Return Task.FromResult(True)
        End If
        Return Task.FromResult(False)
    End Function

    Public Function SetPasswordHashAsync(user As ApplicationUser, passwordHash As String) As Task Implements IUserPasswordStore(Of ApplicationUser, String).SetPasswordHashAsync
        user.PasswordHash = passwordHash
        Return Task.FromResult(True)
    End Function

#End Region
End Class
