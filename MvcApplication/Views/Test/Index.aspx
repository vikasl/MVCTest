<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<MvcApplication.ViewModel.TestViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">

</asp:Content>

<asp:Content ID="HeadContent" ContentPlaceHolderID= "HeadContent" runat ="server">
    <script src="../../Scripts/TestScript.js" type="text/javascript"></script>
    <script id="testWaitingTemplate" type="text/x-jquery-tmpl">
        <div class="gridMinimumHeight" style="width:100%;height:100%;background:white;background-image:url('../../Images/busy.gif');background-repeat:no-repeat;background-position:center center"></div>
    </script>

        <script id="testNoDataTemplate" type="text/x-jquery-tmpl">
        <div class="gridRow">There are no employees to Display.</div>
    </script>

	<script id="testGridTemplate" type="text/x-jquery-tmpl">
        <div class="gridRowContainer">
            <div class="gridRow testGridRow">
                <div class="gridRowItem gridColumnEmployeeName">
                    ${EmployeeName}
                </div>
                <div class="gridRowItem gridColumnAge">
                    ${Age}
                </div>
                <div class="gridRowItem gridColumnSalary">
                    ${Salary}
                </div>
                <div class="gridRowItem gridColumnIsManager">
                    {{if IsManager }}
                    <input type="checkbox" checked="checked" disabled="disabled" />
                    {{else}}
                    <input type="checkbox" disabled="disabled" />
                    {{/if}}
                </div>
                <div class="gridRowItem gridColumnCommands">
                    <a href="#" onclick='pecrPage.editRule(${Id}); return false;'>[ Edit ]</a>
                    <a href="#" onclick='pecrPage.copyRule(${Id}); return false;'>[ Copy ]</a>
                    <a href="#" onclick='pecrPage.deleteRule(${Id}); return false;'>[ Delete ]</a>
                </div>
                <div style="clear:both"></div>
            </div>
        </div>
    </script>


    <script type="text/javascript">

        $(document).ready(function () {

        testPage = new testHandler();

        // Initialize URL properties
        testPage.GetEmployeesUrl = '<%=Url.Action("GetEmployeeList","Test") %>';

        // Get Data
        testPage.getData();
    });


</script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

     <div class="gridHeaderRow gridMinimumWidth testGridRow" id="testGridHeaderContainer" style="overflow:hidden">
            <div class="gridHeaderRowItem gridColumnEmployeeName withBorder">Employee Name</div>
            <div class="gridHeaderRowItem gridColumnAge withBorder">Age </div>
            <div class="gridHeaderRowItem gridColumnSalary withBorder">Salary</div>
            <div class="gridHeaderRowItem gridColumnIsManager withBorder">IsManager</div>
            <%--<div style="clear:both"></div>--%>
    </div>
    <div id="testContent" class="gridData gridMinimumWidth gridMinimumHeight">
    </div>


</asp:Content>
