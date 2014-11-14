﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Horaire.aspx.vb" Inherits="ProjetSite.Horaire" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Horaire</title>
</head>
<body>
    <form id="horaire" runat="server">
        <h3>Horaire</h3>
        <asp:Calendar runat="server" ID="calendar1"
            TodayDayStyle-BackColor="LightBlue"
            SelectedDayStyle-BackColor ="CadetBlue"
            TitleStyle-BackColor="CadetBlue"
            TitleStyle-Font-Size ="20"
            DayStyle-Font-Size ="15"
            DayStyle-Height ="100"
            DayStyle-Width ="100"
            OtherMonthDayStyle-ForeColor ="Gray"          
            ></asp:Calendar>
        <asp:Label ID="lbltest" runat="server" Text=""></asp:Label>
    </form>
</body>
</html>