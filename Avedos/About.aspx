<%@ Page Title="Veo lisamine" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Avedos.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %></h2>
    <p>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="SqlDataSource_veod" DefaultMode="Insert" Height="50px" Width="125px" OnPageIndexChanging="DetailsView1_PageIndexChanging">
            <Fields>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="algus" HeaderText="algus" SortExpression="algus" />
                <asp:BoundField DataField="ots" HeaderText="ots" SortExpression="ots" />
                <asp:TemplateField HeaderText="aeg" SortExpression="aeg">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("aeg") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:Calendar ID="Calendar2" runat="server" SelectedDate='<%# Bind("aeg") %>'></asp:Calendar>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="autonr" HeaderText="autonr" SortExpression="autonr" />
                <asp:BoundField DataField="juht" HeaderText="juht" SortExpression="juht" />
                <asp:TemplateField HeaderText="valmis" SortExpression="valmis">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("valmis") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("valmis") %>'>
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>0</asp:ListItem>
                        </asp:DropDownList>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("valmis") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="kasutajaId" SortExpression="kasutajaId">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("kasutajaId") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource_kasutaja" DataTextField="login" DataValueField="login" SelectedValue='<%# Bind("kasutajaId") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource_kasutaja" runat="server" ConnectionString="<%$ ConnectionStrings:avedosConnectionString1 %>" SelectCommand="SELECT [login] FROM [kasutaja]"></asp:SqlDataSource>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:SqlDataSource ID="SqlDataSource1_kasutaja" runat="server" ConnectionString="<%$ ConnectionStrings:avedosConnectionString1 %>" SelectCommand="SELECT [login] FROM [kasutaja]"></asp:SqlDataSource>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource_veod" runat="server" ConnectionString="<%$ ConnectionStrings:avedosConnectionString1 %>" DeleteCommand="DELETE FROM [veod] WHERE [id] = @id" InsertCommand="INSERT INTO [veod] ([algus], [ots], [aeg], [autonr], [juht], [valmis], [kasutajaId]) VALUES (@algus, @ots, @aeg, @autonr, @juht, @valmis, @kasutajaId)" SelectCommand="SELECT * FROM [veod]" UpdateCommand="UPDATE [veod] SET [algus] = @algus, [ots] = @ots, [aeg] = @aeg, [autonr] = @autonr, [juht] = @juht, [valmis] = @valmis, [kasutajaId] = @kasutajaId WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="algus" Type="String" />
                <asp:Parameter Name="ots" Type="String" />
                <asp:Parameter DbType="Date" Name="aeg" />
                <asp:Parameter Name="autonr" Type="String" />
                <asp:Parameter Name="juht" Type="String" />
                <asp:Parameter Name="valmis" Type="Int32" />
                <asp:Parameter Name="kasutajaId" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="algus" Type="String" />
                <asp:Parameter Name="ots" Type="String" />
                <asp:Parameter DbType="Date" Name="aeg" />
                <asp:Parameter Name="autonr" Type="String" />
                <asp:Parameter Name="juht" Type="String" />
                <asp:Parameter Name="valmis" Type="Int32" />
                <asp:Parameter Name="kasutajaId" Type="Int32" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
    </main>
</asp:Content>
