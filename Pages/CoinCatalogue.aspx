<%@ Page Title="Coin Catalogue" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CoinCatalogue.aspx.cs" Inherits="Pages_CoinCatalogue" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h3>Below is a complete list of our Coins. Use the drop list to filter the conins by Countries.</h3>
    <asp:Label ID="ConuntriesLabel" runat="server" Text="Countries:"></asp:Label>
    <asp:DropDownList ID="Countries" runat="server" DataSourceID="SqlDataSourceDistinctCountry" DataTextField="Country" DataValueField="Country" AutoPostBack="true" OnSelectedIndexChanged="FilterByCountry" AppendDataBoundItems="true">
        <asp:ListItem Value="">Make a selection</asp:ListItem>
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSourceDistinctCountry" runat="server" ConnectionString="<%$ ConnectionStrings:DbConnectionCoinDb %>" ProviderName="<%$ ConnectionStrings:DbConnectionCoinDb.ProviderName %>" SelectCommand="SELECT DISTINCT [Country] FROM [CoinsTable]"></asp:SqlDataSource>

    <br />
    <asp:GridView ID="CoinsListing" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceCoinsTable" EmptyDataText="There are no data records to display." AllowSorting="True" Width="80%" CssClass="align-center margin-top">
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" DataFormatString="${0:0.00}"/>
            <asp:BoundField DataField="InStock" HeaderText="InStock" SortExpression="InStock" />
            <asp:BoundField DataField="LastUpdate" HeaderText="LastUpdate" SortExpression="LastUpdate" DataFormatString="{0:d/MM/yyyy}" />
            <asp:ImageField DataImageUrlField="Picture" ControlStyle-Width="200">
<ControlStyle Width="200px"></ControlStyle>
            </asp:ImageField>
            <asp:HyperLinkField DataNavigateUrlFields="CoinId,Name,Price,Picture" DataNavigateUrlFormatString="~/Shopping/ShoppingCartItem.aspx?coin_id={0}&name={1}&price={2}&picture={3}" Text="Add to cart" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSourceCoinsTable" runat="server" ConnectionString="<%$ ConnectionStrings:DbConnectionCoinDb %>" SelectCommand="SELECT [CoinId], [Name], [Price], [InStock], [LastUpdate], [Picture], [Country], [OnSpecial] FROM [CoinsTable] WHERE ([Country] LIKE '%' + @Country + '%')">
        <SelectParameters>
            <asp:ControlParameter ControlID="Countries" Name="Country" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>

