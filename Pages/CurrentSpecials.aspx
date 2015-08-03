<%@ Page Title="Current Specials" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CurrentSpecials.aspx.cs" Inherits="Pages_CurrentSpecials" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="center" style="margin: 0px auto">
        <asp:LoginView ID="LoginView1" runat="server">
            <AnonymousTemplate>
                <h2>Welcome to our Specials!</h2>
                <p>To be eligible to see and purchase listed specials, you must register as a member.</p>
                <p>
                    To become a member,
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Pages/Register.aspx">Register</asp:HyperLink>

                </p>
            </AnonymousTemplate>
            <LoggedInTemplate>
                 <h2>Welcome to our Member Specials!</h2>
                <p>Here at Brissie Coin we offer selected coins at 10% off their regular listed sales price exclusively for our members!</p>

                <asp:GridView CssClass="align-center margin-top" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CoinId" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." AllowSorting="True">
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="SalesPrice" HeaderText="Sales Price" SortExpression="Price" DataFormatString="${0:0.00}"/>
                        <asp:BoundField DataField="InStock" HeaderText="InStock" SortExpression="InStock" />
                        <asp:BoundField DataField="LastUpdate" HeaderText="LastUpdate" SortExpression="LastUpdate" DataFormatString="{0:d/MM/yyyy}"/>
                        <asp:ImageField DataImageUrlField="Picture" HeaderText="Picture" ControlStyle-Width="200">
                            <ControlStyle Width="200px" />
                        </asp:ImageField>
                        <asp:HyperLinkField HeaderText="View Larger Image" DataNavigateUrlFields="Picture" DataNavigateUrlFormatString="" Text="Large Image" Target="_blank" />
                        <asp:HyperLinkField HeaderText="Add to cart" DataNavigateUrlFields="CoinId,Name,SalesPrice,Picture" DataNavigateUrlFormatString="~/Shopping/ShoppingCartItem.aspx?coin_id={0}&name={1}&price={2}&picture={3}" Text="Add to cart" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DbConnectionCoinDb %>" DeleteCommand="DELETE FROM [CoinsTable] WHERE [CoinId] = @CoinId" InsertCommand="INSERT INTO [CoinsTable] ([Name], [Price], [InStock], [LastUpdate], [Picture], [Country], [OnSpecial]) VALUES (@Name, @Price, @InStock, @LastUpdate, @Picture, @Country, @OnSpecial)" ProviderName="<%$ ConnectionStrings:DbConnectionCoinDb.ProviderName %>" SelectCommand="SELECT [CoinId], [Name], [Price], [Price]*0.9  AS [SalesPrice], [InStock], [LastUpdate], [Picture], [Country], [OnSpecial] FROM [CoinsTable] WHERE [OnSpecial] = '1'" UpdateCommand="UPDATE [CoinsTable] SET [Name] = @Name, [Price] = @Price, [InStock] = @InStock, [LastUpdate] = @LastUpdate, [Picture] = @Picture, [Country] = @Country, [OnSpecial] = @OnSpecial WHERE [CoinId] = @CoinId">
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

            </LoggedInTemplate>
        </asp:LoginView>
    </div>
</asp:Content>

