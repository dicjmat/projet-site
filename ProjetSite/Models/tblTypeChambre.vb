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

Partial Public Class tblTypeChambre
    Public Property codeTypeChambre As String
    Public Property nomTypeChambre As String

    Public Overridable Property tblGabarit As ICollection(Of tblGabarit) = New HashSet(Of tblGabarit)
    Public Overridable Property tblChambre As ICollection(Of tblChambre) = New HashSet(Of tblChambre)
    Public Overridable Property tblForfait As ICollection(Of tblForfait) = New HashSet(Of tblForfait)
    Public Overridable Property tblTypeChambreHotel As ICollection(Of tblTypeChambreHotel) = New HashSet(Of tblTypeChambreHotel)
    Public Overridable Property tblOption As ICollection(Of tblOption) = New HashSet(Of tblOption)

End Class
