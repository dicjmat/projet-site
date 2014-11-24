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
        bd = New P2014_Equipe2_GestionHôtelièreEntities

        If Context.User.Identity.GetUserId IsNot Nothing <> 0 Then
            Dim usr As ApplicationUser = Context.GetOwinContext().GetUserManager(Of ApplicationUserManager)().FindByIdAsync(Context.User.Identity.GetUserId).Result
            nom = usr.nom
            prenom = usr.prenom
        End If

        'Accueil et communiqué
        Dim comuni As String

        usr = Context.GetOwinContext().GetUserManager(Of ApplicationUserManager)().FindByIdAsync(Context.User.Identity.GetUserId).Result

        Dim noHotell As Integer = (From ho In bd.tblEmploye Where ho.noEmpl = usr.Id Select ho.noHotel).Single

        Dim com = From comu In bd.tblCommunique Where comu.noHotel = noHotell Select comu.titreCommunique, comu.contCommunique


        If com.ToList.Count <> 0 Then
            For Each el In com.ToList
                comuni = el.titreCommunique + " " + el.contCommunique
                communique.Controls.Add(New LiteralControl(comuni + "<br/>"))
            Next
        Else
            communique.Controls.Add(New LiteralControl("Vous n'avez pas de communiqué"))
        End If

        'Fiche employé
        Dim noEmp As Integer
        Dim noTel As String
        Dim adr As String
        Dim code As String
        Dim embauche As Date
        Dim jMal As Integer
        Dim jFer As Integer
        Dim jVac As Integer
        Dim salaireHoraire As Decimal
        Dim hrSem As Integer
        Dim nomHot As String
        Dim NoCell As String

        Dim var = From emp In bd.tblEmploye Where emp.noEmpl = usr.Id Select emp.noEmpl, emp.nomEmpl, emp.prenEmpl, emp.noTelEmpl, emp.adrEmpl, emp.tblProfession.nomProf, emp.dateEmbauche, emp.noCellEmpl, emp.tblHotel.nomHotel, emp.hrSemaine, emp.salaire, emp.joursFerie, emp.joursMal, emp.joursVac


        'Initialisation des variables
        noEmp = var.First.noEmpl
        noTel = var.First.noTelEmpl
        NoCell = var.First.noCellEmpl
        adr = var.First.adrEmpl
        code = var.First.nomProf
        embauche = var.First.dateEmbauche
        nomHot = var.First.nomHotel
        hrSem = var.First.hrSemaine
        salaireHoraire = var.First.salaire
        jVac = var.First.joursVac
        jFer = var.First.joursFerie
        jMal = var.First.joursMal

        'Écriture des labels
        lblNoEmp.Text = noEmp.ToString
        lblNoTel.Text = noTel
        lblNoCell.Text = NoCell
        lblAdr.Text = adr
        lblProf.Text = code
        lbldateEmbauche.Text = Format(embauche, "yyyy-MM-dd")
        lblNoHotel.Text = nomHot + "."
        lblHrSemaine.Text = hrSem.ToString
        lblSalaire.Text = salaireHoraire.ToString + "$ de l'heure."
        lblJoursFerie.Text = jFer.ToString
        lblJoursMal.Text = jMal.ToString
        lblJoursVac.Text = jVac.ToString
    End Sub
End Class