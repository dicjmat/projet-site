Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports Microsoft.AspNet.Identity
Imports Microsoft.AspNet.Identity.EntityFramework
Imports Microsoft.AspNet.Identity.Owin
Imports Owin
Public Class FicheEmploye
    Inherits System.Web.UI.Page
    Dim bd As P2014_Equipe2_GestionHôtelièreEntities
    Dim usr As ApplicationUser
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim noEmp As Integer
        Dim nom As String
        Dim prenom As String
        Dim noTel As String
        Dim adr As String
        Dim code As String
        Dim embauche As Date

        bd = New P2014_Equipe2_GestionHôtelièreEntities
        usr = Context.GetOwinContext().GetUserManager(Of ApplicationUserManager)().FindByIdAsync(Context.User.Identity.GetUserId).Result

        Dim var = From emp In bd.tblEmploye Where emp.noEmpl = usr.Id Select emp.noEmpl, emp.nomEmpl, emp.prenEmpl, emp.noTelEmpl, emp.adrEmpl, emp.codeProf, emp.dateEmbauche

        'Initialisation des variables
        noEmp = var.First.noEmpl
        nom = var.First.nomEmpl
        prenom = var.First.prenEmpl
        noTel = var.First.noTelEmpl
        adr = var.First.adrEmpl
        code = var.First.codeProf
        embauche = var.First.dateEmbauche

        'Écriture des labels
        lblNoEmp.Text = "Numéro d'employé : " + noEmp.ToString
        lblIntroFiche.Text = "Bonjour " + prenom + " " + nom + ", bienvenur sur votre fiche d'employé."
        lblNoTel.Text = "Numéro de téléphone : " + noTel
        lblAdr.Text = "Adresse : " + adr
        lblCodeProf.Text = "Code de profession : " + code
        lbldateEmbauche.Text = "Vous avez été embauché le " + embauche.ToString + "."

    End Sub

End Class