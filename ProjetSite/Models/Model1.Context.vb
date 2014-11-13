﻿'------------------------------------------------------------------------------
' <auto-generated>
'     Ce code a été généré à partir d'un modèle.
'
'     Des modifications manuelles apportées à ce fichier peuvent conduire à un comportement inattendu de votre application.
'     Les modifications manuelles apportées à ce fichier sont remplacées si le code est régénéré.
' </auto-generated>
'------------------------------------------------------------------------------

Imports System
Imports System.Data.Entity
Imports System.Data.Entity.Infrastructure
Imports System.Data.Entity.Core.Objects
Imports System.Linq

Partial Public Class P2014_Equipe2_GestionHôtelièreEntities
    Inherits DbContext

    Public Sub New()
        MyBase.New("name=P2014_Equipe2_GestionHôtelièreEntities")
    End Sub

    Protected Overrides Sub OnModelCreating(modelBuilder As DbModelBuilder)
        Throw New UnintentionalCodeFirstException()
    End Sub

    Public Overridable Property tblBris() As DbSet(Of tblBris)
    Public Overridable Property tblCatalogue() As DbSet(Of tblCatalogue)
    Public Overridable Property tblChecklist() As DbSet(Of tblChecklist)
    Public Overridable Property tblCommande() As DbSet(Of tblCommande)
    Public Overridable Property tblFournisseur() As DbSet(Of tblFournisseur)
    Public Overridable Property tblGabarit() As DbSet(Of tblGabarit)
    Public Overridable Property tblHotel() As DbSet(Of tblHotel)
    Public Overridable Property tblInventaire() As DbSet(Of tblInventaire)
    Public Overridable Property tblItem() As DbSet(Of tblItem)
    Public Overridable Property tblLigneCommande() As DbSet(Of tblLigneCommande)
    Public Overridable Property tblPays() As DbSet(Of tblPays)
    Public Overridable Property tblProvince() As DbSet(Of tblProvince)
    Public Overridable Property tblVille() As DbSet(Of tblVille)
    Public Overridable Property tblCommunique() As DbSet(Of tblCommunique)
    Public Overridable Property tblEmploye() As DbSet(Of tblEmploye)
    Public Overridable Property tblHoraire() As DbSet(Of tblHoraire)
    Public Overridable Property tblLogin() As DbSet(Of tblLogin)
    Public Overridable Property tblProfession() As DbSet(Of tblProfession)
    Public Overridable Property tblClient() As DbSet(Of tblClient)
    Public Overridable Property tblCompagnie() As DbSet(Of tblCompagnie)
    Public Overridable Property tblElementNote() As DbSet(Of tblElementNote)
    Public Overridable Property tblFacture() As DbSet(Of tblFacture)
    Public Overridable Property tblForfait() As DbSet(Of tblForfait)
    Public Overridable Property tblNote() As DbSet(Of tblNote)
    Public Overridable Property tblPeriode() As DbSet(Of tblPeriode)
    Public Overridable Property tblPeriodeTypeSalle() As DbSet(Of tblPeriodeTypeSalle)
    Public Overridable Property tblRabais() As DbSet(Of tblRabais)
    Public Overridable Property tblReservation() As DbSet(Of tblReservation)
    Public Overridable Property tblSalle() As DbSet(Of tblSalle)
    Public Overridable Property tblTypeElement() As DbSet(Of tblTypeElement)
    Public Overridable Property tblTypeSalle() As DbSet(Of tblTypeSalle)
    Public Overridable Property tblTypeSalleHotel() As DbSet(Of tblTypeSalleHotel)

    Public Overridable Function inventaireCommun() As ObjectResult(Of inventaireCommun_Result)
        Return DirectCast(Me, IObjectContextAdapter).ObjectContext.ExecuteFunction(Of inventaireCommun_Result)("inventaireCommun")
    End Function

    Public Overridable Function determinerchambrelibre(dateDebut As Nullable(Of Date), datefin As Nullable(Of Date), noHotel As Nullable(Of Byte)) As ObjectResult(Of determinerchambrelibre_Result)
        Dim dateDebutParameter As ObjectParameter = If(dateDebut.HasValue, New ObjectParameter("dateDebut", dateDebut), New ObjectParameter("dateDebut", GetType(Date)))

        Dim datefinParameter As ObjectParameter = If(datefin.HasValue, New ObjectParameter("datefin", datefin), New ObjectParameter("datefin", GetType(Date)))

        Dim noHotelParameter As ObjectParameter = If(noHotel.HasValue, New ObjectParameter("noHotel", noHotel), New ObjectParameter("noHotel", GetType(Byte)))

        Return DirectCast(Me, IObjectContextAdapter).ObjectContext.ExecuteFunction(Of determinerchambrelibre_Result)("determinerchambrelibre", dateDebutParameter, datefinParameter, noHotelParameter)
    End Function

    Public Overridable Function determinersallelibre(dateDebut As Nullable(Of Date), datefin As Nullable(Of Date), noHotel As Nullable(Of Byte)) As ObjectResult(Of determinersallelibre_Result)
        Dim dateDebutParameter As ObjectParameter = If(dateDebut.HasValue, New ObjectParameter("dateDebut", dateDebut), New ObjectParameter("dateDebut", GetType(Date)))

        Dim datefinParameter As ObjectParameter = If(datefin.HasValue, New ObjectParameter("datefin", datefin), New ObjectParameter("datefin", GetType(Date)))

        Dim noHotelParameter As ObjectParameter = If(noHotel.HasValue, New ObjectParameter("noHotel", noHotel), New ObjectParameter("noHotel", GetType(Byte)))

        Return DirectCast(Me, IObjectContextAdapter).ObjectContext.ExecuteFunction(Of determinersallelibre_Result)("determinersallelibre", dateDebutParameter, datefinParameter, noHotelParameter)
    End Function

End Class
