<%@ Page Title="Resumen de Participantes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Resumen.aspx.cs" Inherits="EventoAcademicoApp.Resumen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Resumen de registro</h2>

    <asp:Panel ID="pnlConfirmacion" runat="server" CssClass="confirmation-box" Visible="false">
        <asp:Label ID="lblConfirmacion" runat="server" />
    </asp:Panel>

    <h3>Participantes registrados en esta sesión</h3> 

    <asp:GridView ID="gvParticipantes" runat="server"
        CssClass="data-grid"
        AutoGenerateColumns="false"
        EmptyDataText="Aún no hay participantes registrados."
        GridLines="None">
        <Columns>
            <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
            <asp:BoundField DataField="Identificacion" HeaderText="Identificación" />
            <asp:BoundField DataField="Correo" HeaderText="Correo" />
            <asp:BoundField DataField="Categoria" HeaderText="Categoría" />
            <asp:BoundField DataField="Institucion" HeaderText="Institución" />
            <asp:BoundField DataField="Modalidad" HeaderText="Modalidad" />
            <asp:BoundField DataField="FechaAsistencia" HeaderText="Fecha de asistencia" DataFormatString="{0:dd/MM/yyyy}" />
            <asp:TemplateField HeaderText="Desea certificado">
                <ItemTemplate>
                    <%# (bool)Eval("DeseaCertificado") ? "Sí" : "No" %>
                </ItemTemplate>
</asp:TemplateField>
        </Columns>
    </asp:GridView>

    <div class="form-group full-width">
        <asp:Button ID="btnVolver" runat="server" Text="Registrar otro participante" CssClass="btn-secondary" OnClick="btnVolver_Click" />
    </div>

</asp:Content>
