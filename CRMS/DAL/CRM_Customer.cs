using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using XHD.DBUtility;//Please add references
namespace XHD.DAL
{
	/// <summary>
	/// ���ݷ�����:CRM_Customer
	/// </summary>
	public partial class CRM_Customer
	{
		public CRM_Customer()
		{}
		#region  Method

		/// <summary>
		/// �õ����ID
		/// </summary>
		public int GetMaxId()
		{
		return DbHelperSQL.GetMaxID("id", "CRM_Customer"); 
		}

		/// <summary>
		/// �Ƿ���ڸü�¼
		/// </summary>
		public bool Exists(int id)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) from CRM_Customer");
			strSql.Append(" where id=@id ");
			SqlParameter[] parameters = {
					new SqlParameter("@id", SqlDbType.Int,4)};
			parameters[0].Value = id;

			return DbHelperSQL.Exists(strSql.ToString(),parameters);
		}


		/// <summary>
		/// ����һ������
		/// </summary>
		public int Add(XHD.Model.CRM_Customer model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into CRM_Customer(");
			strSql.Append("Serialnumber,Customer,address,tel,fax,site,industry,Provinces_id,Provinces,City_id,City,CustomerType_id,CustomerType,CustomerLevel_id,CustomerLevel,CustomerSource_id,CustomerSource,DesCripe,Remarks,Department_id,Department,Employee_id,Employee,privatecustomer,lastfollow,Create_id,Create_name,Create_date,isDelete,Delete_time)");
			strSql.Append(" values (");
			strSql.Append("@Serialnumber,@Customer,@address,@tel,@fax,@site,@industry,@Provinces_id,@Provinces,@City_id,@City,@CustomerType_id,@CustomerType,@CustomerLevel_id,@CustomerLevel,@CustomerSource_id,@CustomerSource,@DesCripe,@Remarks,@Department_id,@Department,@Employee_id,@Employee,@privatecustomer,@lastfollow,@Create_id,@Create_name,@Create_date,@isDelete,@Delete_time)");
			strSql.Append(";select @@IDENTITY");
			SqlParameter[] parameters = {
					new SqlParameter("@Serialnumber", SqlDbType.VarChar,250),
					new SqlParameter("@Customer", SqlDbType.VarChar,250),
					new SqlParameter("@address", SqlDbType.VarChar,250),
					new SqlParameter("@tel", SqlDbType.VarChar,250),
					new SqlParameter("@fax", SqlDbType.VarChar,250),
					new SqlParameter("@site", SqlDbType.VarChar,250),
					new SqlParameter("@industry", SqlDbType.VarChar,250),
					new SqlParameter("@Provinces_id", SqlDbType.Int,4),
					new SqlParameter("@Provinces", SqlDbType.VarChar,250),
					new SqlParameter("@City_id", SqlDbType.Int,4),
					new SqlParameter("@City", SqlDbType.VarChar,250),
					new SqlParameter("@CustomerType_id", SqlDbType.Int,4),
					new SqlParameter("@CustomerType", SqlDbType.VarChar,250),
					new SqlParameter("@CustomerLevel_id", SqlDbType.Int,4),
					new SqlParameter("@CustomerLevel", SqlDbType.VarChar,250),
					new SqlParameter("@CustomerSource_id", SqlDbType.Int,4),
					new SqlParameter("@CustomerSource", SqlDbType.VarChar,250),
					new SqlParameter("@DesCripe", SqlDbType.VarChar,4000),
					new SqlParameter("@Remarks", SqlDbType.VarChar,4000),
					new SqlParameter("@Department_id", SqlDbType.Int,4),
					new SqlParameter("@Department", SqlDbType.VarChar,250),
					new SqlParameter("@Employee_id", SqlDbType.Int,4),
					new SqlParameter("@Employee", SqlDbType.VarChar,250),
					new SqlParameter("@privatecustomer", SqlDbType.VarChar,50),
					new SqlParameter("@lastfollow", SqlDbType.DateTime),
					new SqlParameter("@Create_id", SqlDbType.Int,4),
					new SqlParameter("@Create_name", SqlDbType.VarChar,250),
					new SqlParameter("@Create_date", SqlDbType.DateTime),
					new SqlParameter("@isDelete", SqlDbType.Int,4),
					new SqlParameter("@Delete_time", SqlDbType.DateTime)};
			parameters[0].Value = model.Serialnumber;
			parameters[1].Value = model.Customer;
			parameters[2].Value = model.address;
			parameters[3].Value = model.tel;
			parameters[4].Value = model.fax;
			parameters[5].Value = model.site;
			parameters[6].Value = model.industry;
			parameters[7].Value = model.Provinces_id;
			parameters[8].Value = model.Provinces;
			parameters[9].Value = model.City_id;
			parameters[10].Value = model.City;
			parameters[11].Value = model.CustomerType_id;
			parameters[12].Value = model.CustomerType;
			parameters[13].Value = model.CustomerLevel_id;
			parameters[14].Value = model.CustomerLevel;
			parameters[15].Value = model.CustomerSource_id;
			parameters[16].Value = model.CustomerSource;
			parameters[17].Value = model.DesCripe;
			parameters[18].Value = model.Remarks;
			parameters[19].Value = model.Department_id;
			parameters[20].Value = model.Department;
			parameters[21].Value = model.Employee_id;
			parameters[22].Value = model.Employee;
			parameters[23].Value = model.privatecustomer;
			parameters[24].Value = model.lastfollow;
			parameters[25].Value = model.Create_id;
			parameters[26].Value = model.Create_name;
			parameters[27].Value = model.Create_date;
			parameters[28].Value = model.isDelete;
			parameters[29].Value = model.Delete_time;

			object obj = DbHelperSQL.GetSingle(strSql.ToString(),parameters);
			if (obj == null)
			{
				return 0;
			}
			else
			{
				return Convert.ToInt32(obj);
			}
		}
		/// <summary>
		/// ����һ������
		/// </summary>
		public bool Update(XHD.Model.CRM_Customer model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update CRM_Customer set ");
			strSql.Append("Serialnumber=@Serialnumber,");
			strSql.Append("Customer=@Customer,");
			strSql.Append("address=@address,");
			strSql.Append("tel=@tel,");
			strSql.Append("fax=@fax,");
			strSql.Append("site=@site,");
			strSql.Append("industry=@industry,");
			strSql.Append("Provinces_id=@Provinces_id,");
			strSql.Append("Provinces=@Provinces,");
			strSql.Append("City_id=@City_id,");
			strSql.Append("City=@City,");
			strSql.Append("CustomerType_id=@CustomerType_id,");
			strSql.Append("CustomerType=@CustomerType,");
			strSql.Append("CustomerLevel_id=@CustomerLevel_id,");
			strSql.Append("CustomerLevel=@CustomerLevel,");
			strSql.Append("CustomerSource_id=@CustomerSource_id,");
			strSql.Append("CustomerSource=@CustomerSource,");
			strSql.Append("DesCripe=@DesCripe,");
			strSql.Append("Remarks=@Remarks,");
			strSql.Append("Department_id=@Department_id,");
			strSql.Append("Department=@Department,");
			strSql.Append("Employee_id=@Employee_id,");
			strSql.Append("Employee=@Employee,");
			strSql.Append("privatecustomer=@privatecustomer,");
			strSql.Append("lastfollow=@lastfollow,");
			strSql.Append("Create_id=@Create_id,");
			strSql.Append("Create_name=@Create_name,");
			strSql.Append("Create_date=@Create_date,");
			strSql.Append("isDelete=@isDelete,");
			strSql.Append("Delete_time=@Delete_time");
			strSql.Append(" where id=@id");
			SqlParameter[] parameters = {
					new SqlParameter("@Serialnumber", SqlDbType.VarChar,250),
					new SqlParameter("@Customer", SqlDbType.VarChar,250),
					new SqlParameter("@address", SqlDbType.VarChar,250),
					new SqlParameter("@tel", SqlDbType.VarChar,250),
					new SqlParameter("@fax", SqlDbType.VarChar,250),
					new SqlParameter("@site", SqlDbType.VarChar,250),
					new SqlParameter("@industry", SqlDbType.VarChar,250),
					new SqlParameter("@Provinces_id", SqlDbType.Int,4),
					new SqlParameter("@Provinces", SqlDbType.VarChar,250),
					new SqlParameter("@City_id", SqlDbType.Int,4),
					new SqlParameter("@City", SqlDbType.VarChar,250),
					new SqlParameter("@CustomerType_id", SqlDbType.Int,4),
					new SqlParameter("@CustomerType", SqlDbType.VarChar,250),
					new SqlParameter("@CustomerLevel_id", SqlDbType.Int,4),
					new SqlParameter("@CustomerLevel", SqlDbType.VarChar,250),
					new SqlParameter("@CustomerSource_id", SqlDbType.Int,4),
					new SqlParameter("@CustomerSource", SqlDbType.VarChar,250),
					new SqlParameter("@DesCripe", SqlDbType.VarChar,4000),
					new SqlParameter("@Remarks", SqlDbType.VarChar,4000),
					new SqlParameter("@Department_id", SqlDbType.Int,4),
					new SqlParameter("@Department", SqlDbType.VarChar,250),
					new SqlParameter("@Employee_id", SqlDbType.Int,4),
					new SqlParameter("@Employee", SqlDbType.VarChar,250),
					new SqlParameter("@privatecustomer", SqlDbType.VarChar,50),
					new SqlParameter("@lastfollow", SqlDbType.DateTime),
					new SqlParameter("@Create_id", SqlDbType.Int,4),
					new SqlParameter("@Create_name", SqlDbType.VarChar,250),
					new SqlParameter("@Create_date", SqlDbType.DateTime),
					new SqlParameter("@isDelete", SqlDbType.Int,4),
					new SqlParameter("@Delete_time", SqlDbType.DateTime),
					new SqlParameter("@id", SqlDbType.Int,4)};
			parameters[0].Value = model.Serialnumber;
			parameters[1].Value = model.Customer;
			parameters[2].Value = model.address;
			parameters[3].Value = model.tel;
			parameters[4].Value = model.fax;
			parameters[5].Value = model.site;
			parameters[6].Value = model.industry;
			parameters[7].Value = model.Provinces_id;
			parameters[8].Value = model.Provinces;
			parameters[9].Value = model.City_id;
			parameters[10].Value = model.City;
			parameters[11].Value = model.CustomerType_id;
			parameters[12].Value = model.CustomerType;
			parameters[13].Value = model.CustomerLevel_id;
			parameters[14].Value = model.CustomerLevel;
			parameters[15].Value = model.CustomerSource_id;
			parameters[16].Value = model.CustomerSource;
			parameters[17].Value = model.DesCripe;
			parameters[18].Value = model.Remarks;
			parameters[19].Value = model.Department_id;
			parameters[20].Value = model.Department;
			parameters[21].Value = model.Employee_id;
			parameters[22].Value = model.Employee;
			parameters[23].Value = model.privatecustomer;
			parameters[24].Value = model.lastfollow;
			parameters[25].Value = model.Create_id;
			parameters[26].Value = model.Create_name;
			parameters[27].Value = model.Create_date;
			parameters[28].Value = model.isDelete;
			parameters[29].Value = model.Delete_time;
			parameters[30].Value = model.id;

			int rows=DbHelperSQL.ExecuteSql(strSql.ToString(),parameters);
			if (rows > 0)
			{
				return true;
			}
			else
			{
				return false;
			}
		}

		/// <summary>
		/// Ԥɾ��
		/// </summary>
		public bool AdvanceDelete(int id, int isDelete, string time)
		{
			StringBuilder strSql = new StringBuilder();
			strSql.Append("update CRM_Customer set ");
			strSql.Append("isDelete=" + isDelete);
			strSql.Append(",Delete_time='" + time + "'");
			strSql.Append(" where id=" + id);
			int rows = DbHelperSQL.ExecuteSql(strSql.ToString());
			if (rows > 0)
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		/// <summary>
		/// ɾ��һ������
		/// </summary>
		public bool Delete(int id)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from CRM_Customer ");
			strSql.Append(" where id=@id");
			SqlParameter[] parameters = {
					new SqlParameter("@id", SqlDbType.Int,4)
};
			parameters[0].Value = id;

			int rows=DbHelperSQL.ExecuteSql(strSql.ToString(),parameters);
			if (rows > 0)
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		/// <summary>
		/// ɾ��һ������
		/// </summary>
		public bool DeleteList(string idlist )
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from CRM_Customer ");
			strSql.Append(" where id in ("+idlist + ")  ");
			int rows=DbHelperSQL.ExecuteSql(strSql.ToString());
			if (rows > 0)
			{
				return true;
			}
			else
			{
				return false;
			}
		}


		/// <summary>
		/// �õ�һ������ʵ��
		/// </summary>
		public XHD.Model.CRM_Customer GetModel(int id)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select  top 1 id,Serialnumber,Customer,address,tel,fax,site,industry,Provinces_id,Provinces,City_id,City,CustomerType_id,CustomerType,CustomerLevel_id,CustomerLevel,CustomerSource_id,CustomerSource,DesCripe,Remarks,Department_id,Department,Employee_id,Employee,privatecustomer,lastfollow,Create_id,Create_name,Create_date,isDelete,Delete_time from CRM_Customer ");
			strSql.Append(" where id=@id");
			SqlParameter[] parameters = {
					new SqlParameter("@id", SqlDbType.Int,4)
};
			parameters[0].Value = id;

			XHD.Model.CRM_Customer model=new XHD.Model.CRM_Customer();
			DataSet ds=DbHelperSQL.Query(strSql.ToString(),parameters);
			if(ds.Tables[0].Rows.Count>0)
			{
				if(ds.Tables[0].Rows[0]["id"]!=null && ds.Tables[0].Rows[0]["id"].ToString()!="")
				{
					model.id=int.Parse(ds.Tables[0].Rows[0]["id"].ToString());
				}
				if(ds.Tables[0].Rows[0]["Serialnumber"]!=null && ds.Tables[0].Rows[0]["Serialnumber"].ToString()!="")
				{
					model.Serialnumber=ds.Tables[0].Rows[0]["Serialnumber"].ToString();
				}
				if(ds.Tables[0].Rows[0]["Customer"]!=null && ds.Tables[0].Rows[0]["Customer"].ToString()!="")
				{
					model.Customer=ds.Tables[0].Rows[0]["Customer"].ToString();
				}
				if(ds.Tables[0].Rows[0]["address"]!=null && ds.Tables[0].Rows[0]["address"].ToString()!="")
				{
					model.address=ds.Tables[0].Rows[0]["address"].ToString();
				}
				if(ds.Tables[0].Rows[0]["tel"]!=null && ds.Tables[0].Rows[0]["tel"].ToString()!="")
				{
					model.tel=ds.Tables[0].Rows[0]["tel"].ToString();
				}
				if(ds.Tables[0].Rows[0]["fax"]!=null && ds.Tables[0].Rows[0]["fax"].ToString()!="")
				{
					model.fax=ds.Tables[0].Rows[0]["fax"].ToString();
				}
				if(ds.Tables[0].Rows[0]["site"]!=null && ds.Tables[0].Rows[0]["site"].ToString()!="")
				{
					model.site=ds.Tables[0].Rows[0]["site"].ToString();
				}
				if(ds.Tables[0].Rows[0]["industry"]!=null && ds.Tables[0].Rows[0]["industry"].ToString()!="")
				{
					model.industry=ds.Tables[0].Rows[0]["industry"].ToString();
				}
				if(ds.Tables[0].Rows[0]["Provinces_id"]!=null && ds.Tables[0].Rows[0]["Provinces_id"].ToString()!="")
				{
					model.Provinces_id=int.Parse(ds.Tables[0].Rows[0]["Provinces_id"].ToString());
				}
				if(ds.Tables[0].Rows[0]["Provinces"]!=null && ds.Tables[0].Rows[0]["Provinces"].ToString()!="")
				{
					model.Provinces=ds.Tables[0].Rows[0]["Provinces"].ToString();
				}
				if(ds.Tables[0].Rows[0]["City_id"]!=null && ds.Tables[0].Rows[0]["City_id"].ToString()!="")
				{
					model.City_id=int.Parse(ds.Tables[0].Rows[0]["City_id"].ToString());
				}
				if(ds.Tables[0].Rows[0]["City"]!=null && ds.Tables[0].Rows[0]["City"].ToString()!="")
				{
					model.City=ds.Tables[0].Rows[0]["City"].ToString();
				}
				if(ds.Tables[0].Rows[0]["CustomerType_id"]!=null && ds.Tables[0].Rows[0]["CustomerType_id"].ToString()!="")
				{
					model.CustomerType_id=int.Parse(ds.Tables[0].Rows[0]["CustomerType_id"].ToString());
				}
				if(ds.Tables[0].Rows[0]["CustomerType"]!=null && ds.Tables[0].Rows[0]["CustomerType"].ToString()!="")
				{
					model.CustomerType=ds.Tables[0].Rows[0]["CustomerType"].ToString();
				}
				if(ds.Tables[0].Rows[0]["CustomerLevel_id"]!=null && ds.Tables[0].Rows[0]["CustomerLevel_id"].ToString()!="")
				{
					model.CustomerLevel_id=int.Parse(ds.Tables[0].Rows[0]["CustomerLevel_id"].ToString());
				}
				if(ds.Tables[0].Rows[0]["CustomerLevel"]!=null && ds.Tables[0].Rows[0]["CustomerLevel"].ToString()!="")
				{
					model.CustomerLevel=ds.Tables[0].Rows[0]["CustomerLevel"].ToString();
				}
				if(ds.Tables[0].Rows[0]["CustomerSource_id"]!=null && ds.Tables[0].Rows[0]["CustomerSource_id"].ToString()!="")
				{
					model.CustomerSource_id=int.Parse(ds.Tables[0].Rows[0]["CustomerSource_id"].ToString());
				}
				if(ds.Tables[0].Rows[0]["CustomerSource"]!=null && ds.Tables[0].Rows[0]["CustomerSource"].ToString()!="")
				{
					model.CustomerSource=ds.Tables[0].Rows[0]["CustomerSource"].ToString();
				}
				if(ds.Tables[0].Rows[0]["DesCripe"]!=null && ds.Tables[0].Rows[0]["DesCripe"].ToString()!="")
				{
					model.DesCripe=ds.Tables[0].Rows[0]["DesCripe"].ToString();
				}
				if(ds.Tables[0].Rows[0]["Remarks"]!=null && ds.Tables[0].Rows[0]["Remarks"].ToString()!="")
				{
					model.Remarks=ds.Tables[0].Rows[0]["Remarks"].ToString();
				}
				if(ds.Tables[0].Rows[0]["Department_id"]!=null && ds.Tables[0].Rows[0]["Department_id"].ToString()!="")
				{
					model.Department_id=int.Parse(ds.Tables[0].Rows[0]["Department_id"].ToString());
				}
				if(ds.Tables[0].Rows[0]["Department"]!=null && ds.Tables[0].Rows[0]["Department"].ToString()!="")
				{
					model.Department=ds.Tables[0].Rows[0]["Department"].ToString();
				}
				if(ds.Tables[0].Rows[0]["Employee_id"]!=null && ds.Tables[0].Rows[0]["Employee_id"].ToString()!="")
				{
					model.Employee_id=int.Parse(ds.Tables[0].Rows[0]["Employee_id"].ToString());
				}
				if(ds.Tables[0].Rows[0]["Employee"]!=null && ds.Tables[0].Rows[0]["Employee"].ToString()!="")
				{
					model.Employee=ds.Tables[0].Rows[0]["Employee"].ToString();
				}
				if(ds.Tables[0].Rows[0]["privatecustomer"]!=null && ds.Tables[0].Rows[0]["privatecustomer"].ToString()!="")
				{
					model.privatecustomer=ds.Tables[0].Rows[0]["privatecustomer"].ToString();
				}
				if(ds.Tables[0].Rows[0]["lastfollow"]!=null && ds.Tables[0].Rows[0]["lastfollow"].ToString()!="")
				{
					model.lastfollow=DateTime.Parse(ds.Tables[0].Rows[0]["lastfollow"].ToString());
				}
				if(ds.Tables[0].Rows[0]["Create_id"]!=null && ds.Tables[0].Rows[0]["Create_id"].ToString()!="")
				{
					model.Create_id=int.Parse(ds.Tables[0].Rows[0]["Create_id"].ToString());
				}
				if(ds.Tables[0].Rows[0]["Create_name"]!=null && ds.Tables[0].Rows[0]["Create_name"].ToString()!="")
				{
					model.Create_name=ds.Tables[0].Rows[0]["Create_name"].ToString();
				}
				if(ds.Tables[0].Rows[0]["Create_date"]!=null && ds.Tables[0].Rows[0]["Create_date"].ToString()!="")
				{
					model.Create_date=DateTime.Parse(ds.Tables[0].Rows[0]["Create_date"].ToString());
				}
				if(ds.Tables[0].Rows[0]["isDelete"]!=null && ds.Tables[0].Rows[0]["isDelete"].ToString()!="")
				{
					model.isDelete=int.Parse(ds.Tables[0].Rows[0]["isDelete"].ToString());
				}
				if(ds.Tables[0].Rows[0]["Delete_time"]!=null && ds.Tables[0].Rows[0]["Delete_time"].ToString()!="")
				{
					model.Delete_time=DateTime.Parse(ds.Tables[0].Rows[0]["Delete_time"].ToString());
				}
				return model;
			}
			else
			{
				return null;
			}
		}

		/// <summary>
		/// ��������б�
		/// </summary>
		public DataSet GetList(string strWhere)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select id,Serialnumber,Customer,address,tel,fax,site,industry,Provinces_id,Provinces,City_id,City,CustomerType_id,CustomerType,CustomerLevel_id,CustomerLevel,CustomerSource_id,CustomerSource,DesCripe,Remarks,Department_id,Department,Employee_id,Employee,privatecustomer,lastfollow,Create_id,Create_name,Create_date,isDelete,Delete_time ");
			strSql.Append(" FROM CRM_Customer ");
			if(strWhere.Trim()!="")
			{
				strSql.Append(" where "+strWhere);
			}
			return DbHelperSQL.Query(strSql.ToString());
		}

		/// <summary>
		/// ���ǰ��������
		/// </summary>
		public DataSet GetList(int Top,string strWhere,string filedOrder)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select ");
			if(Top>0)
			{
				strSql.Append(" top "+Top.ToString());
			}
			strSql.Append(" id,Serialnumber,Customer,address,tel,fax,site,industry,Provinces_id,Provinces,City_id,City,CustomerType_id,CustomerType,CustomerLevel_id,CustomerLevel,CustomerSource_id,CustomerSource,DesCripe,Remarks,Department_id,Department,Employee_id,Employee,privatecustomer,lastfollow,Create_id,Create_name,Create_date,isDelete,Delete_time ");
			strSql.Append(" FROM CRM_Customer ");
			if(strWhere.Trim()!="")
			{
				strSql.Append(" where "+strWhere);
			}
			strSql.Append(" order by " + filedOrder);
			return DbHelperSQL.Query(strSql.ToString());
		}

		/// <summary>
		/// ��ҳ��ȡ�����б�
		/// </summary>
		public DataSet GetList(int PageSize, int PageIndex, string strWhere, string filedOrder, out string Total)
		{
			StringBuilder strSql = new StringBuilder();
			StringBuilder strSql1 = new StringBuilder();
			strSql.Append("select ");
			strSql.Append(" top " + PageSize + " * FROM CRM_Customer ");
			strSql.Append(" WHERE id not in ( SELECT top " + (PageIndex - 1) * PageSize + " id FROM CRM_Customer ");
			strSql.Append(" where " + strWhere + " order by " + filedOrder + " ) ");
			strSql1.Append(" select count(id) FROM CRM_Customer ");
			if (strWhere.Trim() != "")
			{
			    strSql.Append(" and " + strWhere);
			    strSql1.Append(" where " + strWhere);
			}
			strSql.Append(" order by " + filedOrder);
			Total = DbHelperSQL.Query(strSql1.ToString()).Tables[0].Rows[0][0].ToString();
			return DbHelperSQL.Query(strSql.ToString());
		}
        /// <summary>
        /// ����������
        /// </summary>
        public bool UpdateLastFollow(string id)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("update CRM_Customer set ");
            strSql.Append("[lastfollow] = isnull((select max(Follow_date) as Followdate from dbo.CRM_Follow where CRM_Customer.id=CRM_Follow.Customer_id),Create_date)");
            strSql.Append(" where CRM_Customer.id=" + id);

            int rows = DbHelperSQL.ExecuteSql(strSql.ToString());
            if (rows > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public DataSet Reports_year(string items, int year, string where)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("if OBJECT_ID('Tempdb..#t') is not null ");
            strSql.Append("    drop TABLE  #t ");
            //strSql.Append("go");
            strSql.Append(" begin ");
            //strSql.Append("    --Ԥͳ�Ʊ� #t");
            strSql.Append("    select ");
            strSql.Append("        " + items + ",'m'+convert(varchar,month(Create_date)) mm,count(id)tNum into #t ");
            strSql.Append("    from dbo.CRM_Customer ");
            strSql.Append("    where datediff(YEAR,[Create_date],'" + year + "-1-1')=0 ");
            if (where.Trim() != "")
            {
                strSql.Append(" and " + where);
            }
            strSql.Append("    group by " + items + ",'m'+convert(varchar,month(Create_date)) ");

            //strSql.Append("    --����SQL");
            strSql.Append("    declare @sql varchar(8000) ");
            strSql.Append("    set @sql='select " + items + " items ' ");
            strSql.Append("    select @sql = @sql + ',sum(case mm when ' + char(39) +mm+ char(39) + ' then tNum else 0 end) ['+ mm +']' ");
            strSql.Append("        from (select distinct mm from #t)as data ");
            strSql.Append("    set @sql = @sql + ' from #t group by " + items + "' ");

            strSql.Append("    exec(@sql) ");
            strSql.Append(" end ");
            //strSql.Append("go");

            return DbHelperSQL.Query(strSql.ToString());
        }


        /// <summary>
        /// ͬ�Ȼ��ȡ��ͻ�������
        /// </summary>
        /// <param name="dt1"></param>
        /// <param name="dt2"></param>
        /// <returns></returns>
        public DataSet Compared(DateTime dt1, DateTime dt2)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(" select count(id) as yy,");
            strSql.Append(" SUM(case when YEAR( Create_date)=YEAR('" + dt1 + "') and MONTH(Create_date)=month('" + dt1 + "') then 1 else 0 end) as dt1, ");
            strSql.Append(" SUM(case when YEAR( Create_date)=YEAR('" + dt2 + "') and MONTH(Create_date)=month('" + dt2 + "') then 1 else 0 end) as dt2 ");
            strSql.Append(" FROM CRM_Customer");

            return DbHelperSQL.Query(strSql.ToString());
        }

        /// <summary>
        /// �ͻ����͡�ͬ�Ȼ��ȡ�
        /// </summary>
        /// <param name="dt1"></param>
        /// <param name="dt2"></param>
        /// <returns></returns>
        public DataSet Compared_type(DateTime dt1, DateTime dt2)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(" select CustomerType as yy,count(CustomerType) as xx,");
            strSql.Append(" SUM(case when YEAR( Create_date)=YEAR('" + dt1 + "') and MONTH(Create_date)=month('" + dt1 + "') then 1 else 0 end) as dt1, ");
            strSql.Append(" SUM(case when YEAR( Create_date)=YEAR('" + dt2 + "') and MONTH(Create_date)=month('" + dt2 + "') then 1 else 0 end) as dt2 ");
            strSql.Append(" FROM CRM_Customer group by CustomerType");

            return DbHelperSQL.Query(strSql.ToString());

        }

        /// <summary>
        /// �ͻ�����ͬ�Ȼ��ȡ�
        /// </summary>
        /// <param name="dt1"></param>
        /// <param name="dt2"></param>
        /// <returns></returns>
        public DataSet Compared_level(DateTime dt1, DateTime dt2)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(" select CustomerLevel as yy,count(CustomerLevel) as xx,");
            strSql.Append(" SUM(case when YEAR( Create_date)=YEAR('" + dt1 + "') and MONTH(Create_date)=month('" + dt1 + "') then 1 else 0 end) as dt1, ");
            strSql.Append(" SUM(case when YEAR( Create_date)=YEAR('" + dt2 + "') and MONTH(Create_date)=month('" + dt2 + "') then 1 else 0 end) as dt2 ");
            strSql.Append(" FROM CRM_Customer group by CustomerLevel");

            return DbHelperSQL.Query(strSql.ToString());
        }

        /// <summary>
        /// �ͻ���Դ��ͬ�Ȼ��ȡ�
        /// </summary>
        /// <param name="dt1"></param>
        /// <param name="dt2"></param>
        /// <returns></returns>
        public DataSet Compared_source(DateTime dt1, DateTime dt2)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(" select CustomerSource as yy,count(CustomerSource) as xx,");
            strSql.Append(" SUM(case when YEAR( Create_date)=YEAR('" + dt1 + "') and MONTH(Create_date)=month('" + dt1 + "') then 1 else 0 end) as dt1, ");
            strSql.Append(" SUM(case when YEAR( Create_date)=YEAR('" + dt2 + "') and MONTH(Create_date)=month('" + dt2 + "') then 1 else 0 end) as dt2 ");
            strSql.Append(" FROM CRM_Customer group by CustomerSource");


            return DbHelperSQL.Query(strSql.ToString());
        }

        public DataSet Compared_empcusadd(DateTime dt1, DateTime dt2, string idlist)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(" select hr_employee.name as yy,");
            strSql.Append(" SUM(case when YEAR( CRM_Customer.Create_date)=YEAR('" + dt1 + "') and MONTH(CRM_Customer.create_date)=month('" + dt1 + "') then 1 else 0 end) as dt1, ");
            strSql.Append(" SUM(case when YEAR( CRM_Customer.Create_date)=YEAR('" + dt2 + "') and MONTH(CRM_Customer.create_date)=month('" + dt2 + "') then 1 else 0 end) as dt2 ");
            strSql.Append(" FROM hr_employee left outer join  CRM_Customer ");
            strSql.Append(" on hr_employee.ID=CRM_Customer.Create_id ");
            strSql.Append(" where hr_employee.ID in " + idlist);
            strSql.Append(" group by hr_employee.name,hr_employee.ID ");
            strSql.Append(" order by hr_employee.ID ");

            return DbHelperSQL.Query(strSql.ToString());
        }

        /// <summary>
        /// �ͻ�����ͳ��
        /// </summary>
        public DataSet report_empcus(int year, string idlist)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(" select name,yy,isnull([1],0) as 'm1',isnull([2],0) as 'm2',isnull([3],0) as 'm3',isnull([4],0) as 'm4',isnull([5],0) as 'm5',isnull([6],0) as 'm6',");
            strSql.Append(" isnull([7],0) as 'm7',isnull([8],0) as 'm8',isnull([9],0) as 'm9',isnull([10],0) as 'm10',isnull([11],0) as 'm11',isnull([12],0) as 'm12' ");
            strSql.Append(" from");
            strSql.Append(" (SELECT   hr_employee.ID, hr_employee.name, COUNT(derivedtbl_1.id) AS cn, YEAR(derivedtbl_1.Create_date) AS yy, ");
            strSql.Append(" MONTH(derivedtbl_1.Create_date) AS mm");
            strSql.Append(" FROM      hr_employee LEFT OUTER JOIN");
            strSql.Append("  (SELECT   id, Create_id, Create_date");
            strSql.Append("  FROM      CRM_Customer");
            strSql.Append("  WHERE ISNULL(isdelete,0)=0 and  (YEAR(Create_date) = " + year + ")) AS derivedtbl_1 ON hr_employee.ID = derivedtbl_1.Create_id");
            strSql.Append(" WHERE hr_employee.ID in " + idlist);
            strSql.Append(" GROUP BY hr_employee.ID, hr_employee.name, YEAR(derivedtbl_1.Create_date), MONTH(derivedtbl_1.Create_date)) as tt");
            strSql.Append(" pivot");
            strSql.Append(" (sum(cn) for mm in ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12]))");
            strSql.Append(" as pvt");

            return DbHelperSQL.Query(strSql.ToString());
        }
		#endregion  Method
	}
}
