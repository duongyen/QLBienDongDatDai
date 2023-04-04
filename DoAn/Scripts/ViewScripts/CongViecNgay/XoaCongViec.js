
function XoaCongViecGiaoTrucTiep() {

	if (lstSelectedRow.length > 1) {
		alert("Không được xóa nhiều công việc");
	}
	else if (lstSelectedRow.length == 0) {
		alert("Không có công việc nào được chọn");
	}
	else if (!!lstSelectedRow[0].XacNhanGiaoViec) {
		alert("Công việc này đã được người giao việc xác nhận, không thể xóa");
	}
	else if (lstSelectedRow[0].IdTrangThaiCongViec != 2) {
		alert("Công việc này đã được thực hiện, không thể xóa");
	}
	else {
		if (confirm("Bạn có muốn xóa công việc này?")) {

			$.ajax({
				type: "POST",
				url: "/ProductDevelopment/QuanLyCongViecNgay/XoaCongViecGiaoTrucTiep",
				data: "{ Guid: '" + lstSelectedRow[0].GUID + "' }",
				async: false,
				dataType: "json",
				contentType: "application/json; charset=utf-8",
				success: function (data) {
					if (data.State == 0) {
						alert("Xóa công việc thành công");
						reLoad();
					}
					else {
						alert(data.Message);
					}
				},
				error: function (data) {
					alert("Xóa thất bại", data.Message);
				}
			});
		}
	}
}
