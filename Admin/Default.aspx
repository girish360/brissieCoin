<%@ Page Title="Administration" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Administration</h1>
    <p>Welcome <strong><asp:LoginName ID="LoginName1" runat="server" /></strong>. You have administration privileges.</p>
    <h3>Select a link below to administer Brissie Coin Palace.</h3>

    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Admin/ManageCatalogue.aspx" Font-Size="Large">Manage Catalogue</asp:HyperLink><br />
    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Admin/AddUser.aspx" Font-Size="Large">Add new user</asp:HyperLink><br />
    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Admin/AddUserToRole.aspx" Font-Size="Large">Add user to role</asp:HyperLink><br />

</asp:Content>

