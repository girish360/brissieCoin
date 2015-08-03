<%@ Page Title="Shopping Cart Item" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ShoppingCartItem.aspx.cs" Inherits="Shopping_ShoppingCartItem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" CssClass="align-center margin-top">
        <ItemTemplate>
            <table style="width: 250px; margin: 0px auto;" border="0">
                <caption>
                    <h3>Selected Item</h3>
                </caption>
                <tr>
                    <td class="align-center">
                        <asp:Image ID="Picture" runat="server" ImageUrl='<%# Bind("Picture") %>' Width="200" />
                    </td>
                </tr>

                <tr>
                    <td class="align-center">
                        <asp:Label ID="Name" runat="server" Text='<%# Bind("Name") %>' />
                    </td>
                </tr>

                <tr>
                    <td class="align-center">$ 
                        <asp:LoginView ID="LoginView1" runat="server">
                            <AnonymousTemplate>
                                <asp:Label ID="Price" runat="server" Text='<%# Bind("Normal_Price") %>'/>
                            </AnonymousTemplate>
                            <LoggedInTemplate>
                                <asp:Label ID="Price" runat="server" Text='<%# Bind("Special_Price") %>'/>
                            </LoggedInTemplate>
                        </asp:LoginView>

                    </td>
                </tr>

                <tr>
                    <td></td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:FormView>

    <asp:HiddenField ID="CoinId" runat="server" />
    <asp:HiddenField ID="Name" runat="server" />
    <asp:HiddenField ID="Price" runat="server" />
    <asp:HiddenField ID="Picture" runat="server" />

    <asp:Button ID="Button1" runat="server" Text="Add to cart" OnClick="AddToCart" />

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DbConnectionCoinDb %>" SelectCommand="SELECT *, convert(varchar,cast([Price] as money),-1)  AS [Normal_Price],  convert(varchar,cast([Price]*0.9 as money),-1)  AS [Special_Price] FROM [CoinsTable] WHERE ([CoinId] = @CoinId)">
        <SelectParameters>
            <asp:QueryStringParameter Name="CoinId" QueryStringField="coin_id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

