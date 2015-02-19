$(document).ready(function () {
    $("#cpAdmin_txtImageCode").autocomplete({
        source: function (request, response) {
            var param = { keyword: $('#cpAdmin_txtImageCode').val() };
            $.ajax({
                url: "ManageImages.aspx/GetImageCode",
                data: JSON.stringify(param),
                dataType: "json",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                dataFilter: function (data) { return data; },
                success: function (data) {
                    response($.map(data.d, function (item) {
                        return {
                            value: item
                        }
                    }))
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(textStatus);
                }
            });
        },
        select: function (event, ui) {
            if (ui.item) {
                //GetCustomerDetails(ui.item.value);
            }
        },
        minLength: 1
    });


});

$(document).ready(function () {
    $("#HeaderMenu_txtSearch").autocomplete({
        source: function (request, response) {
            var param = { keyword: $('#HeaderMenu_txtSearch').val() };
            $.ajax({
                url: "Default.aspx/GetImageCode",
                data: JSON.stringify(param),
                dataType: "json",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                dataFilter: function (data) { return data; },
                success: function (data) {
                    response($.map(data.d, function (item) {
                        return {
                            value: item
                        }
                    }))
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(textStatus);
                }
            });
        },
        select: function (event, ui) {
            if (ui.item) {
                //GetCustomerDetails(ui.item.value);
            }
        },
        minLength: 1
    });


});


$(document).ready(function () {
    $("#txtSearch").autocomplete({
        source: function (request, response) {
            var param = { keyword: $('#txtSearch').val() };
            $.ajax({
                url: "Default.aspx/GetImageCode",
                data: JSON.stringify(param),
                dataType: "json",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                dataFilter: function (data) { return data; },
                success: function (data) {
                    response($.map(data.d, function (item) {
                        return {
                            value: item
                        }
                    }))
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(textStatus);
                }
            });
        },
        select: function (event, ui) {
            if (ui.item) {
                //GetCustomerDetails(ui.item.value);
            }
        },
        minLength: 1
    });





    
});
