<%@ Page Title="" Language="C#" MasterPageFile="~/Layoout.Master" AutoEventWireup="true" CodeBehind="TraCuu.aspx.cs" Inherits="WebBanHoa.TraCuu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="NoiDung" runat="server">

    <h4> TRANG TRA CỨU </h4>

    <div class="form-inline mb-2">
        Giá bán từ: <asp:TextBox ID="txtGiaTu" CssClass="form-control" runat="server"></asp:TextBox>
      <asp:RequiredFieldValidator ID="rfvGiaTu" runat="server" ControlToValidate="txtGiaTu" 
          ErrorMessage="Chưa nhập giá từ" Text="(*)"></asp:RequiredFieldValidator>
        Giá đến: <asp:TextBox ID="txtGiaDen" CssClass="form-control" runat="server"></asp:TextBox>
      <asp:RequiredFieldValidator ID="rfvGiaDen" runat="server" ControlToValidate="txtGiaDen"
          ErrorMessage="Chưa nhập giá đến" Text="(*)"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="cvGia" runat="server" ErrorMessage="Giá đến lớn hơn giá từ"
            ControlToValidate="txtGiaDen" ControlToCompare="txtGiaTu" Operator="GreaterThanEqual" Type="Double"></asp:CompareValidator>
        <asp:Button ID="btnTraCuu" runat="server" Text="Tìm Kiếm" CssClass="btn btn-danger" />
        </div>

    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    <div class="row mt-2">
        <asp:Repeater ID="rptHoa" runat="server" DataSourceID="sdsHoaTheoGia">
              <ItemTemplate>
                  <div class="col-md-3 text-center mb-2">
                      <a href="#">
                          <img alt="" src="hinh_san_pham/<%# Eval("hinh") %>" style="width:100px" />
                      </a><br />

                      <%# Eval("TenHoa") %> <br />
                      Giá bán: <%# Eval("gia","0:#,##0} đồng") %> <br />
                      <asp:Button ID="btnAddToCard" runat="server" Text="AddToCard" CssClass="btn btn-danger" />
                  </div>
              </ItemTemplate>
        </asp:Repeater>
    </div>
    <asp:SqlDataSource ID="sdsHoaTheoGia" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HoaTuoiDBConnectionString %>" 
        SelectCommand="SELECT * FROM [Hoa] WHERE (([Gia] >= @Gia) AND ([Gia] <= @Gia2))">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtGiaTu" PropertyName="Text" Name="Gia" Type="Double"></asp:ControlParameter>
            <asp:ControlParameter ControlID="txtGiaDen" PropertyName="Text" Name="Gia2" Type="Double"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>



</asp:Content>
