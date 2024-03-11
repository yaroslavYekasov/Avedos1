<%@ Page Title="Vaata veod" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Avedos.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2 id="title"><%: Title %></h2>
    <main aria-labelledby="title">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." CellPadding="10" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowSorting="True">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" />
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="algus" HeaderText="algus" SortExpression="algus" />
                    <asp:BoundField DataField="ots" HeaderText="ots" SortExpression="ots" />
                    <asp:TemplateField HeaderText="aeg" SortExpression="aeg">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("aeg") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("aeg", "{0:D}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="autonr" HeaderText="autonr" SortExpression="autonr" />
                    <asp:BoundField DataField="juht" HeaderText="juht" SortExpression="juht" />
                    <asp:BoundField DataField="valmis" HeaderText="valmis" SortExpression="valmis" />
                    <asp:BoundField DataField="login" HeaderText="login" SortExpression="login" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:avedosConnectionString1 %>" DeleteCommand="DELETE FROM [veod] WHERE [id] = @id" InsertCommand="INSERT INTO [veod] ([algus], [ots], [aeg], [autonr], [juht], [valmis], [kasutajaId]) VALUES (@algus, @ots, @aeg, @autonr, @juht, @valmis, @kasutajaId)" SelectCommand="SELECT veod.id, veod.algus, veod.ots, veod.aeg, veod.autonr, veod.juht, veod.valmis, kasutaja.login FROM veod INNER JOIN kasutaja ON veod.kasutajaId = kasutaja.id" UpdateCommand="UPDATE [veod] SET [algus] = @algus, [ots] = @ots, [aeg] = @aeg, [autonr] = @autonr, [juht] = @juht, [valmis] = @valmis, [kasutajaId] = @kasutajaId WHERE [id] = @id">
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
    </main>
</asp:Content>
