function XoaBaoCao() {
	if (confirm("Bạn có muốn xóa báo cáo công việc này???")) {

		var IdBaoCao = $("#hIdBaoCao").val();
		$.ajax({
			type: "POST",
			url: "/ProductDevelopment/BaoCaoCongViecNgay/XoaBaoCao",//make sure url exist
			data: "{ IdBaoCao: '" + IdBaoCao + "' }",
			async: false,
			dataType: "json",
			contentType: "application/json; charset=utf-8",
			success: function (data) {
				if (data.State == 0) {
					alert("Xóa báo cáo thành công");
					var datepicker = $("#datepicker").data("kendoDatePicker");
					reloadTimeline(kendo.toString(datepicker.value(), 'dd/MM/yyyy'));
					$("#window").data("kendoWindow").close();
				}
				else {
					alert("Xóa báo cáo không thành công");
				}
			},
			error: function (data) {
				alert("Xóa báo cáo không thành công", data.Message);
			}
		});
	}

}
