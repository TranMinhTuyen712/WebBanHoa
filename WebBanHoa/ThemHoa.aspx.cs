using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBanHoa
{
    public partial class ThemHoa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // lấy giá trị chuỗi kết nối trong wed.config
            string chuoi_ket_noi = ConfigurationManager.ConnectionStrings["HoaTuoiDBConnectionString"].ConnectionString;
            // tạo đối tượng Connection
            SqlConnection conn = new SqlConnection(chuoi_ket_noi);
            conn.Open();
            // tao cau sql de them ban tin
            string sql = "insert into Hoa(Tenhoa, Gia, Hinh,MaLoai,NgayDang,SoLuotXem)" +
                " values (@tenhoa, @gia, @hinh,@maloai,@ngaydang,@soluotxem)";
            SqlCommand cmd = new SqlCommand(sql, conn);
            // truyen gia tri cho cac tham so trong cau lenh sql
            cmd.Parameters.AddWithValue("@tenhoa", txtTenHoa.Text);
            cmd.Parameters.AddWithValue("@gia", txtGia.Text);
            if (FHinh.HasFile)
            {
                // xu ly upload hinh
                string duong_dan = Server.MapPath("~/Hinh_San_Pham/") + FHinh.FileName;
                FHinh.SaveAs(duong_dan);
                cmd.Parameters.AddWithValue("@hinh", FHinh.FileName);
            }
            else
            {
                cmd.Parameters.AddWithValue("@hinh", "no_image.png");
            }
            cmd.Parameters.AddWithValue("@ngaydang", txtNgayCapNhat.Text);
            cmd.Parameters.AddWithValue("@maloai", ddlLoai.SelectedValue);
            cmd.Parameters.AddWithValue("@soluotxem", 0);

            //thuc hien cau lenh truy van den CSDL
            if (cmd.ExecuteNonQuery() > 0)
                Response.Redirect("XemHoa.aspx");
            else
                lbThongbao.Text = "Thao tác thêm tin thất bại";

        }
    }
}
 