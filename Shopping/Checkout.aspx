<%@ Page Title="Checkout" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Checkout.aspx.cs" Inherits="Shopping_Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Wizard ID="Wizard1" runat="server" ActiveStepIndex="0" FinishDestinationPageUrl="~/Pages/CoinCatalogue.aspx" CssClass="align-center" Width="90%" OnFinishButtonClick="Wizard1_FinishButtonClick">
        <NavigationStyle CssClass="pull-right" />
        <StepNextButtonStyle CssClass="align-center" />
        <WizardSteps>
            <asp:WizardStep ID="WizardStep1" runat="server" Title="Login">
                <asp:LoginView ID="LoginView1" runat="server">
                    <AnonymousTemplate>
                        <table style="width: 100%">
                            <tr>
                                <td style="width: 40%">
                                    <asp:Login ID="Login1" runat="server" RememberMeSet="false"></asp:Login>
                                </td>
                                <td style="text-align: right; width: 40%">
                                    <asp:PasswordRecovery ID="PasswordRecovery1" runat="server"></asp:PasswordRecovery>
                                </td>
                            </tr>
                        </table>
                    </AnonymousTemplate>
                    <LoggedInTemplate>
                        Wel Come
                        <asp:LoginName ID="LoginName1" runat="server" />
                        , Click Next to proceed
                    </LoggedInTemplate>
                </asp:LoginView>
            </asp:WizardStep>
            <asp:WizardStep ID="WizardStep2" runat="server" Title="Delivery Address">
                <table>
                    <tr>
                        <td></td>
                        <td>
                            <asp:CheckBox ID="CheckBox1" runat="server" Text="Use membership address" /></td>
                    </tr>
                    <tr>
                        <td style="float: left;">
                            <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="Name" runat="server"></asp:TextBox></td>
                    </tr>

                    <tr>
                        <td style="float: left;">
                            <asp:Label ID="Label2" runat="server" Text="Address"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="Address" runat="server"></asp:TextBox></td>
                    </tr>

                    <tr>
                        <td style="float: left;">
                            <asp:Label ID="Label3" runat="server" Text="City"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="City" runat="server"></asp:TextBox></td>
                    </tr>

                    <tr>
                        <td style="float: left;">
                            <asp:Label ID="Label4" runat="server" Text="State"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="State" runat="server"></asp:TextBox></td>
                    </tr>

                    <tr>
                        <td style="float: left;">
                            <asp:Label ID="Label5" runat="server" Text="Postcode"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="Postcode" runat="server"></asp:TextBox></td>
                    </tr>

                    <tr>
                        <td style="float: left;">
                            <asp:Label ID="Label6" runat="server" Text="Country"></asp:Label></td>
                        <td>
                            <asp:TextBox ID="Country" runat="server"></asp:TextBox></td>
                    </tr>
                </table>

            </asp:WizardStep>
            <asp:WizardStep ID="WizardStep3" runat="server" Title="Payment">
                <table>
                    <tr>
                        <td style="width: 251px">
                            <asp:Label ID="Label7" runat="server" Text="Card Type "></asp:Label></td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server">
                                <asp:ListItem>MasterCard</asp:ListItem>
                                <asp:ListItem>Visa</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>

                    <tr>
                        <td style="width: 251px">
                            <asp:Label ID="Label8" runat="server" Text="Card Number "></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox1" runat="server" Width="196px"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td style="width: 251px">
                            <asp:Label ID="Label9" runat="server" Text="Expires"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="TextBox2" runat="server" Width="53px"></asp:TextBox>
                            /
                            <asp:TextBox ID="TextBox3" runat="server" Width="49px"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </asp:WizardStep>
            <asp:WizardStep ID="WizardStep4" runat="server" Title="Confirmation">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SourceCartItem" CssClass="align-center margin-top" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" ReadOnly="true" />
                        <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" ReadOnly="true" DataFormatString="${0:0.00}" />
                        <asp:ImageField DataImageUrlField="Picture" HeaderText="Picture" ReadOnly="true">
                            <ControlStyle Width="200px"></ControlStyle>
                        </asp:ImageField>
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                        <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" ReadOnly="true" />
                        <asp:BoundField DataField="CoinId" HeaderText="CoinId" SortExpression="CoinId" ControlStyle-CssClass="hide" ItemStyle-CssClass="hide" HeaderStyle-CssClass="hide">

                            <ControlStyle CssClass="hide"></ControlStyle>

                            <HeaderStyle CssClass="hide"></HeaderStyle>

                            <ItemStyle CssClass="hide"></ItemStyle>
                        </asp:BoundField>

                    </Columns>
                </asp:GridView>

                <asp:ObjectDataSource ID="SourceCartItem" runat="server" SelectMethod="getItems" TypeName="CartItem"></asp:ObjectDataSource>
                <div style="float: left;">
                    <b>
                        <asp:Label ID="CartMsg" runat="server" Text=""></asp:Label></b>


                </div>

                 <p>Please confirm the amount you wish to have deducted from your credit card.</p>

                    <p><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Pages/CoinCatalogue.aspx">HyperLink</asp:HyperLink></p>



            </asp:WizardStep>
            <asp:WizardStep ID="WizardStep5" runat="server" Title="Complete">
                <h2>We thank you for shopping at our place</h2>
            </asp:WizardStep>
        </WizardSteps>
    </asp:Wizard>
</asp:Content>
