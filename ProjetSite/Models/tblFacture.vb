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

Partial Public Class tblFacture
    Public Property noFacture As Integer
    Public Property montantFacture As Decimal
    Public Property etatFacture As String
    Public Property noReservation As Integer

    Public Overridable Property tblElementFacture As ICollection(Of tblElementFacture) = New HashSet(Of tblElementFacture)
    Public Overridable Property tblReservationChambre As tblReservationChambre

End Class
