<%@ Page Title="Add user to role" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddUserToRole.aspx.cs" Inherits="Admin_AddUserToRole" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Add User to Role</h2>
    <br />
    <h3>Select a User</h3>
    <asp:ListBox ID="UserList" runat="server"  DataSourceID="SqlDataSource1" DataTextField="UserName" DataValueField="UserName" Width="200"></asp:ListBox>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>
    <br />

    <h3>Select a Role</h3>

    <asp:ListBox ID="RolesList" DataSourceID="SqlDataSource2" runat="server" DataTextField="RoleName" DataValueField="RoleName"></asp:ListBox>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Roles]"></asp:SqlDataSource>

    <h3>Click button to add user to role</h3>

    <asp:Button ID="Button1" runat="server" Text="Add user to role" OnClick="Button1_Click" />

    <br />

    <asp:Label ID="MessageLabel" runat="server" Text=""></asp:Label>


</asp:Content>

