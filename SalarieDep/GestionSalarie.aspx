<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GestionSalarie.aspx.cs" Inherits="CSSDB.SalarieDep.GestionSalarie" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 352px;
        }
        .auto-style3 {
            width: 352px;
            height: 35px;
        }
        .auto-style4 {
            height: 35px;
        }
        .auto-style5 {
            width: 525px;
        }
        .auto-style6 {
            height: 35px;
            width: 525px;
        }
    </style>
</head>
<body style="width: 1449px">
    <form id="form1" runat="server">
        <div>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/SalarieDep/GestionDepartement.aspx"><h2>Gestion Departement</h2></asp:HyperLink>
            <br />
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label1" runat="server" Text="Nom: "></asp:Label>
                    </td>
                    <td class="auto-style5">
                        <asp:TextBox ID="TbNom" runat="server" Width="265px" OnTextChanged="TbNom_TextChanged"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TbNom" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label2" runat="server" Text="Prenom:"></asp:Label>
                    </td>
                    <td class="auto-style5">
                        <asp:TextBox ID="TbPrenom" runat="server" Width="265px" ></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TbPrenom" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label3" runat="server" Text="Age: "></asp:Label>
                    </td>
                    <td class="auto-style5">
                        <asp:TextBox ID="TBAge" runat="server" Width="265px" ></asp:TextBox>
                    </td>
                    <td>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TBAge" ErrorMessage="Please entre the correct age" MaximumValue="120" MinimumValue="1" Type="Integer"></asp:RangeValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label4" runat="server" Text="Fonction: "></asp:Label>
                    </td>
                    <td class="auto-style6">
                        <asp:TextBox ID="TBfonction" runat="server" Width="265px" ></asp:TextBox>
                    </td>
                    <td class="auto-style4">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TBfonction" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label5" runat="server" Text="Email"></asp:Label>
                        :
                    </td>
                    <td class="auto-style5">
                        <asp:TextBox ID="TBAdress" runat="server" Width="265px" ></asp:TextBox>
                    </td>
                    <td>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TBAdress" ErrorMessage="Email not correct" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label7" runat="server" Text="Email Verification"></asp:Label>
                        :
                    </td>
                    <td class="auto-style5">
                        <asp:TextBox ID="TBAdressV" runat="server" Width="265px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TBAdress" ControlToValidate="TBAdressV" ErrorMessage="Email is not equal*"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label6" runat="server" Text="Id Departement: "></asp:Label>
                    </td>
                    <td class="auto-style5">
                        <asp:DropDownList ID="DropDownIdDepartement" runat="server" OnSelectedIndexChanged="DropDownIdDepartement_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DropDownIdDepartement" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        &nbsp;</td>
                    <td class="auto-style5">
                        <asp:Button ID="Valid" runat="server" Height="37px" OnClick="Valid_Click" Text="Add new Salarie" Width="140px"  />
                        <asp:Button ID="BtUpdate" runat="server" Height="37px" Text="Update" Width="140px" style="margin-right:13px; margin-left:13px" OnClick="BtUpdate_Click" />
                        <asp:Button ID="BtDelete" runat="server" Height="37px" Text="Delete" Width="140px" OnClick="BtDelete_Click" />
                    </td>
                    <td>
                        <asp:Label ID="LidSalarie" runat="server" Text=" " Visible="False"></asp:Label>
                    </td>
                </tr>
            </table>
            <div>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateSelectButton="True" Height="116px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="513px">
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
