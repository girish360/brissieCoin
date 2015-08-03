<%@ Page Title="Shopping Cart page" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ShoppingCartPage.aspx.cs" Inherits="Shopping_ShoppingCartPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h2>Brissie Coin Palace Shopping Item</h2>

    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SourceCartItem" CssClass="align-center margin-top" Width="80%" OnRowUpdated="GridView2_RowUpdated">
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" ReadOnly="true"/>
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" ReadOnly="true" DataFormatString="${0:0.00}"/>
            <asp:ImageField DataImageUrlField="Picture" HeaderText="Picture" ReadOnly="true">
               <ControlStyle Width="200px"></ControlStyle>
            </asp:ImageField>
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
            <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" ReadOnly="true"/>
            <asp:CommandField ShowEditButton="True" />
            <asp:HyperLinkField DataNavigateUrlFields="CoinId" DataNavigateUrlFormatString="~/Shopping/ShoppingCartPage.aspx?remove={0}" Text="Delete"/>
            <asp:BoundField DataField="CoinId" HeaderText="CoinId" SortExpression="CoinId" ControlStyle-CssClass="hide" ItemStyle-CssClass="hide" HeaderStyle-CssClass="hide">
           
<ControlStyle CssClass="hide"></ControlStyle>

<HeaderStyle CssClass="hide"></HeaderStyle>

<ItemStyle CssClass="hide"></ItemStyle>
            </asp:BoundField>
           
        </Columns>
    </asp:GridView>

    <asp:ObjectDataSource ID="SourceCartItem" runat="server" DeleteMethod="remove" SelectMethod="getItems" TypeName="CartItem" UpdateMethod="updateItem">
        <DeleteParameters>
            <asp:Parameter Name="CoinId" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="CoinId" Type="Int32" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Price" Type="Double" />
            <asp:Parameter Name="Picture" Type="String" />
            <asp:Parameter Name="Quantity" Type="Int32" />
            <asp:Parameter Name="Total" Type="Double" />
        </UpdateParameters>
    </asp:ObjectDataSource>

    <div class="align-left margin-top" style="padding-left: 100px;">
        <strong><asp:Label ID="CartMsg" runat="server" Text=""></asp:Label></strong>
    </div>

</asp:Content>

