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
    Public Property etatFacture As String
    Public Property dateFacture As Date
    Public Property noHotel As Nullable(Of Byte)

    Public Overridable Property tblHotel As tblHotel
    Public Overridable Property tblNote As ICollection(Of tblNote) = New HashSet(Of tblNote)

End Class
