<%@ Page Title="Manage catalogue" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ManageCatalogue.aspx.cs" Inherits="Admin_ManageCatalogue" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h3>Manage Content</h3>
    <asp:Label ID="ConuntriesLabel" runat="server" Text="Select Category"></asp:Label><br />
    <asp:DropDownList ID="Countries" runat="server" DataSourceID="SqlDataSourceDistinctCountry" DataTextField="Country" DataValueField="Country" AutoPostBack="true" OnSelectedIndexChanged="FilterByCountry" AppendDataBoundItems="true">
        <asp:ListItem Value="">Make a selection</asp:ListItem>
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSourceDistinctCountry" runat="server" ConnectionString="<%$ ConnectionStrings:DbConnectionCoinDb %>" ProviderName="<%$ ConnectionStrings:DbConnectionCoinDb.ProviderName %>" SelectCommand="SELECT DISTINCT [Country] FROM [CoinsTable]"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" CssClass="align-center margin-top" AutoGenerateColumns="False" DataKeyNames="CoinId" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." AllowSorting="True" OnRowUpdated="CoinsListing_RowUpdated">
        <Columns>
            <asp:BoundField DataField="CoinId" HeaderText="CoinId" ReadOnly="True" SortExpression="CoinId" InsertVisible="False" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            <asp:BoundField DataField="InStock" HeaderText="InStock" SortExpression="InStock" />
            <asp:BoundField DataField="LastUpdate" HeaderText="LastUpdate" SortExpression="LastUpdate" />
            <asp:BoundField DataField="Picture" HeaderText="Picture" SortExpression="Picture" />
            <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
            <asp:BoundField DataField="OnSpecial" HeaderText="OnSpecial" SortExpression="OnSpecial" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DbConnectionCoinDb %>" DeleteCommand="DELETE FROM [CoinsTable] WHERE [CoinId] = @CoinId" InsertCommand="INSERT INTO [CoinsTable] ([Name], [Price], [InStock], [LastUpdate], [Picture], [Country], [OnSpecial]) VALUES (@Name, @Price, @InStock, @LastUpdate, @Picture, @Country, @OnSpecial)" SelectCommand="SELECT [CoinId], [Name], [Price], [InStock], [LastUpdate], [Picture], [Country], [OnSpecial] FROM [CoinsTable] WHERE ([Country] = @Country)" UpdateCommand="UPDATE [CoinsTable] SET [Name] = @Name, [Price] = @Price, [InStock] = @InStock, [LastUpdate] = @LastUpdate, [Picture] = @Picture, [Country] = @Country, [OnSpecial] = @OnSpecial WHERE [CoinId] = @CoinId">
        <DeleteParameters>
            <asp:Parameter Name="CoinId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Price" Type="Decimal" />
            <asp:Parameter Name="InStock" Type="Int32" />
            <asp:Parameter Name="LastUpdate" Type="DateTime" />
            <asp:Parameter Name="Picture" Type="String" />
            <asp:Parameter Name="Country" Type="String" />
            <asp:Parameter Name="OnSpecial" Type="Int16" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="Countries" Name="Country" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Price" Type="Decimal" />
            <asp:Parameter Name="InStock" Type="Int32" />
            <asp:Parameter Name="LastUpdate" Type="DateTime" />
            <asp:Parameter Name="Picture" Type="String" />
            <asp:Parameter Name="Country" Type="String" />
            <asp:Parameter Name="OnSpecial" Type="Int16" />
            <asp:Parameter Name="CoinId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>


    <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource2" DataKeyNames="CoinId" CssClass="align-center margin-top" DefaultMode="Insert" OnItemCreated="FormView1_ItemCreated" OnDataBound="FormView1_DataBound">
        <InsertItemTemplate>
            <table style="width: 500px; margin: 0px auto;" border="1">
                <caption>
                    <h3>Add a new stamp to the category</h3>
                </caption>
                <tr>
                    <td>Name
                    </td>
                    <td class="leftalign">
                        <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                    </td>
                </tr>

                <tr>
                    <td>Price</td>
                    <td class="leftalign">
                        <asp:TextBox ID="PriceTextBox" runat="server" Text='<%# Bind("Price") %>' />
                    </td>
                </tr>

                <tr>
                    <td>InStock</td>
                    <td class="leftalign">
                        <asp:TextBox ID="InStockTextBox" runat="server" Text='<%# Bind("InStock") %>' />
                    </td>
                </tr>

                <tr>
                    <td>Picture</td>
                    <td class="leftalign">
                        <asp:TextBox ID="PictureTextBox" runat="server" Text='<%# Bind("Picture") %>' />
                    </td>
                </tr>

                <tr>
                    <td>Country</td>
                    <td class="leftalign">
                        <asp:TextBox ID="CountryTextBox" runat="server" Text='<%# Bind("Country") %>' ReadOnly="true"/>
                    </td>
                </tr>

                <tr>
                    <td>OnSpecial</td>
                    <td class="leftalign">
                        <asp:TextBox ID="OnSpecialTextBox" runat="server" Text='<%# Bind("OnSpecial") %>' />
                    </td>
                </tr>

                <tr>
                    <td></td>
                    <td>
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </td>
                </tr>
            </table>
        </InsertItemTemplate>

    </asp:FormView>


    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DbConnectionCoinDb %>" InsertCommand="INSERT INTO CoinsTable(Name, Price, InStock, LastUpdate, Picture, OnSpecial, Country) VALUES (@Name, @Price, @InStock, GETDATE(), @Picture, @OnSpecial, @Country)" SelectCommand="SELECT CoinsTable.* FROM CoinsTable">
        <InsertParameters>
            <asp:Parameter Name="Name" />
            <asp:Parameter Name="Price" />
            <asp:Parameter Name="InStock" />
            <asp:Parameter Name="Picture" />
            <asp:Parameter Name="OnSpecial" />
            <asp:Parameter Name="Country"  DefaultValue=""/>
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>

