function testHandler() {



    this.EmployeeList = null;









    this.getData = function () {
        this.showWaiting($('div#rulesContent'));

        if (this.RuleRequest != null)
            this.RuleRequest.abort();

        this.RuleRequest = $.ajax({
            async: true,
            url: this.GetEmployeesUrl,
            context: this,
            success: function (data) {

                this.EmployeeList = data;
                this.displayEmployees(data);
            },
            failure: function (data) {
                alert(data);
            },
            type: 'POST',
            dataType: 'json'
        });

    }


    this.displayEmployees = function (data) {


        var targetDiv = $('div#testContent');

        // Clear out previous contents
        targetDiv.html('');

        // If there are no data rows display a message
        if (data.length == 0) {
            $('#TestNoDataTemplate').tmpl(null).appendTo(targetDiv);
            return;
        }

        for (var i = 0; i < data.length; i++) {
            var currentDataItem = data[i];

            // use the patient finder template and display this data
            $('#testGridTemplate').tmpl(currentDataItem).appendTo(targetDiv);

            // apply alternate row styling
            targetDiv.find('.gridRowContainer:odd').addClass('alternateRow');
        }
    


    }





    /**********************************************************************************
    ***********************************************************************************
    ***********************************************************************************
    Utility Methods
    ***********************************************************************************
    ***********************************************************************************
    **********************************************************************************/
    this.showWaiting = function (targetDiv) {
        // Clear out previous contents
        targetDiv.html('');
        $('#testWaitingTemplate').tmpl(null).appendTo(targetDiv);
    }


















}