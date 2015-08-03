<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="Pages_ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>Contact Brissie Coin Palace</h1>
    <div>
        If you have any questions please don't hesitte to contact us on:<br />
        Phone : 07 3840 0008
        <br />
        Email: info@BrissieCoinPalace.com.au
    </div>

    <table style="width:500px;margin:0px auto;" border="0">
        <caption><h3>Feedback</h3></caption>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
            </td>
            <td class="leftalign">
                <asp:TextBox ID="TextBox1" runat="server" Width="400px"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Email"></asp:Label>
            </td>
            <td class="leftalign">
                <asp:TextBox ID="TextBox2" runat="server" Width="400px"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Comments"></asp:Label>
            </td>
            <td class="leftalign">
                <asp:TextBox ID="TextBox3" runat="server" TextMode="multiline" Columns="50" Rows="5" Width="400px"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td></td>
            <td> 
                <asp:Button ID="Submit" runat="server" Text="Submit" OnClick="Submit_Click"/>
                <asp:Button ID="Cancel" runat="server" Text="Cancel" OnClick="Cancel_Click"/>
            </td>
        </tr>
    </table>

   
</asp:Content>

