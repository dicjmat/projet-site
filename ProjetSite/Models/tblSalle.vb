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

Partial Public Class tblSalle
    Public Property noSalle As Short
    Public Property noHotel As Byte
    Public Property nomSalle As String
    Public Property descSalle As String
    Public Property nbPlace As Nullable(Of Short)
    Public Property statutSalle As String
    Public Property codeTypeSalle As String
    Public Property codeTypeLit As String

    Public Overridable Property tblBris As ICollection(Of tblBris) = New HashSet(Of tblBris)
    Public Overridable Property tblChecklist As ICollection(Of tblChecklist) = New HashSet(Of tblChecklist)
    Public Overridable Property tblHotel As tblHotel
    Public Overridable Property tblReservation As ICollection(Of tblReservation) = New HashSet(Of tblReservation)
    Public Overridable Property tblTypeLit As tblTypeLit
    Public Overridable Property tblTypeSalle As tblTypeSalle

End Class
