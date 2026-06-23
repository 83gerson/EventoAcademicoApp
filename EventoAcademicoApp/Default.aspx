<%@ Page Title="Registro de Participante" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EventoAcademicoApp.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" />

    <h2>Formulario de registro de participantes</h2>
    <p class="subtitle">
        Complete sus datos para inscribirse en el Congreso Estudiantil de Innovación TI 2026.
    </p>

    <asp:ValidationSummary ID="vsResumen" runat="server"
        HeaderText="Por favor corrija los siguientes errores:"
        DisplayMode="BulletList"
        CssClass="validation-summary" />

    <div class="form-grid">

        <div class="form-group">
            <asp:Label ID="lblNombre" runat="server" AssociatedControlID="txtNombre" Text="Nombre completo:" />
            <asp:TextBox ID="txtNombre" runat="server" CssClass="input-text" MaxLength="100" />
            <asp:RequiredFieldValidator ID="rfvNombre" runat="server"
                ControlToValidate="txtNombre"
                ErrorMessage="El nombre es obligatorio."
                Text="*" CssClass="error-text"
                Display="Dynamic" />
        </div>

        <div class="form-group">
            <asp:Label ID="lblIdentificacion" runat="server" AssociatedControlID="txtIdentificacion" Text="Número de identificación:" />
            <asp:TextBox ID="txtIdentificacion" runat="server" CssClass="input-text" MaxLength="20" />
            <asp:RequiredFieldValidator ID="rfvIdentificacion" runat="server"
                ControlToValidate="txtIdentificacion"
                ErrorMessage="La identificación es obligatoria."
                Text="*" CssClass="error-text"
                Display="Dynamic" />
            <asp:RegularExpressionValidator ID="revIdentificacion" runat="server"
                ControlToValidate="txtIdentificacion"
                ValidationExpression="^[0-9\-]{6,15}$"
                ErrorMessage="Use solo números y guiones (6 a 15 caracteres)."
                Text="*" CssClass="error-text"
                Display="Dynamic" />
        </div>

        <div class="form-group">
            <asp:Label ID="lblCorreo" runat="server" AssociatedControlID="txtCorreo" Text="Correo electrónico:" />
            <asp:TextBox ID="txtCorreo" runat="server" CssClass="input-text" MaxLength="100" />
            <asp:RequiredFieldValidator ID="rfvCorreo" runat="server"
                ControlToValidate="txtCorreo"
                ErrorMessage="El correo es obligatorio."
                Text="*" CssClass="error-text"
                Display="Dynamic" />
            <asp:RegularExpressionValidator ID="revCorreo" runat="server"
                ControlToValidate="txtCorreo"
                ValidationExpression="^[^@\s]+@[^@\s]+\.[a-zA-Z]{2,}$"
                ErrorMessage="Ingrese un correo válido."
                Text="*" CssClass="error-text"
                Display="Dynamic" />
        </div>

        <div class="form-group">
            <asp:Label ID="lblConfirmarCorreo" runat="server" AssociatedControlID="txtConfirmarCorreo" Text="Confirmar correo electrónico:" />
            <asp:TextBox ID="txtConfirmarCorreo" runat="server" CssClass="input-text" MaxLength="100" />
            <asp:CompareValidator ID="cvCorreo" runat="server"
                ControlToValidate="txtConfirmarCorreo"
                ControlToCompare="txtCorreo"
                ErrorMessage="Los correos no coinciden."
                Text="*" CssClass="error-text"
                Display="Dynamic" />
        </div>

        <!-- CATEGORÍA -->
        <asp:UpdatePanel ID="upCategoria" runat="server">
            <ContentTemplate>

                <div class="form-group">
                    <asp:Label ID="lblCategoria" runat="server" AssociatedControlID="ddlCategoria" Text="Categoría de participante:" />

                    <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="input-select"
                        AutoPostBack="true"
                        OnSelectedIndexChanged="ddlCategoria_SelectedIndexChanged">

                        <asp:ListItem Text="-- Seleccione --" Value="" />
                        <asp:ListItem Text="Estudiante" Value="Estudiante" />
                        <asp:ListItem Text="Docente" Value="Docente" />
                        <asp:ListItem Text="Profesional" Value="Profesional" />
                        <asp:ListItem Text="Egresado" Value="Egresado" />

                    </asp:DropDownList>

                    <asp:RequiredFieldValidator ID="rfvCategoria" runat="server"
                        ControlToValidate="ddlCategoria"
                        InitialValue=""
                        ErrorMessage="Seleccione una categoría."
                        Text="*" CssClass="error-text"
                        Display="Dynamic" />

                    <asp:Label ID="lblInfoCategoria" runat="server" CssClass="info-text" />
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>

        <div class="form-group">
            <asp:Label ID="lblInstitucion" runat="server" AssociatedControlID="txtInstitucion" Text="Institución u organización:" />
            <asp:TextBox ID="txtInstitucion" runat="server" CssClass="input-text" MaxLength="100" />
            <asp:RequiredFieldValidator ID="rfvInstitucion" runat="server"
                ControlToValidate="txtInstitucion"
                ErrorMessage="Indique su institución u organización."
                Text="*" CssClass="error-text"
                Display="Dynamic" />
        </div>

        <div class="form-group">
            <asp:Label ID="lblEdad" runat="server" AssociatedControlID="txtEdad" Text="Edad:" />
            <asp:TextBox ID="txtEdad" runat="server" CssClass="input-text-small" MaxLength="3" />
            <asp:RequiredFieldValidator ID="rfvEdad" runat="server"
                ControlToValidate="txtEdad"
                ErrorMessage="La edad es obligatoria."
                Text="*" CssClass="error-text"
                Display="Dynamic" />
            <asp:RangeValidator ID="rvEdad" runat="server"
                ControlToValidate="txtEdad"
                Type="Integer"
                MinimumValue="15"
                MaximumValue="99"
                ErrorMessage="La edad debe estar entre 15 y 99 años."
                Text="*" CssClass="error-text"
                Display="Dynamic" />
        </div>

        <div class="form-group">
            <asp:Label runat="server" Text="Modalidad de participación:" />
            <asp:RadioButtonList ID="rblModalidad" runat="server" CssClass="input-radio" RepeatDirection="Horizontal">
                <asp:ListItem Text="Presencial" Value="Presencial" />
                <asp:ListItem Text="Virtual" Value="Virtual" />
            </asp:RadioButtonList>
            <asp:RequiredFieldValidator ID="rfvModalidad" runat="server"
                ControlToValidate="rblModalidad"
                ErrorMessage="Seleccione una modalidad."
                Text="*" CssClass="error-text"
                Display="Dynamic" />
        </div>

        <!-- CALENDARIO -->
        <asp:UpdatePanel ID="upCalendario" runat="server">
            <ContentTemplate>

                <div class="form-group full-width">
                    <asp:Label runat="server" Text="Seleccione el día en que asistirá:" />

                    <asp:Calendar ID="calAsistencia" runat="server"
                        OnSelectionChanged="calAsistencia_SelectionChanged"
                        CssClass="input-calendar" />

                    <asp:Label ID="lblFechaSeleccionada" runat="server"
                        CssClass="info-text"
                        Text="Si no selecciona fecha, se pondrá la de hoy automáticamente." />
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>

        <div class="form-group full-width">
            <asp:CheckBox ID="chkCertificado" runat="server" Text="Deseo recibir certificado de participación" CssClass="input-checkbox" />
        </div>

        <div class="form-group full-width">
            <asp:Button ID="btnRegistrar" runat="server" Text="Registrarme" CssClass="btn-primary" OnClick="btnRegistrar_Click" />
        </div>

    </div>

</asp:Content>