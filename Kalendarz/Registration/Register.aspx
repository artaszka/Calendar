<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" MasterPageFile="~/MasterPage/Kalendarz.master" Inherits="Kalendarz.Registration.Register" %>


<asp:Content 
    ID="Content1" 
    ContentPlaceHolderID="ContentPlaceHolder1" 
    Runat="Server">

    <div>
    
        <table style="background-color:#bad4ee"  >
            <tr>
                <td class="auto-style1" >Rejestracja</td>
                <td style="border-color: #000000; border-width: 2px;" class="auto-style2">&nbsp;</td>
                
            </tr>
            <tr>
                <td class="auto-style1" >
                    <asp:Label ID="Label3" runat="server" Text="Użytkownik"></asp:Label>
                </td>
                <td style="border-color: #000000; border-width: 2px;" class="auto-style2">
                    <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="BrakUser" runat="server" ErrorMessage="Podaj nazwę użytkownika" ForeColor="Red" ControlToValidate="txtUserName">

                    </asp:RequiredFieldValidator>
                </td>
                
            </tr>
            <tr>
                <td class="auto-style1" >
                    <asp:Label ID="Label4" runat="server" Text="Hasło"></asp:Label>
                </td>
                <td style="border-color: #000000; border-width: 2px;" class="auto-style2">
                    <asp:TextBox ID="txtPassword" TextMode="Password" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="Brakhasło" runat="server" ErrorMessage="Podaj hasło" ForeColor="Red" ControlToValidate="txtPassword">

                    </asp:RequiredFieldValidator>
                </td>
                
            </tr>
            <tr>
                <td class="auto-style1" >
                    <asp:Label ID="Label1" runat="server" Text="Powtórz Hasło"></asp:Label>
                </td>
                <td style="border-color: #000000; border-width: 2px;" class="auto-style2">
                    <asp:TextBox ID="txtPass" TextMode="Password" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="Brakhasło1" runat="server" ErrorMessage="Powtórz hasło" ForeColor="Red" ControlToValidate="txtPass">
                    </asp:RequiredFieldValidator>
                    
                </td>
                
            </tr>
            <tr>
                <td class="auto-style1" >
                    <asp:Label ID="Label2" runat="server" Text="Email"></asp:Label>
                </td>
                <td style="border-color: #000000; border-width: 2px;" class="auto-style2">
                    <asp:TextBox ID="txtEmail" TextMode="Email" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="Zlymail" runat="server" ErrorMessage="Podaj email" ForeColor="Red" ControlToValidate="txtEmail">

                    </asp:RequiredFieldValidator>
                </td>
                
            </tr>
            <tr>
                <td class="auto-style1" >
                    &nbsp;</td>
                <td  style=" text-align:center; border-color: #000000; border-width: 2px;" class="auto-style2;">
                    <asp:Button ID="BRejestruj" runat="server" Text="Rejestruj" OnClick="BRejestruj_Click"/> &nbsp
                    
                </td>
                
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="LbMessage" runat="server" ForeColor="#CC0000"></asp:Label>
                </td>
                <td style="border-color: #000000; border-width: 2px;" class="auto-style2">
                    <asp:CompareValidator ID="PorownajHasla" runat="server" ControlToCompare="txtPassword" ForeColor="Red"
                         ControlToValidate="txtPass" Display="Dynamic" ErrorMessage="Pola Hasło i Powtórz Hasło muszą być jednakowe.">
                    </asp:CompareValidator>
                    
                </td>
                
            </tr>
        </table>
        
    </div>
 </asp:Content>  
