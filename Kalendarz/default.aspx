<%@ Page Language="C#" AutoEventWireup="true" validateRequest="false" CodeBehind="default.aspx.cs" Inherits="Kalendarz._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <style type="text/css">
        .auto-style4 {
            width: 60px;
            height: 31px;
        }
        .auto-style5 {
            width: 620px;
            height: 31px;
        }
        .auto-style6 {
            width: 40px;
            height: 31px;
        }
    </style>
</head>

<body style="background-color: #343434">
    
    <form id="form1" runat="server">
    <div style="position:absolute;">
    <table style="width: 800px;">
        <tr>
            <td style=" border-style: double none none double; border-color: #3399FF; border-width: 5px 0px 0px 5px; background-color: #bad4ee;" class="auto-style4">
                <b><%= DateTime.Now %></b>
            </td>
            <td style=" border-style: double double double none; border-color: #3399FF; background-color: #bad4ee; border-top-width: 5px; border-right-width: 5px; border-bottom-width: 5px;" class="auto-style5" >
                

            </td>
            <td class="auto-style6"></td>
        </tr>
        <tr>
            <td style="border-style: none double double double; border-width: 0px 5px 5px 5px; 
                        border-color: #3399FF; background-color: #bad4ee;
                        vertical-align:top">
                 
                <asp:Button ID="bShow" runat="server" text="Przeglądanie" 
                    CausesValidation="false" Width="99px" OnClick="bShow_Click" /><br />
                <asp:Button ID="bEdit" runat="server" text="Edycja" 
                    CausesValidation="false" Width="99px" OnClick="bEdit_Click" /><br />
                <asp:Button ID="bManager" runat="server" text="Zarządzanie" 
                    CausesValidation="false" Width="99px" OnClick="bManager_Click" /><br /><br /><br />
                <asp:Button ID="bBack" runat="server" Text="Logowanie " 
                    OnClick="bBack_Click" CausesValidation="False" Width="99px"/><br />
                <asp:Button ID="bRegister" runat="server" Text="Rejestracja " 
                    CausesValidation="False" Width="99px" OnClick="bRegister_Click"/><br />
                <asp:Button ID="bLogout" runat="server" Text="Wylogowanie " 
                    CausesValidation="False" Width="99px" OnClick="bLogout_Click"/><br />
            </td>
            <td rowspan="2" style=" border-bottom:dashed">

    
        <table style="width:620px; background-color: #bad4ee; text-align:center; align-items:baseline  ">
            <tr>
                <td style="background-color: #bad4ee; width:20px">
                    &nbsp;</td>
                <td class="auto-style3" style="background-color: #bad4ee; width:400px">
                    
                </td>
                <td style="background-color: #bad4ee">
                    &nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style3">

            <!-- Tworzenie kalendarza -->

                    <asp:Calendar 
                        ID="calSchedule" 
                        OnDayRender="calSchedule_DayRender"
                        runat="server"
                         
                        BackColor="White" BorderColor="#3366CC" 
                        BorderWidth="1px" CellPadding="1" 
                        Font-Names="Segoe Print" Font-Size="small" ForeColor="#003399" 
                        Height="250px" Width="400px" SelectionMode="DayWeekMonth" Font-Bold="True" CellSpacing="1" ShowGridLines="True" NextPrevFormat="FullMonth">
                        <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                        <NextPrevStyle Font-Size="10pt" ForeColor="#CCCCFF" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                        <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                        <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                        <WeekendDayStyle BackColor="#3399FF" />
                    </asp:Calendar>
                    
                    

            <!-- Tworzenie kontrolki Formview -->

                    <asp:FormView
                        id="frmSchedule"
                        AllowPaging="False"  
                        DataKeyNames="Data"
                        DataSourceID="srcSchedule"
                        Runat="server" 
                        BackColor="#99d9ff" Width="600px" >
                        
            

                        <EmptyDataTemplate>
                           <h3> <%# calSchedule.SelectedDate.ToString("d MMMM yyyy") %></h3>
                            <h4>Brak wpisów</h4>
                        <asp:LinkButton
                            id="btnNew"
                            Text="Dodaj wpis"
                            CommandName="New"
                            Runat="server"

                            BorderColor="#999999" BorderWidth="2" 
                            CausesValidation="True" Font-Bold="True" 
                            Font-Size="Large" BackColor="Silver" 
                            Font-Overline="True" Font-Underline="True" 
                            BorderStyle="Solid" ForeColor="black"/>
                        </EmptyDataTemplate>

                        <ItemTemplate>
                        <h3><%# Eval("Data", "{0:D}") %></h3>
                        
                        <table style="left:90px; border:0px">
                        <tr><td style="text-align:left">
                        <b>utworzył: </b><%# Eval("KtoAdd") %><b>, czas utworzenia: </b> <%#Eval("DataWpisu") %>    
                                     </td></tr>
                        <tr><td style="text-align:left">
                        <b>edytował: </b><%# Eval("KtoModify") %><b>, czas edycji: </b> <%#Eval("DataEdycji") %>
                        </td></tr>
                        </table>



                        <br /><br />  
                        <%# Eval("Notatka") %>
                        <br /><br />
            <!--przycisk edycja -->
                        <asp:LinkButton
                            Id="btnEdit"
                            Text="Edytuj wpis "
                            CommandName="Edit"
                            Runat="server" 
                            
                            BorderColor="#999999" BorderWidth="2" 
                            CausesValidation="True" Font-Bold="True" 
                            Font-Size="Large" BackColor="Silver" 
                            Font-Overline="True" Font-Underline="True" 
                            BorderStyle="Solid" ForeColor="black"/>
                            &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                            
            <!--przycisk kasowanie -->               
                        <asp:LinkButton
                            Id="lnkDelete"
                            Text="Usuń wpis"
                            CommandName="Delete"
                            OnClientClick="return confirm('Usunąć wpis?');"
                            Runat="server"

                            BackColor="Silver" 
                            BorderColor="#999999" BorderWidth="2" 
                            CausesValidation="True" Font-Bold="True" 
                            Font-Size="Large" 
                            Font-Overline="True" Font-Underline="True" 
                            BorderStyle="Solid" ForeColor="black"/>
                        </ItemTemplate>

            
                        <EditItemTemplate>
            <!--pobiera login zalogowanego użytkownika-->
                        <asp:Label
                            id="lblEntry"
                            Text='<%#User.Identity.Name %>'
                            AssociatedControlID="txtEntry"
                            Runat="server" />
                        

                        <br />    
                        <asp:TextBox
                            id="txtEntry"
                            Text='<%#Bind("Notatka") %>'
                            TextMode="MultiLine"
                            Columns="40"
                            Rows="8"
                            Runat="server" />
                        <br />
                        <asp:LinkButton
                            id="btnUpdate"
                            Text="Uaktualnij"
                            CommandName="Update"
                            Runat="server" 

                            BackColor="Silver" 
                            BorderColor="#999999" BorderWidth="2" 
                            CausesValidation="True" Font-Bold="True" 
                            Font-Size="Large" 
                            Font-Overline="True" Font-Underline="True" 
                            BorderStyle="Solid" ForeColor="black"/>
                        <asp:LinkButton
                            id="btnCancel"
                            Text="Anuluj edycję"
                            CommandName="Cancel"
                            Runat="server"
                            
                            BackColor="Silver" 
                            BorderColor="#999999" BorderWidth="2" 
                            CausesValidation="True" Font-Bold="True" 
                            Font-Size="Large" 
                            Font-Overline="True" Font-Underline="True" 
                            BorderStyle="Solid" ForeColor="black" /> 
                             
                        </EditItemTemplate>

                        <InsertItemTemplate>
                            
                        
                            
                            <br />
                        <asp:Label
                            id="lblEntry"
                            Text="dodaj wpis:"
                            AssociatedControlID="txtEntry"
                            Runat="server" />
                        <br />   
                        <asp:TextBox
                            id="txtEntry"
                            Text='<%#Bind("Notatka") %>'
                            TextMode="MultiLine"
                            Columns="40"
                            Rows="8"
                            Runat="server" />
                        <br />
                        <asp:Button
                            id="btnInsert"
                            Text="Wstaw"
                            CommandName="Insert"
                            Runat="server" 
                            
                            BackColor="Silver" 
                            BorderColor="#999999" BorderWidth="2" 
                            CausesValidation="True" Font-Bold="True" 
                            Font-Size="Large" 
                            Font-Overline="True" Font-Underline="True" 
                            BorderStyle="Solid" ForeColor="black"/>
                            <asp:Button
                            id="bAnuluj"
                            Text="Anuluj"
                            CommandName="Cancel"
                            Runat="server" 
                            
                            BackColor="Silver" 
                            BorderColor="#999999" BorderWidth="2" 
                            CausesValidation="True" Font-Bold="True" 
                            Font-Size="Large" 
                            Font-Overline="True" Font-Underline="True" 
                            BorderStyle="Solid" ForeColor="black"/>
                        </InsertItemTemplate>
                    </asp:FormView>

                    <asp:SqlDataSource
                        id="srcSchedule"
                        ConnectionString="<%$ ConnectionStrings:DaneUzytkownikow %>"
                        SelectCommand="SELECT Data, Notatka, KtoAdd,KtoModify,DataWpisu,DataEdycji FROM tblNotes WHERE Data=@Data "
                        InsertCommand="INSERT tblNotes (Data,Notatka,KtoAdd,DataWpisu) VALUES (@Data,@Notatka,@KtoAdd,@DataWpisu)"
                        UpdateCommand="UPDATE tblNotes SET Notatka=@Notatka,KtoModify=@KtoModify,DataEdycji=@DataEdycji WHERE Data=@Data"
                        DELETECommand="DELETE tblNotes WHERE Data=@Data"
                        Runat="server">
                    <SelectParameters>
                    <asp:ControlParameter 
                        Name="Data"
                        ControlID="calSchedule"
                        PropertyName="SelectedDate" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="Data" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter 
                            Name="Data"
                            ControlID="calSchedule"
                            PropertyName="SelectedDate" />        
                         <asp:Parameter Name="Notatka" />
                         <asp:FormParameter Name="KtoAdd" formfield="aduser" />
                        <asp:FormParameter Name="DataWpisu" FormField="godzina" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Notatka" />
                        <asp:Parameter Name="Data" />
                        <asp:FormParameter Name="KtoModify" formfield="aduser" />
                        <asp:FormParameter Name="DataEdycji" FormField="godzina" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                    <asp:Label
                        id="lbzalogowany"
                        text="Zalogowany jako :"
                        runat="server" BackColor="#bad4ee" ForeColor="#666666" />
                    <asp:textbox
                        id="aduser"
                        runat="server" ForeColor="#666666" 
                        ReadOnly="True" BackColor="#99FFCC" 
                        BorderColor="#99FFCC"  
                        BorderWidth="0px" Width="98px" />
                    
                    <asp:textbox
                        id="Godzina"
                        runat="server" ForeColor="#00FFFF" 
                        ReadOnly="True" BackColor="#00FFFF" 
                        BorderColor="#00FFFF"  
                        BorderWidth="0px" Width="98px" />
                    
                    
                    <asp:SqlDataSource
                    id="srcCalendar"
                    ConnectionString="<%$ ConnectionStrings:DaneUzytkownikow %>"
                    SelectCommand="SELECT Data FROM tblNotes"
                    Runat="server">
                </asp:SqlDataSource>

                <asp:SqlDataSource
                    id="srcUsers"
                    ConnectionString="<%$ ConnectionStrings:DaneUzytkownikow %>"
                    SelectCommand="SELECT Id, UserName FROM tblUsers"
                    Runat="server">
                </asp:SqlDataSource>


                    
                <asp:SqlDataSource ID="SqlDataSource1" 
                    ConnectionString="<%$ ConnectionStrings:DaneUzytkownikow %>" 
                    SelectCommand="SELECT [Godziny] FROM [tblGodziny]"
                    runat="server">

                </asp:SqlDataSource>
                </td>
                <td>


                    
                    <br />
                    </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
                </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="border-width: 0px 5px 5px 5px; border-style: none double double double; border-color: #3399FF; background-color:#bad4ee;"><br /><br /></td>
            
                
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td style="text-align:right">
                &copy;Copyright. All rights reserved</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    
        
    </div>
    </form>
</body>
</html>
    
