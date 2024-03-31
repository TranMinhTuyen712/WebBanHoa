<%@ Page Title="" Language="C#" MasterPageFile="~/Layoout.Master" AutoEventWireup="true" CodeBehind="ThemHoa.aspx.cs" Inherits="WebBanHoa.ThemHoa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NoiDung" runat="server">

            <h2 class="text-center">Thêm mới sản phẩm</h2>
        <hr />

        <div class="row mt-3 mb-2">
            <div class="col-md-2">
                Danh mục
            </div>
        <div class="col-md-10">
            <asp:DropDownList ID="ddlLoai" runat="server" CssClass="form-control" DataSourceID="dsloai" DataTextField="TenLoai" DataValueField="MaLoai"></asp:DropDownList>
    </div>
</div>
            <div class="row mt-3 mb-2">
            <div class="col-md-2">
                Tên Hoa
            </div>
        <div class="col-md-10">
             <asp:TextBox ID="txtTenHoa" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
    </div>
</div>
                <div class="row mt-3 mb-2">
            <div class="col-md-2">
                Gia
            </div>
        <div class="col-md-10">
            <asp:TextBox ID="txtGia"  runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
    </div>
</div>
                    <div class="row mt-3 mb-2">
            <div class="col-md-2">
                Ngày cập nhật
            </div>
        <div class="col-md-10">
            <asp:TextBox ID="txtNgayCapNhat" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
    </div>
</div>
            <div class="row mb-2">
            <div class="col-2">
                Hình
            </div>
        <div class="col-8">
            <asp:FileUpload ID="FHinh" runat="server" CssClass="form-control" />
    </div>
</div>
                <div class="row mb-2">
                <div class="col-2">
                    <asp:Button ID="btnThem" runat="server" Text="Thêm" />
                    <asp:Label ID="lbThongbao" runat="server"></asp:Label>

                <asp:SqlDataSource ID="dsloai" runat="server" ConnectionString="<%$ ConnectionStrings:HoaTuoiDBConnectionString %>" SelectCommand="SELECT * FROM [Loai]"></asp:SqlDataSource>
        </div>
</div>

</asp:Content>
