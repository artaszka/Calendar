<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" MasterPageFile="~/MasterPage/Kalendarz.master" Inherits="Kalendarz.Login" %>


<asp:Content 
    ID="Content1" 
    ContentPlaceHolderID="ContentPlaceHolder1" 
    Runat="Server">
    
    <div>
    
        <table style="background-color:aqua"  >
            <tr>
                <td class="auto-style1" >Logowanie</td>
                <td class="auto-style2">  </td>
                
            </tr>
            <tr>
                <td class="auto-style1" >
                    <asp:Label ID="Label1" runat="server" Text="Użytkownik"></asp:Label>
                </td>
                <td class="auto-style2" >
                    <asp:TextBox ID="TbUser" runat="server" AutoCompleteType="DisplayName" TabIndex="1"></asp:TextBox>
                </td>
                
            </tr>
            <tr>
                <td class="auto-style1" >
                    <asp:Label ID="Label2" runat="server" Text="Hasło"></asp:Label>
                </td>
                <td class="auto-style2" >
                    <asp:TextBox ID="TbPass" TextMode="Password" runat="server" TabIndex="2"></asp:TextBox>
                </td>
                
            </tr>
            <tr>
                <td class="auto-style1" >
                    <asp:CheckBox ID="CbRemember" runat="server" Text="Zapamiętaj" />
                </td>
                <td class="auto-style2" >
                    <asp:Button ID="Bloguj" runat="server" Text="Loguj" OnClick="Bloguj_Click" TabIndex="3" />
                </td>
                
            </tr>
            <tr >
                <td colspan="2">
                    <asp:Label ID="LbMessage" runat="server" ForeColor="#CC0000"></asp:Label>
                </td>
                
                
            </tr>
        </table>
        <br />
        <a href="Registration/Register.aspx" style="color: #000066; font-size: 19px;">Zarejestruj się</a>
        jeśli chcesz być adminem
        <br />
        <a href="UserPAge/UserPage.aspx" style="color: #000066; font-size: 19px;">Przejdź do kalendarza</a>
        jeśli chcesz być użytkownikiem
    </div>
   
</asp:Content>