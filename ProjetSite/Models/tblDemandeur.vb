'------------------------------------------------------------------------------
' <auto-generated>
'     Ce code a été généré à partir d'un modèle.
'
'     Des modifications manuelles apportées à ce fichier peuvent conduire à un comportement inattendu de votre application.
'     Les modifications manuelles apportées à ce fichier sont remplacées si le code est régénéré.
' </auto-generated>
'------------------------------------------------------------------------------

Imports System
Imports System.Collections.Generic

Partial Public Class tblDemandeur
    Public Property noDemandeur As Integer
    Public Property nomDemandeur As String
    Public Property prenDemandeur As String
    Public Property noTelDemandeur As String
    Public Property noCellDemandeur As String
    Public Property adrDemandeur As String
    Public Property codePostalDemandeur As String
    Public Property emailDemandeur As String
    Public Property typeCarteCredit As String
    Public Property noCarteCredit As String
    Public Property dateExpiration As String
    Public Property commentaire As String
    Public Property noCompagnie As Nullable(Of Integer)
    Public Property codeVille As String
    Public Property codeProv As String

    Public Overridable Property tblVille As tblVille
    Public Overridable Property tblCompagnie As tblCompagnie
    Public Overridable Property tblReservation As ICollection(Of tblReservation) = New HashSet(Of tblReservation)

End Class
