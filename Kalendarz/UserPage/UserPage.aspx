<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserPage.aspx.cs" MasterPageFile="~/MasterPage/Kalendarz.master" Inherits="Kalendarz.UserPage.UserPage" %>



<asp:Content 
    ID="Content1" 
    ContentPlaceHolderID="ContentPlaceHolder1" 
    Runat="Server">

    <div>
        <table style="width:auto; background-color: #bad4ee; text-align:center">
            <tr>
                <td style="background-color: #bad4ee; width:20px">
                    
                </td>
                <td style="background-color: #bad4ee; "></td>
                <td style="background-color: #bad4ee">
                    &nbsp;</td>
            </tr>
            <tr>
                <td></td>
                <td class="auto-style3;" style="vertical-align:top; width: 425px">
                    <asp:Calendar 
                        ID="calSchedule" OnDayRender="calSchedule_DayRender" 
                        runat="server" BackColor="White" BorderColor="#3366CC" 
                        BorderWidth="1px" CellPadding="1" 
                        Font-Names="Segoe Print" Font-Size="small" ForeColor="#003399" 
                        Height="250px" Width="400px" SelectionMode="DayWeekMonth" Font-Bold="True" 
                        CellSpacing="1" ShowGridLines="True" 
                        NextPrevFormat="FullMonth" >

                        <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                        <NextPrevStyle Font-Size="10pt" ForeColor="#CCCCFF" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                        <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                        <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                        <WeekendDayStyle BackColor="#3399FF" />
                    </asp:Calendar>

                    <asp:FormView
                        id="frmSchedule"
                        AllowPaging="False"  
                        DataKeyNames="Data"
                        DataSourceID="srcSchedule"
                        Runat="server" 
                        BackColor="#badeee" Width="600px" >
                        
            

                        <EmptyDataTemplate>
                           <h3> <%# calSchedule.SelectedDate.ToString("d MMMM yyyy") %></h3>
                            <h4>Brak wpisów</h4>
                        
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
            
                            
            
                        </ItemTemplate>

            
                        

                        
                    </asp:FormView>



                     <asp:SqlDataSource
                        id="srcSchedule"
                        ConnectionString="<%$ ConnectionStrings:DaneUzytkownikow %>"
                        SelectCommand="SELECT Data, Notatka, KtoAdd,KtoModify,DataWpisu,DataEdycji FROM tblNotes WHERE Data=@Data "
                        Runat="server">

                    <SelectParameters>
                    <asp:ControlParameter 
                        Name="Data"
                        ControlID="calSchedule"
                        PropertyName="SelectedDate" />
                    </SelectParameters>
                    
                    </asp:SqlDataSource>
                    
                    
                <asp:SqlDataSource
                    id="srcCalendar"
                    ConnectionString="<%$ ConnectionStrings:DaneUzytkownikow %>"
                    SelectCommand="SELECT Data FROM tblNotes"
                    Runat="server">
                </asp:SqlDataSource>


                    
                    
                </td>
                <td style="text-align:left; vertical-align:top">

                    <asp:Button ID="bTydzien" Text="pokaż tydzień" runat="server" OnClick="bTydzien_Click" />
                    
                    <asp:BulletedList
                        id="bltResults"
                        DataTextFormatString="{0:d}"
                        Runat="server" />


                    
                    <br />
                    </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td style="width: 600px"></td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </div>
   </asp:Content>