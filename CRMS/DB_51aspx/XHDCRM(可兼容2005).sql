USE [master]
GO
/****** Object:  Database [XHDCRM]    Script Date: 05/28/2014 10:08:24 ******/
CREATE DATABASE [XHDCRM] ON  PRIMARY 
( NAME = N'XHDCRM', FILENAME = N'F:\VS 2010\XHDcrm\DB\XHDCRM.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'XHDCRM_log', FILENAME = N'F:\VS 2010\XHDcrm\DB\XHDCRM_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [XHDCRM] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [XHDCRM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [XHDCRM] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [XHDCRM] SET ANSI_NULLS OFF
GO
ALTER DATABASE [XHDCRM] SET ANSI_PADDING OFF
GO
ALTER DATABASE [XHDCRM] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [XHDCRM] SET ARITHABORT OFF
GO
ALTER DATABASE [XHDCRM] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [XHDCRM] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [XHDCRM] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [XHDCRM] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [XHDCRM] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [XHDCRM] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [XHDCRM] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [XHDCRM] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [XHDCRM] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [XHDCRM] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [XHDCRM] SET  DISABLE_BROKER
GO
ALTER DATABASE [XHDCRM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [XHDCRM] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [XHDCRM] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [XHDCRM] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [XHDCRM] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [XHDCRM] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [XHDCRM] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [XHDCRM] SET  READ_WRITE
GO
ALTER DATABASE [XHDCRM] SET RECOVERY FULL
GO
ALTER DATABASE [XHDCRM] SET  MULTI_USER
GO
ALTER DATABASE [XHDCRM] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [XHDCRM] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'XHDCRM', N'ON'
GO
USE [XHDCRM]
GO
/****** Object:  Table [dbo].[Sys_role_emp]    Script Date: 05/28/2014 10:08:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sys_role_emp](
	[RoleID] [int] NULL,
	[empID] [int] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Sys_role_emp] ([RoleID], [empID]) VALUES (1, 2)
/****** Object:  Table [dbo].[Sys_role]    Script Date: 05/28/2014 10:08:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](255) NULL,
	[RoleDscript] [varchar](255) NULL,
	[RoleSort] [nchar](10) NULL,
	[CreateID] [int] NULL,
	[CreateDate] [datetime] NULL,
	[UpdateID] [int] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_Sys_role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Sys_role] ON
INSERT [dbo].[Sys_role] ([RoleID], [RoleName], [RoleDscript], [RoleSort], [CreateID], [CreateDate], [UpdateID], [UpdateDate]) VALUES (1, N'系统管理员', N'拥有全部权限', N'999       ', 1, CAST(0x0000A316017E7BA6 AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Sys_role] OFF
/****** Object:  Table [dbo].[Sys_online]    Script Date: 05/28/2014 10:08:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_online](
	[UserID] [int] NULL,
	[UserName] [varchar](50) NULL,
	[LastLogTime] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Sys_online] ([UserID], [UserName], [LastLogTime]) VALUES (1, N'管理员', CAST(0x0000A33900A4D95A AS DateTime))
/****** Object:  Table [dbo].[Sys_Menu]    Script Date: 05/28/2014 10:08:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_Menu](
	[Menu_id] [int] IDENTITY(1,1) NOT NULL,
	[Menu_name] [varchar](255) NULL,
	[parentid] [int] NULL,
	[parentname] [varchar](255) NULL,
	[App_id] [int] NULL,
	[Menu_url] [varchar](255) NULL,
	[Menu_icon] [varchar](50) NULL,
	[Menu_handler] [varchar](50) NULL,
	[Menu_order] [int] NULL,
	[Menu_type] [varchar](50) NULL,
 CONSTRAINT [PK_Sys_Menu] PRIMARY KEY CLUSTERED 
(
	[Menu_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Sys_Menu] ON
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (1, N'个人工作', 0, N'无', 1, N'', N'../images/icon/37.png', NULL, 10, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (2, N'我的便签', 1, N'个人工作', 1, N'personal/personal/notes.aspx', N'../images/icon/33.png', NULL, 10, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (3, N'客户管理', 0, N'无', 2, N'', N'../images/icon/37.png', NULL, 10, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (4, N'客户列表', 3, N'客户管理', 2, N'crm/Customer/customer.aspx', N'../images/icon/61.png', NULL, 10, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (5, N'联系人管理', 3, N'客户管理', 2, N'crm/Customer/customer_contact.aspx', N'../images/icon/38.png', NULL, 20, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (6, N'跟进管理', 3, N'客户管理', 2, N'crm/Customer/customer_follow.aspx', N'../images/icon/3.png', NULL, 30, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (7, N'日程安排', 1, N'个人工作', 1, N'personal/personal/Calendar.aspx', N'../images/icon/29.png', NULL, 20, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (8, N'邮箱', 0, N'无', -1, N'', N'../images/icon/48.png', NULL, 20, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (9, N'收件箱', 8, N'邮箱', 1, N'', N'../images/icon/47.png', NULL, 10, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (10, N'草稿箱', 8, N'邮箱', 1, N'', N'../images/icon/48.png', NULL, 20, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (11, N'已发送', 8, N'邮箱', 1, N'', N'../images/icon/43.png', NULL, 30, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (12, N'信息中心', 0, N'无', 1, N'', N'../images/icon/56.png', NULL, 30, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (13, N'新闻', 12, N'信息中心', 1, N'personal/message/news.aspx', N'../images/icon/57.png', NULL, 10, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (14, N'公告', 12, N'信息中心', 1, N'personal/message/notice.aspx', N'../images/icon/58.png', NULL, 20, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (15, N'论坛', -1, N'信息中心', 1, N'', N'../images/icon/62.png', NULL, 30, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (16, N'知识库', -1, N'信息中心', 1, N'', N'../images/icon/68.png', NULL, 40, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (17, N'人事架构', 0, N'无', 3, N'', N'../images/icon/37.png', NULL, 10, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (18, N'人事资料', -1, N'无', 3, N'', N'../images/icon/37.png', NULL, 20, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (19, N'人事培训', -1, N'无', 3, N'', N'../images/icon/37.png', NULL, 30, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (20, N'人事报表', 0, N'无', -1, N'', N'../images/icon/37.png', NULL, 40, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (21, N'组织架构', 17, N'人事架构', 3, N'hr/hr_department.aspx', N'../images/icon/67.png', NULL, 20, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (22, N'职务管理', 17, N'人事架构', 3, N'hr/hr_position.aspx', N'../images/icon/68.png', NULL, 20, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (23, N'岗位管理', 17, N'人事架构', 3, N'hr/hr_post.aspx', N'../images/icon/49.png', NULL, 30, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (24, N'员工管理', 17, N'人事架构', 3, N'hr/hr_employee.aspx', N'../images/icon/37.png', NULL, 40, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (25, N'人事异动', -1, N'人事资料', 3, N'', N'../images/icon/43.png', NULL, 10, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (26, N'劳动合同', 19, N'人事资料', 3, N'hr/hr_contract.aspx', N'../images/icon/24.png', NULL, 20, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (27, N'社保管理', -1, N'人事资料', 3, N'', N'../images/icon/29.png', NULL, 30, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (28, N'培训记录', -1, N'人事培训', 3, N'', N'../images/icon/24.png', NULL, 10, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (29, N'讲师团队', -1, N'人事培训', 3, N'', N'../images/icon/38.png', NULL, 20, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (30, N'系统管理', 0, N'无', 6, N'', N'../images/icon/77.png', NULL, 10, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (31, N'角色授权', 30, N'系统管理', 6, N'System/Sys_role.aspx', N'../images/icon/70.png', NULL, 10, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (32, N'日志管理', 30, N'系统管理', 6, N'system/sys_log.aspx', N'../images/icon/51.png', NULL, 20, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (33, N'合同订单', 0, N'无', 2, N'', N'../images/icon/5.png', NULL, 20, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (34, N'订单管理', 33, N'销售管理', 2, N'crm/sale/Order.aspx', N'../images/icon/27.png', NULL, 10, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (35, N'合同管理', 33, N'销售管理', 2, N'crm/sale/contract.aspx', N'../images/icon/22.png', NULL, 20, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (36, N'收款管理', 45, N'财务管理', 2, N'crm/finance/receive.aspx', N'../images/icon/39.png', NULL, 10, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (37, N'开票管理', 45, N'财务管理', 2, N'crm/finance/invoice.aspx', N'../images/icon/28.png', NULL, 30, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (38, N'产品管理', 0, N'无', 2, N'', N'../images/icon/67.png', NULL, 40, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (39, N'产品列表', 38, N'产品管理', 2, N'crm/Product/product.aspx', N'../images/icon/67.png', NULL, 20, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (40, N'数据年报', 0, N'无', 5, N'', N'../images/icon/53.png', NULL, 10, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (41, N'客户统计年报', 40, N'CRM报表中心', 5, N'reports/crm/CRM_report_year.aspx', N'../images/icon/53.png', NULL, 10, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (42, N'跟进统计年报', 40, N'CRM报表中心', 5, N'reports/crm/Follow_report_year.aspx', N'../images/icon/54.png', NULL, 20, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (43, N'参数配置', 30, N'系统管理', 6, N'system/Param_SysParam.aspx', N'../images/icon/77.png', NULL, 30, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (44, N'产品类别', 38, N'产品管理', 2, N'crm/Product/product_category.aspx', N'../images/icon/82.png', NULL, 10, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (45, N'财务管理', 0, N'无', 2, N'', N'../../images/icon/56.png', NULL, 30, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (46, N'CRM回收站', 0, N'无', 4, N'', N'../../images/icon/12.png', NULL, 10, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (47, N'客户回收', 46, N'CRM回收站', 4, N'toolbar/recycle/crm/customer.aspx', N'../../images/icon/94.png', NULL, 10, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (48, N'联系人回收', 46, N'CRM回收站', 4, N'toolbar/recycle/crm/contact.aspx', N'../../images/icon/37.png', NULL, 20, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (49, N'跟进回收', 46, N'CRM回收站', 4, N'toolbar/recycle/crm/follow.aspx', N'../../images/icon/3.png', NULL, 30, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (50, N'订单回收', 46, N'CRM回收站', 4, N'toolbar/recycle/crm/order.aspx', N'../../images/icon/27.png', NULL, 40, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (51, N'合同回收', 46, N'CRM回收站', 4, N'toolbar/recycle/crm/contract.aspx', N'../../images/icon/22.png', NULL, 50, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (52, N'收款单回收', 46, N'CRM回收站', 4, N'toolbar/recycle/crm/receive.aspx', N'../../images/icon/39.png', NULL, 60, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (53, N'发票回收', 46, N'CRM回收站', 4, N'toolbar/recycle/crm/invoice.aspx', N'../../images/icon/28.png', NULL, 70, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (54, N'产品类别回收', 46, N'CRM回收站', 4, N'toolbar/recycle/crm/product_category.aspx', N'../../images/icon/81.png', NULL, 80, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (55, N'产品回收', 46, N'CRM回收站', 4, N'toolbar/recycle/crm/product.aspx', N'../../images/icon/67.png', NULL, 90, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (56, N'收款流水', 45, N'财务管理', 2, N'crm/finance/receive_list.aspx', N'../../images/icon/26.png', NULL, 20, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (57, N'发票列表', 45, N'财务管理', 2, N'crm/finance/invoice_list.aspx', N'../../images/icon/24.png', NULL, 40, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (58, N'人事管理回收站', 0, N'无', 4, N'', N'../../images/icon/37.png', NULL, 20, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (59, N'按钮管理', 60, N'配置信息', 6, N'system/sys_button.aspx', N'../images/icon/85.png', NULL, 20, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (60, N'配置信息', 0, N'无', -1, N'', N'../../images/icon/37.png', NULL, 20, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (61, N'系统信息', 61, N'配置信息', 6, N'system/sys_info.aspx', N'../../images/icon/49.png', NULL, 10, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (62, N'应收与未收', 45, N'财务管理', 2, N'crm/finance/receiveanduncollected.aspx', N'/images/icon/54.png', NULL, 50, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (63, N'同比与环比', 0, N'无', 5, N'', N'../../images/icon/59.png', NULL, 20, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (64, N'【客户】新增', 63, N'同比与环比', 5, N'Reports/Compared/customer_add.aspx', N'../../images/icon/37.png', NULL, 10, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (65, N'【客户】类型', 63, N'同比与环比', 5, N'Reports/Compared/customer_type.aspx', N'../../images/icon/33.png', NULL, 20, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (66, N'【客户】级别', 63, N'同比与环比', 5, N'Reports/Compared/customer_level.aspx', N'../../images/icon/82.png', NULL, 30, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (67, N'【客户】来源', 63, N'同比与环比', 5, N'Reports/Compared/customer_source.aspx', N'../../images/icon/83.png', NULL, 40, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (68, N'【客户】跟进', 63, N'同比与环比', 5, N'Reports/Compared/customer_follow.aspx', N'../../images/icon/81.png', NULL, 50, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (69, N'【员工】客户新增', 63, N'同比与环比', 5, N'Reports/Compared/emp_customer_add.aspx', N'../../images/icon/37.png', NULL, 60, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (70, N'【员工】客户跟进', 63, N'同比与环比', 5, N'Reports/Compared/emp_customer_follow.aspx', N'../../images/icon/38.png', NULL, 70, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (71, N'【员工】客户成交', 63, N'同比与环比', 5, N'Reports/Compared/emp_customer_contract.aspx', N'../../images/icon/94.png', NULL, 80, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (72, N'员工分析', 0, N'无', 5, N'', N'../../images/icon/93.png', NULL, 30, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (73, N'【员工】客户新增统计', 72, N'员工分析', 5, N'Reports/emp/customer_add.aspx', N'../../images/icon/37.png', NULL, 10, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (74, N'【员工】客户跟进统计', 72, N'员工分析', 5, N'Reports/emp/customer_follow.aspx', N'../../images/icon/38.png', NULL, 20, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (75, N'【员工】客户成交统计', 72, N'员工分析', 5, N'Reports/emp/customer_contract.aspx', N'../../images/icon/94.png', NULL, 30, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (76, N'目录管理', 60, N'配置信息', 6, N'system/sys_menu.aspx', N'../images/icon/81.png', NULL, 10, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (77, N'收件箱', 77, N'邮件', -1, N'personal/Mail/Mail_inbox.aspx', N'../../images/icon/39.png', NULL, 10, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (78, N'已发送', 77, N'邮件', -1, N'personal/Mail/mail_send.aspx', N'../../images/icon/40.png', NULL, 20, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (79, N'垃圾箱', 77, N'邮件', -1, N'personal/Mail/mail_dustbin.aspx', N'../../images/icon/4.png', NULL, 30, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (80, N'组织架构回收', 58, N'人事管理回收站', 4, N'toolbar/recycle/HR/hr_department.aspx', N'../../images/icon/64.png', NULL, 10, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (81, N'职务回收', 58, N'人事管理回收站', 4, N'toolbar/Recycle/HR/hr_position.aspx', N'../../images/icon/68.png', NULL, 20, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (82, N'岗位回收', 58, N'人事管理回收站', 4, N'toolbar/Recycle/HR/hr_post.aspx', N'../../images/icon/49.png', NULL, 30, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (83, N'员工回收', 58, N'人事管理回收站', 4, N'toolbar/Recycle/HR/hr_employee.aspx', N'../../images/icon/37.png', NULL, 40, N'sys')
INSERT [dbo].[Sys_Menu] ([Menu_id], [Menu_name], [parentid], [parentname], [App_id], [Menu_url], [Menu_icon], [Menu_handler], [Menu_order], [Menu_type]) VALUES (84, N'城市管理', 30, N'系统管理', 6, N'system/Param_City.aspx', N'../images/icon/64.png', NULL, 40, N'sys')
SET IDENTITY_INSERT [dbo].[Sys_Menu] OFF
/****** Object:  Table [dbo].[Sys_log_Err]    Script Date: 05/28/2014 10:08:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_log_Err](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Err_typeid] [int] NULL,
	[Err_type] [varchar](250) NULL,
	[Err_time] [datetime] NULL,
	[Err_url] [varchar](500) NULL,
	[Err_message] [varchar](max) NULL,
	[Err_source] [varchar](500) NULL,
	[Err_trace] [varchar](max) NULL,
	[Err_emp_id] [int] NULL,
	[Err_emp_name] [varchar](250) NULL,
	[Err_ip] [varchar](250) NULL,
 CONSTRAINT [PK_Sys_log_Err] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Sys_log_Err] ON
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (1, 2, N'前台系统', CAST(0x0000A3160105C1D7 AS DateTime), N'http://localhost:11916/Data/login.ashx', N'未将对象引用设置到对象的实例。', N'XHD_crm', N'在 XHD.XHD_crm.Data.login.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\login.ashx.cs:行号 34
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', -1, N'未登录', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (2, 2, N'前台系统', CAST(0x0000A316010AFF9C AS DateTime), N'http://localhost:11916/data/Base.ashx?Action=GetOnline&rnd=0.09150389874865444', N'未能创建类型“XHD.XHD_crm.Data._base”。', N'System.Web', N'在 System.Web.UI.SimpleWebHandlerParser.GetType(String typeName)
   在 System.Web.UI.SimpleWebHandlerParser.GetTypeToCache(Assembly builtAssembly)
   在 System.Web.Compilation.SimpleHandlerBuildProvider.GetGeneratedType(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.CreateBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.GetBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResult(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean ensureIsUpToDate)
   在 System.Web.UI.SimpleHandlerFactory.System.Web.IHttpHandlerFactory2.GetHandler(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   在 System.Web.UI.SimpleHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   在 System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (3, 2, N'前台系统', CAST(0x0000A316010AFFA9 AS DateTime), N'http://localhost:11916/data/Base.ashx?Action=getUserTree&rnd=0.4489702540643153', N'未能创建类型“XHD.XHD_crm.Data._base”。', N'System.Web', N'在 System.Web.UI.SimpleWebHandlerParser.GetType(String typeName)
   在 System.Web.UI.SimpleWebHandlerParser.GetTypeToCache(Assembly builtAssembly)
   在 System.Web.Compilation.SimpleHandlerBuildProvider.GetGeneratedType(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.CreateBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.GetBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResult(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean ensureIsUpToDate)
   在 System.Web.UI.SimpleHandlerFactory.System.Web.IHttpHandlerFactory2.GetHandler(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   在 System.Web.UI.SimpleHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   在 System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (4, 2, N'前台系统', CAST(0x0000A316010B2288 AS DateTime), N'http://localhost:11916/data/Base.ashx?Action=GetOnline&rnd=0.708963697806013', N'未能创建类型“XHD.XHD_crm.Data._base”。', N'System.Web', N'在 System.Web.UI.SimpleWebHandlerParser.GetType(String typeName)
   在 System.Web.UI.SimpleWebHandlerParser.GetTypeToCache(Assembly builtAssembly)
   在 System.Web.Compilation.SimpleHandlerBuildProvider.GetGeneratedType(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.CreateBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.GetBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResult(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean ensureIsUpToDate)
   在 System.Web.UI.SimpleHandlerFactory.System.Web.IHttpHandlerFactory2.GetHandler(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   在 System.Web.UI.SimpleHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   在 System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (5, 2, N'前台系统', CAST(0x0000A316010B228D AS DateTime), N'http://localhost:11916/data/Base.ashx?Action=getUserTree&rnd=0.4489702540643153', N'未能创建类型“XHD.XHD_crm.Data._base”。', N'System.Web', N'在 System.Web.UI.SimpleWebHandlerParser.GetType(String typeName)
   在 System.Web.UI.SimpleWebHandlerParser.GetTypeToCache(Assembly builtAssembly)
   在 System.Web.Compilation.SimpleHandlerBuildProvider.GetGeneratedType(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.CreateBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.GetBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResult(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean ensureIsUpToDate)
   在 System.Web.UI.SimpleHandlerFactory.System.Web.IHttpHandlerFactory2.GetHandler(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   在 System.Web.UI.SimpleHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   在 System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (6, 2, N'前台系统', CAST(0x0000A316010B45B1 AS DateTime), N'http://localhost:11916/data/Base.ashx?Action=GetOnline&rnd=0.4395068168837395', N'未能创建类型“XHD.XHD_crm.Data._base”。', N'System.Web', N'在 System.Web.UI.SimpleWebHandlerParser.GetType(String typeName)
   在 System.Web.UI.SimpleWebHandlerParser.GetTypeToCache(Assembly builtAssembly)
   在 System.Web.Compilation.SimpleHandlerBuildProvider.GetGeneratedType(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.CreateBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.GetBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResult(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean ensureIsUpToDate)
   在 System.Web.UI.SimpleHandlerFactory.System.Web.IHttpHandlerFactory2.GetHandler(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   在 System.Web.UI.SimpleHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   在 System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (7, 2, N'前台系统', CAST(0x0000A316010B45B9 AS DateTime), N'http://localhost:11916/data/Base.ashx?Action=getUserTree&rnd=0.4489702540643153', N'未能创建类型“XHD.XHD_crm.Data._base”。', N'System.Web', N'在 System.Web.UI.SimpleWebHandlerParser.GetType(String typeName)
   在 System.Web.UI.SimpleWebHandlerParser.GetTypeToCache(Assembly builtAssembly)
   在 System.Web.Compilation.SimpleHandlerBuildProvider.GetGeneratedType(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.CreateBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.GetBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResult(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean ensureIsUpToDate)
   在 System.Web.UI.SimpleHandlerFactory.System.Web.IHttpHandlerFactory2.GetHandler(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   在 System.Web.UI.SimpleHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   在 System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (8, 2, N'前台系统', CAST(0x0000A316010B68D8 AS DateTime), N'http://localhost:11916/data/Base.ashx?Action=GetOnline&rnd=0.5822485766270129', N'未能创建类型“XHD.XHD_crm.Data._base”。', N'System.Web', N'在 System.Web.UI.SimpleWebHandlerParser.GetType(String typeName)
   在 System.Web.UI.SimpleWebHandlerParser.GetTypeToCache(Assembly builtAssembly)
   在 System.Web.Compilation.SimpleHandlerBuildProvider.GetGeneratedType(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.CreateBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.GetBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResult(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean ensureIsUpToDate)
   在 System.Web.UI.SimpleHandlerFactory.System.Web.IHttpHandlerFactory2.GetHandler(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   在 System.Web.UI.SimpleHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   在 System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (9, 2, N'前台系统', CAST(0x0000A316010B68E0 AS DateTime), N'http://localhost:11916/data/Base.ashx?Action=getUserTree&rnd=0.4489702540643153', N'未能创建类型“XHD.XHD_crm.Data._base”。', N'System.Web', N'在 System.Web.UI.SimpleWebHandlerParser.GetType(String typeName)
   在 System.Web.UI.SimpleWebHandlerParser.GetTypeToCache(Assembly builtAssembly)
   在 System.Web.Compilation.SimpleHandlerBuildProvider.GetGeneratedType(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.CreateBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.GetBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResult(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean ensureIsUpToDate)
   在 System.Web.UI.SimpleHandlerFactory.System.Web.IHttpHandlerFactory2.GetHandler(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   在 System.Web.UI.SimpleHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   在 System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (10, 2, N'前台系统', CAST(0x0000A316010B8C3A AS DateTime), N'http://localhost:11916/data/Base.ashx?Action=GetOnline&rnd=0.8184475313980707', N'未能创建类型“XHD.XHD_crm.Data._base”。', N'System.Web', N'在 System.Web.UI.SimpleWebHandlerParser.GetType(String typeName)
   在 System.Web.UI.SimpleWebHandlerParser.GetTypeToCache(Assembly builtAssembly)
   在 System.Web.Compilation.SimpleHandlerBuildProvider.GetGeneratedType(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.CreateBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.GetBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResult(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean ensureIsUpToDate)
   在 System.Web.UI.SimpleHandlerFactory.System.Web.IHttpHandlerFactory2.GetHandler(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   在 System.Web.UI.SimpleHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   在 System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (11, 2, N'前台系统', CAST(0x0000A316010B8C45 AS DateTime), N'http://localhost:11916/data/Base.ashx?Action=getUserTree&rnd=0.4489702540643153', N'未能创建类型“XHD.XHD_crm.Data._base”。', N'System.Web', N'在 System.Web.UI.SimpleWebHandlerParser.GetType(String typeName)
   在 System.Web.UI.SimpleWebHandlerParser.GetTypeToCache(Assembly builtAssembly)
   在 System.Web.Compilation.SimpleHandlerBuildProvider.GetGeneratedType(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.CreateBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.GetBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResult(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean ensureIsUpToDate)
   在 System.Web.UI.SimpleHandlerFactory.System.Web.IHttpHandlerFactory2.GetHandler(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   在 System.Web.UI.SimpleHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   在 System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (12, 2, N'前台系统', CAST(0x0000A316010BAFC9 AS DateTime), N'http://localhost:11916/data/Base.ashx?Action=GetOnline&rnd=0.9249957115496128', N'未能创建类型“XHD.XHD_crm.Data._base”。', N'System.Web', N'在 System.Web.UI.SimpleWebHandlerParser.GetType(String typeName)
   在 System.Web.UI.SimpleWebHandlerParser.GetTypeToCache(Assembly builtAssembly)
   在 System.Web.Compilation.SimpleHandlerBuildProvider.GetGeneratedType(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.CreateBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.GetBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResult(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean ensureIsUpToDate)
   在 System.Web.UI.SimpleHandlerFactory.System.Web.IHttpHandlerFactory2.GetHandler(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   在 System.Web.UI.SimpleHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   在 System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (13, 2, N'前台系统', CAST(0x0000A316010BAFCF AS DateTime), N'http://localhost:11916/data/Base.ashx?Action=getUserTree&rnd=0.4489702540643153', N'未能创建类型“XHD.XHD_crm.Data._base”。', N'System.Web', N'在 System.Web.UI.SimpleWebHandlerParser.GetType(String typeName)
   在 System.Web.UI.SimpleWebHandlerParser.GetTypeToCache(Assembly builtAssembly)
   在 System.Web.Compilation.SimpleHandlerBuildProvider.GetGeneratedType(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.CreateBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.GetBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResult(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean ensureIsUpToDate)
   在 System.Web.UI.SimpleHandlerFactory.System.Web.IHttpHandlerFactory2.GetHandler(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   在 System.Web.UI.SimpleHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   在 System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (14, 2, N'前台系统', CAST(0x0000A316010BD250 AS DateTime), N'http://localhost:11916/data/Base.ashx?Action=GetOnline&rnd=0.27502952354092896', N'未能创建类型“XHD.XHD_crm.Data._base”。', N'System.Web', N'在 System.Web.UI.SimpleWebHandlerParser.GetType(String typeName)
   在 System.Web.UI.SimpleWebHandlerParser.GetTypeToCache(Assembly builtAssembly)
   在 System.Web.Compilation.SimpleHandlerBuildProvider.GetGeneratedType(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.CreateBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.GetBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResult(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean ensureIsUpToDate)
   在 System.Web.UI.SimpleHandlerFactory.System.Web.IHttpHandlerFactory2.GetHandler(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   在 System.Web.UI.SimpleHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   在 System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (15, 2, N'前台系统', CAST(0x0000A316010BD255 AS DateTime), N'http://localhost:11916/data/Base.ashx?Action=getUserTree&rnd=0.4489702540643153', N'未能创建类型“XHD.XHD_crm.Data._base”。', N'System.Web', N'在 System.Web.UI.SimpleWebHandlerParser.GetType(String typeName)
   在 System.Web.UI.SimpleWebHandlerParser.GetTypeToCache(Assembly builtAssembly)
   在 System.Web.Compilation.SimpleHandlerBuildProvider.GetGeneratedType(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.CreateBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.GetBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResult(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean ensureIsUpToDate)
   在 System.Web.UI.SimpleHandlerFactory.System.Web.IHttpHandlerFactory2.GetHandler(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   在 System.Web.UI.SimpleHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   在 System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (16, 2, N'前台系统', CAST(0x0000A316011B6501 AS DateTime), N'http://localhost:11916/data/Sys_Menu.ashx?Action=GetMenu&parentid=-1', N'值不能为 null。
参数名: input', N'System', N'在 System.Text.RegularExpressions.Regex.Match(String input)
   在 XHD.Common.PageValidate.IsNumber(String inputData) 位置 f:\VS 2010\XHDcrm\Common\PageValidate.cs:行号 67
   在 XHD.XHD_crm.Data.sys_menu.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\sys_menu.ashx.cs:行号 22
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (17, 2, N'前台系统', CAST(0x0000A316011B72FF AS DateTime), N'http://localhost:11916/data/Sys_Menu.ashx?Action=GetMenu&parentid=-1', N'值不能为 null。
参数名: input', N'System', N'在 System.Text.RegularExpressions.Regex.Match(String input)
   在 XHD.Common.PageValidate.IsNumber(String inputData) 位置 f:\VS 2010\XHDcrm\Common\PageValidate.cs:行号 67
   在 XHD.XHD_crm.Data.sys_menu.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\sys_menu.ashx.cs:行号 22
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (18, 2, N'前台系统', CAST(0x0000A316011B95DF AS DateTime), N'http://localhost:11916/data/Sys_Menu.ashx?Action=GetMenu&parentid=-1', N'值不能为 null。
参数名: input', N'System', N'在 System.Text.RegularExpressions.Regex.Match(String input)
   在 XHD.Common.PageValidate.IsNumber(String inputData) 位置 f:\VS 2010\XHDcrm\Common\PageValidate.cs:行号 67
   在 XHD.XHD_crm.Data.sys_menu.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\sys_menu.ashx.cs:行号 22
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (19, 2, N'前台系统', CAST(0x0000A316011B9BD4 AS DateTime), N'http://localhost:11916/data/Sys_Menu.ashx?Action=GetMenu&parentid=-1', N'值不能为 null。
参数名: input', N'System', N'在 System.Text.RegularExpressions.Regex.Match(String input)
   在 XHD.Common.PageValidate.IsNumber(String inputData) 位置 f:\VS 2010\XHDcrm\Common\PageValidate.cs:行号 67
   在 XHD.XHD_crm.Data.sys_menu.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\sys_menu.ashx.cs:行号 22
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (20, 2, N'前台系统', CAST(0x0000A316011BDB2E AS DateTime), N'http://localhost:11916/data/Sys_Menu.ashx?Action=GetMenu&parentid=-1', N'值不能为 null。
参数名: input', N'System', N'在 System.Text.RegularExpressions.Regex.Match(String input)
   在 XHD.Common.PageValidate.IsNumber(String inputData) 位置 f:\VS 2010\XHDcrm\Common\PageValidate.cs:行号 67
   在 XHD.XHD_crm.Data.sys_menu.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\sys_menu.ashx.cs:行号 22
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (21, 2, N'前台系统', CAST(0x0000A316011BE149 AS DateTime), N'http://localhost:11916/data/Sys_Menu.ashx?Action=GetMenu&parentid=-1', N'值不能为 null。
参数名: input', N'System', N'在 System.Text.RegularExpressions.Regex.Match(String input)
   在 XHD.Common.PageValidate.IsNumber(String inputData) 位置 f:\VS 2010\XHDcrm\Common\PageValidate.cs:行号 67
   在 XHD.XHD_crm.Data.sys_menu.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\sys_menu.ashx.cs:行号 22
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (22, 2, N'前台系统', CAST(0x0000A316011C8526 AS DateTime), N'http://localhost:11916/data/Sys_Menu.ashx?Action=GetMenu&parentid=-1', N'值不能为 null。
参数名: input', N'System', N'在 System.Text.RegularExpressions.Regex.Match(String input)
   在 XHD.Common.PageValidate.IsNumber(String inputData) 位置 f:\VS 2010\XHDcrm\Common\PageValidate.cs:行号 67
   在 XHD.XHD_crm.Data.sys_menu.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\sys_menu.ashx.cs:行号 22
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (23, 2, N'前台系统', CAST(0x0000A316011F60D6 AS DateTime), N'http://localhost:11916/data/Sys_Menu.ashx?Action=GetMenu&parentid=-1', N'值不能为 null。
参数名: input', N'System', N'在 System.Text.RegularExpressions.Regex.Match(String input)
   在 XHD.Common.PageValidate.IsNumber(String inputData) 位置 f:\VS 2010\XHDcrm\Common\PageValidate.cs:行号 67
   在 XHD.XHD_crm.Data.sys_menu.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\sys_menu.ashx.cs:行号 22
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (24, 2, N'前台系统', CAST(0x0000A316011F99BD AS DateTime), N'http://localhost:11916/data/Sys_Menu.ashx?Action=GetMenu&parentid=-1', N'值不能为 null。
参数名: input', N'System', N'在 System.Text.RegularExpressions.Regex.Match(String input)
   在 XHD.Common.PageValidate.IsNumber(String inputData) 位置 f:\VS 2010\XHDcrm\Common\PageValidate.cs:行号 67
   在 XHD.XHD_crm.Data.sys_menu.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\sys_menu.ashx.cs:行号 22
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (25, 2, N'前台系统', CAST(0x0000A31601214388 AS DateTime), N'http://localhost:11916/data/Sys_Menu.ashx?Action=GetMenu&parentid=-1', N'值不能为 null。
参数名: input', N'System', N'在 System.Text.RegularExpressions.Regex.Match(String input)
   在 XHD.Common.PageValidate.IsNumber(String inputData) 位置 f:\VS 2010\XHDcrm\Common\PageValidate.cs:行号 67
   在 XHD.XHD_crm.Data.sys_menu.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\sys_menu.ashx.cs:行号 22
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (26, 2, N'前台系统', CAST(0x0000A3160121742F AS DateTime), N'http://localhost:11916/data/Sys_Menu.ashx?Action=GetMenu&parentid=-1', N'值不能为 null。
参数名: input', N'System', N'在 System.Text.RegularExpressions.Regex.Match(String input)
   在 XHD.Common.PageValidate.IsNumber(String inputData) 位置 f:\VS 2010\XHDcrm\Common\PageValidate.cs:行号 67
   在 XHD.XHD_crm.Data.sys_menu.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\sys_menu.ashx.cs:行号 22
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (27, 2, N'前台系统', CAST(0x0000A31601317024 AS DateTime), N'http://localhost:11916/data/Sys_Menu.ashx?Action=GetMenu&parentid=-1', N'值不能为 null。
参数名: input', N'System', N'在 System.Text.RegularExpressions.Regex.Match(String input)
   在 XHD.Common.PageValidate.IsNumber(String inputData) 位置 f:\VS 2010\XHDcrm\Common\PageValidate.cs:行号 67
   在 XHD.XHD_crm.Data.sys_menu.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\sys_menu.ashx.cs:行号 22
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (28, 2, N'前台系统', CAST(0x0000A31601317232 AS DateTime), N'http://localhost:11916/data/Sys_Menu.ashx?Action=GetMenu&parentid=-1', N'值不能为 null。
参数名: input', N'System', N'在 System.Text.RegularExpressions.Regex.Match(String input)
   在 XHD.Common.PageValidate.IsNumber(String inputData) 位置 f:\VS 2010\XHDcrm\Common\PageValidate.cs:行号 67
   在 XHD.XHD_crm.Data.sys_menu.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\sys_menu.ashx.cs:行号 22
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (29, 2, N'前台系统', CAST(0x0000A3160134DC16 AS DateTime), N'http://localhost:11916/data/Sys_Menu.ashx?Action=GetMenu&parentid=-1', N'值不能为 null。
参数名: input', N'System', N'在 System.Text.RegularExpressions.Regex.Match(String input)
   在 XHD.Common.PageValidate.IsNumber(String inputData) 位置 f:\VS 2010\XHDcrm\Common\PageValidate.cs:行号 67
   在 XHD.XHD_crm.Data.sys_menu.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\sys_menu.ashx.cs:行号 22
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (30, 2, N'前台系统', CAST(0x0000A3160134E10E AS DateTime), N'http://localhost:11916/data/public_news.ashx?Action=grid&rnd=0.7860453439530548', N'未能创建类型“XHD.XHD_crm.Data.public_news”。', N'System.Web', N'在 System.Web.UI.SimpleWebHandlerParser.GetType(String typeName)
   在 System.Web.UI.SimpleWebHandlerParser.GetTypeToCache(Assembly builtAssembly)
   在 System.Web.Compilation.SimpleHandlerBuildProvider.GetGeneratedType(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.CreateBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.GetBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResult(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean ensureIsUpToDate)
   在 System.Web.UI.SimpleHandlerFactory.System.Web.IHttpHandlerFactory2.GetHandler(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   在 System.Web.UI.SimpleHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   在 System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (31, 2, N'前台系统', CAST(0x0000A3160134E3D8 AS DateTime), N'http://localhost:11916/data/public_news.ashx?Action=grid&rnd=0.2072160593169768', N'未能创建类型“XHD.XHD_crm.Data.public_news”。', N'System.Web', N'在 System.Web.UI.SimpleWebHandlerParser.GetType(String typeName)
   在 System.Web.UI.SimpleWebHandlerParser.GetTypeToCache(Assembly builtAssembly)
   在 System.Web.Compilation.SimpleHandlerBuildProvider.GetGeneratedType(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.CreateBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.GetBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResult(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean ensureIsUpToDate)
   在 System.Web.UI.SimpleHandlerFactory.System.Web.IHttpHandlerFactory2.GetHandler(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   在 System.Web.UI.SimpleHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   在 System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (32, 2, N'前台系统', CAST(0x0000A316013501B0 AS DateTime), N'http://localhost:11916/data/public_news.ashx?Action=grid&rnd=0.5307994904570064', N'未能创建类型“XHD.XHD_crm.Data.public_news”。', N'System.Web', N'在 System.Web.UI.SimpleWebHandlerParser.GetType(String typeName)
   在 System.Web.UI.SimpleWebHandlerParser.GetTypeToCache(Assembly builtAssembly)
   在 System.Web.Compilation.SimpleHandlerBuildProvider.GetGeneratedType(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.CreateBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.GetBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResult(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean ensureIsUpToDate)
   在 System.Web.UI.SimpleHandlerFactory.System.Web.IHttpHandlerFactory2.GetHandler(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   在 System.Web.UI.SimpleHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   在 System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (33, 2, N'前台系统', CAST(0x0000A31601350B06 AS DateTime), N'http://localhost:11916/data/public_news.ashx', N'未能创建类型“XHD.XHD_crm.Data.public_news”。', N'System.Web', N'在 System.Web.UI.SimpleWebHandlerParser.GetType(String typeName)
   在 System.Web.UI.SimpleWebHandlerParser.GetTypeToCache(Assembly builtAssembly)
   在 System.Web.Compilation.SimpleHandlerBuildProvider.GetGeneratedType(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.CreateBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.GetBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResult(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean ensureIsUpToDate)
   在 System.Web.UI.SimpleHandlerFactory.System.Web.IHttpHandlerFactory2.GetHandler(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   在 System.Web.UI.SimpleHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   在 System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (34, 2, N'前台系统', CAST(0x0000A31601350B16 AS DateTime), N'http://localhost:11916/data/public_news.ashx?Action=grid&rnd=0.5307994904570064', N'未能创建类型“XHD.XHD_crm.Data.public_news”。', N'System.Web', N'在 System.Web.UI.SimpleWebHandlerParser.GetType(String typeName)
   在 System.Web.UI.SimpleWebHandlerParser.GetTypeToCache(Assembly builtAssembly)
   在 System.Web.Compilation.SimpleHandlerBuildProvider.GetGeneratedType(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.CreateBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.GetBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResult(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean ensureIsUpToDate)
   在 System.Web.UI.SimpleHandlerFactory.System.Web.IHttpHandlerFactory2.GetHandler(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   在 System.Web.UI.SimpleHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   在 System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (35, 2, N'前台系统', CAST(0x0000A31601350E3A AS DateTime), N'http://localhost:11916/data/public_news.ashx?Action=grid&rnd=0.5485458513318762', N'未能创建类型“XHD.XHD_crm.Data.public_news”。', N'System.Web', N'在 System.Web.UI.SimpleWebHandlerParser.GetType(String typeName)
   在 System.Web.UI.SimpleWebHandlerParser.GetTypeToCache(Assembly builtAssembly)
   在 System.Web.Compilation.SimpleHandlerBuildProvider.GetGeneratedType(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.CreateBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.GetBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResult(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean ensureIsUpToDate)
   在 System.Web.UI.SimpleHandlerFactory.System.Web.IHttpHandlerFactory2.GetHandler(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   在 System.Web.UI.SimpleHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   在 System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (36, 2, N'前台系统', CAST(0x0000A31601351904 AS DateTime), N'http://localhost:11916/data/public_news.ashx', N'未能创建类型“XHD.XHD_crm.Data.public_news”。', N'System.Web', N'在 System.Web.UI.SimpleWebHandlerParser.GetType(String typeName)
   在 System.Web.UI.SimpleWebHandlerParser.GetTypeToCache(Assembly builtAssembly)
   在 System.Web.Compilation.SimpleHandlerBuildProvider.GetGeneratedType(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.CreateBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.GetBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResult(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean ensureIsUpToDate)
   在 System.Web.UI.SimpleHandlerFactory.System.Web.IHttpHandlerFactory2.GetHandler(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   在 System.Web.UI.SimpleHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   在 System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (37, 2, N'前台系统', CAST(0x0000A31601351919 AS DateTime), N'http://localhost:11916/data/public_news.ashx?Action=grid&rnd=0.5485458513318762', N'未能创建类型“XHD.XHD_crm.Data.public_news”。', N'System.Web', N'在 System.Web.UI.SimpleWebHandlerParser.GetType(String typeName)
   在 System.Web.UI.SimpleWebHandlerParser.GetTypeToCache(Assembly builtAssembly)
   在 System.Web.Compilation.SimpleHandlerBuildProvider.GetGeneratedType(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.CreateBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.GetBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResult(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean ensureIsUpToDate)
   在 System.Web.UI.SimpleHandlerFactory.System.Web.IHttpHandlerFactory2.GetHandler(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   在 System.Web.UI.SimpleHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   在 System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (38, 2, N'前台系统', CAST(0x0000A31601356E91 AS DateTime), N'http://localhost:11916/data/public_news.ashx?Action=grid&rnd=0.5485458513318762', N'关键字  order  附近有语法错误。', N'XHD.DBUtility', N'在 XHD.DBUtility.DbHelperSQL.Query(String SQLString) 位置 f:\VS 2010\XHDcrm\DBUtility\DbHelperSQL.cs:行号 517
   在 XHD.DAL.public_news.GetList(Int32 PageSize, Int32 PageIndex, String strWhere, String filedOrder, String& Total) 位置 f:\VS 2010\XHDcrm\DAL\public_news.cs:行号 317
   在 XHD.BLL.public_news.GetList(Int32 PageSize, Int32 PageIndex, String strWhere, String filedOrder, String& Total) 位置 f:\VS 2010\XHDcrm\BLL\public_news.cs:行号 204
   在 XHD.XHD_crm.Data.public_news.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\public_news.ashx.cs:行号 129
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (39, 2, N'前台系统', CAST(0x0000A3160135710A AS DateTime), N'http://localhost:11916/data/public_news.ashx?Action=grid&rnd=0.5485458513318762', N'关键字  order  附近有语法错误。', N'XHD.DBUtility', N'在 XHD.DBUtility.DbHelperSQL.Query(String SQLString) 位置 f:\VS 2010\XHDcrm\DBUtility\DbHelperSQL.cs:行号 517
   在 XHD.DAL.public_news.GetList(Int32 PageSize, Int32 PageIndex, String strWhere, String filedOrder, String& Total) 位置 f:\VS 2010\XHDcrm\DAL\public_news.cs:行号 317
   在 XHD.BLL.public_news.GetList(Int32 PageSize, Int32 PageIndex, String strWhere, String filedOrder, String& Total) 位置 f:\VS 2010\XHDcrm\BLL\public_news.cs:行号 204
   在 XHD.XHD_crm.Data.public_news.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\public_news.ashx.cs:行号 129
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (40, 2, N'前台系统', CAST(0x0000A31601357392 AS DateTime), N'http://localhost:11916/data/public_news.ashx?Action=grid&rnd=0.6624244381873244', N'关键字  order  附近有语法错误。', N'XHD.DBUtility', N'在 XHD.DBUtility.DbHelperSQL.Query(String SQLString) 位置 f:\VS 2010\XHDcrm\DBUtility\DbHelperSQL.cs:行号 517
   在 XHD.DAL.public_news.GetList(Int32 PageSize, Int32 PageIndex, String strWhere, String filedOrder, String& Total) 位置 f:\VS 2010\XHDcrm\DAL\public_news.cs:行号 317
   在 XHD.BLL.public_news.GetList(Int32 PageSize, Int32 PageIndex, String strWhere, String filedOrder, String& Total) 位置 f:\VS 2010\XHDcrm\BLL\public_news.cs:行号 204
   在 XHD.XHD_crm.Data.public_news.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\public_news.ashx.cs:行号 129
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (41, 2, N'前台系统', CAST(0x0000A3160135A28A AS DateTime), N'http://localhost:11916/data/public_news.ashx?Action=grid&rnd=0.6624244381873244', N'关键字  order  附近有语法错误。', N'XHD.DBUtility', N'在 XHD.DBUtility.DbHelperSQL.Query(String SQLString) 位置 f:\VS 2010\XHDcrm\DBUtility\DbHelperSQL.cs:行号 517
   在 XHD.DAL.public_news.GetList(Int32 PageSize, Int32 PageIndex, String strWhere, String filedOrder, String& Total) 位置 f:\VS 2010\XHDcrm\DAL\public_news.cs:行号 317
   在 XHD.BLL.public_news.GetList(Int32 PageSize, Int32 PageIndex, String strWhere, String filedOrder, String& Total) 位置 f:\VS 2010\XHDcrm\BLL\public_news.cs:行号 204
   在 XHD.XHD_crm.Data.public_news.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\public_news.ashx.cs:行号 129
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (42, 2, N'前台系统', CAST(0x0000A3160135D3E8 AS DateTime), N'http://localhost:11916/data/public_news.ashx?Action=grid&rnd=0.6624244381873244', N'关键字  order  附近有语法错误。', N'XHD.DBUtility', N'在 XHD.DBUtility.DbHelperSQL.Query(String SQLString) 位置 f:\VS 2010\XHDcrm\DBUtility\DbHelperSQL.cs:行号 517
   在 XHD.DAL.public_news.GetList(Int32 PageSize, Int32 PageIndex, String strWhere, String filedOrder, String& Total) 位置 f:\VS 2010\XHDcrm\DAL\public_news.cs:行号 317
   在 XHD.BLL.public_news.GetList(Int32 PageSize, Int32 PageIndex, String strWhere, String filedOrder, String& Total) 位置 f:\VS 2010\XHDcrm\BLL\public_news.cs:行号 204
   在 XHD.XHD_crm.Data.public_news.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\public_news.ashx.cs:行号 129
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (43, 2, N'前台系统', CAST(0x0000A3160139C40D AS DateTime), N'http://localhost:11916/data/public_notice.ashx?Action=grid&rnd=0.9989637813475818', N'未能创建类型“XHD.XHD_crm.Data.public_notice”。', N'System.Web', N'在 System.Web.UI.SimpleWebHandlerParser.GetType(String typeName)
   在 System.Web.UI.SimpleWebHandlerParser.GetTypeToCache(Assembly builtAssembly)
   在 System.Web.Compilation.SimpleHandlerBuildProvider.GetGeneratedType(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.CreateBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.GetBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResult(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean ensureIsUpToDate)
   在 System.Web.UI.SimpleHandlerFactory.System.Web.IHttpHandlerFactory2.GetHandler(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   在 System.Web.UI.SimpleHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   在 System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (44, 2, N'前台系统', CAST(0x0000A3160139D34C AS DateTime), N'http://localhost:11916/data/public_notice.ashx?Action=grid&rnd=0.41806687819628246', N'未能创建类型“XHD.XHD_crm.Data.public_notice”。', N'System.Web', N'在 System.Web.UI.SimpleWebHandlerParser.GetType(String typeName)
   在 System.Web.UI.SimpleWebHandlerParser.GetTypeToCache(Assembly builtAssembly)
   在 System.Web.Compilation.SimpleHandlerBuildProvider.GetGeneratedType(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.CreateBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.GetBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResult(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean ensureIsUpToDate)
   在 System.Web.UI.SimpleHandlerFactory.System.Web.IHttpHandlerFactory2.GetHandler(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   在 System.Web.UI.SimpleHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   在 System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (45, 2, N'前台系统', CAST(0x0000A3160139D9C5 AS DateTime), N'http://localhost:11916/data/public_notice.ashx', N'未能创建类型“XHD.XHD_crm.Data.public_notice”。', N'System.Web', N'在 System.Web.UI.SimpleWebHandlerParser.GetType(String typeName)
   在 System.Web.UI.SimpleWebHandlerParser.GetTypeToCache(Assembly builtAssembly)
   在 System.Web.Compilation.SimpleHandlerBuildProvider.GetGeneratedType(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.CreateBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.GetBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResult(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean ensureIsUpToDate)
   在 System.Web.UI.SimpleHandlerFactory.System.Web.IHttpHandlerFactory2.GetHandler(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   在 System.Web.UI.SimpleHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   在 System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (46, 2, N'前台系统', CAST(0x0000A3160139D9E0 AS DateTime), N'http://localhost:11916/data/public_notice.ashx?Action=grid&rnd=0.41806687819628246', N'未能创建类型“XHD.XHD_crm.Data.public_notice”。', N'System.Web', N'在 System.Web.UI.SimpleWebHandlerParser.GetType(String typeName)
   在 System.Web.UI.SimpleWebHandlerParser.GetTypeToCache(Assembly builtAssembly)
   在 System.Web.Compilation.SimpleHandlerBuildProvider.GetGeneratedType(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.CreateBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.GetBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResult(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean ensureIsUpToDate)
   在 System.Web.UI.SimpleHandlerFactory.System.Web.IHttpHandlerFactory2.GetHandler(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   在 System.Web.UI.SimpleHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   在 System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (47, 2, N'前台系统', CAST(0x0000A3160139DC01 AS DateTime), N'http://localhost:11916/data/public_notice.ashx?Action=grid&rnd=0.41806687819628246', N'未能创建类型“XHD.XHD_crm.Data.public_notice”。', N'System.Web', N'在 System.Web.UI.SimpleWebHandlerParser.GetType(String typeName)
   在 System.Web.UI.SimpleWebHandlerParser.GetTypeToCache(Assembly builtAssembly)
   在 System.Web.Compilation.SimpleHandlerBuildProvider.GetGeneratedType(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.CreateBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.GetBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResult(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean ensureIsUpToDate)
   在 System.Web.UI.SimpleHandlerFactory.System.Web.IHttpHandlerFactory2.GetHandler(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   在 System.Web.UI.SimpleHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   在 System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (48, 2, N'前台系统', CAST(0x0000A316013F0C84 AS DateTime), N'http://localhost:11916/data/Sys_Menu.ashx?Action=GetMenu&parentid=-1', N'值不能为 null。
参数名: input', N'System', N'在 System.Text.RegularExpressions.Regex.Match(String input)
   在 XHD.Common.PageValidate.IsNumber(String inputData) 位置 f:\VS 2010\XHDcrm\Common\PageValidate.cs:行号 67
   在 XHD.XHD_crm.Data.sys_menu.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\sys_menu.ashx.cs:行号 22
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (49, 2, N'前台系统', CAST(0x0000A316013F0EB5 AS DateTime), N'http://localhost:11916/data/Sys_Menu.ashx?Action=GetMenu&parentid=-1', N'值不能为 null。
参数名: input', N'System', N'在 System.Text.RegularExpressions.Regex.Match(String input)
   在 XHD.Common.PageValidate.IsNumber(String inputData) 位置 f:\VS 2010\XHDcrm\Common\PageValidate.cs:行号 67
   在 XHD.XHD_crm.Data.sys_menu.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\sys_menu.ashx.cs:行号 22
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (50, 2, N'前台系统', CAST(0x0000A316013FAB53 AS DateTime), N'http://localhost:11916/data/Sys_Menu.ashx?Action=GetMenu&parentid=-1', N'值不能为 null。
参数名: input', N'System', N'在 System.Text.RegularExpressions.Regex.Match(String input)
   在 XHD.Common.PageValidate.IsNumber(String inputData) 位置 f:\VS 2010\XHDcrm\Common\PageValidate.cs:行号 67
   在 XHD.XHD_crm.Data.sys_menu.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\sys_menu.ashx.cs:行号 22
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (51, 2, N'前台系统', CAST(0x0000A316014512B1 AS DateTime), N'http://localhost:11916/data/hr_department.ashx?Action=tree&rnd=0.2963309979396495', N'未能创建类型“XHD.XHD_crm.Data.hr_department”。', N'System.Web', N'在 System.Web.UI.SimpleWebHandlerParser.GetType(String typeName)
   在 System.Web.UI.SimpleWebHandlerParser.GetTypeToCache(Assembly builtAssembly)
   在 System.Web.Compilation.SimpleHandlerBuildProvider.GetGeneratedType(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.CreateBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.GetBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResult(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean ensureIsUpToDate)
   在 System.Web.UI.SimpleHandlerFactory.System.Web.IHttpHandlerFactory2.GetHandler(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   在 System.Web.UI.SimpleHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   在 System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (52, 2, N'前台系统', CAST(0x0000A316014512B1 AS DateTime), N'http://localhost:11916/data/hr_department.ashx?Action=department&did=-2', N'未能创建类型“XHD.XHD_crm.Data.hr_department”。', N'System.Web', N'在 System.Web.UI.SimpleWebHandlerParser.GetType(String typeName)
   在 System.Web.UI.SimpleWebHandlerParser.GetTypeToCache(Assembly builtAssembly)
   在 System.Web.Compilation.SimpleHandlerBuildProvider.GetGeneratedType(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.CreateBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.GetBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResult(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean ensureIsUpToDate)
   在 System.Web.UI.SimpleHandlerFactory.System.Web.IHttpHandlerFactory2.GetHandler(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   在 System.Web.UI.SimpleHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   在 System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (53, 2, N'前台系统', CAST(0x0000A316014536AF AS DateTime), N'http://localhost:11916/data/hr_department.ashx?Action=tree&rnd=0.10210162990255211', N'未能创建类型“XHD.XHD_crm.Data.hr_department”。', N'System.Web', N'在 System.Web.UI.SimpleWebHandlerParser.GetType(String typeName)
   在 System.Web.UI.SimpleWebHandlerParser.GetTypeToCache(Assembly builtAssembly)
   在 System.Web.Compilation.SimpleHandlerBuildProvider.GetGeneratedType(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.CreateBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.GetBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResult(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean ensureIsUpToDate)
   在 System.Web.UI.SimpleHandlerFactory.System.Web.IHttpHandlerFactory2.GetHandler(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   在 System.Web.UI.SimpleHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   在 System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (54, 2, N'前台系统', CAST(0x0000A31601453ACD AS DateTime), N'http://localhost:11916/data/hr_department.ashx?Action=deptree&companyid=0&rnd=0.18387435943791158', N'未能创建类型“XHD.XHD_crm.Data.hr_department”。', N'System.Web', N'在 System.Web.UI.SimpleWebHandlerParser.GetType(String typeName)
   在 System.Web.UI.SimpleWebHandlerParser.GetTypeToCache(Assembly builtAssembly)
   在 System.Web.Compilation.SimpleHandlerBuildProvider.GetGeneratedType(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.CreateBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.GetBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResult(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean ensureIsUpToDate)
   在 System.Web.UI.SimpleHandlerFactory.System.Web.IHttpHandlerFactory2.GetHandler(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   在 System.Web.UI.SimpleHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   在 System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (55, 2, N'前台系统', CAST(0x0000A31601454A4F AS DateTime), N'http://localhost:11916/data/hr_department.ashx', N'未能创建类型“XHD.XHD_crm.Data.hr_department”。', N'System.Web', N'在 System.Web.UI.SimpleWebHandlerParser.GetType(String typeName)
   在 System.Web.UI.SimpleWebHandlerParser.GetTypeToCache(Assembly builtAssembly)
   在 System.Web.Compilation.SimpleHandlerBuildProvider.GetGeneratedType(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.CreateBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.GetBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResult(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean ensureIsUpToDate)
   在 System.Web.UI.SimpleHandlerFactory.System.Web.IHttpHandlerFactory2.GetHandler(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   在 System.Web.UI.SimpleHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   在 System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (56, 2, N'前台系统', CAST(0x0000A31601454A56 AS DateTime), N'http://localhost:11916/data/hr_department.ashx?Action=tree&rnd=0.10210162990255211', N'未能创建类型“XHD.XHD_crm.Data.hr_department”。', N'System.Web', N'在 System.Web.UI.SimpleWebHandlerParser.GetType(String typeName)
   在 System.Web.UI.SimpleWebHandlerParser.GetTypeToCache(Assembly builtAssembly)
   在 System.Web.Compilation.SimpleHandlerBuildProvider.GetGeneratedType(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.CreateBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.GetBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResult(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean ensureIsUpToDate)
   在 System.Web.UI.SimpleHandlerFactory.System.Web.IHttpHandlerFactory2.GetHandler(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   在 System.Web.UI.SimpleHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   在 System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (57, 2, N'前台系统', CAST(0x0000A31601454DBF AS DateTime), N'http://localhost:11916/data/hr_department.ashx?Action=tree&rnd=0.457070583071913', N'未能创建类型“XHD.XHD_crm.Data.hr_department”。', N'System.Web', N'在 System.Web.UI.SimpleWebHandlerParser.GetType(String typeName)
   在 System.Web.UI.SimpleWebHandlerParser.GetTypeToCache(Assembly builtAssembly)
   在 System.Web.Compilation.SimpleHandlerBuildProvider.GetGeneratedType(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.CreateBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.GetBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResult(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean ensureIsUpToDate)
   在 System.Web.UI.SimpleHandlerFactory.System.Web.IHttpHandlerFactory2.GetHandler(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   在 System.Web.UI.SimpleHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   在 System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (58, 2, N'前台系统', CAST(0x0000A3160146D43B AS DateTime), N'http://localhost:11916/data/hr_position.ashx?Action=grid', N'未能创建类型“XHD.XHD_crm.Data.hr_position”。', N'System.Web', N'在 System.Web.UI.SimpleWebHandlerParser.GetType(String typeName)
   在 System.Web.UI.SimpleWebHandlerParser.GetTypeToCache(Assembly builtAssembly)
   在 System.Web.Compilation.SimpleHandlerBuildProvider.GetGeneratedType(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.CreateBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.GetBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResult(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean ensureIsUpToDate)
   在 System.Web.UI.SimpleHandlerFactory.System.Web.IHttpHandlerFactory2.GetHandler(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   在 System.Web.UI.SimpleHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   在 System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (59, 2, N'前台系统', CAST(0x0000A3160146E073 AS DateTime), N'http://localhost:11916/data/hr_position.ashx', N'未能创建类型“XHD.XHD_crm.Data.hr_position”。', N'System.Web', N'在 System.Web.UI.SimpleWebHandlerParser.GetType(String typeName)
   在 System.Web.UI.SimpleWebHandlerParser.GetTypeToCache(Assembly builtAssembly)
   在 System.Web.Compilation.SimpleHandlerBuildProvider.GetGeneratedType(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.CreateBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.GetBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResult(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean ensureIsUpToDate)
   在 System.Web.UI.SimpleHandlerFactory.System.Web.IHttpHandlerFactory2.GetHandler(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   在 System.Web.UI.SimpleHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   在 System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (60, 2, N'前台系统', CAST(0x0000A3160146E086 AS DateTime), N'http://localhost:11916/data/hr_position.ashx?Action=grid', N'未能创建类型“XHD.XHD_crm.Data.hr_position”。', N'System.Web', N'在 System.Web.UI.SimpleWebHandlerParser.GetType(String typeName)
   在 System.Web.UI.SimpleWebHandlerParser.GetTypeToCache(Assembly builtAssembly)
   在 System.Web.Compilation.SimpleHandlerBuildProvider.GetGeneratedType(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.CreateBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.GetBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResult(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean ensureIsUpToDate)
   在 System.Web.UI.SimpleHandlerFactory.System.Web.IHttpHandlerFactory2.GetHandler(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   在 System.Web.UI.SimpleHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   在 System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (61, 2, N'前台系统', CAST(0x0000A316014D0F20 AS DateTime), N'http://localhost:11916/data/hr_employee.ashx?Action=grid', N'未能创建类型“XHD.XHD_crm.Data.hr_employee”。', N'System.Web', N'在 System.Web.UI.SimpleWebHandlerParser.GetType(String typeName)
   在 System.Web.UI.SimpleWebHandlerParser.GetTypeToCache(Assembly builtAssembly)
   在 System.Web.Compilation.SimpleHandlerBuildProvider.GetGeneratedType(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.CreateBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.GetBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResult(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean ensureIsUpToDate)
   在 System.Web.UI.SimpleHandlerFactory.System.Web.IHttpHandlerFactory2.GetHandler(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   在 System.Web.UI.SimpleHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   在 System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (62, 2, N'前台系统', CAST(0x0000A316014D12BC AS DateTime), N'http://localhost:11916/data/hr_employee.ashx?Action=grid', N'未能创建类型“XHD.XHD_crm.Data.hr_employee”。', N'System.Web', N'在 System.Web.UI.SimpleWebHandlerParser.GetType(String typeName)
   在 System.Web.UI.SimpleWebHandlerParser.GetTypeToCache(Assembly builtAssembly)
   在 System.Web.Compilation.SimpleHandlerBuildProvider.GetGeneratedType(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.CreateBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.GetBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResult(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean ensureIsUpToDate)
   在 System.Web.UI.SimpleHandlerFactory.System.Web.IHttpHandlerFactory2.GetHandler(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   在 System.Web.UI.SimpleHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   在 System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (63, 2, N'前台系统', CAST(0x0000A3160173834A AS DateTime), N'http://localhost:11916/data/hr_employee.ashx?Action=Exist&rnd=0.683633772739519&T_uid=miracle', N'未能创建类型“XHD.XHD_crm.Data.hr_employee”。', N'System.Web', N'在 System.Web.UI.SimpleWebHandlerParser.GetType(String typeName)
   在 System.Web.UI.SimpleWebHandlerParser.GetTypeToCache(Assembly builtAssembly)
   在 System.Web.Compilation.SimpleHandlerBuildProvider.GetGeneratedType(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.CreateBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.GetBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResult(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean ensureIsUpToDate)
   在 System.Web.UI.SimpleHandlerFactory.System.Web.IHttpHandlerFactory2.GetHandler(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   在 System.Web.UI.SimpleHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   在 System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (64, 2, N'前台系统', CAST(0x0000A3160176618A AS DateTime), N'http://localhost:11916/data/hr_employee.ashx', N'未能创建类型“XHD.XHD_crm.Data.hr_employee”。', N'System.Web', N'在 System.Web.UI.SimpleWebHandlerParser.GetType(String typeName)
   在 System.Web.UI.SimpleWebHandlerParser.GetTypeToCache(Assembly builtAssembly)
   在 System.Web.Compilation.SimpleHandlerBuildProvider.GetGeneratedType(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.CreateBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.GetBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResult(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean ensureIsUpToDate)
   在 System.Web.UI.SimpleHandlerFactory.System.Web.IHttpHandlerFactory2.GetHandler(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   在 System.Web.UI.SimpleHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   在 System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (65, 2, N'前台系统', CAST(0x0000A31601766197 AS DateTime), N'http://localhost:11916/data/hr_employee.ashx?Action=grid', N'未能创建类型“XHD.XHD_crm.Data.hr_employee”。', N'System.Web', N'在 System.Web.UI.SimpleWebHandlerParser.GetType(String typeName)
   在 System.Web.UI.SimpleWebHandlerParser.GetTypeToCache(Assembly builtAssembly)
   在 System.Web.Compilation.SimpleHandlerBuildProvider.GetGeneratedType(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.CreateBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.GetBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResult(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean ensureIsUpToDate)
   在 System.Web.UI.SimpleHandlerFactory.System.Web.IHttpHandlerFactory2.GetHandler(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   在 System.Web.UI.SimpleHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   在 System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (66, 2, N'前台系统', CAST(0x0000A31601766199 AS DateTime), N'http://localhost:11916/data/hr_employee.ashx?Action=grid', N'未能创建类型“XHD.XHD_crm.Data.hr_employee”。', N'System.Web', N'在 System.Web.UI.SimpleWebHandlerParser.GetType(String typeName)
   在 System.Web.UI.SimpleWebHandlerParser.GetTypeToCache(Assembly builtAssembly)
   在 System.Web.Compilation.SimpleHandlerBuildProvider.GetGeneratedType(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.CreateBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.GetBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResult(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean ensureIsUpToDate)
   在 System.Web.UI.SimpleHandlerFactory.System.Web.IHttpHandlerFactory2.GetHandler(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   在 System.Web.UI.SimpleHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   在 System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (67, 2, N'前台系统', CAST(0x0000A3160176642E AS DateTime), N'http://localhost:11916/data/hr_employee.ashx?Action=grid', N'未能创建类型“XHD.XHD_crm.Data.hr_employee”。', N'System.Web', N'在 System.Web.UI.SimpleWebHandlerParser.GetType(String typeName)
   在 System.Web.UI.SimpleWebHandlerParser.GetTypeToCache(Assembly builtAssembly)
   在 System.Web.Compilation.SimpleHandlerBuildProvider.GetGeneratedType(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.CreateBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.GetBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResult(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean ensureIsUpToDate)
   在 System.Web.UI.SimpleHandlerFactory.System.Web.IHttpHandlerFactory2.GetHandler(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   在 System.Web.UI.SimpleHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   在 System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (68, 2, N'前台系统', CAST(0x0000A3160176718B AS DateTime), N'http://localhost:11916/data/hr_employee.ashx?Action=Exist&rnd=0.7771302589980311&T_uid=miracle', N'未能创建类型“XHD.XHD_crm.Data.hr_employee”。', N'System.Web', N'在 System.Web.UI.SimpleWebHandlerParser.GetType(String typeName)
   在 System.Web.UI.SimpleWebHandlerParser.GetTypeToCache(Assembly builtAssembly)
   在 System.Web.Compilation.SimpleHandlerBuildProvider.GetGeneratedType(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.CreateBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.GetBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResult(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean ensureIsUpToDate)
   在 System.Web.UI.SimpleHandlerFactory.System.Web.IHttpHandlerFactory2.GetHandler(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   在 System.Web.UI.SimpleHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   在 System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (69, 2, N'前台系统', CAST(0x0000A31601768F12 AS DateTime), N'http://localhost:11916/data/hr_employee.ashx', N'未能创建类型“XHD.XHD_crm.Data.hr_employee”。', N'System.Web', N'在 System.Web.UI.SimpleWebHandlerParser.GetType(String typeName)
   在 System.Web.UI.SimpleWebHandlerParser.GetTypeToCache(Assembly builtAssembly)
   在 System.Web.Compilation.SimpleHandlerBuildProvider.GetGeneratedType(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.CreateBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.GetBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResult(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean ensureIsUpToDate)
   在 System.Web.UI.SimpleHandlerFactory.System.Web.IHttpHandlerFactory2.GetHandler(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   在 System.Web.UI.SimpleHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   在 System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (70, 2, N'前台系统', CAST(0x0000A31601768F23 AS DateTime), N'http://localhost:11916/data/hr_employee.ashx?Action=grid', N'未能创建类型“XHD.XHD_crm.Data.hr_employee”。', N'System.Web', N'在 System.Web.UI.SimpleWebHandlerParser.GetType(String typeName)
   在 System.Web.UI.SimpleWebHandlerParser.GetTypeToCache(Assembly builtAssembly)
   在 System.Web.Compilation.SimpleHandlerBuildProvider.GetGeneratedType(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.CreateBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.GetBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResult(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean ensureIsUpToDate)
   在 System.Web.UI.SimpleHandlerFactory.System.Web.IHttpHandlerFactory2.GetHandler(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   在 System.Web.UI.SimpleHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   在 System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (71, 2, N'前台系统', CAST(0x0000A31601768F25 AS DateTime), N'http://localhost:11916/data/hr_employee.ashx?Action=grid', N'未能创建类型“XHD.XHD_crm.Data.hr_employee”。', N'System.Web', N'在 System.Web.UI.SimpleWebHandlerParser.GetType(String typeName)
   在 System.Web.UI.SimpleWebHandlerParser.GetTypeToCache(Assembly builtAssembly)
   在 System.Web.Compilation.SimpleHandlerBuildProvider.GetGeneratedType(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.CreateBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.GetBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResult(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean ensureIsUpToDate)
   在 System.Web.UI.SimpleHandlerFactory.System.Web.IHttpHandlerFactory2.GetHandler(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   在 System.Web.UI.SimpleHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   在 System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (73, 2, N'前台系统', CAST(0x0000A31601778C9A AS DateTime), N'http://localhost:11916/data/Sys_Menu.ashx?Action=GetMenu&parentid=-1', N'值不能为 null。
参数名: input', N'System', N'在 System.Text.RegularExpressions.Regex.Match(String input)
   在 XHD.Common.PageValidate.IsNumber(String inputData) 位置 f:\VS 2010\XHDcrm\Common\PageValidate.cs:行号 67
   在 XHD.XHD_crm.Data.sys_menu.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\sys_menu.ashx.cs:行号 22
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (74, 2, N'前台系统', CAST(0x0000A316017B1188 AS DateTime), N'http://localhost:11916/data/Sys_Menu.ashx?Action=GetMenu&parentid=-1', N'值不能为 null。
参数名: input', N'System', N'在 System.Text.RegularExpressions.Regex.Match(String input)
   在 XHD.Common.PageValidate.IsNumber(String inputData) 位置 f:\VS 2010\XHDcrm\Common\PageValidate.cs:行号 67
   在 XHD.XHD_crm.Data.sys_menu.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\sys_menu.ashx.cs:行号 22
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (75, 2, N'前台系统', CAST(0x0000A316017BE450 AS DateTime), N'http://localhost:11916/data/Sys_Menu.ashx?Action=GetMenu&parentid=-1', N'值不能为 null。
参数名: input', N'System', N'在 System.Text.RegularExpressions.Regex.Match(String input)
   在 XHD.Common.PageValidate.IsNumber(String inputData) 位置 f:\VS 2010\XHDcrm\Common\PageValidate.cs:行号 67
   在 XHD.XHD_crm.Data.sys_menu.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\sys_menu.ashx.cs:行号 22
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (76, 2, N'前台系统', CAST(0x0000A316017E800D AS DateTime), N'http://localhost:11916/data/Sys_role.ashx?Action=getauth&postdata={role_id: 1 ,app: 2 }&rdm=0.916117177566528', N'在位置 0 处没有任何行。', N'System.Data', N'在 System.Data.RBTree`1.GetNodeByIndex(Int32 userIndex)
   在 System.Data.DataRowCollection.get_Item(Int32 index)
   在 XHD.XHD_crm.Data.Sys_role.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\Sys_role.ashx.cs:行号 136
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (77, 2, N'前台系统', CAST(0x0000A316017E83A6 AS DateTime), N'http://localhost:11916/data/Sys_role.ashx?Action=getauth&postdata={role_id: 1 ,app: 1 }&rdm=0.3445199911282084', N'在位置 0 处没有任何行。', N'System.Data', N'在 System.Data.RBTree`1.GetNodeByIndex(Int32 userIndex)
   在 System.Data.DataRowCollection.get_Item(Int32 index)
   在 XHD.XHD_crm.Data.Sys_role.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\Sys_role.ashx.cs:行号 136
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (78, 2, N'前台系统', CAST(0x0000A316017EA6EA AS DateTime), N'http://localhost:11916/data/Sys_role.ashx?Action=getauth&postdata={role_id: 1 ,app: 2 }&rdm=0.13525096188059848', N'在位置 0 处没有任何行。', N'System.Data', N'在 System.Data.RBTree`1.GetNodeByIndex(Int32 userIndex)
   在 System.Data.DataRowCollection.get_Item(Int32 index)
   在 XHD.XHD_crm.Data.Sys_role.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\Sys_role.ashx.cs:行号 136
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (79, 2, N'前台系统', CAST(0x0000A316017F2B06 AS DateTime), N'http://localhost:11916/data/Sys_role.ashx?Action=getauth&postdata={role_id: 1 ,app: 2 }&rdm=0.6677992676883124', N'在位置 0 处没有任何行。', N'System.Data', N'在 System.Data.RBTree`1.GetNodeByIndex(Int32 userIndex)
   在 System.Data.DataRowCollection.get_Item(Int32 index)
   在 XHD.XHD_crm.Data.Sys_role.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\Sys_role.ashx.cs:行号 136
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (80, 2, N'前台系统', CAST(0x0000A316017F2D82 AS DateTime), N'http://localhost:11916/data/Sys_role.ashx?Action=getauth&postdata={role_id: 1 ,app: 3 }&rdm=0.7588713228187984', N'在位置 0 处没有任何行。', N'System.Data', N'在 System.Data.RBTree`1.GetNodeByIndex(Int32 userIndex)
   在 System.Data.DataRowCollection.get_Item(Int32 index)
   在 XHD.XHD_crm.Data.Sys_role.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\Sys_role.ashx.cs:行号 136
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (81, 2, N'前台系统', CAST(0x0000A316017F2E9C AS DateTime), N'http://localhost:11916/data/Sys_role.ashx?Action=getauth&postdata={role_id: 1 ,app: 2 }&rdm=0.8876956772650948', N'在位置 0 处没有任何行。', N'System.Data', N'在 System.Data.RBTree`1.GetNodeByIndex(Int32 userIndex)
   在 System.Data.DataRowCollection.get_Item(Int32 index)
   在 XHD.XHD_crm.Data.Sys_role.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\Sys_role.ashx.cs:行号 136
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (82, 2, N'前台系统', CAST(0x0000A316017F3371 AS DateTime), N'http://localhost:11916/data/Sys_role.ashx?Action=getauth&postdata={role_id: 1 ,app: 3 }&rdm=0.15524191059104586', N'在位置 0 处没有任何行。', N'System.Data', N'在 System.Data.RBTree`1.GetNodeByIndex(Int32 userIndex)
   在 System.Data.DataRowCollection.get_Item(Int32 index)
   在 XHD.XHD_crm.Data.Sys_role.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\Sys_role.ashx.cs:行号 136
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (83, 2, N'前台系统', CAST(0x0000A316017F3985 AS DateTime), N'http://localhost:11916/data/Sys_role.ashx?Action=getauth&postdata={role_id: 1 ,app: 4 }&rdm=0.7119173861020482', N'在位置 0 处没有任何行。', N'System.Data', N'在 System.Data.RBTree`1.GetNodeByIndex(Int32 userIndex)
   在 System.Data.DataRowCollection.get_Item(Int32 index)
   在 XHD.XHD_crm.Data.Sys_role.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\Sys_role.ashx.cs:行号 136
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (84, 2, N'前台系统', CAST(0x0000A316017F3A82 AS DateTime), N'http://localhost:11916/data/Sys_role.ashx?Action=getauth&postdata={role_id: 1 ,app: 5 }&rdm=0.5627073850348827', N'在位置 0 处没有任何行。', N'System.Data', N'在 System.Data.RBTree`1.GetNodeByIndex(Int32 userIndex)
   在 System.Data.DataRowCollection.get_Item(Int32 index)
   在 XHD.XHD_crm.Data.Sys_role.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\Sys_role.ashx.cs:行号 136
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (85, 2, N'前台系统', CAST(0x0000A316017F3BBB AS DateTime), N'http://localhost:11916/data/Sys_role.ashx?Action=getauth&postdata={role_id: 1 ,app: 6 }&rdm=0.7174028782578102', N'在位置 0 处没有任何行。', N'System.Data', N'在 System.Data.RBTree`1.GetNodeByIndex(Int32 userIndex)
   在 System.Data.DataRowCollection.get_Item(Int32 index)
   在 XHD.XHD_crm.Data.Sys_role.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\Sys_role.ashx.cs:行号 136
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (86, 2, N'前台系统', CAST(0x0000A3160181F943 AS DateTime), N'http://localhost:11916/data/Sys_role.ashx?Action=getauth&postdata={role_id: 1 ,app: 2 }&rdm=0.5020379998042583', N'在位置 0 处没有任何行。', N'System.Data', N'在 System.Data.RBTree`1.GetNodeByIndex(Int32 userIndex)
   在 System.Data.DataRowCollection.get_Item(Int32 index)
   在 XHD.XHD_crm.Data.Sys_role.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\Sys_role.ashx.cs:行号 136
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (87, 2, N'前台系统', CAST(0x0000A3160181FAC8 AS DateTime), N'http://localhost:11916/data/Sys_role.ashx?Action=getauth&postdata={role_id: 1 ,app: 4 }&rdm=0.7659796579409854', N'在位置 0 处没有任何行。', N'System.Data', N'在 System.Data.RBTree`1.GetNodeByIndex(Int32 userIndex)
   在 System.Data.DataRowCollection.get_Item(Int32 index)
   在 XHD.XHD_crm.Data.Sys_role.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\Sys_role.ashx.cs:行号 136
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (88, 2, N'前台系统', CAST(0x0000A3160181FB65 AS DateTime), N'http://localhost:11916/data/Sys_role.ashx?Action=getauth&postdata={role_id: 1 ,app: 5 }&rdm=0.6573324668777147', N'在位置 0 处没有任何行。', N'System.Data', N'在 System.Data.RBTree`1.GetNodeByIndex(Int32 userIndex)
   在 System.Data.DataRowCollection.get_Item(Int32 index)
   在 XHD.XHD_crm.Data.Sys_role.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\Sys_role.ashx.cs:行号 136
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (89, 2, N'前台系统', CAST(0x0000A31700A3BC4B AS DateTime), N'http://localhost:11916/data/Sys_Menu.ashx?Action=GetMenu&parentid=-1', N'值不能为 null。
参数名: input', N'System', N'在 System.Text.RegularExpressions.Regex.Match(String input)
   在 XHD.Common.PageValidate.IsNumber(String inputData) 位置 f:\VS 2010\XHDcrm\Common\PageValidate.cs:行号 67
   在 XHD.XHD_crm.Data.sys_menu.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\sys_menu.ashx.cs:行号 22
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (90, 2, N'前台系统', CAST(0x0000A31700A3C31E AS DateTime), N'http://localhost:11916/data/Sys_Menu.ashx?Action=GetMenu&parentid=-1', N'值不能为 null。
参数名: input', N'System', N'在 System.Text.RegularExpressions.Regex.Match(String input)
   在 XHD.Common.PageValidate.IsNumber(String inputData) 位置 f:\VS 2010\XHDcrm\Common\PageValidate.cs:行号 67
   在 XHD.XHD_crm.Data.sys_menu.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\sys_menu.ashx.cs:行号 22
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (91, 2, N'前台系统', CAST(0x0000A31700A8AA56 AS DateTime), N'http://localhost:11916/data/Sys_Menu.ashx?Action=GetMenu&parentid=-1', N'值不能为 null。
参数名: input', N'System', N'在 System.Text.RegularExpressions.Regex.Match(String input)
   在 XHD.Common.PageValidate.IsNumber(String inputData) 位置 f:\VS 2010\XHDcrm\Common\PageValidate.cs:行号 67
   在 XHD.XHD_crm.Data.sys_menu.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\sys_menu.ashx.cs:行号 22
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (92, 2, N'前台系统', CAST(0x0000A31700BDA4EB AS DateTime), N'http://localhost:11916/data/Sys_Menu.ashx?Action=GetMenu&parentid=-1', N'值不能为 null。
参数名: input', N'System', N'在 System.Text.RegularExpressions.Regex.Match(String input)
   在 XHD.Common.PageValidate.IsNumber(String inputData) 位置 f:\VS 2010\XHDcrm\Common\PageValidate.cs:行号 67
   在 XHD.XHD_crm.Data.sys_menu.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\sys_menu.ashx.cs:行号 22
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (93, 2, N'前台系统', CAST(0x0000A31700BDA5FA AS DateTime), N'http://localhost:11916/data/Sys_Menu.ashx?Action=GetMenu&parentid=-1', N'值不能为 null。
参数名: input', N'System', N'在 System.Text.RegularExpressions.Regex.Match(String input)
   在 XHD.Common.PageValidate.IsNumber(String inputData) 位置 f:\VS 2010\XHDcrm\Common\PageValidate.cs:行号 67
   在 XHD.XHD_crm.Data.sys_menu.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\sys_menu.ashx.cs:行号 22
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (94, 2, N'前台系统', CAST(0x0000A31700F6AF5D AS DateTime), N'http://localhost:11916/data/Sys_Menu.ashx?Action=GetMenu&parentid=-1', N'值不能为 null。
参数名: input', N'System', N'在 System.Text.RegularExpressions.Regex.Match(String input)
   在 XHD.Common.PageValidate.IsNumber(String inputData) 位置 f:\VS 2010\XHDcrm\Common\PageValidate.cs:行号 67
   在 XHD.XHD_crm.Data.sys_menu.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\sys_menu.ashx.cs:行号 22
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (95, 2, N'前台系统', CAST(0x0000A31700F82E3F AS DateTime), N'http://localhost:11916/data/Param_SysParam.ashx?Action=GetApp&rnd=0.32113050875715843', N'列“Company_id”不属于表 ds。', N'System.Data', N'在 System.Data.DataRow.GetDataColumn(String columnName)
   在 System.Data.DataRow.get_Item(String columnName)
   在 XHD.XHD_crm.Data.Param_SysParam.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\Param_SysParam.ashx.cs:行号 28
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (96, 2, N'前台系统', CAST(0x0000A31700F83BEC AS DateTime), N'http://localhost:11916/data/Param_SysParam.ashx?Action=GetApp&rnd=0.45011747645135286', N'列“Company_id”不属于表 ds。', N'System.Data', N'在 System.Data.DataRow.GetDataColumn(String columnName)
   在 System.Data.DataRow.get_Item(String columnName)
   在 XHD.XHD_crm.Data.Param_SysParam.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\Param_SysParam.ashx.cs:行号 28
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (97, 2, N'前台系统', CAST(0x0000A31700F8B1C0 AS DateTime), N'http://localhost:11916/data/Param_SysParam.ashx?Action=GetApp&rnd=0.5868393202817079', N'列“Company_id”不属于表 ds。', N'System.Data', N'在 System.Data.DataRow.GetDataColumn(String columnName)
   在 System.Data.DataRow.get_Item(String columnName)
   在 XHD.XHD_crm.Data.Param_SysParam.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\Param_SysParam.ashx.cs:行号 28
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (98, 2, N'前台系统', CAST(0x0000A31700F8B7B3 AS DateTime), N'http://localhost:11916/data/Param_SysParam.ashx?Action=GetApp&rnd=0.354187461900446', N'列“Company_id”不属于表 ds。', N'System.Data', N'在 System.Data.DataRow.GetDataColumn(String columnName)
   在 System.Data.DataRow.get_Item(String columnName)
   在 XHD.XHD_crm.Data.Param_SysParam.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\Param_SysParam.ashx.cs:行号 28
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (99, 2, N'前台系统', CAST(0x0000A31700F8F514 AS DateTime), N'http://localhost:11916/data/Param_SysParam.ashx?Action=GetApp&rnd=0.28543151643872966', N'列“Company_id”不属于表 ds。', N'System.Data', N'在 System.Data.DataRow.GetDataColumn(String columnName)
   在 System.Data.DataRow.get_Item(String columnName)
   在 XHD.XHD_crm.Data.Param_SysParam.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\Param_SysParam.ashx.cs:行号 28
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (100, 2, N'前台系统', CAST(0x0000A31700F97BC6 AS DateTime), N'http://localhost:11916/data/Param_SysParam.ashx?Action=GetParams&parentid=1&rnd=0.34546342114687334', N'列名  isDelete  无效。', N'XHD.DBUtility', N'在 XHD.DBUtility.DbHelperSQL.Query(String SQLString) 位置 f:\VS 2010\XHDcrm\DBUtility\DbHelperSQL.cs:行号 517
   在 XHD.DAL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\DAL\Param_SysParam.cs:行号 277
   在 XHD.BLL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\BLL\Param_SysParam.cs:行号 122
   在 XHD.XHD_crm.Data.Param_SysParam.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\Param_SysParam.ashx.cs:行号 50
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (101, 2, N'前台系统', CAST(0x0000A31700F97D0A AS DateTime), N'http://localhost:11916/data/Param_SysParam.ashx?Action=GetParams&parentid=2&rnd=0.5523501481056177', N'列名  isDelete  无效。', N'XHD.DBUtility', N'在 XHD.DBUtility.DbHelperSQL.Query(String SQLString) 位置 f:\VS 2010\XHDcrm\DBUtility\DbHelperSQL.cs:行号 517
   在 XHD.DAL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\DAL\Param_SysParam.cs:行号 277
   在 XHD.BLL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\BLL\Param_SysParam.cs:行号 122
   在 XHD.XHD_crm.Data.Param_SysParam.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\Param_SysParam.ashx.cs:行号 50
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
GO
print 'Processed 100 total records'
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (102, 2, N'前台系统', CAST(0x0000A31700F97DE4 AS DateTime), N'http://localhost:11916/data/Param_SysParam.ashx?Action=GetParams&parentid=3&rnd=0.894323805835815', N'列名  isDelete  无效。', N'XHD.DBUtility', N'在 XHD.DBUtility.DbHelperSQL.Query(String SQLString) 位置 f:\VS 2010\XHDcrm\DBUtility\DbHelperSQL.cs:行号 517
   在 XHD.DAL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\DAL\Param_SysParam.cs:行号 277
   在 XHD.BLL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\BLL\Param_SysParam.cs:行号 122
   在 XHD.XHD_crm.Data.Param_SysParam.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\Param_SysParam.ashx.cs:行号 50
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (103, 2, N'前台系统', CAST(0x0000A31700F97E82 AS DateTime), N'http://localhost:11916/data/Param_SysParam.ashx?Action=GetParams&parentid=4&rnd=0.6777956015979796', N'列名  isDelete  无效。', N'XHD.DBUtility', N'在 XHD.DBUtility.DbHelperSQL.Query(String SQLString) 位置 f:\VS 2010\XHDcrm\DBUtility\DbHelperSQL.cs:行号 517
   在 XHD.DAL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\DAL\Param_SysParam.cs:行号 277
   在 XHD.BLL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\BLL\Param_SysParam.cs:行号 122
   在 XHD.XHD_crm.Data.Param_SysParam.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\Param_SysParam.ashx.cs:行号 50
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (104, 2, N'前台系统', CAST(0x0000A31700F97F02 AS DateTime), N'http://localhost:11916/data/Param_SysParam.ashx?Action=GetParams&parentid=5&rnd=0.09795338154575422', N'列名  isDelete  无效。', N'XHD.DBUtility', N'在 XHD.DBUtility.DbHelperSQL.Query(String SQLString) 位置 f:\VS 2010\XHDcrm\DBUtility\DbHelperSQL.cs:行号 517
   在 XHD.DAL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\DAL\Param_SysParam.cs:行号 277
   在 XHD.BLL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\BLL\Param_SysParam.cs:行号 122
   在 XHD.XHD_crm.Data.Param_SysParam.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\Param_SysParam.ashx.cs:行号 50
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (105, 2, N'前台系统', CAST(0x0000A31700F97F89 AS DateTime), N'http://localhost:11916/data/Param_SysParam.ashx?Action=GetParams&parentid=6&rnd=0.2716304450546345', N'列名  isDelete  无效。', N'XHD.DBUtility', N'在 XHD.DBUtility.DbHelperSQL.Query(String SQLString) 位置 f:\VS 2010\XHDcrm\DBUtility\DbHelperSQL.cs:行号 517
   在 XHD.DAL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\DAL\Param_SysParam.cs:行号 277
   在 XHD.BLL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\BLL\Param_SysParam.cs:行号 122
   在 XHD.XHD_crm.Data.Param_SysParam.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\Param_SysParam.ashx.cs:行号 50
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (106, 2, N'前台系统', CAST(0x0000A31700F9800F AS DateTime), N'http://localhost:11916/data/Param_SysParam.ashx?Action=GetParams&parentid=7&rnd=0.7743598141914632', N'列名  isDelete  无效。', N'XHD.DBUtility', N'在 XHD.DBUtility.DbHelperSQL.Query(String SQLString) 位置 f:\VS 2010\XHDcrm\DBUtility\DbHelperSQL.cs:行号 517
   在 XHD.DAL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\DAL\Param_SysParam.cs:行号 277
   在 XHD.BLL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\BLL\Param_SysParam.cs:行号 122
   在 XHD.XHD_crm.Data.Param_SysParam.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\Param_SysParam.ashx.cs:行号 50
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (107, 2, N'前台系统', CAST(0x0000A31700F98142 AS DateTime), N'http://localhost:11916/data/Param_SysParam.ashx?Action=GetParams&parentid=1&rnd=0.8763582402059926', N'列名  isDelete  无效。', N'XHD.DBUtility', N'在 XHD.DBUtility.DbHelperSQL.Query(String SQLString) 位置 f:\VS 2010\XHDcrm\DBUtility\DbHelperSQL.cs:行号 517
   在 XHD.DAL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\DAL\Param_SysParam.cs:行号 277
   在 XHD.BLL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\BLL\Param_SysParam.cs:行号 122
   在 XHD.XHD_crm.Data.Param_SysParam.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\Param_SysParam.ashx.cs:行号 50
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (108, 2, N'前台系统', CAST(0x0000A31700FA5192 AS DateTime), N'http://localhost:11916/data/Param_SysParam.ashx?Action=GetParams&parentid=1&rnd=0.9627705123494281', N'列名  isDelete  无效。', N'XHD.DBUtility', N'在 XHD.DBUtility.DbHelperSQL.Query(String SQLString) 位置 f:\VS 2010\XHDcrm\DBUtility\DbHelperSQL.cs:行号 517
   在 XHD.DAL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\DAL\Param_SysParam.cs:行号 277
   在 XHD.BLL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\BLL\Param_SysParam.cs:行号 122
   在 XHD.XHD_crm.Data.Param_SysParam.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\Param_SysParam.ashx.cs:行号 50
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (109, 2, N'前台系统', CAST(0x0000A31700FA5A77 AS DateTime), N'http://localhost:11916/data/Param_SysParam.ashx?Action=GetParams&parentid=1&rnd=0.8632965185256005', N'列名  isDelete  无效。', N'XHD.DBUtility', N'在 XHD.DBUtility.DbHelperSQL.Query(String SQLString) 位置 f:\VS 2010\XHDcrm\DBUtility\DbHelperSQL.cs:行号 517
   在 XHD.DAL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\DAL\Param_SysParam.cs:行号 277
   在 XHD.BLL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\BLL\Param_SysParam.cs:行号 122
   在 XHD.XHD_crm.Data.Param_SysParam.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\Param_SysParam.ashx.cs:行号 50
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (110, 2, N'前台系统', CAST(0x0000A31700FA8663 AS DateTime), N'http://localhost:11916/data/Param_SysParam.ashx?Action=GetParams&parentid=1&rnd=0.0003658966148602505', N'列名  isDelete  无效。', N'XHD.DBUtility', N'在 XHD.DBUtility.DbHelperSQL.Query(String SQLString) 位置 f:\VS 2010\XHDcrm\DBUtility\DbHelperSQL.cs:行号 517
   在 XHD.DAL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\DAL\Param_SysParam.cs:行号 277
   在 XHD.BLL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\BLL\Param_SysParam.cs:行号 122
   在 XHD.XHD_crm.Data.Param_SysParam.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\Param_SysParam.ashx.cs:行号 50
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (111, 2, N'前台系统', CAST(0x0000A31700FA8DB2 AS DateTime), N'http://localhost:11916/data/Param_SysParam.ashx?Action=GetParams&parentid=1&rnd=0.0003658966148602505', N'列名  isDelete  无效。', N'XHD.DBUtility', N'在 XHD.DBUtility.DbHelperSQL.Query(String SQLString) 位置 f:\VS 2010\XHDcrm\DBUtility\DbHelperSQL.cs:行号 517
   在 XHD.DAL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\DAL\Param_SysParam.cs:行号 277
   在 XHD.BLL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\BLL\Param_SysParam.cs:行号 122
   在 XHD.XHD_crm.Data.Param_SysParam.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\Param_SysParam.ashx.cs:行号 50
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (112, 2, N'前台系统', CAST(0x0000A31700FA9176 AS DateTime), N'http://localhost:11916/data/Param_SysParam.ashx?Action=GetParams&parentid=1&rnd=0.0003658966148602505', N'列名  isDelete  无效。', N'XHD.DBUtility', N'在 XHD.DBUtility.DbHelperSQL.Query(String SQLString) 位置 f:\VS 2010\XHDcrm\DBUtility\DbHelperSQL.cs:行号 517
   在 XHD.DAL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\DAL\Param_SysParam.cs:行号 277
   在 XHD.BLL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\BLL\Param_SysParam.cs:行号 122
   在 XHD.XHD_crm.Data.Param_SysParam.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\Param_SysParam.ashx.cs:行号 50
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (113, 2, N'前台系统', CAST(0x0000A31700FAA3E4 AS DateTime), N'http://localhost:11916/data/Param_SysParam.ashx?Action=GetParams&parentid=2&rnd=0.7886624233396189', N'列名  isDelete  无效。', N'XHD.DBUtility', N'在 XHD.DBUtility.DbHelperSQL.Query(String SQLString) 位置 f:\VS 2010\XHDcrm\DBUtility\DbHelperSQL.cs:行号 517
   在 XHD.DAL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\DAL\Param_SysParam.cs:行号 277
   在 XHD.BLL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\BLL\Param_SysParam.cs:行号 122
   在 XHD.XHD_crm.Data.Param_SysParam.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\Param_SysParam.ashx.cs:行号 50
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (114, 2, N'前台系统', CAST(0x0000A31700FAA4A2 AS DateTime), N'http://localhost:11916/data/Param_SysParam.ashx?Action=GetParams&parentid=1&rnd=0.6046105575639438', N'列名  isDelete  无效。', N'XHD.DBUtility', N'在 XHD.DBUtility.DbHelperSQL.Query(String SQLString) 位置 f:\VS 2010\XHDcrm\DBUtility\DbHelperSQL.cs:行号 517
   在 XHD.DAL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\DAL\Param_SysParam.cs:行号 277
   在 XHD.BLL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\BLL\Param_SysParam.cs:行号 122
   在 XHD.XHD_crm.Data.Param_SysParam.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\Param_SysParam.ashx.cs:行号 50
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (115, 2, N'前台系统', CAST(0x0000A31700FAB67B AS DateTime), N'http://localhost:11916/data/Param_SysParam.ashx?Action=GetParams&parentid=1&rnd=0.6046105575639438', N'列名  isDelete  无效。', N'XHD.DBUtility', N'在 XHD.DBUtility.DbHelperSQL.Query(String SQLString) 位置 f:\VS 2010\XHDcrm\DBUtility\DbHelperSQL.cs:行号 517
   在 XHD.DAL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\DAL\Param_SysParam.cs:行号 277
   在 XHD.BLL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\BLL\Param_SysParam.cs:行号 122
   在 XHD.XHD_crm.Data.Param_SysParam.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\Param_SysParam.ashx.cs:行号 50
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (116, 2, N'前台系统', CAST(0x0000A31700FB1AA0 AS DateTime), N'http://localhost:11916/data/Param_SysParam.ashx?Action=GetParams&parentid=2&rnd=0.4149612448514364', N'列名  isDelete  无效。', N'XHD.DBUtility', N'在 XHD.DBUtility.DbHelperSQL.Query(String SQLString) 位置 f:\VS 2010\XHDcrm\DBUtility\DbHelperSQL.cs:行号 517
   在 XHD.DAL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\DAL\Param_SysParam.cs:行号 277
   在 XHD.BLL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\BLL\Param_SysParam.cs:行号 122
   在 XHD.XHD_crm.Data.Param_SysParam.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\Param_SysParam.ashx.cs:行号 50
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (117, 2, N'前台系统', CAST(0x0000A31700FB1B41 AS DateTime), N'http://localhost:11916/data/Param_SysParam.ashx?Action=GetParams&parentid=1&rnd=0.7350226175874837', N'列名  isDelete  无效。', N'XHD.DBUtility', N'在 XHD.DBUtility.DbHelperSQL.Query(String SQLString) 位置 f:\VS 2010\XHDcrm\DBUtility\DbHelperSQL.cs:行号 517
   在 XHD.DAL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\DAL\Param_SysParam.cs:行号 277
   在 XHD.BLL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\BLL\Param_SysParam.cs:行号 122
   在 XHD.XHD_crm.Data.Param_SysParam.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\Param_SysParam.ashx.cs:行号 50
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (118, 2, N'前台系统', CAST(0x0000A31700FCBDD8 AS DateTime), N'http://localhost:11916/data/Param_SysParam.ashx?Action=combo&parentid=3&rnd=0.42877424270134756', N'列名  isDelete  无效。', N'XHD.DBUtility', N'在 XHD.DBUtility.DbHelperSQL.Query(String SQLString) 位置 f:\VS 2010\XHDcrm\DBUtility\DbHelperSQL.cs:行号 517
   在 XHD.DAL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\DAL\Param_SysParam.cs:行号 277
   在 XHD.BLL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\BLL\Param_SysParam.cs:行号 122
   在 XHD.XHD_crm.Data.Param_SysParam.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\Param_SysParam.ashx.cs:行号 63
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (119, 2, N'前台系统', CAST(0x0000A31700FCBDD4 AS DateTime), N'http://localhost:11916/data/Param_SysParam.ashx?Action=combo&parentid=1&rnd=0.520871306712542', N'列名  isDelete  无效。', N'XHD.DBUtility', N'在 XHD.DBUtility.DbHelperSQL.Query(String SQLString) 位置 f:\VS 2010\XHDcrm\DBUtility\DbHelperSQL.cs:行号 517
   在 XHD.DAL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\DAL\Param_SysParam.cs:行号 277
   在 XHD.BLL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\BLL\Param_SysParam.cs:行号 122
   在 XHD.XHD_crm.Data.Param_SysParam.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\Param_SysParam.ashx.cs:行号 63
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (120, 2, N'前台系统', CAST(0x0000A31700FCBDD6 AS DateTime), N'http://localhost:11916/data/Param_SysParam.ashx?Action=combo&parentid=2&rnd=0.6600126491761236', N'列名  isDelete  无效。', N'XHD.DBUtility', N'在 XHD.DBUtility.DbHelperSQL.Query(String SQLString) 位置 f:\VS 2010\XHDcrm\DBUtility\DbHelperSQL.cs:行号 517
   在 XHD.DAL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\DAL\Param_SysParam.cs:行号 277
   在 XHD.BLL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\BLL\Param_SysParam.cs:行号 122
   在 XHD.XHD_crm.Data.Param_SysParam.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\Param_SysParam.ashx.cs:行号 63
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (121, 2, N'前台系统', CAST(0x0000A31700FCCE78 AS DateTime), N'http://localhost:11916/data/Param_SysParam.ashx?Action=combo&parentid=1&rnd=0.8417400606267558', N'列名  isDelete  无效。', N'XHD.DBUtility', N'在 XHD.DBUtility.DbHelperSQL.Query(String SQLString) 位置 f:\VS 2010\XHDcrm\DBUtility\DbHelperSQL.cs:行号 517
   在 XHD.DAL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\DAL\Param_SysParam.cs:行号 277
   在 XHD.BLL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\BLL\Param_SysParam.cs:行号 122
   在 XHD.XHD_crm.Data.Param_SysParam.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\Param_SysParam.ashx.cs:行号 63
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (122, 2, N'前台系统', CAST(0x0000A31700FCCE7A AS DateTime), N'http://localhost:11916/data/Param_SysParam.ashx?Action=combo&parentid=2&rnd=0.7160136208439563', N'列名  isDelete  无效。', N'XHD.DBUtility', N'在 XHD.DBUtility.DbHelperSQL.Query(String SQLString) 位置 f:\VS 2010\XHDcrm\DBUtility\DbHelperSQL.cs:行号 517
   在 XHD.DAL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\DAL\Param_SysParam.cs:行号 277
   在 XHD.BLL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\BLL\Param_SysParam.cs:行号 122
   在 XHD.XHD_crm.Data.Param_SysParam.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\Param_SysParam.ashx.cs:行号 63
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (123, 2, N'前台系统', CAST(0x0000A31700FCCE7C AS DateTime), N'http://localhost:11916/data/Param_SysParam.ashx?Action=combo&parentid=3&rnd=0.1894924922641072', N'列名  isDelete  无效。', N'XHD.DBUtility', N'在 XHD.DBUtility.DbHelperSQL.Query(String SQLString) 位置 f:\VS 2010\XHDcrm\DBUtility\DbHelperSQL.cs:行号 517
   在 XHD.DAL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\DAL\Param_SysParam.cs:行号 277
   在 XHD.BLL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\BLL\Param_SysParam.cs:行号 122
   在 XHD.XHD_crm.Data.Param_SysParam.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\Param_SysParam.ashx.cs:行号 63
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (124, 2, N'前台系统', CAST(0x0000A31700FCD5C6 AS DateTime), N'http://localhost:11916/data/Param_SysParam.ashx?Action=combo&parentid=1&rnd=0.03831132302764434', N'列名  isDelete  无效。', N'XHD.DBUtility', N'在 XHD.DBUtility.DbHelperSQL.Query(String SQLString) 位置 f:\VS 2010\XHDcrm\DBUtility\DbHelperSQL.cs:行号 517
   在 XHD.DAL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\DAL\Param_SysParam.cs:行号 277
   在 XHD.BLL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\BLL\Param_SysParam.cs:行号 122
   在 XHD.XHD_crm.Data.Param_SysParam.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\Param_SysParam.ashx.cs:行号 63
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (125, 2, N'前台系统', CAST(0x0000A31700FCD5C8 AS DateTime), N'http://localhost:11916/data/Param_SysParam.ashx?Action=combo&parentid=2&rnd=0.5939490670050324', N'列名  isDelete  无效。', N'XHD.DBUtility', N'在 XHD.DBUtility.DbHelperSQL.Query(String SQLString) 位置 f:\VS 2010\XHDcrm\DBUtility\DbHelperSQL.cs:行号 517
   在 XHD.DAL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\DAL\Param_SysParam.cs:行号 277
   在 XHD.BLL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\BLL\Param_SysParam.cs:行号 122
   在 XHD.XHD_crm.Data.Param_SysParam.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\Param_SysParam.ashx.cs:行号 63
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (126, 2, N'前台系统', CAST(0x0000A31700FCD5CA AS DateTime), N'http://localhost:11916/data/Param_SysParam.ashx?Action=combo&parentid=3&rnd=0.9556965728248942', N'列名  isDelete  无效。', N'XHD.DBUtility', N'在 XHD.DBUtility.DbHelperSQL.Query(String SQLString) 位置 f:\VS 2010\XHDcrm\DBUtility\DbHelperSQL.cs:行号 517
   在 XHD.DAL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\DAL\Param_SysParam.cs:行号 277
   在 XHD.BLL.Param_SysParam.GetList(Int32 Top, String strWhere, String filedOrder) 位置 f:\VS 2010\XHDcrm\BLL\Param_SysParam.cs:行号 122
   在 XHD.XHD_crm.Data.Param_SysParam.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\Param_SysParam.ashx.cs:行号 63
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (127, 2, N'前台系统', CAST(0x0000A3170101698D AS DateTime), N'http://localhost:11916/data/CRM_Follow.ashx', N'对象名  dbo.C_CRM_Follow  无效。', N'.Net SqlClient Data Provider', N'在 XHD.DBUtility.DbHelperSQL.ExecuteSql(String SQLString) 位置 f:\VS 2010\XHDcrm\DBUtility\DbHelperSQL.cs:行号 147
   在 XHD.DAL.CRM_Customer.UpdateLastFollow(String id) 位置 f:\VS 2010\XHDcrm\DAL\CRM_Customer.cs:行号 518
   在 XHD.BLL.CRM_Customer.UpdateLastFollow(String id) 位置 f:\VS 2010\XHDcrm\BLL\CRM_Customer.cs:行号 296
   在 XHD.XHD_crm.Data.CRM_Follow.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\CRM_Follow.ashx.cs:行号 94
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (128, 2, N'前台系统', CAST(0x0000A3170101767D AS DateTime), N'http://localhost:11916/data/CRM_Follow.ashx', N'对象名  dbo.C_CRM_Follow  无效。', N'.Net SqlClient Data Provider', N'在 XHD.DBUtility.DbHelperSQL.ExecuteSql(String SQLString) 位置 f:\VS 2010\XHDcrm\DBUtility\DbHelperSQL.cs:行号 147
   在 XHD.DAL.CRM_Customer.UpdateLastFollow(String id) 位置 f:\VS 2010\XHDcrm\DAL\CRM_Customer.cs:行号 518
   在 XHD.BLL.CRM_Customer.UpdateLastFollow(String id) 位置 f:\VS 2010\XHDcrm\BLL\CRM_Customer.cs:行号 296
   在 XHD.XHD_crm.Data.CRM_Follow.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\CRM_Follow.ashx.cs:行号 94
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (129, 2, N'前台系统', CAST(0x0000A317010B87FB AS DateTime), N'http://localhost:11916/data/Crm_product_category.ashx', N'值不能为 null。
参数名: String', N'mscorlib', N'在 System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   在 System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   在 System.Int32.Parse(String s)
   在 XHD.XHD_crm.Data.CRM_product_category.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\CRM_product_category.ashx.cs:行号 46
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (130, 2, N'前台系统', CAST(0x0000A317010B9251 AS DateTime), N'http://localhost:11916/data/Crm_product_category.ashx', N'值不能为 null。
参数名: String', N'mscorlib', N'在 System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   在 System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   在 System.Int32.Parse(String s)
   在 XHD.XHD_crm.Data.CRM_product_category.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\CRM_product_category.ashx.cs:行号 46
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (131, 2, N'前台系统', CAST(0x0000A317010FB7FF AS DateTime), N'http://localhost:11916/data/Crm_product.ashx?Action=grid&categoryid=2&rnd=0.9012315815383285', N'列名  id  无效。', N'XHD.DBUtility', N'在 XHD.DBUtility.DbHelperSQL.Query(String SQLString) 位置 f:\VS 2010\XHDcrm\DBUtility\DbHelperSQL.cs:行号 517
   在 XHD.DAL.CRM_product.GetList(Int32 PageSize, Int32 PageIndex, String strWhere, String filedOrder, String& Total) 位置 f:\VS 2010\XHDcrm\DAL\CRM_product.cs:行号 325
   在 XHD.BLL.CRM_product.GetList(Int32 PageSize, Int32 PageIndex, String strWhere, String filedOrder, String& Total) 位置 f:\VS 2010\XHDcrm\BLL\CRM_product.cs:行号 208
   在 XHD.XHD_crm.Data.CRM_product.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\CRM_product.ashx.cs:行号 135
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (132, 2, N'前台系统', CAST(0x0000A31701100FD7 AS DateTime), N'http://localhost:11916/data/Crm_product.ashx?Action=grid&categoryid=2&rnd=0.4553921491576671', N'列名  id  无效。', N'XHD.DBUtility', N'在 XHD.DBUtility.DbHelperSQL.Query(String SQLString) 位置 f:\VS 2010\XHDcrm\DBUtility\DbHelperSQL.cs:行号 517
   在 XHD.DAL.CRM_product.GetList(Int32 PageSize, Int32 PageIndex, String strWhere, String filedOrder, String& Total) 位置 f:\VS 2010\XHDcrm\DAL\CRM_product.cs:行号 325
   在 XHD.BLL.CRM_product.GetList(Int32 PageSize, Int32 PageIndex, String strWhere, String filedOrder, String& Total) 位置 f:\VS 2010\XHDcrm\BLL\CRM_product.cs:行号 208
   在 XHD.XHD_crm.Data.CRM_product.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\CRM_product.ashx.cs:行号 135
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (133, 2, N'前台系统', CAST(0x0000A31701101110 AS DateTime), N'http://localhost:11916/data/Crm_product.ashx?Action=grid&categoryid=3&rnd=0.7815010389004662', N'列名  id  无效。', N'XHD.DBUtility', N'在 XHD.DBUtility.DbHelperSQL.Query(String SQLString) 位置 f:\VS 2010\XHDcrm\DBUtility\DbHelperSQL.cs:行号 517
   在 XHD.DAL.CRM_product.GetList(Int32 PageSize, Int32 PageIndex, String strWhere, String filedOrder, String& Total) 位置 f:\VS 2010\XHDcrm\DAL\CRM_product.cs:行号 325
   在 XHD.BLL.CRM_product.GetList(Int32 PageSize, Int32 PageIndex, String strWhere, String filedOrder, String& Total) 位置 f:\VS 2010\XHDcrm\BLL\CRM_product.cs:行号 208
   在 XHD.XHD_crm.Data.CRM_product.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\CRM_product.ashx.cs:行号 135
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (134, 2, N'前台系统', CAST(0x0000A31701101238 AS DateTime), N'http://localhost:11916/data/Crm_product.ashx?Action=grid&categoryid=2&rnd=0.4576806476832071', N'列名  id  无效。', N'XHD.DBUtility', N'在 XHD.DBUtility.DbHelperSQL.Query(String SQLString) 位置 f:\VS 2010\XHDcrm\DBUtility\DbHelperSQL.cs:行号 517
   在 XHD.DAL.CRM_product.GetList(Int32 PageSize, Int32 PageIndex, String strWhere, String filedOrder, String& Total) 位置 f:\VS 2010\XHDcrm\DAL\CRM_product.cs:行号 325
   在 XHD.BLL.CRM_product.GetList(Int32 PageSize, Int32 PageIndex, String strWhere, String filedOrder, String& Total) 位置 f:\VS 2010\XHDcrm\BLL\CRM_product.cs:行号 208
   在 XHD.XHD_crm.Data.CRM_product.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\CRM_product.ashx.cs:行号 135
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (135, 2, N'前台系统', CAST(0x0000A31701101347 AS DateTime), N'http://localhost:11916/data/Crm_product.ashx?Action=grid&categoryid=1&rnd=0.5670867736055786', N'列名  id  无效。', N'XHD.DBUtility', N'在 XHD.DBUtility.DbHelperSQL.Query(String SQLString) 位置 f:\VS 2010\XHDcrm\DBUtility\DbHelperSQL.cs:行号 517
   在 XHD.DAL.CRM_product.GetList(Int32 PageSize, Int32 PageIndex, String strWhere, String filedOrder, String& Total) 位置 f:\VS 2010\XHDcrm\DAL\CRM_product.cs:行号 325
   在 XHD.BLL.CRM_product.GetList(Int32 PageSize, Int32 PageIndex, String strWhere, String filedOrder, String& Total) 位置 f:\VS 2010\XHDcrm\BLL\CRM_product.cs:行号 208
   在 XHD.XHD_crm.Data.CRM_product.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\CRM_product.ashx.cs:行号 135
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (136, 2, N'前台系统', CAST(0x0000A31701101421 AS DateTime), N'http://localhost:11916/data/Crm_product.ashx?Action=grid&categoryid=2&rnd=0.024329716915569455', N'列名  id  无效。', N'XHD.DBUtility', N'在 XHD.DBUtility.DbHelperSQL.Query(String SQLString) 位置 f:\VS 2010\XHDcrm\DBUtility\DbHelperSQL.cs:行号 517
   在 XHD.DAL.CRM_product.GetList(Int32 PageSize, Int32 PageIndex, String strWhere, String filedOrder, String& Total) 位置 f:\VS 2010\XHDcrm\DAL\CRM_product.cs:行号 325
   在 XHD.BLL.CRM_product.GetList(Int32 PageSize, Int32 PageIndex, String strWhere, String filedOrder, String& Total) 位置 f:\VS 2010\XHDcrm\BLL\CRM_product.cs:行号 208
   在 XHD.XHD_crm.Data.CRM_product.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\CRM_product.ashx.cs:行号 135
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (137, 2, N'前台系统', CAST(0x0000A3170110190E AS DateTime), N'http://localhost:11916/data/Crm_product.ashx?Action=grid&categoryid=3&rnd=0.47269376241250016', N'列名  id  无效。', N'XHD.DBUtility', N'在 XHD.DBUtility.DbHelperSQL.Query(String SQLString) 位置 f:\VS 2010\XHDcrm\DBUtility\DbHelperSQL.cs:行号 517
   在 XHD.DAL.CRM_product.GetList(Int32 PageSize, Int32 PageIndex, String strWhere, String filedOrder, String& Total) 位置 f:\VS 2010\XHDcrm\DAL\CRM_product.cs:行号 325
   在 XHD.BLL.CRM_product.GetList(Int32 PageSize, Int32 PageIndex, String strWhere, String filedOrder, String& Total) 位置 f:\VS 2010\XHDcrm\BLL\CRM_product.cs:行号 208
   在 XHD.XHD_crm.Data.CRM_product.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\CRM_product.ashx.cs:行号 135
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (138, 2, N'前台系统', CAST(0x0000A31701261FBB AS DateTime), N'http://localhost:11916/data/Base.ashx?Action=GetOnline&rnd=0.5087911329916852', N'startIndex 不能大于字符串长度。
参数名: startIndex', N'mscorlib', N'在 System.String.InternalSubStringWithChecks(Int32 startIndex, Int32 length, Boolean fAlwaysCopy)
   在 System.Web.Compilation.DiskBuildResultCache.MarkAssemblyAndRelatedFilesForDeletion(String assemblyName)
   在 System.Web.Compilation.DiskBuildResultCache.CacheBuildResult(String cacheKey, BuildResult result, Int64 hashCode, DateTime utcStart)
   在 System.Web.Compilation.BuildManager.CacheBuildResultInternal(String cacheKey, BuildResult result, Int64 hashCode, DateTime utcStart)
   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResult(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean ensureIsUpToDate)
   在 System.Web.UI.SimpleHandlerFactory.System.Web.IHttpHandlerFactory2.GetHandler(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   在 System.Web.UI.SimpleHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   在 System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (139, 2, N'前台系统', CAST(0x0000A317014A82C6 AS DateTime), N'http://localhost:11916/data/CRM_order_details.ashx?Action=grid&orderid=null', N'输入字符串的格式不正确。', N'mscorlib', N'在 System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   在 System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   在 System.Int32.Parse(String s)
   在 XHD.XHD_crm.Data.CRM_order_details.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\CRM_order_details.ashx.cs:行号 30
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (140, 2, N'前台系统', CAST(0x0000A317014AFBDC AS DateTime), N'http://localhost:11916/data/CRM_order_details.ashx?Action=grid&orderid=null', N'输入字符串的格式不正确。', N'mscorlib', N'在 System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   在 System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   在 System.Int32.Parse(String s)
   在 XHD.XHD_crm.Data.CRM_order_details.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\CRM_order_details.ashx.cs:行号 30
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (141, 2, N'前台系统', CAST(0x0000A317014C08B4 AS DateTime), N'http://localhost:11916/data/CRM_order_details.ashx?Action=grid&orderid=null', N'输入字符串的格式不正确。', N'mscorlib', N'在 System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   在 System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   在 System.Int32.Parse(String s)
   在 XHD.XHD_crm.Data.CRM_order_details.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\CRM_order_details.ashx.cs:行号 30
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (142, 2, N'前台系统', CAST(0x0000A31701501694 AS DateTime), N'http://localhost:11916/data/CRM_invoice.ashx?Action=grid&rnd=0.9302852518742914', N'未能创建类型“XHD.XHD_crm.Data.CRM_invoice”。', N'System.Web', N'在 System.Web.UI.SimpleWebHandlerParser.GetType(String typeName)
   在 System.Web.UI.SimpleWebHandlerParser.GetTypeToCache(Assembly builtAssembly)
   在 System.Web.Compilation.SimpleHandlerBuildProvider.GetGeneratedType(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.CreateBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.GetBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResult(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean ensureIsUpToDate)
   在 System.Web.UI.SimpleHandlerFactory.System.Web.IHttpHandlerFactory2.GetHandler(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   在 System.Web.UI.SimpleHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   在 System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (143, 2, N'前台系统', CAST(0x0000A31701501806 AS DateTime), N'http://localhost:11916/data/CRM_invoice.ashx?Action=grid&orderid=4', N'未能创建类型“XHD.XHD_crm.Data.CRM_invoice”。', N'System.Web', N'在 System.Web.UI.SimpleWebHandlerParser.GetType(String typeName)
   在 System.Web.UI.SimpleWebHandlerParser.GetTypeToCache(Assembly builtAssembly)
   在 System.Web.Compilation.SimpleHandlerBuildProvider.GetGeneratedType(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.CreateBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.GetBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResult(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean ensureIsUpToDate)
   在 System.Web.UI.SimpleHandlerFactory.System.Web.IHttpHandlerFactory2.GetHandler(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   在 System.Web.UI.SimpleHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   在 System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (144, 2, N'前台系统', CAST(0x0000A31701503F56 AS DateTime), N'http://localhost:11916/data/CRM_invoice.ashx', N'未能创建类型“XHD.XHD_crm.Data.CRM_invoice”。', N'System.Web', N'在 System.Web.UI.SimpleWebHandlerParser.GetType(String typeName)
   在 System.Web.UI.SimpleWebHandlerParser.GetTypeToCache(Assembly builtAssembly)
   在 System.Web.Compilation.SimpleHandlerBuildProvider.GetGeneratedType(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.CreateBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildProvider.GetBuildResult(CompilerResults results)
   在 System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   在 System.Web.Compilation.BuildManager.GetVPathBuildResult(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean ensureIsUpToDate)
   在 System.Web.UI.SimpleHandlerFactory.System.Web.IHttpHandlerFactory2.GetHandler(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   在 System.Web.UI.SimpleHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   在 System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (145, 2, N'前台系统', CAST(0x0000A31701579B87 AS DateTime), N'http://localhost:11916/data/CRM_Customer.ashx', N'对象名  C_hr_employee  无效。', N'XHD.DBUtility', N'在 XHD.DBUtility.DbHelperSQL.Query(String SQLString) 位置 f:\VS 2010\XHDcrm\DBUtility\DbHelperSQL.cs:行号 517
   在 XHD.DAL.CRM_Customer.Compared_empcusadd(DateTime dt1, DateTime dt2, String idlist) 位置 f:\VS 2010\XHDcrm\DAL\CRM_Customer.cs:行号 644
   在 XHD.BLL.CRM_Customer.Compared_empcusadd(DateTime dt1, DateTime dt2, String idlist) 位置 f:\VS 2010\XHDcrm\BLL\CRM_Customer.cs:行号 332
   在 XHD.XHD_crm.Data.CRM_Customer.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\CRM_Customer.ashx.cs:行号 711
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (146, 2, N'前台系统', CAST(0x0000A31701583C4A AS DateTime), N'http://localhost:11916/data/CRM_Customer.ashx', N'对象名  C_hr_employee  无效。', N'XHD.DBUtility', N'在 XHD.DBUtility.DbHelperSQL.Query(String SQLString) 位置 f:\VS 2010\XHDcrm\DBUtility\DbHelperSQL.cs:行号 517
   在 XHD.DAL.CRM_Customer.Compared_empcusadd(DateTime dt1, DateTime dt2, String idlist) 位置 f:\VS 2010\XHDcrm\DAL\CRM_Customer.cs:行号 644
   在 XHD.BLL.CRM_Customer.Compared_empcusadd(DateTime dt1, DateTime dt2, String idlist) 位置 f:\VS 2010\XHDcrm\BLL\CRM_Customer.cs:行号 332
   在 XHD.XHD_crm.Data.CRM_Customer.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\CRM_Customer.ashx.cs:行号 711
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (147, 2, N'前台系统', CAST(0x0000A317015874B2 AS DateTime), N'http://localhost:11916/data/CRM_Customer.ashx', N'对象名  C_hr_employee  无效。', N'XHD.DBUtility', N'在 XHD.DBUtility.DbHelperSQL.Query(String SQLString) 位置 f:\VS 2010\XHDcrm\DBUtility\DbHelperSQL.cs:行号 517
   在 XHD.DAL.CRM_Customer.Compared_empcusadd(DateTime dt1, DateTime dt2, String idlist) 位置 f:\VS 2010\XHDcrm\DAL\CRM_Customer.cs:行号 644
   在 XHD.BLL.CRM_Customer.Compared_empcusadd(DateTime dt1, DateTime dt2, String idlist) 位置 f:\VS 2010\XHDcrm\BLL\CRM_Customer.cs:行号 332
   在 XHD.XHD_crm.Data.CRM_Customer.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\CRM_Customer.ashx.cs:行号 711
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (148, 2, N'前台系统', CAST(0x0000A3170169123F AS DateTime), N'http://localhost:11916/data/Crm_product.ashx', N'列名  id  无效。', N'.Net SqlClient Data Provider', N'在 XHD.DBUtility.DbHelperSQL.ExecuteSql(String SQLString) 位置 f:\VS 2010\XHDcrm\DBUtility\DbHelperSQL.cs:行号 147
   在 XHD.DAL.CRM_product.AdvanceDelete(Int32 id, Int32 isDelete, String time) 位置 f:\VS 2010\XHDcrm\DAL\CRM_product.cs:行号 147
   在 XHD.BLL.CRM_product.AdvanceDelete(Int32 id, Int32 isDelete, String time) 位置 f:\VS 2010\XHDcrm\BLL\CRM_product.cs:行号 59
   在 XHD.XHD_crm.Data.CRM_product.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\CRM_product.ashx.cs:行号 166
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (149, 2, N'前台系统', CAST(0x0000A31701692CF2 AS DateTime), N'http://localhost:11916/data/Crm_product.ashx', N'列名  id  无效。', N'.Net SqlClient Data Provider', N'在 XHD.DBUtility.DbHelperSQL.ExecuteSql(String SQLString) 位置 f:\VS 2010\XHDcrm\DBUtility\DbHelperSQL.cs:行号 147
   在 XHD.DAL.CRM_product.AdvanceDelete(Int32 id, Int32 isDelete, String time) 位置 f:\VS 2010\XHDcrm\DAL\CRM_product.cs:行号 147
   在 XHD.BLL.CRM_product.AdvanceDelete(Int32 id, Int32 isDelete, String time) 位置 f:\VS 2010\XHDcrm\BLL\CRM_product.cs:行号 59
   在 XHD.XHD_crm.Data.CRM_product.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\CRM_product.ashx.cs:行号 166
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (150, 2, N'前台系统', CAST(0x0000A31701698E46 AS DateTime), N'http://localhost:11916/data/Sys_Menu.ashx?Action=GetMenu&parentid=-1', N'值不能为 null。
参数名: input', N'System', N'在 System.Text.RegularExpressions.Regex.Match(String input)
   在 XHD.Common.PageValidate.IsNumber(String inputData) 位置 f:\VS 2010\XHDcrm\Common\PageValidate.cs:行号 67
   在 XHD.XHD_crm.Data.sys_menu.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\sys_menu.ashx.cs:行号 22
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (151, 2, N'前台系统', CAST(0x0000A31800A9E619 AS DateTime), N'http://localhost:11916/Data/login.ashx', N'未将对象引用设置到对象的实例。', N'XHD_crm', N'在 XHD.XHD_crm.Data.login.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\login.ashx.cs:行号 35
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', -1, N'未登录', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (152, 2, N'前台系统', CAST(0x0000A31800AA7C42 AS DateTime), N'http://localhost:11916/data/Sys_role.ashx?Action=getauth&postdata={role_id: 1 ,app: 2 }&rdm=0.028305619722232223', N'在位置 0 处没有任何行。', N'System.Data', N'在 System.Data.RBTree`1.GetNodeByIndex(Int32 userIndex)
   在 System.Data.DataRowCollection.get_Item(Int32 index)
   在 XHD.XHD_crm.Data.Sys_role.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\Sys_role.ashx.cs:行号 136
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 2, N'奇迹', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (153, 2, N'前台系统', CAST(0x0000A31800AA8324 AS DateTime), N'http://localhost:11916/data/Sys_role.ashx?Action=getauth&postdata={role_id: 1 ,app: 4 }&rdm=0.2061811205931008', N'在位置 0 处没有任何行。', N'System.Data', N'在 System.Data.RBTree`1.GetNodeByIndex(Int32 userIndex)
   在 System.Data.DataRowCollection.get_Item(Int32 index)
   在 XHD.XHD_crm.Data.Sys_role.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\Sys_role.ashx.cs:行号 136
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 2, N'奇迹', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (154, 2, N'前台系统', CAST(0x0000A31800AA85DD AS DateTime), N'http://localhost:11916/data/Sys_role.ashx?Action=getauth&postdata={role_id: 1 ,app: 4 }&rdm=0.41156093310564756', N'在位置 0 处没有任何行。', N'System.Data', N'在 System.Data.RBTree`1.GetNodeByIndex(Int32 userIndex)
   在 System.Data.DataRowCollection.get_Item(Int32 index)
   在 XHD.XHD_crm.Data.Sys_role.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\Sys_role.ashx.cs:行号 136
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 2, N'奇迹', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (155, 2, N'前台系统', CAST(0x0000A31800AA8AFE AS DateTime), N'http://localhost:11916/data/Sys_role.ashx?Action=getauth&postdata={role_id: 1 ,app: 5 }&rdm=0.816721725044772', N'在位置 0 处没有任何行。', N'System.Data', N'在 System.Data.RBTree`1.GetNodeByIndex(Int32 userIndex)
   在 System.Data.DataRowCollection.get_Item(Int32 index)
   在 XHD.XHD_crm.Data.Sys_role.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\Sys_role.ashx.cs:行号 136
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 2, N'奇迹', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (156, 2, N'前台系统', CAST(0x0000A31800AAA7A7 AS DateTime), N'http://localhost:11916/data/Sys_Menu.ashx?Action=GetMenu&parentid=-1', N'值不能为 null。
参数名: input', N'System', N'在 System.Text.RegularExpressions.Regex.Match(String input)
   在 XHD.Common.PageValidate.IsNumber(String inputData) 位置 f:\VS 2010\XHDcrm\Common\PageValidate.cs:行号 67
   在 XHD.XHD_crm.Data.sys_menu.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\sys_menu.ashx.cs:行号 22
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 2, N'奇迹', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (157, 2, N'前台系统', CAST(0x0000A31800AB66E5 AS DateTime), N'http://localhost:11916/data/Sys_Menu.ashx?Action=GetMenu&parentid=-1', N'值不能为 null。
参数名: input', N'System', N'在 System.Text.RegularExpressions.Regex.Match(String input)
   在 XHD.Common.PageValidate.IsNumber(String inputData) 位置 f:\VS 2010\XHDcrm\Common\PageValidate.cs:行号 67
   在 XHD.XHD_crm.Data.sys_menu.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\sys_menu.ashx.cs:行号 22
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (158, 2, N'前台系统', CAST(0x0000A31800C82E7D AS DateTime), N'http://localhost:11916/data/Sys_Menu.ashx?Action=GetMenu&parentid=-1', N'值不能为 null。
参数名: input', N'System', N'在 System.Text.RegularExpressions.Regex.Match(String input)
   在 XHD.Common.PageValidate.IsNumber(String inputData) 位置 f:\VS 2010\XHDcrm\Common\PageValidate.cs:行号 67
   在 XHD.XHD_crm.Data.sys_menu.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\sys_menu.ashx.cs:行号 22
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (159, 2, N'前台系统', CAST(0x0000A3180112AE49 AS DateTime), N'http://localhost:11916/data/CRM_order_details.ashx?Action=grid&orderid=null', N'输入字符串的格式不正确。', N'mscorlib', N'在 System.Number.StringToNumber(String str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   在 System.Number.ParseInt32(String s, NumberStyles style, NumberFormatInfo info)
   在 System.Int32.Parse(String s)
   在 XHD.XHD_crm.Data.CRM_order_details.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\CRM_order_details.ashx.cs:行号 30
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (160, 2, N'前台系统', CAST(0x0000A3180116AAA8 AS DateTime), N'http://localhost:11916/data/Sys_Menu.ashx?Action=GetMenu&parentid=-1', N'值不能为 null。
参数名: input', N'System', N'在 System.Text.RegularExpressions.Regex.Match(String input)
   在 XHD.Common.PageValidate.IsNumber(String inputData) 位置 f:\VS 2010\XHDcrm\Common\PageValidate.cs:行号 67
   在 XHD.XHD_crm.Data.sys_menu.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\sys_menu.ashx.cs:行号 25
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (161, 2, N'前台系统', CAST(0x0000A318011AF89D AS DateTime), N'http://localhost:11916/data/CRM_Follow.ashx', N'该字符串未被识别为有效的 DateTime。', N'mscorlib', N'在 System.DateTimeParse.Parse(String s, DateTimeFormatInfo dtfi, DateTimeStyles styles)
   在 System.DateTime.Parse(String s)
   在 XHD.XHD_crm.Data.CRM_Follow.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\CRM_Follow.ashx.cs:行号 428
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (162, 2, N'前台系统', CAST(0x0000A318011AFD3E AS DateTime), N'http://localhost:11916/data/CRM_Follow.ashx', N'该字符串未被识别为有效的 DateTime。', N'mscorlib', N'在 System.DateTimeParse.Parse(String s, DateTimeFormatInfo dtfi, DateTimeStyles styles)
   在 System.DateTime.Parse(String s)
   在 XHD.XHD_crm.Data.CRM_Follow.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\CRM_Follow.ashx.cs:行号 428
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (163, 2, N'前台系统', CAST(0x0000A318011EEE52 AS DateTime), N'http://localhost:11916/data/Crm_contract.ashx', N'该字符串未被识别为有效的 DateTime。', N'mscorlib', N'在 System.DateTimeParse.Parse(String s, DateTimeFormatInfo dtfi, DateTimeStyles styles)
   在 System.DateTime.Parse(String s)
   在 XHD.XHD_crm.Data.CRM_contract.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\CRM_contract.ashx.cs:行号 426
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (164, 2, N'前台系统', CAST(0x0000A31801218606 AS DateTime), N'http://localhost:11916/data/CRM_Follow.ashx', N' )  附近有语法错误。', N'XHD.DBUtility', N'在 XHD.DBUtility.DbHelperSQL.Query(String SQLString) 位置 f:\VS 2010\XHDcrm\DBUtility\DbHelperSQL.cs:行号 517
   在 XHD.DAL.hr_post.GetList(String strWhere) 位置 f:\VS 2010\XHDcrm\DAL\hr_post.cs:行号 310
   在 XHD.BLL.hr_post.GetList(String strWhere) 位置 f:\VS 2010\XHDcrm\BLL\hr_post.cs:行号 115
   在 XHD.XHD_crm.Data.CRM_Follow.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\CRM_Follow.ashx.cs:行号 465
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (165, 2, N'前台系统', CAST(0x0000A31801545BFE AS DateTime), N'http://localhost:11916/data/Sys_Menu.ashx?Action=GetMenu&parentid=-1', N'值不能为 null。
参数名: input', N'System', N'在 System.Text.RegularExpressions.Regex.Match(String input)
   在 XHD.Common.PageValidate.IsNumber(String inputData) 位置 f:\VS 2010\XHDcrm\Common\PageValidate.cs:行号 67
   在 XHD.XHD_crm.Data.sys_menu.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\sys_menu.ashx.cs:行号 25
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
INSERT [dbo].[Sys_log_Err] ([id], [Err_typeid], [Err_type], [Err_time], [Err_url], [Err_message], [Err_source], [Err_trace], [Err_emp_id], [Err_emp_name], [Err_ip]) VALUES (166, 2, N'前台系统', CAST(0x0000A31900A5C024 AS DateTime), N'http://localhost:11916/data/Sys_Menu.ashx?Action=GetMenu&parentid=-1', N'值不能为 null。
参数名: input', N'System', N'在 System.Text.RegularExpressions.Regex.Match(String input)
   在 XHD.Common.PageValidate.IsNumber(String inputData) 位置 f:\VS 2010\XHDcrm\Common\PageValidate.cs:行号 67
   在 XHD.XHD_crm.Data.sys_menu.ProcessRequest(HttpContext context) 位置 f:\VS 2010\XHDcrm\XHD_CRM\Data\sys_menu.ashx.cs:行号 25
   在 System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   在 System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)', 1, N'管理员', N'::1')
SET IDENTITY_INSERT [dbo].[Sys_log_Err] OFF
/****** Object:  Table [dbo].[Sys_log]    Script Date: 05/28/2014 10:08:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[EventType] [varchar](250) NULL,
	[EventID] [varchar](50) NULL,
	[EventTitle] [varchar](250) NULL,
	[Original_txt] [varchar](4000) NULL,
	[Current_txt] [varchar](4000) NULL,
	[UserID] [int] NULL,
	[UserName] [varchar](50) NULL,
	[IPStreet] [varchar](50) NULL,
	[EventDate] [datetime] NULL,
 CONSTRAINT [PK_Sys_log] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Sys_log] ON
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (1, N'系统登录', NULL, NULL, NULL, NULL, 1, N'管理员', N'::1', CAST(0x0000A31601062B81 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (2, N'系统登录', NULL, NULL, NULL, NULL, 1, N'管理员', N'::1', CAST(0x0000A31601189D9C AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (3, N'彻底删除新闻', N'1', N'test', N'【】', N'【】', 1, N'管理员', N'::1', CAST(0x0000A316013671F2 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (4, N'职位修改', N'1', N'总经理1', N'【职务名称】总经理', N'【职务名称】总经理1', 1, N'管理员', N'::1', CAST(0x0000A3160147018E AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (5, N'职位修改', N'1', N'总经理', N'【职务名称】总经理1', N'【职务名称】总经理', 1, N'管理员', N'::1', CAST(0x0000A31601470551 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (6, N'彻底删除员工', N'2', N'奇迹', N'【】', N'【】', 1, N'管理员', N'::1', CAST(0x0000A31601774650 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (7, N'员工修改', N'2', N'奇迹', N'【状态】', N'【状态】在职', 1, N'管理员', N'::1', CAST(0x0000A3160177CBF5 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (8, N'权限修改', N'1', NULL, NULL, NULL, 1, N'管理员', N'::1', CAST(0x0000A316017EA06F AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (9, N'权限修改', N'1', NULL, NULL, NULL, 1, N'管理员', N'::1', CAST(0x0000A316017F370D AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (10, N'权限修改', N'1', NULL, NULL, NULL, 1, N'管理员', N'::1', CAST(0x0000A316017F3FB6 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (11, N'权限人员调整', N'1', NULL, NULL, NULL, 1, N'管理员', N'::1', CAST(0x0000A3160180E395 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (12, N'权限人员调整', N'1', NULL, NULL, NULL, 1, N'管理员', N'::1', CAST(0x0000A3160180F706 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (13, N'权限人员调整', N'1', NULL, NULL, NULL, 1, N'管理员', N'::1', CAST(0x0000A31601818373 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (14, N'权限人员调整', N'1', NULL, NULL, NULL, 1, N'管理员', N'::1', CAST(0x0000A3160181CFD2 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (15, N'权限人员调整', N'1', NULL, NULL, NULL, 1, N'管理员', N'::1', CAST(0x0000A3160181D394 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (16, N'权限人员调整', N'1', NULL, NULL, NULL, 1, N'管理员', N'::1', CAST(0x0000A3160181DAAF AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (17, N'权限人员调整', N'1', NULL, NULL, NULL, 1, N'管理员', N'::1', CAST(0x0000A3160181E5FB AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (18, N'系统登录', NULL, NULL, NULL, NULL, 1, N'管理员', N'::1', CAST(0x0000A31700A2D1EF AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (19, N'系统登录', NULL, NULL, NULL, NULL, 1, N'管理员', N'::1', CAST(0x0000A31700AEC632 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (20, N'客户跟进修改', N'2', N'test', N'【跟进内容】跟进内容被修改', N'【跟进内容】跟进内容被修改', 1, N'管理员', N'::1', CAST(0x0000A3170101F0BE AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (21, N'客户跟进修改', N'2', N'test', N'【跟进类型】电话跟进', N'【跟进类型】短信跟进', 1, N'管理员', N'::1', CAST(0x0000A3170101F0BF AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (22, N'客户跟进修改', N'1', N'test', N'【跟进内容】跟进内容被修改', N'【跟进内容】跟进内容被修改', 1, N'管理员', N'::1', CAST(0x0000A31701020A8D AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (23, N'客户跟进修改', N'1', N'test', N'【跟进类型】电话跟进', N'【跟进类型】QQ', 1, N'管理员', N'::1', CAST(0x0000A31701020A8E AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (24, N'联系人修改', N'1', N'test1', N'【联系人】test', N'【联系人】test1', 1, N'管理员', N'::1', CAST(0x0000A317010623C3 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (25, N'联系人修改', N'1', N'test12', N'【联系人】test1', N'【联系人】test12', 1, N'管理员', N'::1', CAST(0x0000A31701064A86 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (26, N'客户联系人预删除', N'1', N'test12', N'【】', N'【】', 1, N'管理员', N'::1', CAST(0x0000A31701065447 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (27, N'恢复删除客户联系人', N'49', N'test12', N'【】', N'【】', 1, N'管理员', N'::1', CAST(0x0000A3170106CDFF AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (28, N'客户联系人预删除', N'1', N'test12', N'【】', N'【】', 1, N'管理员', N'::1', CAST(0x0000A3170106D878 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (29, N'恢复删除客户联系人', N'49', N'test12', N'【】', N'【】', 1, N'管理员', N'::1', CAST(0x0000A3170106E175 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (30, N'产品类别修改', N'3', N'C', N'【上级类别】1', N'【上级类别】2', 1, N'管理员', N'::1', CAST(0x0000A317010D25AC AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (31, N'产品类别修改', N'2', N'B', N'【上级类别】1', N'【上级类别】3', 1, N'管理员', N'::1', CAST(0x0000A317010D2E1C AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (32, N'产品类别修改', N'2', N'B', N'【上级类别】3', N'【上级类别】1', 1, N'管理员', N'::1', CAST(0x0000A317010E1545 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (33, N'产品修改', N'1', N'产品B', N'【产品名字】产品A', N'【产品名字】产品B', 1, N'管理员', N'::1', CAST(0x0000A3170110E57A AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (34, N'产品修改', N'1', N'产品B', N'【价格】100', N'【价格】100.00', 1, N'管理员', N'::1', CAST(0x0000A3170110E57B AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (35, N'产品类别修改', N'1', N'A类', N'【产品类别】A', N'【产品类别】A类', 1, N'管理员', N'::1', CAST(0x0000A3170112C942 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (36, N'产品类别修改', N'3', N'C类', N'【产品类别】C', N'【产品类别】C类', 1, N'管理员', N'::1', CAST(0x0000A3170112D0B0 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (37, N'产品类别修改', N'2', N'B类', N'【产品类别】B', N'【产品类别】B类', 1, N'管理员', N'::1', CAST(0x0000A3170112D801 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (38, N'产品修改', N'1', N'产品B', N'【价格】100', N'【价格】100.00', 1, N'管理员', N'::1', CAST(0x0000A3170113286B AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (39, N'产品修改', N'1', N'产品B', N'【产品类别】B', N'【产品类别】B类', 1, N'管理员', N'::1', CAST(0x0000A3170113785A AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (40, N'产品修改', N'1', N'产品B', N'【价格】100', N'【价格】100.00', 1, N'管理员', N'::1', CAST(0x0000A3170113785A AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (41, N'产品修改', N'2', N'产品A', N'【产品类别】B', N'【产品类别】B类', 1, N'管理员', N'::1', CAST(0x0000A31701139DAD AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (42, N'产品修改', N'2', N'产品A', N'【价格】100', N'【价格】100.00', 1, N'管理员', N'::1', CAST(0x0000A31701139DAD AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (43, N'产品修改', N'1', N'产品B', N'【价格】100', N'【价格】100.00', 1, N'管理员', N'::1', CAST(0x0000A3170113AA98 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (44, N'产品修改', N'1', N'产品B', N'【价格】100', N'【价格】100.00', 1, N'管理员', N'::1', CAST(0x0000A31701147039 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (45, N'产品修改', N'1', N'产品B', N'【价格】100', N'【价格】100.00', 1, N'管理员', N'::1', CAST(0x0000A3170114C01D AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (46, N'合同修改', N'1', N'天天', N'【合同金额】200', N'【合同金额】300', 1, N'管理员', N'::1', CAST(0x0000A3170126DD87 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (47, N'收款修改', N'1', N'r100', N'【收款时间】2014-04-24 00:00:00', N'【收款时间】2014-04-24', 1, N'管理员', N'::1', CAST(0x0000A317014A42A5 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (48, N'收款预删除', N'2', N'test', N'【】', N'【】', 1, N'管理员', N'::1', CAST(0x0000A317014AEC23 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (49, N'收款预删除', N'1', N'test', N'【】', N'【】', 1, N'管理员', N'::1', CAST(0x0000A317014CABF0 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (50, N'收款预删除', N'3', N'test', N'【】', N'【】', 1, N'管理员', N'::1', CAST(0x0000A317014CF01B AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (51, N'开票修改', N'1', N'1', N'【开票时间】2014-04-24 00:00:00', N'【开票时间】2014-04-24', 1, N'管理员', N'::1', CAST(0x0000A3170151ADD4 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (52, N'开票修改', N'1', N'1', N'【发票总额】100', N'【发票总额】200', 1, N'管理员', N'::1', CAST(0x0000A3170151C361 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (53, N'开票修改', N'1', N'1', N'【开票时间】2014-04-24 00:00:00', N'【开票时间】2014-04-24', 1, N'管理员', N'::1', CAST(0x0000A3170151C361 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (54, N'客户联系人预删除', N'1', N'test12', N'【】', N'【】', 1, N'管理员', N'::1', CAST(0x0000A317015EA8D0 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (55, N'恢复删除客户联系人', N'49', N'test12', N'【】', N'【】', 1, N'管理员', N'::1', CAST(0x0000A317015EB122 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (56, N'客户联系人预删除', N'1', N'test12', N'【】', N'【】', 1, N'管理员', N'::1', CAST(0x0000A317015F011F AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (57, N'彻底删除客户联系人', N'49', N'test12', N'【】', N'【】', 1, N'管理员', N'::1', CAST(0x0000A317015F1E1A AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (58, N'跟进预删除', N'1', N'test', N'【】', N'【】', 1, N'管理员', N'::1', CAST(0x0000A3170163DD39 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (59, N'恢复删除跟进', N'49', N'test', N'【】', N'【】', 1, N'管理员', N'::1', CAST(0x0000A3170163E655 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (60, N'跟进预删除', N'1', N'test', N'【】', N'【】', 1, N'管理员', N'::1', CAST(0x0000A3170163ED34 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (61, N'彻底删除跟进', N'49', N'test', N'【】', N'【】', 1, N'管理员', N'::1', CAST(0x0000A31701640B53 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (62, N'订单预删除', N'3', N'test', N'【】', N'【】', 1, N'管理员', N'::1', CAST(0x0000A31701648640 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (63, N'恢复删除订单', N'51', N'test', N'【】', N'【】', 1, N'管理员', N'::1', CAST(0x0000A317016539FA AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (64, N'订单预删除', N'3', N'test', N'【】', N'【】', 1, N'管理员', N'::1', CAST(0x0000A317016548CD AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (65, N'彻底删除订单', N'51', N'test', N'【】', N'【】', 1, N'管理员', N'::1', CAST(0x0000A31701655075 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (66, N'合同预删除', N'1', N'天天', N'【】', N'【】', 1, N'管理员', N'::1', CAST(0x0000A317016586B1 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (67, N'恢复删除合同', N'49', N'天天', N'【】', N'【】', 1, N'管理员', N'::1', CAST(0x0000A317016595A2 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (68, N'合同预删除', N'1', N'天天', N'【】', N'【】', 1, N'管理员', N'::1', CAST(0x0000A31701659B67 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (69, N'彻底删除合同', N'49', N'天天', N'【】', N'【】', 1, N'管理员', N'::1', CAST(0x0000A3170165ADCE AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (70, N'恢复删除收款', N'49', N'test', N'【】', N'【】', 1, N'管理员', N'::1', CAST(0x0000A3170165C93F AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (71, N'恢复删除收款', N'50', N'test', N'【】', N'【】', 1, N'管理员', N'::1', CAST(0x0000A3170165CBEE AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (72, N'收款预删除', N'1', N'test', N'【】', N'【】', 1, N'管理员', N'::1', CAST(0x0000A317016698F2 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (73, N'彻底删除收款', N'49', N'test', N'【】', N'【】', 1, N'管理员', N'::1', CAST(0x0000A3170166A8C1 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (74, N'彻底删除收款', N'51', N'test', N'【】', N'【】', 1, N'管理员', N'::1', CAST(0x0000A3170166AC41 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (75, N'开票预删除', N'1', N'test', N'【】', N'【】', 1, N'管理员', N'::1', CAST(0x0000A3170167AD84 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (76, N'恢复删除票据', N'49', N'test', N'【】', N'【】', 1, N'管理员', N'::1', CAST(0x0000A31701681EEA AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (77, N'开票预删除', N'1', N'test', N'【】', N'【】', 1, N'管理员', N'::1', CAST(0x0000A31701682FCD AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (78, N'恢复删除票据', N'49', N'test', N'【】', N'【】', 1, N'管理员', N'::1', CAST(0x0000A31701683CB1 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (79, N'开票预删除', N'1', N'test', N'【】', N'【】', 1, N'管理员', N'::1', CAST(0x0000A31701685741 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (80, N'恢复删除票据', N'49', N'test', N'【】', N'【】', 1, N'管理员', N'::1', CAST(0x0000A3170168648D AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (81, N'开票预删除', N'1', N'test', N'【】', N'【】', 1, N'管理员', N'::1', CAST(0x0000A31701686BC3 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (82, N'彻底删除发票', N'49', N'test', N'【】', N'【】', 1, N'管理员', N'::1', CAST(0x0000A31701687481 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (83, N'产品类别预删除', N'3', N'C类', N'【】', N'【】', 1, N'管理员', N'::1', CAST(0x0000A3170168A8B1 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (84, N'恢复删除产品类别', N'51', N'C类', N'【】', N'【】', 1, N'管理员', N'::1', CAST(0x0000A3170168B551 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (85, N'产品类别预删除', N'3', N'C类', N'【】', N'【】', 1, N'管理员', N'::1', CAST(0x0000A3170168BCC6 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (86, N'彻底删除产品类别', N'51', N'C类', N'【】', N'【】', 1, N'管理员', N'::1', CAST(0x0000A3170168C396 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (87, N'产品预删除', N'3', N'c', N'【】', N'【】', 1, N'管理员', N'::1', CAST(0x0000A31701697AE1 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (88, N'恢复删除产品', N'51', N'c', N'【】', N'【】', 1, N'管理员', N'::1', CAST(0x0000A3170169AD04 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (89, N'产品预删除', N'3', N'c', N'【】', N'【】', 1, N'管理员', N'::1', CAST(0x0000A3170169B432 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (90, N'彻底删除产品', N'51', N'c', N'【】', N'【】', 1, N'管理员', N'::1', CAST(0x0000A3170169BF2C AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (91, N'系统登录', NULL, NULL, NULL, NULL, 1, N'管理员', N'::1', CAST(0x0000A31800A9FBD1 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (92, N'系统登录', NULL, NULL, NULL, NULL, 2, N'奇迹', N'::1', CAST(0x0000A31800AA5742 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (93, N'权限修改', N'1', NULL, NULL, NULL, 2, N'奇迹', N'::1', CAST(0x0000A31800AA7F81 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (94, N'权限修改', N'1', NULL, NULL, NULL, 2, N'奇迹', N'::1', CAST(0x0000A31800AA88B9 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (95, N'权限修改', N'1', NULL, NULL, NULL, 2, N'奇迹', N'::1', CAST(0x0000A31800AA8DB1 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (96, N'权限修改', N'1', NULL, NULL, NULL, 2, N'奇迹', N'::1', CAST(0x0000A31800AA9923 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (97, N'产品类别预删除', N'4', N'c', N'【】', N'【】', 1, N'管理员', N'::1', CAST(0x0000A31800F9E16C AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (98, N'彻底删除产品类别', N'52', N'c', N'【】', N'【】', 1, N'管理员', N'::1', CAST(0x0000A31800F9E9FC AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (99, N'跟进预删除', N'2', N'test', N'【】', N'【】', 1, N'管理员', N'::1', CAST(0x0000A318011156F5 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (100, N'恢复删除跟进', N'50', N'test', N'【】', N'【】', 1, N'管理员', N'::1', CAST(0x0000A31801118DEA AS DateTime))
GO
print 'Processed 100 total records'
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (101, N'开票修改', N'2', N'a', N'【发票总额】402', N'【发票总额】102', 1, N'管理员', N'::1', CAST(0x0000A3180112917B AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (102, N'开票修改', N'2', N'a', N'【开票时间】2014-04-25 00:00:00', N'【开票时间】2014-04-25', 1, N'管理员', N'::1', CAST(0x0000A3180112917B AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (103, N'产品预删除', N'4', N'才', N'【】', N'【】', 1, N'管理员', N'::1', CAST(0x0000A3180117A6A0 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (104, N'产品类别预删除', N'5', N'才', N'【】', N'【】', 1, N'管理员', N'::1', CAST(0x0000A3180117D4E4 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (105, N'彻底删除产品类别', N'53', N'才', N'【】', N'【】', 1, N'管理员', N'::1', CAST(0x0000A31801180CDE AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (106, N'产品类别修改', N'1', N'A类', N'【上级类别】0', N'【上级类别】-1', 1, N'管理员', N'::1', CAST(0x0000A3180149C365 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (107, N'产品类别修改', N'6', N'C', N'【上级类别】0', N'【上级类别】2', 1, N'管理员', N'::1', CAST(0x0000A318014B4E9B AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (108, N'产品类别修改', N'6', N'C', N'【上级类别】2', N'【上级类别】1', 1, N'管理员', N'::1', CAST(0x0000A318014B58B1 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (109, N'产品类别修改', N'6', N'C', N'【上级类别】1', N'【上级类别】0', 1, N'管理员', N'::1', CAST(0x0000A318014B5FE4 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (110, N'系统登录', NULL, NULL, NULL, NULL, 1, N'管理员', N'::1', CAST(0x0000A3180163F799 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (111, N'系统登录', NULL, NULL, NULL, NULL, 1, N'管理员', N'::1', CAST(0x0000A31900987CB3 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (112, N'系统登录', NULL, NULL, NULL, NULL, 1, N'管理员', N'::1', CAST(0x0000A31900B99DD9 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (113, N'系统登录', NULL, NULL, NULL, NULL, 1, N'管理员', N'::1', CAST(0x0000A31900C84EC7 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (114, N'系统登录', NULL, NULL, NULL, NULL, 1, N'管理员', N'::1', CAST(0x0000A31900D5A007 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (115, N'系统登录', NULL, NULL, NULL, NULL, 1, N'管理员', N'::1', CAST(0x0000A323012F08A9 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (116, N'系统登录', NULL, NULL, NULL, NULL, 1, N'管理员', N'::1', CAST(0x0000A3350127C5C4 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (117, N'系统登录', NULL, NULL, NULL, NULL, 1, N'管理员', N'::1', CAST(0x0000A33600ADCD4A AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (118, N'系统登录', NULL, NULL, NULL, NULL, 1, N'管理员', N'::1', CAST(0x0000A33600B15AC9 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (119, N'系统登录', NULL, NULL, NULL, NULL, 1, N'管理员', N'::1', CAST(0x0000A33900A37B95 AS DateTime))
INSERT [dbo].[Sys_log] ([id], [EventType], [EventID], [EventTitle], [Original_txt], [Current_txt], [UserID], [UserName], [IPStreet], [EventDate]) VALUES (120, N'系统登录', NULL, NULL, NULL, NULL, 1, N'管理员', N'192.168.1.102', CAST(0x0000A33900A4D8AC AS DateTime))
SET IDENTITY_INSERT [dbo].[Sys_log] OFF
/****** Object:  Table [dbo].[Sys_data_authority]    Script Date: 05/28/2014 10:08:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_data_authority](
	[Role_id] [int] NULL,
	[option_id] [int] NULL,
	[Sys_option] [varchar](250) NULL,
	[Sys_view] [int] NULL,
	[Sys_add] [int] NULL,
	[Sys_edit] [int] NULL,
	[Sys_del] [int] NULL,
	[Create_id] [int] NULL,
	[Create_date] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Sys_data_authority] ([Role_id], [option_id], [Sys_option], [Sys_view], [Sys_add], [Sys_edit], [Sys_del], [Create_id], [Create_date]) VALUES (1, 1, N'客户管理', 3, 3, 3, 3, NULL, NULL)
INSERT [dbo].[Sys_data_authority] ([Role_id], [option_id], [Sys_option], [Sys_view], [Sys_add], [Sys_edit], [Sys_del], [Create_id], [Create_date]) VALUES (1, 2, N'跟进管理', 3, 3, 3, 3, NULL, NULL)
INSERT [dbo].[Sys_data_authority] ([Role_id], [option_id], [Sys_option], [Sys_view], [Sys_add], [Sys_edit], [Sys_del], [Create_id], [Create_date]) VALUES (1, 3, N'订单管理', 3, 3, 3, 3, NULL, NULL)
INSERT [dbo].[Sys_data_authority] ([Role_id], [option_id], [Sys_option], [Sys_view], [Sys_add], [Sys_edit], [Sys_del], [Create_id], [Create_date]) VALUES (1, 4, N'合同管理', 3, 3, 3, 3, NULL, NULL)
/****** Object:  Table [dbo].[Sys_Button]    Script Date: 05/28/2014 10:08:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_Button](
	[Btn_id] [int] IDENTITY(1,1) NOT NULL,
	[Btn_name] [varchar](255) NULL,
	[Btn_icon] [varchar](50) NULL,
	[Btn_handler] [varchar](255) NULL,
	[Menu_id] [int] NULL,
	[Menu_name] [varchar](255) NULL,
	[Btn_order] [varchar](50) NULL,
 CONSTRAINT [PK_Sys_Button] PRIMARY KEY CLUSTERED 
(
	[Btn_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Sys_Button] ON
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (1, N'新增', N'../../../images/icon/11.png', N'add()', 76, N'目录管理', N'10')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (2, N'修改', N'../../../images/icon/33.png', N'edit()', 76, N'目录管理', N'20')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (3, N'删除', N'../../../images/icon/12.png', N'del()', 76, N'目录管理', N'30')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (4, N'新增', N'../../../images/icon/11.png', N'add()', 59, N'按钮管理', N'10')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (5, N'修改', N'../../../images/icon/33.png', N'edit()', 59, N'按钮管理', N'20')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (6, N'删除', N'../../../images/icon/12.png', N'del()', 59, N'按钮管理', N'30')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (7, N'批量新增', N'../../../images/icon/69.png', N'batch()', 59, N'按钮管理', N'40')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (8, N'修改', N'../../images/icon/33.png', N'edit()', 13, N'新闻', N'20')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (9, N'新增', N'../../images/icon/11.png', N'add()', 13, N'新闻', N'10')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (10, N'删除', N'../../images/icon/12.png', N'del()', 13, N'新闻', N'30')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (11, N'新增', N'../../images/icon/11.png', N'add()', 14, N'公告', N'10')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (12, N'修改', N'../../images/icon/33.png', N'edit()', 14, N'公告', N'20')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (13, N'删除', N'../../images/icon/12.png', N'del()', 14, N'公告', N'30')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (14, N'删除', N'../../images/icon/12.png', N'del()', 4, N'客户列表', N'30')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (15, N'新增', N'../../images/icon/11.png', N'add()', 4, N'客户列表', N'10')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (16, N'修改', N'../../images/icon/33.png', N'edit()', 4, N'客户列表', N'20')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (17, N'新增跟进', N'../../images/icon/11.png', N'addfollow()', 6, N'跟进管理', N'10')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (18, N'修改跟进', N'../../images/icon/33.png', N'editfollow()', 6, N'跟进管理', N'20')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (19, N'删除跟进', N'../../images/icon/12.png', N'delfollow()', 6, N'跟进管理', N'30')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (20, N'删除', N'../../images/icon/12.png', N'del()', 21, N'组织架构', N'30')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (21, N'新增', N'../../images/icon/11.png', N'add()', 21, N'组织架构', N'10')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (22, N'修改', N'../../images/icon/33.png', N'edit()', 21, N'组织架构', N'20')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (23, N'新增', N'../../images/icon/11.png', N'add()', 22, N'职务管理', N'10')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (24, N'修改', N'../../images/icon/33.png', N'edit()', 22, N'职务管理', N'20')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (25, N'删除', N'../../images/icon/12.png', N'del()', 22, N'职务管理', N'30')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (26, N'删除', N'../../images/icon/12.png', N'del()', 23, N'岗位管理', N'30')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (27, N'修改', N'../../images/icon/33.png', N'edit()', 23, N'岗位管理', N'20')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (28, N'新增', N'../../images/icon/11.png', N'add()', 23, N'岗位管理', N'10')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (29, N'新增', N'../../images/icon/11.png', N'add()', 24, N'员工管理', N'10')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (30, N'删除', N'../../images/icon/12.png', N'del()', 24, N'员工管理', N'30')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (31, N'修改', N'../../images/icon/33.png', N'edit()', 24, N'员工管理', N'20')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (32, N'新增', N'../../images/icon/11.png', N'add()', 31, N'角色授权', N'10')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (33, N'删除', N'../../images/icon/12.png', N'del()', 31, N'角色授权', N'30')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (34, N'修改', N'../../images/icon/33.png', N'edit()', 31, N'角色授权', N'20')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (35, N'操作权限', N'../../../images/icon/91.png', N'authorized()', 31, N'角色授权', N'40')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (36, N'包含人员', N'../../../images/icon/37.png', N'role_emp()', 31, N'角色授权', N'60')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (37, N'数据权限', N'../../../images/icon/92.png', N'data_authorized()', 31, N'角色授权', N'50')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (38, N'新增', N'../../images/icon/11.png', N'add()', 5, N'联系人管理', N'10')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (39, N'修改', N'../../images/icon/33.png', N'edit()', 5, N'联系人管理', N'20')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (40, N'删除', N'../../images/icon/12.png', N'del()', 5, N'联系人管理', N'30')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (41, N'删除', N'../../images/icon/12.png', N'del()', 34, N'订单管理', N'30')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (42, N'新增', N'../../images/icon/11.png', N'add()', 34, N'订单管理', N'10')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (43, N'修改', N'../../images/icon/33.png', N'edit()', 34, N'订单管理', N'20')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (44, N'修改', N'../../images/icon/33.png', N'edit()', 35, N'合同管理', N'20')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (45, N'新增', N'../../images/icon/11.png', N'add()', 35, N'合同管理', N'10')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (46, N'删除', N'../../images/icon/12.png', N'del()', 35, N'合同管理', N'30')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (47, N'新增', N'../../images/icon/11.png', N'add()', 36, N'收款管理', N'10')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (48, N'删除', N'../../images/icon/12.png', N'del()', 36, N'收款管理', N'30')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (49, N'修改', N'../../images/icon/33.png', N'edit()', 36, N'收款管理', N'20')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (50, N'新增', N'../../images/icon/11.png', N'add()', 37, N'开票管理', N'10')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (51, N'删除', N'../../images/icon/12.png', N'del()', 37, N'开票管理', N'30')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (52, N'修改', N'../../images/icon/33.png', N'edit()', 37, N'开票管理', N'20')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (53, N'修改', N'../../images/icon/33.png', N'edit()', 44, N'产品类别', N'20')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (54, N'删除', N'../../images/icon/12.png', N'del()', 44, N'产品类别', N'30')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (55, N'新增', N'../../images/icon/11.png', N'add()', 44, N'产品类别', N'10')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (56, N'新增', N'../../images/icon/11.png', N'add()', 39, N'产品列表', N'10')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (57, N'修改', N'../../images/icon/33.png', N'edit()', 39, N'产品列表', N'20')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (58, N'删除', N'../../images/icon/12.png', N'del()', 39, N'产品列表', N'30')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (59, N'恢复', N'../../../images/icon/2.png', N'regain()', 47, N'客户回收', N'10')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (60, N'彻底删除', N'../../../images/icon/50.png', N'del()', 47, N'客户回收', N'20')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (61, N'恢复', N'../../../images/icon/2.png', N'regain()', 48, N'联系人回收', N'10')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (62, N'彻底删除', N'../../../images/icon/50.png', N'del()', 48, N'联系人回收', N'20')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (63, N'恢复', N'../../../images/icon/2.png', N'regain()', 49, N'跟进回收', N'10')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (64, N'彻底删除', N'../../../images/icon/50.png', N'del()', 49, N'跟进回收', N'20')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (65, N'恢复', N'../../../images/icon/2.png', N'regain()', 50, N'订单回收', N'10')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (66, N'彻底删除', N'../../../images/icon/50.png', N'del()', 50, N'订单回收', N'20')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (67, N'恢复', N'../../../images/icon/2.png', N'regain()', 51, N'合同回收', N'10')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (68, N'彻底删除', N'../../../images/icon/50.png', N'del()', 51, N'合同回收', N'20')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (69, N'恢复', N'../../../images/icon/2.png', N'regain()', 52, N'收款单回收', N'10')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (70, N'彻底删除', N'../../../images/icon/50.png', N'del()', 52, N'收款单回收', N'20')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (71, N'恢复', N'../../../images/icon/2.png', N'regain()', 53, N'发票回收', N'10')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (72, N'彻底删除', N'../../../images/icon/50.png', N'del()', 53, N'发票回收', N'20')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (73, N'恢复', N'../../../images/icon/2.png', N'regain()', 54, N'产品类别回收', N'10')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (74, N'彻底删除', N'../../../images/icon/50.png', N'del()', 54, N'产品类别回收', N'20')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (75, N'恢复', N'../../../images/icon/2.png', N'regain()', 55, N'产品回收', N'10')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (76, N'彻底删除', N'../../../images/icon/50.png', N'del()', 55, N'产品回收', N'20')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (77, N'恢复', N'../../../images/icon/2.png', N'regain()', 80, N'组织架构回收', N'10')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (78, N'彻底删除', N'../../../images/icon/50.png', N'del()', 80, N'组织架构回收', N'20')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (79, N'恢复', N'../../../images/icon/2.png', N'regain()', 81, N'职务回收', N'10')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (80, N'彻底删除', N'../../../images/icon/50.png', N'del()', 81, N'职务回收', N'20')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (81, N'恢复', N'../../../images/icon/2.png', N'regain()', 82, N'岗位回收', N'10')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (82, N'彻底删除', N'../../../images/icon/50.png', N'del()', 82, N'岗位回收', N'20')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (83, N'恢复', N'../../../images/icon/2.png', N'regain()', 83, N'员工回收', N'10')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (84, N'彻底删除', N'../../../images/icon/50.png', N'del()', 83, N'员工回收', N'20')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (85, N'修改', N'../../images/icon/33.png', N'edit()', 43, N'参数配置', N'20')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (86, N'删除', N'../../images/icon/12.png', N'del()', 43, N'参数配置', N'30')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (87, N'新增', N'../../images/icon/11.png', N'add()', 43, N'参数配置', N'10')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (88, N'新增', N'../../images/icon/11.png', N'add()', 84, N'城市管理', N'10')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (89, N'修改', N'../../images/icon/33.png', N'edit()', 84, N'城市管理', N'20')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (90, N'删除', N'../../images/icon/12.png', N'del()', 84, N'城市管理', N'30')
INSERT [dbo].[Sys_Button] ([Btn_id], [Btn_name], [Btn_icon], [Btn_handler], [Menu_id], [Menu_name], [Btn_order]) VALUES (91, N'查看', N'../../../images/icon/75.png', N'view()', 4, N'客户列表', N'5')
INSERT [dbo].[Sys_Button] ([Btn_name]
           ,[Btn_icon]
           ,[Btn_handler]
           ,[Menu_id]
           ,[Menu_name]
           ,[Btn_order])
     VALUES
           ('修改密码'
           ,'../images/icon/36.png'
           ,'changepwd()'
           ,24
           ,'员工管理'
           ,40)

SET IDENTITY_INSERT [dbo].[Sys_Button] OFF
/****** Object:  Table [dbo].[Sys_authority]    Script Date: 05/28/2014 10:08:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_authority](
	[Role_id] [int] NOT NULL,
	[App_ids] [varchar](250) NULL,
	[Menu_ids] [varchar](250) NULL,
	[Button_ids] [varchar](250) NULL,
	[Create_id] [int] NULL,
	[Create_date] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Sys_authority] ([Role_id], [App_ids], [Menu_ids], [Button_ids], [Create_id], [Create_date]) VALUES (1, N'a1,', N'm1,m2,m7,m8,m9,m10,m11,m12,m13,m14,', N',,,b9,b8,b10,b11,b12,b13,', NULL, NULL)
INSERT [dbo].[Sys_authority] ([Role_id], [App_ids], [Menu_ids], [Button_ids], [Create_id], [Create_date]) VALUES (1, N'a3,', N'm17,m21,m22,m23,m24,', N',,,b21,b22,b20,b23,b24,b25,b28,b27,b26,b29,b31,b30,', NULL, NULL)
INSERT [dbo].[Sys_authority] ([Role_id], [App_ids], [Menu_ids], [Button_ids], [Create_id], [Create_date]) VALUES (1, N'a6,', N'm30,m31,m32,m43,m84,m60,m59,m76,', N',,,b32,b34,b33,b35,b37,b36,b87,b85,b86,b88,b89,b90,b4,b5,b6,b7,b1,b2,b3,', NULL, NULL)
INSERT [dbo].[Sys_authority] ([Role_id], [App_ids], [Menu_ids], [Button_ids], [Create_id], [Create_date]) VALUES (1, N'a2,', N'm3,m4,m5,m6,m33,m34,m35,m38,m39,m44,m45,m36,m37,m56,m57,m62,', N',,,b15,b16,b14,b38,b39,b40,b17,b18,b19,b42,b43,b41,b45,b44,b46,b56,b57,b58,b55,b53,b54,b47,b49,b48,b50,b52,b51,', NULL, NULL)
INSERT [dbo].[Sys_authority] ([Role_id], [App_ids], [Menu_ids], [Button_ids], [Create_id], [Create_date]) VALUES (1, N'a4,', N'm46,m47,m48,m49,m50,m51,m52,m53,m54,m55,m58,m80,m81,m82,m83,', N',,,b59,b60,b61,b62,b63,b64,b65,b66,b67,b68,b69,b70,b71,b72,b73,b74,b75,b76,b77,b78,b79,b80,b81,b82,b83,b84,', NULL, NULL)
INSERT [dbo].[Sys_authority] ([Role_id], [App_ids], [Menu_ids], [Button_ids], [Create_id], [Create_date]) VALUES (1, N'a5,', N'm40,m41,m42,m63,m64,m65,m66,m67,m68,m69,m70,m71,m72,m73,m74,m75,', N',,,', NULL, NULL)
/****** Object:  Table [dbo].[Sys_App]    Script Date: 05/28/2014 10:08:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_App](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[App_name] [varchar](100) NULL,
	[App_order] [int] NULL,
	[App_url] [varchar](250) NULL,
	[App_handler] [varchar](250) NULL,
	[App_type] [varchar](50) NULL,
	[App_icon] [varchar](250) NULL,
 CONSTRAINT [PK_Sys_App] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Sys_App] ON
INSERT [dbo].[Sys_App] ([id], [App_name], [App_order], [App_url], [App_handler], [App_type], [App_icon]) VALUES (1, N'个人办公', 10, NULL, NULL, NULL, N'../images/icon/62.png')
INSERT [dbo].[Sys_App] ([id], [App_name], [App_order], [App_url], [App_handler], [App_type], [App_icon]) VALUES (2, N'CRM客户管理', 20, NULL, NULL, NULL, N'../images/icon/85.png')
INSERT [dbo].[Sys_App] ([id], [App_name], [App_order], [App_url], [App_handler], [App_type], [App_icon]) VALUES (3, N'人事管理', 30, NULL, NULL, NULL, N'../images/icon/37.png')
INSERT [dbo].[Sys_App] ([id], [App_name], [App_order], [App_url], [App_handler], [App_type], [App_icon]) VALUES (4, N'实用工具', 40, NULL, NULL, NULL, N'../images/icon/71.png')
INSERT [dbo].[Sys_App] ([id], [App_name], [App_order], [App_url], [App_handler], [App_type], [App_icon]) VALUES (5, N'报表分析', 50, NULL, NULL, NULL, N'../images/icon/54.png')
INSERT [dbo].[Sys_App] ([id], [App_name], [App_order], [App_url], [App_handler], [App_type], [App_icon]) VALUES (6, N'系统管理', 60, NULL, NULL, NULL, N'../images/icon/77.png')
SET IDENTITY_INSERT [dbo].[Sys_App] OFF
/****** Object:  Table [dbo].[public_notice]    Script Date: 05/28/2014 10:08:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[public_notice](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[notice_title] [varchar](250) NULL,
	[notice_content] [varchar](max) NULL,
	[create_id] [int] NULL,
	[create_name] [varchar](250) NULL,
	[dep_id] [int] NULL,
	[dep_name] [varchar](250) NULL,
	[notice_time] [datetime] NULL,
 CONSTRAINT [PK_public_notice] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[public_notice] ON
INSERT [dbo].[public_notice] ([id], [notice_title], [notice_content], [create_id], [create_name], [dep_id], [dep_name], [notice_time]) VALUES (1, N'test', N'', 1, N'管理员', 1, N'', CAST(0x0000A316013A0F6A AS DateTime))
SET IDENTITY_INSERT [dbo].[public_notice] OFF
/****** Object:  Table [dbo].[public_news]    Script Date: 05/28/2014 10:08:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[public_news](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[news_title] [varchar](250) NULL,
	[news_content] [varchar](max) NULL,
	[create_id] [int] NULL,
	[create_name] [varchar](250) NULL,
	[dep_id] [int] NULL,
	[dep_name] [varchar](250) NULL,
	[news_time] [datetime] NULL,
	[isDelete] [int] NULL,
	[Delete_time] [datetime] NULL,
 CONSTRAINT [PK_public_news] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[public_news] ON
INSERT [dbo].[public_news] ([id], [news_title], [news_content], [create_id], [create_name], [dep_id], [dep_name], [news_time], [isDelete], [Delete_time]) VALUES (2, N'test', N'&lt;p&gt;欢迎使用ueditor!&lt;/p&gt;', 1, N'管理员', 1, N'', CAST(0x0000A3160135A27E AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[public_news] OFF
/****** Object:  Table [dbo].[Personal_notes]    Script Date: 05/28/2014 10:08:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Personal_notes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[emp_id] [int] NULL,
	[emp_name] [varchar](250) NULL,
	[note_content] [varchar](max) NULL,
	[note_color] [varchar](250) NULL,
	[xyz] [varchar](250) NULL,
	[note_time] [datetime] NULL,
 CONSTRAINT [PK_Personal_notes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Personal_notes] ON
INSERT [dbo].[Personal_notes] ([id], [emp_id], [emp_name], [note_content], [note_color], [xyz], [note_time]) VALUES (5, 1, NULL, N'2', N'blue', N'164,23,1', CAST(0x0000A316012C11B0 AS DateTime))
SET IDENTITY_INSERT [dbo].[Personal_notes] OFF
/****** Object:  Table [dbo].[Personal_Calendar]    Script Date: 05/28/2014 10:08:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Personal_Calendar](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[emp_id] [int] NULL,
	[emp_name] [varchar](250) NULL,
	[companyid] [int] NULL,
	[Subject] [varchar](max) NULL,
	[Location] [varchar](max) NULL,
	[MasterId] [int] NULL,
	[Description] [varchar](max) NULL,
	[CalendarType] [tinyint] NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[IsAllDayEvent] [bit] NULL,
	[HasAttachment] [bit] NULL,
	[Category] [varchar](max) NULL,
	[InstanceType] [tinyint] NULL,
	[Attendees] [varchar](max) NULL,
	[AttendeeNames] [varchar](max) NULL,
	[OtherAttendee] [varchar](max) NULL,
	[UPAccount] [varchar](250) NULL,
	[UPName] [varchar](250) NULL,
	[UPTime] [datetime] NULL,
	[RecurringRule] [varchar](max) NULL,
 CONSTRAINT [PK_Personal_Calendar] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Personal_Calendar] ON
INSERT [dbo].[Personal_Calendar] ([Id], [emp_id], [emp_name], [companyid], [Subject], [Location], [MasterId], [Description], [CalendarType], [StartTime], [EndTime], [IsAllDayEvent], [HasAttachment], [Category], [InstanceType], [Attendees], [AttendeeNames], [OtherAttendee], [UPAccount], [UPName], [UPTime], [RecurringRule]) VALUES (1, 1, NULL, NULL, N'tesst', NULL, 8, NULL, 1, CAST(0x0000A31600000000 AS DateTime), CAST(0x0000A31600000000 AS DateTime), 1, NULL, N'1', 0, NULL, NULL, NULL, N'1', NULL, CAST(0x0000A3160131496D AS DateTime), NULL)
INSERT [dbo].[Personal_Calendar] ([Id], [emp_id], [emp_name], [companyid], [Subject], [Location], [MasterId], [Description], [CalendarType], [StartTime], [EndTime], [IsAllDayEvent], [HasAttachment], [Category], [InstanceType], [Attendees], [AttendeeNames], [OtherAttendee], [UPAccount], [UPName], [UPTime], [RecurringRule]) VALUES (3, 1, NULL, NULL, N'【test】tt1', NULL, 8, NULL, 1, CAST(0x0000A317010300B0 AS DateTime), CAST(0x0000A317010300B0 AS DateTime), 0, NULL, NULL, 0, NULL, NULL, NULL, N'1', NULL, CAST(0x0000A31701035D1D AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Personal_Calendar] OFF
/****** Object:  Table [dbo].[Param_SysParam_Type]    Script Date: 05/28/2014 10:08:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Param_SysParam_Type](
	[id] [int] NOT NULL,
	[params_name] [varchar](250) NULL,
	[params_order] [varchar](50) NULL,
	[isDelete] [int] NULL,
	[Delete_time] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Param_SysParam_Type] ([id], [params_name], [params_order], [isDelete], [Delete_time]) VALUES (1, N'客户类型', N'20', NULL, NULL)
INSERT [dbo].[Param_SysParam_Type] ([id], [params_name], [params_order], [isDelete], [Delete_time]) VALUES (2, N'客户级别', N'30', NULL, NULL)
INSERT [dbo].[Param_SysParam_Type] ([id], [params_name], [params_order], [isDelete], [Delete_time]) VALUES (3, N'客户来源', N'40', NULL, NULL)
INSERT [dbo].[Param_SysParam_Type] ([id], [params_name], [params_order], [isDelete], [Delete_time]) VALUES (4, N'跟进方式', N'50', NULL, NULL)
INSERT [dbo].[Param_SysParam_Type] ([id], [params_name], [params_order], [isDelete], [Delete_time]) VALUES (5, N'支付方式', N'60', NULL, NULL)
INSERT [dbo].[Param_SysParam_Type] ([id], [params_name], [params_order], [isDelete], [Delete_time]) VALUES (6, N'订单状态', N'70', NULL, NULL)
INSERT [dbo].[Param_SysParam_Type] ([id], [params_name], [params_order], [isDelete], [Delete_time]) VALUES (7, N'发票类型', N'80', NULL, NULL)
/****** Object:  Table [dbo].[Param_SysParam]    Script Date: 05/28/2014 10:08:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Param_SysParam](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[parentid] [int] NULL,
	[params_name] [varchar](250) NULL,
	[params_order] [varchar](50) NULL,
	[Create_id] [int] NULL,
	[Create_date] [datetime] NULL,
	[Update_id] [int] NULL,
	[Update_date] [datetime] NULL,
 CONSTRAINT [PK_Param_SysParam] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Param_SysParam] ON
INSERT [dbo].[Param_SysParam] ([id], [parentid], [params_name], [params_order], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (1, 1, N'无意向', N'20', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_SysParam] ([id], [parentid], [params_name], [params_order], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (2, 1, N'有意向', N'20', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_SysParam] ([id], [parentid], [params_name], [params_order], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (3, 1, N'已成交', N'20', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_SysParam] ([id], [parentid], [params_name], [params_order], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (4, 2, N'A', N'20', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_SysParam] ([id], [parentid], [params_name], [params_order], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (5, 2, N'B', N'20', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_SysParam] ([id], [parentid], [params_name], [params_order], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (6, 2, N'C', N'20', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_SysParam] ([id], [parentid], [params_name], [params_order], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (7, 3, N'网上', N'20', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_SysParam] ([id], [parentid], [params_name], [params_order], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (8, 3, N'客户上门', N'20', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_SysParam] ([id], [parentid], [params_name], [params_order], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (9, 3, N'电话', N'20', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_SysParam] ([id], [parentid], [params_name], [params_order], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (10, 3, N'转介绍', N'20', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_SysParam] ([id], [parentid], [params_name], [params_order], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (11, 4, N'电话跟进', N'20', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_SysParam] ([id], [parentid], [params_name], [params_order], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (12, 4, N'短信跟进', N'20', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_SysParam] ([id], [parentid], [params_name], [params_order], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (13, 4, N'QQ', N'20', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_SysParam] ([id], [parentid], [params_name], [params_order], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (14, 4, N'微信', N'20', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_SysParam] ([id], [parentid], [params_name], [params_order], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (15, 4, N'邮件', N'20', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_SysParam] ([id], [parentid], [params_name], [params_order], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (16, 4, N'上门拜访', N'20', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_SysParam] ([id], [parentid], [params_name], [params_order], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (17, 5, N'银行转账', N'10', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_SysParam] ([id], [parentid], [params_name], [params_order], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (18, 5, N'现金支付', N'20', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_SysParam] ([id], [parentid], [params_name], [params_order], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (19, 5, N'承兑汇票', N'30', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_SysParam] ([id], [parentid], [params_name], [params_order], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (20, 6, N'订单签订', N'10', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_SysParam] ([id], [parentid], [params_name], [params_order], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (21, 7, N'国税发票', N'10', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_SysParam] ([id], [parentid], [params_name], [params_order], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (22, 7, N'地税发票', N'20', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Param_SysParam] OFF
/****** Object:  Table [dbo].[Param_City]    Script Date: 05/28/2014 10:08:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Param_City](
	[id] [int] NOT NULL,
	[parentid] [int] NULL,
	[City] [varchar](250) NULL,
	[Create_id] [int] NULL,
	[Create_date] [datetime] NULL,
	[Update_id] [int] NULL,
	[Update_date] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (1, 0, N'北京', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (2, 0, N'上海', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (3, 0, N'天津', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (4, 0, N' 重庆', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (5, 0, N' 黑龙江', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (6, 0, N'吉林', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (7, 0, N'辽宁', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (8, 0, N'内蒙古', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (9, 0, N'宁夏', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (10, 0, N'新疆', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (11, 0, N'青海', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (12, 0, N'甘肃', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (13, 0, N'陕西', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (14, 0, N'河北', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (15, 0, N'河南', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (16, 0, N'山东', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (17, 0, N'山西', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (18, 0, N'湖北', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (19, 0, N'湖南', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (20, 0, N'安徽', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (21, 0, N'江苏', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (22, 0, N' 浙江', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (23, 0, N'江西', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (24, 0, N'广东', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (25, 0, N'广西', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (26, 0, N'福建', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (27, 0, N'四川', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (28, 0, N'云南', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (29, 0, N'贵州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (30, 0, N'西藏', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (31, 0, N'海南', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (32, 0, N'香港', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (33, 0, N'澳门', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (34, 0, N'台湾', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (35, 1, N'东城区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (36, 1, N'西城区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (37, 1, N'宣武区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (38, 1, N'崇文区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (39, 1, N'朝阳区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (40, 1, N'海淀区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (41, 1, N'丰台区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (42, 1, N'石景山区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (43, 1, N'门头沟区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (44, 1, N'昌平区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (45, 1, N'大兴区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (46, 1, N'怀柔区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (47, 1, N'密云县', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (48, 1, N'平谷区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (49, 1, N'顺义区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (50, 1, N'通州区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (51, 1, N'延庆县', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (52, 1, N'房山区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (53, 2, N'黄浦区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (54, 2, N'南市区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (55, 2, N'卢湾区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (56, 2, N'徐汇区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (57, 2, N'长宁区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (58, 2, N'静安区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (59, 2, N'普陀区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (60, 2, N'金山区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (61, 2, N'闸北区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (62, 2, N'虹口区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (63, 2, N'杨浦区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (64, 2, N'宝山区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (65, 2, N'闵行区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (66, 2, N'嘉定区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (67, 2, N'松江区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (68, 2, N'浦东新区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (69, 2, N'青浦县', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (70, 2, N'奉贤县', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (71, 2, N'南汇县', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (72, 2, N'崇明县', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (73, 3, N'和平区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (74, 3, N'河东区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (75, 3, N'河西区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (76, 3, N'河北区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (77, 3, N'南开区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (78, 3, N'红桥区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (79, 3, N'塘沽区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (80, 3, N'汉沽区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (81, 3, N'大港区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (82, 3, N'东丽区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (83, 3, N'西青区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (84, 3, N'津南区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (85, 3, N'北辰区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (86, 3, N' 武清区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (87, 3, N'宝坻区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (88, 3, N'蓟 县', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (89, 3, N'宁河县', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (90, 3, N'静海县', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (91, 4, N'永川市', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (92, 4, N'黔江区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (93, 4, N'涪陵区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (94, 4, N'万洲区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (95, 4, N'渝中区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (96, 4, N'大渡口区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (97, 4, N'江北区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (98, 4, N'沙坪坝区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (99, 4, N'九龙坡区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (100, 4, N'南岸区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (101, 4, N'北碚区', NULL, NULL, NULL, NULL)
GO
print 'Processed 100 total records'
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (102, 4, N' 万盛区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (103, 4, N'双桥区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (104, 4, N'渝北区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (105, 4, N'巴南区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (106, 4, N'长寿区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (107, 5, N'哈尔滨', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (108, 5, N'齐齐哈尔', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (109, 5, N'牡丹江', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (110, 5, N'鹤岗', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (111, 5, N'双鸭山', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (112, 5, N'鸡西', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (113, 5, N'大庆', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (114, 5, N'伊春', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (115, 5, N'佳木斯', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (116, 5, N'七台河', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (117, 5, N'黑河', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (118, 5, N'绥化', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (119, 5, N'大兴安岭地区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (120, 6, N'长春', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (121, 6, N'吉林', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (122, 6, N'四平', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (123, 6, N'辽源', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (124, 6, N'通化', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (125, 6, N'白山', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (126, 6, N'松原', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (127, 6, N'白城', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (128, 6, N'延边朝鲜族自治州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (129, 6, N'高新', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (130, 6, N'延吉', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (131, 6, N'梅河口', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (132, 7, N'沈阳', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (133, 7, N'大连', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (134, 7, N'锦州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (135, 7, N'鞍山', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (136, 7, N'抚顺', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (137, 7, N'本溪', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (138, 7, N'丹东', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (139, 7, N'葫芦岛', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (140, 7, N'营口', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (141, 7, N'盘锦', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (142, 7, N'阜新', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (143, 7, N'辽阳', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (144, 7, N'铁岭', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (145, 7, N'朝阳', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (146, 7, N'瓦房店', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (147, 8, N'呼和浩特', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (148, 8, N'包头', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (149, 8, N'乌海', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (150, 8, N'赤峰', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (151, 8, N'通辽', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (152, 8, N'鄂尔多斯', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (153, 8, N'乌兰察布盟', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (154, 8, N'锡林郭勒盟', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (155, 8, N'巴彦淖尔盟', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (156, 8, N'阿拉善盟', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (157, 8, N'兴安盟', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (158, 8, N'巴彦淖尔', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (159, 8, N'呼伦贝尔', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (160, 8, N'集宁', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (161, 8, N' 乌兰浩特', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (162, 8, N'锡林浩特', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (163, 9, N'银川', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (164, 9, N'石嘴山', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (165, 9, N'吴忠', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (166, 9, N'固原', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (167, 10, N'乌鲁木齐', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (168, 10, N'克拉玛依', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (169, 10, N'吐鲁番地区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (170, 10, N'哈密地区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (171, 10, N'和田地区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (172, 10, N'阿克苏地区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (173, 10, N'喀什地区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (174, 10, N'克孜勒苏柯尔克孜自治州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (175, 10, N'巴音郭楞蒙古自治州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (176, 10, N'昌吉回族自治州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (177, 10, N'博尔塔拉蒙古自治州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (178, 10, N'伊犁哈萨克自治州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (179, 10, N'阿克苏', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (180, 10, N'昌吉', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (181, 10, N'哈密', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (182, 10, N'和田', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (183, 10, N'喀什', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (184, 10, N'克拉马依', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (185, 10, N'库尔勒', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (186, 10, N'石河子', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (187, 10, N'吐鲁番', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (188, 10, N' 乌市', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (189, 10, N'奎屯', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (190, 10, N'伊犁', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (191, 10, N'伊宁', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (192, 11, N'西宁', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (193, 11, N'海东地区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (194, 11, N' 海北藏族自治州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (195, 11, N'黄南藏族自治州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (196, 11, N'海南藏族自治州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (197, 11, N'果洛藏族自治州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (198, 11, N'玉树藏族自治州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (199, 11, N'海西蒙古族藏族自治州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (200, 11, N'格尔木', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (201, 12, N'兰州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (202, 12, N'天水', NULL, NULL, NULL, NULL)
GO
print 'Processed 200 total records'
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (203, 12, N'金昌', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (204, 12, N'白银', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (205, 12, N'嘉峪关', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (206, 12, N'武 威 ', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (207, 12, N'张掖', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (208, 12, N'平凉', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (209, 12, N'酒泉', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (210, 12, N'庆阳', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (211, 12, N'定西地区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (212, 12, N'陇南地区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (213, 12, N'甘南藏族自治州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (214, 12, N'临夏回族自治州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (215, 12, N'嘉峪', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (216, 12, N'武威', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (217, 13, N'西安', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (218, 13, N'宝鸡', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (219, 13, N'延安', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (220, 13, N'铜川', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (221, 13, N'咸阳', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (222, 13, N'渭南', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (223, 13, N'汉中', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (224, 13, N'榆林', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (225, 13, N'安康', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (226, 13, N'商洛', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (227, 13, N'韩城', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (228, 14, N'石家庄', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (229, 14, N'保定', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (230, 14, N'唐山', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (231, 14, N'秦皇岛', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (232, 14, N'邯郸', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (233, 14, N'邢台', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (234, 14, N'张家口', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (235, 14, N'承德', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (236, 14, N'沧州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (237, 14, N'廊坊', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (238, 14, N'衡水', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (239, 14, N'霸州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (240, 14, N'青县', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (241, 14, N'任丘', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (242, 14, N'涿州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (243, 15, N'郑州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (244, 15, N'洛阳', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (245, 15, N'开封', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (246, 15, N'平顶山', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (247, 15, N'焦作', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (248, 15, N'鹤壁', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (249, 15, N'新乡', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (250, 15, N'安阳', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (251, 15, N'濮阳', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (252, 15, N'许昌', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (253, 15, N'漯河', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (254, 15, N'三门峡', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (255, 15, N'南阳', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (256, 15, N'商丘', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (257, 15, N'信阳', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (258, 15, N'周口', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (259, 15, N'驻马店', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (260, 16, N'济南', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (261, 16, N'青岛', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (262, 16, N'烟台', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (263, 16, N'淄博', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (264, 16, N'枣庄', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (265, 16, N'东营', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (266, 16, N'潍坊', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (267, 16, N'威海', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (268, 16, N'济宁', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (269, 16, N'泰安', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (270, 16, N'日照', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (271, 16, N'莱芜', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (272, 16, N'德州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (273, 16, N'临沂', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (274, 16, N'聊城', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (275, 16, N'滨州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (276, 16, N'菏泽', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (277, 16, N'高密', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (278, 16, N'荷泽', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (279, 16, N'淮坊', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (280, 16, N'即墨', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (281, 16, N'胶南', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (282, 16, N'莱州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (283, 16, N'林沂', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (284, 16, N'临忻', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (285, 16, N'龙口', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (286, 16, N'蓬莱', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (287, 16, N'青州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (288, 16, N'乳山', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (289, 16, N'寿光', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (290, 16, N'滕州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (291, 16, N'文登', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (292, 16, N'招远', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (293, 17, N'太原', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (294, 17, N'大同', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (295, 17, N'朔州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (296, 17, N'阳泉', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (297, 17, N'长治', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (298, 17, N'晋城', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (299, 17, N'忻州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (300, 17, N'晋中', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (301, 17, N'临汾', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (302, 17, N'运城', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (303, 17, N'吕梁地区', NULL, NULL, NULL, NULL)
GO
print 'Processed 300 total records'
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (304, 17, N'河津', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (305, 17, N'侯马', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (306, 17, N'孝义', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (307, 17, N'榆次', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (308, 18, N'武汉', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (309, 18, N'黄石', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (310, 18, N'襄樊', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (311, 18, N'十堰', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (312, 18, N'荆州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (313, 18, N'宜昌', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (314, 18, N'荆门', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (315, 18, N'鄂州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (316, 18, N'孝感', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (317, 18, N'黄冈', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (318, 18, N'咸宁', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (319, 18, N'随州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (320, 18, N'恩施土家族苗族自治州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (321, 18, N'安陆', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (322, 18, N'恩施', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (323, 18, N'汉口', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (324, 18, N'汉阳', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (325, 18, N'潜江', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (326, 18, N'仙桃', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (327, 18, N'株州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (328, 19, N'长沙', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (329, 19, N'株洲', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (330, 19, N'湘潭', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (331, 19, N'衡阳', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (332, 19, N'邵阳', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (333, 19, N'岳阳', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (334, 19, N'常德', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (335, 19, N'张家界', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (336, 19, N'益阳', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (337, 19, N'郴州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (338, 19, N'永州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (339, 19, N'怀化', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (340, 19, N'娄底', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (341, 19, N'湘西土家族苗族自治州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (342, 19, N'株州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (343, 19, N'邵东', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (344, 20, N'合肥', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (345, 20, N'芜湖', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (346, 20, N'蚌埠', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (347, 20, N'淮南', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (348, 20, N'马鞍山', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (349, 20, N'淮北', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (350, 20, N'铜陵', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (351, 20, N'安庆', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (352, 20, N'黄山', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (353, 20, N'滁州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (354, 20, N'阜阳', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (355, 20, N'宿州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (356, 20, N'巢湖', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (357, 20, N'六安', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (358, 20, N'亳州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (359, 20, N'池州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (360, 20, N'宣城', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (361, 20, N'蒙城', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (362, 20, N'宁国', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (363, 20, N'桐城', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (364, 21, N'南京', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (365, 21, N'徐州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (366, 21, N'连云港', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (367, 21, N'淮安', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (368, 21, N'宿迁', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (369, 21, N'盐城', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (370, 21, N'扬州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (371, 21, N'泰州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (372, 21, N'南通', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (373, 21, N'镇江', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (374, 21, N'常州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (375, 21, N'无锡', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (376, 21, N'苏州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (377, 21, N'常熟', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (378, 21, N'丹阳', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (379, 21, N'海门', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (380, 21, N'江都', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (381, 21, N'江阴', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (382, 21, N'靖江', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (383, 21, N'昆山', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (384, 21, N'溧阳', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (385, 21, N'太仓', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (386, 21, N'泰州华', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (387, 21, N'吴江', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (388, 21, N'吴县', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (389, 21, N'宜兴', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (390, 21, N'张家港', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (391, 22, N'杭州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (392, 22, N'宁波', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (393, 22, N'温州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (394, 22, N'嘉兴', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (395, 22, N'湖州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (396, 22, N'绍兴', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (397, 22, N'金华', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (398, 22, N'衢州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (399, 22, N'舟山', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (400, 22, N'台州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (401, 22, N'丽水', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (402, 22, N'慈溪', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (403, 22, N'东阳', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (404, 22, N'奉化', NULL, NULL, NULL, NULL)
GO
print 'Processed 400 total records'
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (405, 22, N'乐清', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (406, 22, N'临安', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (407, 22, N'临海', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (408, 22, N'平湖', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (409, 22, N'瑞安', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (410, 22, N'上虞', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (411, 22, N'嵊州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (412, 22, N'温岭', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (413, 22, N'义乌', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (414, 22, N'永康', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (415, 22, N'余姚', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (416, 22, N'诸暨', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (417, 22, N'新昌', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (418, 23, N'南昌', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (419, 23, N'景德镇', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (420, 23, N'萍乡', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (421, 23, N'新余', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (422, 23, N'九江', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (423, 23, N'鹰潭', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (424, 23, N'赣州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (425, 23, N'吉安', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (426, 23, N'宜春', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (427, 23, N'抚州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (428, 23, N'上饶', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (429, 23, N'高安', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (430, 24, N'广州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (431, 24, N'深圳', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (432, 24, N'珠海', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (433, 24, N'汕头', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (434, 24, N'韶关', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (435, 24, N'河源', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (436, 24, N'梅州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (437, 24, N'惠州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (438, 24, N'汕尾', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (439, 24, N'东莞', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (440, 24, N'中山', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (441, 24, N'江门', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (442, 24, N'佛山', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (443, 24, N'阳江', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (444, 24, N'湛江', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (445, 24, N'茂名', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (446, 24, N'肇庆', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (447, 24, N'清远', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (448, 24, N'潮州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (449, 24, N'揭阳', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (450, 24, N'云浮', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (451, 24, N'花都', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (452, 24, N'开平', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (453, 24, N'南海', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (454, 24, N'顺德', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (455, 24, N'台山', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (456, 24, N'增城', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (457, 24, N'市梅', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (458, 25, N'南宁', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (459, 25, N'柳州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (460, 25, N'桂林', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (461, 25, N'梧州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (462, 25, N'北海', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (463, 25, N'防城港', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (464, 25, N'钦州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (465, 25, N'贵港', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (466, 25, N'玉林', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (467, 25, N'百色', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (468, 25, N'贺州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (469, 25, N'河池', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (470, 25, N'来宾', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (471, 25, N'崇左', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (472, 26, N'福州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (473, 26, N'厦门', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (474, 26, N'三明', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (475, 26, N'莆田', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (476, 26, N'泉州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (477, 26, N'漳州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (478, 26, N'南平', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (479, 26, N'龙岩', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (480, 26, N'宁德', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (481, 26, N'福清', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (482, 26, N'建瓯', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (483, 26, N'晋江', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (484, 26, N'南安', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (485, 26, N'邵武', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (486, 26, N'石狮', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (487, 26, N'仙游', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (488, 27, N'成都', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (489, 27, N'自贡', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (490, 27, N'攀枝花', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (491, 27, N'泸州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (492, 27, N'德阳', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (493, 27, N'绵阳', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (494, 27, N'广元', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (495, 27, N'遂宁', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (496, 27, N'内江', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (497, 27, N'乐山', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (498, 27, N'南充', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (499, 27, N'宜宾', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (500, 27, N'广安', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (501, 27, N'达州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (502, 27, N'巴中', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (503, 27, N'雅安', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (504, 27, N'眉山', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (505, 27, N'资阳', NULL, NULL, NULL, NULL)
GO
print 'Processed 500 total records'
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (506, 27, N'阿坝藏族羌族自治州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (507, 27, N'甘孜藏族自治州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (508, 27, N'凉山彝族自治州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (509, 27, N'广汉', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (510, 27, N'锦阳', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (511, 27, N'西昌', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (512, 28, N'昆明', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (513, 28, N'曲靖', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (514, 28, N'玉溪', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (515, 28, N'保山', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (516, 28, N'昭通', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (517, 28, N'思茅地区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (518, 28, N'临沧地区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (519, 28, N'丽江', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (520, 28, N' 文山壮族苗族自治州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (521, 28, N'红河哈尼族彝族自治州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (522, 28, N'西双版纳傣族自治州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (523, 28, N'楚雄彝族自治州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (524, 28, N'大理白族自治州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (525, 28, N'德宏傣族景颇族自治州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (526, 28, N'怒江傈傈族自治州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (527, 28, N'迪庆藏族自治州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (528, 28, N'大理', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (529, 29, N'贵阳', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (530, 29, N'六盘水', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (531, 29, N'遵义', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (532, 29, N'安顺', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (533, 29, N'铜仁地区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (534, 29, N'毕节地区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (535, 29, N'黔西南布依族苗族自治州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (536, 29, N'黔东南苗族侗族自治州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (537, 29, N'黔南布依族苗族自治州', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (538, 29, N'都匀', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (539, 29, N'贵恙', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (540, 29, N'凯里', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (541, 29, N'铜仁', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (542, 30, N'拉萨', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (543, 30, N'那曲地区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (544, 30, N'昌都地区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (545, 30, N'山南地区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (546, 30, N'日喀则地区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (547, 30, N'阿里地区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (548, 30, N'林芝地区', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (549, 31, N'海口', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (550, 31, N'三亚', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (551, 34, N'台北', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (552, 34, N'高雄', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (553, 34, N'台中', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (554, 34, N'台南', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (555, 34, N'基隆', NULL, NULL, NULL, NULL)
INSERT [dbo].[Param_City] ([id], [parentid], [City], [Create_id], [Create_date], [Update_id], [Update_date]) VALUES (556, 34, N'新竹', NULL, NULL, NULL, NULL)
/****** Object:  Table [dbo].[mail_info]    Script Date: 05/28/2014 10:08:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mail_info](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[mail_title] [varchar](250) NULL,
	[mail_content] [text] NULL,
	[atta_count] [int] NULL,
	[create_id] [int] NULL,
	[create_name] [varchar](250) NULL,
	[create_time] [datetime] NULL,
	[isDelete] [int] NULL,
	[Delete_time] [datetime] NULL,
 CONSTRAINT [PK_mail_info] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mail_flow]    Script Date: 05/28/2014 10:08:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mail_flow](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[mail_id] [int] NULL,
	[mail_title] [varchar](250) NULL,
	[atta_count] [int] NULL,
	[receive_id] [int] NULL,
	[receive_name] [varchar](250) NULL,
	[isView] [int] NULL,
	[view_time] [datetime] NULL,
	[recive_type_id] [int] NULL,
	[recive_type] [varchar](250) NULL,
	[sender_id] [int] NULL,
	[sender_name] [varchar](250) NULL,
	[sender_time] [datetime] NULL,
	[isDelete] [int] NULL,
	[Delete_time] [datetime] NULL,
 CONSTRAINT [PK_mail_flow] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[mail_attachment]    Script Date: 05/28/2014 10:08:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mail_attachment](
	[mail_id] [int] NULL,
	[page_id] [varchar](250) NULL,
	[file_id] [varchar](250) NULL,
	[file_name] [varchar](250) NULL,
	[real_name] [varchar](250) NULL,
	[create_id] [int] NULL,
	[create_name] [varchar](250) NULL,
	[create_date] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[hr_post]    Script Date: 05/28/2014 10:08:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[hr_post](
	[post_id] [int] IDENTITY(1,1) NOT NULL,
	[post_name] [varchar](255) NULL,
	[position_id] [int] NULL,
	[position_name] [varchar](255) NULL,
	[position_order] [varchar](50) NULL,
	[dep_id] [int] NULL,
	[depname] [varchar](255) NULL,
	[emp_id] [int] NULL,
	[emp_name] [varchar](255) NULL,
	[default_post] [int] NULL,
	[note] [varchar](max) NULL,
	[post_descript] [varchar](max) NULL,
	[isDelete] [int] NULL,
	[Delete_time] [datetime] NULL,
 CONSTRAINT [PK_hr_post] PRIMARY KEY CLUSTERED 
(
	[post_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[hr_post] ON
INSERT [dbo].[hr_post] ([post_id], [post_name], [position_id], [position_name], [position_order], [dep_id], [depname], [emp_id], [emp_name], [default_post], [note], [post_descript], [isDelete], [Delete_time]) VALUES (1, N'Tess', 1, N'总经理', N'10', 1, N'小黄豆软件', 2, N'奇迹', 1, N'', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[hr_post] OFF
/****** Object:  Table [dbo].[hr_position]    Script Date: 05/28/2014 10:08:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[hr_position](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[position_name] [varchar](250) NULL,
	[position_order] [varchar](50) NULL,
	[position_level] [varchar](50) NULL,
	[create_id] [int] NULL,
	[create_date] [datetime] NULL,
	[isDelete] [int] NULL,
	[Delete_time] [datetime] NULL,
 CONSTRAINT [PK_hr_position] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[hr_position] ON
INSERT [dbo].[hr_position] ([id], [position_name], [position_order], [position_level], [create_id], [create_date], [isDelete], [Delete_time]) VALUES (1, N'总经理', N'10', N'10', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[hr_position] OFF
/****** Object:  Table [dbo].[hr_employee]    Script Date: 05/28/2014 10:08:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[hr_employee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[uid] [varchar](50) NULL,
	[pwd] [varchar](50) NULL,
	[name] [varchar](50) NULL,
	[idcard] [varchar](50) NULL,
	[birthday] [varchar](50) NULL,
	[d_id] [int] NULL,
	[dname] [varchar](50) NULL,
	[postid] [int] NULL,
	[post] [varchar](250) NULL,
	[email] [varchar](50) NULL,
	[sex] [varchar](50) NULL,
	[tel] [varchar](50) NULL,
	[status] [varchar](50) NULL,
	[zhiwuid] [int] NULL,
	[zhiwu] [varchar](50) NULL,
	[sort] [int] NULL,
	[EntryDate] [varchar](50) NULL,
	[address] [varchar](255) NULL,
	[remarks] [varchar](255) NULL,
	[education] [varchar](50) NULL,
	[level] [varchar](50) NULL,
	[professional] [varchar](50) NULL,
	[schools] [varchar](50) NULL,
	[title] [varchar](50) NULL,
	[isDelete] [int] NULL,
	[Delete_time] [datetime] NULL,
	[portal] [varchar](250) NULL,
	[theme] [varchar](250) NULL,
	[canlogin] [int] NULL,
 CONSTRAINT [PK_hr_employee] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[hr_employee] ON
INSERT [dbo].[hr_employee] ([ID], [uid], [pwd], [name], [idcard], [birthday], [d_id], [dname], [postid], [post], [email], [sex], [tel], [status], [zhiwuid], [zhiwu], [sort], [EntryDate], [address], [remarks], [education], [level], [professional], [schools], [title], [isDelete], [Delete_time], [portal], [theme], [canlogin]) VALUES (1, N'admin', N'E10ADC3949BA59ABBE56E057F20F883E', N'管理员', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[hr_employee] ([ID], [uid], [pwd], [name], [idcard], [birthday], [d_id], [dname], [postid], [post], [email], [sex], [tel], [status], [zhiwuid], [zhiwu], [sort], [EntryDate], [address], [remarks], [education], [level], [professional], [schools], [title], [isDelete], [Delete_time], [portal], [theme], [canlogin]) VALUES (2, N'miracle', N'E10ADC3949BA59ABBE56E057F20F883E', N'奇迹', N'', N'2014-04-23', 1, N'小黄豆软件', 1, N'tess', N'', N'男', N'13800012345', N'在职', 1, N'总经理', NULL, N'', N'', N'', N'', NULL, N'', N'', N'201404232259348EFB5B.jpg', NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[hr_employee] OFF
/****** Object:  Table [dbo].[hr_department]    Script Date: 05/28/2014 10:08:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[hr_department](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[d_name] [varchar](50) NULL,
	[parentid] [int] NULL,
	[parentname] [varchar](50) NULL,
	[d_type] [varchar](50) NULL,
	[d_icon] [varchar](50) NULL,
	[d_fuzeren] [varchar](50) NULL,
	[d_tel] [varchar](50) NULL,
	[d_fax] [varchar](50) NULL,
	[d_add] [varchar](255) NULL,
	[d_email] [varchar](50) NULL,
	[d_miaoshu] [varchar](255) NULL,
	[d_order] [varchar](50) NULL,
	[isDelete] [int] NULL,
	[Delete_time] [datetime] NULL,
 CONSTRAINT [PK_hr_department] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[hr_department] ON
INSERT [dbo].[hr_department] ([id], [d_name], [parentid], [parentname], [d_type], [d_icon], [d_fuzeren], [d_tel], [d_fax], [d_add], [d_email], [d_miaoshu], [d_order], [isDelete], [Delete_time]) VALUES (1, N'小黄豆软件', 0, N'无', N'公司', N'../images/icon/61.png', N'黄润伟', N'13467644655', N'', N'', N'250476029@qq.com', N'', N'10', NULL, NULL)
INSERT [dbo].[hr_department] ([id], [d_name], [parentid], [parentname], [d_type], [d_icon], [d_fuzeren], [d_tel], [d_fax], [d_add], [d_email], [d_miaoshu], [d_order], [isDelete], [Delete_time]) VALUES (2, N'总经办', 1, N'小黄豆软件', N'部门', N'../images/icon/94.png', N'', N'', N'', N'', N'', N'', N'20', NULL, NULL)
SET IDENTITY_INSERT [dbo].[hr_department] OFF
/****** Object:  Table [dbo].[CRM_receive]    Script Date: 05/28/2014 10:08:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CRM_receive](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Customer_id] [int] NULL,
	[Customer_name] [varchar](250) NULL,
	[Receive_num] [varchar](250) NULL,
	[Pay_type_id] [int] NULL,
	[Pay_type] [varchar](250) NULL,
	[Receive_amount] [float] NULL,
	[Receive_date] [datetime] NULL,
	[C_depid] [int] NULL,
	[C_depname] [varchar](250) NULL,
	[C_empid] [int] NULL,
	[C_empname] [varchar](250) NULL,
	[create_id] [int] NULL,
	[create_name] [varchar](250) NULL,
	[create_date] [datetime] NULL,
	[companyid] [int] NULL,
	[order_id] [int] NULL,
	[remarks] [varchar](max) NULL,
	[isDelete] [int] NULL,
	[Delete_time] [datetime] NULL,
	[receive_direction_id] [int] NULL,
	[receive_direction_name] [varchar](250) NULL,
	[receive_type_id] [int] NULL,
	[receive_type_name] [varchar](250) NULL,
	[receive_real] [float] NULL,
 CONSTRAINT [PK_CRM_receive] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[CRM_receive] ON
INSERT [dbo].[CRM_receive] ([id], [Customer_id], [Customer_name], [Receive_num], [Pay_type_id], [Pay_type], [Receive_amount], [Receive_date], [C_depid], [C_depname], [C_empid], [C_empname], [create_id], [create_name], [create_date], [companyid], [order_id], [remarks], [isDelete], [Delete_time], [receive_direction_id], [receive_direction_name], [receive_type_id], [receive_type_name], [receive_real]) VALUES (2, 1, N'test', N'a1000', 17, N'银行转账', 100, CAST(0x0000A31700000000 AS DateTime), 1, N'小黄豆软件', 2, N'奇迹', 1, N'管理员', CAST(0x0000A317014AE64F AS DateTime), NULL, 2, N'a', 0, CAST(0x0000A3170165CAEC AS DateTime), 1, N'收款', NULL, NULL, 100)
INSERT [dbo].[CRM_receive] ([id], [Customer_id], [Customer_name], [Receive_num], [Pay_type_id], [Pay_type], [Receive_amount], [Receive_date], [C_depid], [C_depname], [C_empid], [C_empname], [create_id], [create_name], [create_date], [companyid], [order_id], [remarks], [isDelete], [Delete_time], [receive_direction_id], [receive_direction_name], [receive_type_id], [receive_type_name], [receive_real]) VALUES (4, 1, N'test', N'a', 17, N'银行转账', 100, CAST(0x0000A31700000000 AS DateTime), 1, N'小黄豆软件', 2, N'奇迹', 1, N'管理员', CAST(0x0000A31701529D32 AS DateTime), NULL, 1, N'a', NULL, NULL, 1, N'收款', NULL, NULL, 100)
SET IDENTITY_INSERT [dbo].[CRM_receive] OFF
/****** Object:  Table [dbo].[CRM_product_category]    Script Date: 05/28/2014 10:08:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CRM_product_category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_category] [varchar](250) NULL,
	[parentid] [int] NULL,
	[product_icon] [varchar](250) NULL,
	[isDelete] [int] NULL,
	[Delete_id] [int] NULL,
	[Delete_time] [datetime] NULL,
 CONSTRAINT [PK_CRM_product_category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[CRM_product_category] ON
INSERT [dbo].[CRM_product_category] ([id], [product_category], [parentid], [product_icon], [isDelete], [Delete_id], [Delete_time]) VALUES (1, N'A类', 0, N'../../../images/icon/10.png', NULL, NULL, NULL)
INSERT [dbo].[CRM_product_category] ([id], [product_category], [parentid], [product_icon], [isDelete], [Delete_id], [Delete_time]) VALUES (2, N'B类', 1, N'../../../images/icon/12.png', NULL, NULL, NULL)
INSERT [dbo].[CRM_product_category] ([id], [product_category], [parentid], [product_icon], [isDelete], [Delete_id], [Delete_time]) VALUES (6, N'C', 0, N'../../../images/icon/3.png', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[CRM_product_category] OFF
/****** Object:  Table [dbo].[CRM_product]    Script Date: 05/28/2014 10:08:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CRM_product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [varchar](250) NULL,
	[category_id] [int] NULL,
	[category_name] [varchar](250) NULL,
	[specifications] [varchar](250) NULL,
	[status] [varchar](250) NULL,
	[unit] [varchar](250) NULL,
	[remarks] [varchar](max) NULL,
	[price] [float] NULL,
	[isDelete] [int] NULL,
	[Delete_time] [datetime] NULL,
 CONSTRAINT [PK_CRM_product] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[CRM_product] ON
INSERT [dbo].[CRM_product] ([product_id], [product_name], [category_id], [category_name], [specifications], [status], [unit], [remarks], [price], [isDelete], [Delete_time]) VALUES (1, N'产品B', 2, N'B类', N'', NULL, N'', N'', 100, NULL, NULL)
INSERT [dbo].[CRM_product] ([product_id], [product_name], [category_id], [category_name], [specifications], [status], [unit], [remarks], [price], [isDelete], [Delete_time]) VALUES (2, N'产品A', 2, N'B类', N'', NULL, N'', N'', 100, NULL, NULL)
INSERT [dbo].[CRM_product] ([product_id], [product_name], [category_id], [category_name], [specifications], [status], [unit], [remarks], [price], [isDelete], [Delete_time]) VALUES (4, N'才', 2, N'B类', N'', NULL, N'', N'', 100, 1, CAST(0x0000A3180117A5D8 AS DateTime))
SET IDENTITY_INSERT [dbo].[CRM_product] OFF
/****** Object:  Table [dbo].[CRM_order_details]    Script Date: 05/28/2014 10:08:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CRM_order_details](
	[order_id] [int] NULL,
	[product_id] [int] NULL,
	[product_name] [varchar](250) NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[unit] [varchar](250) NULL,
	[amount] [float] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[CRM_order_details] ([order_id], [product_id], [product_name], [price], [quantity], [unit], [amount]) VALUES (1, 1, N'产品b', 100, 1, N'个', 100)
INSERT [dbo].[CRM_order_details] ([order_id], [product_id], [product_name], [price], [quantity], [unit], [amount]) VALUES (1, 2, N'产品a', 100, 1, N'个', 100)
INSERT [dbo].[CRM_order_details] ([order_id], [product_id], [product_name], [price], [quantity], [unit], [amount]) VALUES (2, 1, N'产品b', 100, 2, N'', 200)
INSERT [dbo].[CRM_order_details] ([order_id], [product_id], [product_name], [price], [quantity], [unit], [amount]) VALUES (2, 2, N'产品a', 100, 3, N'', 300)
INSERT [dbo].[CRM_order_details] ([order_id], [product_id], [product_name], [price], [quantity], [unit], [amount]) VALUES (3, 1, N'产品b', 100, 1, N'', 100)
INSERT [dbo].[CRM_order_details] ([order_id], [product_id], [product_name], [price], [quantity], [unit], [amount]) VALUES (4, 1, N'产品b', 100, 1, N'', 100)
INSERT [dbo].[CRM_order_details] ([order_id], [product_id], [product_name], [price], [quantity], [unit], [amount]) VALUES (4, 2, N'产品a', 100, 2, N'', 200)
INSERT [dbo].[CRM_order_details] ([order_id], [product_id], [product_name], [price], [quantity], [unit], [amount]) VALUES (5, 1, N'产品b', 100, 1, N'', 100)
INSERT [dbo].[CRM_order_details] ([order_id], [product_id], [product_name], [price], [quantity], [unit], [amount]) VALUES (5, 2, N'产品a', 100, 1, N'', 100)
INSERT [dbo].[CRM_order_details] ([order_id], [product_id], [product_name], [price], [quantity], [unit], [amount]) VALUES (3, 2, N'产品a', 100, 2, N'', 200)
/****** Object:  Table [dbo].[CRM_order]    Script Date: 05/28/2014 10:08:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CRM_order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Serialnumber] [varchar](250) NULL,
	[Customer_id] [int] NULL,
	[Customer_name] [varchar](250) NULL,
	[Order_date] [datetime] NULL,
	[pay_type_id] [int] NULL,
	[pay_type] [varchar](250) NULL,
	[Order_details] [varchar](max) NULL,
	[Order_status_id] [int] NULL,
	[Order_status] [varchar](250) NULL,
	[Order_amount] [float] NULL,
	[create_id] [int] NULL,
	[create_date] [datetime] NULL,
	[C_dep_id] [int] NULL,
	[C_dep_name] [varchar](250) NULL,
	[C_emp_id] [int] NULL,
	[C_emp_name] [varchar](250) NULL,
	[F_dep_id] [int] NULL,
	[F_dep_name] [varchar](250) NULL,
	[F_emp_id] [int] NULL,
	[F_emp_name] [varchar](250) NULL,
	[receive_money] [float] NULL,
	[arrears_money] [float] NULL,
	[invoice_money] [float] NULL,
	[arrears_invoice] [float] NULL,
	[isDelete] [int] NULL,
	[Delete_time] [datetime] NULL,
 CONSTRAINT [PK_CRM_order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[CRM_order] ON
INSERT [dbo].[CRM_order] ([id], [Serialnumber], [Customer_id], [Customer_name], [Order_date], [pay_type_id], [pay_type], [Order_details], [Order_status_id], [Order_status], [Order_amount], [create_id], [create_date], [C_dep_id], [C_dep_name], [C_emp_id], [C_emp_name], [F_dep_id], [F_dep_name], [F_emp_id], [F_emp_name], [receive_money], [arrears_money], [invoice_money], [arrears_invoice], [isDelete], [Delete_time]) VALUES (1, N'20140424172256300', 1, N'test', CAST(0x0000A31700000000 AS DateTime), 17, N'银行转账', N'啊', 20, N'订单签订', 200, 1, CAST(0x0000A317011E7399 AS DateTime), 1, N'小黄豆软件', 2, N'奇迹', 1, N'小黄豆软件', 2, N'奇迹', 100, 100, 102, 98, NULL, NULL)
INSERT [dbo].[CRM_order] ([id], [Serialnumber], [Customer_id], [Customer_name], [Order_date], [pay_type_id], [pay_type], [Order_details], [Order_status_id], [Order_status], [Order_amount], [create_id], [create_date], [C_dep_id], [C_dep_name], [C_emp_id], [C_emp_name], [F_dep_id], [F_dep_name], [F_emp_id], [F_emp_name], [receive_money], [arrears_money], [invoice_money], [arrears_invoice], [isDelete], [Delete_time]) VALUES (2, N'20140424200356349', 1, N'test', CAST(0x0000A31700000000 AS DateTime), 17, N'银行转账', N'a', 20, N'订单签订', 500, 1, CAST(0x0000A317014AABF8 AS DateTime), 1, N'小黄豆软件', 2, N'奇迹', 1, N'小黄豆软件', 2, N'奇迹', 100, 400, NULL, NULL, NULL, NULL)
INSERT [dbo].[CRM_order] ([id], [Serialnumber], [Customer_id], [Customer_name], [Order_date], [pay_type_id], [pay_type], [Order_details], [Order_status_id], [Order_status], [Order_amount], [create_id], [create_date], [C_dep_id], [C_dep_name], [C_emp_id], [C_emp_name], [F_dep_id], [F_dep_name], [F_emp_id], [F_emp_name], [receive_money], [arrears_money], [invoice_money], [arrears_invoice], [isDelete], [Delete_time]) VALUES (4, N'20140424200931955', 1, N'test', CAST(0x0000A31700000000 AS DateTime), 17, N'银行转账', N'', 20, N'订单签订', 300, 1, CAST(0x0000A317014C3542 AS DateTime), 1, N'小黄豆软件', 2, N'奇迹', 1, N'小黄豆软件', 2, N'奇迹', NULL, 300, NULL, 300, NULL, NULL)
INSERT [dbo].[CRM_order] ([id], [Serialnumber], [Customer_id], [Customer_name], [Order_date], [pay_type_id], [pay_type], [Order_details], [Order_status_id], [Order_status], [Order_amount], [create_id], [create_date], [C_dep_id], [C_dep_name], [C_emp_id], [C_emp_name], [F_dep_id], [F_dep_name], [F_emp_id], [F_emp_name], [receive_money], [arrears_money], [invoice_money], [arrears_invoice], [isDelete], [Delete_time]) VALUES (5, N'20140425164032431', 1, N'test', CAST(0x0000A31800000000 AS DateTime), 17, N'银行转账', N'a', 20, N'订单签订', 200, 1, CAST(0x0000A3180112CE80 AS DateTime), 1, N'小黄豆软件', 2, N'奇迹', 1, N'小黄豆软件', 2, N'奇迹', NULL, 200, NULL, 200, NULL, NULL)
SET IDENTITY_INSERT [dbo].[CRM_order] OFF
/****** Object:  Table [dbo].[CRM_invoice]    Script Date: 05/28/2014 10:08:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CRM_invoice](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Customer_id] [int] NULL,
	[Customer_name] [varchar](250) NULL,
	[invoice_num] [varchar](250) NULL,
	[invoice_type_id] [int] NULL,
	[invoice_type] [varchar](250) NULL,
	[invoice_amount] [float] NULL,
	[invoice_content] [varchar](max) NULL,
	[invoice_date] [datetime] NULL,
	[C_depid] [int] NULL,
	[C_depname] [varchar](250) NULL,
	[C_empid] [int] NULL,
	[C_empname] [varchar](250) NULL,
	[create_id] [int] NULL,
	[create_name] [varchar](250) NULL,
	[create_date] [datetime] NULL,
	[order_id] [int] NULL,
	[isDelete] [int] NULL,
	[Delete_time] [datetime] NULL,
 CONSTRAINT [PK_CRM_invoice] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[CRM_invoice] ON
INSERT [dbo].[CRM_invoice] ([id], [Customer_id], [Customer_name], [invoice_num], [invoice_type_id], [invoice_type], [invoice_amount], [invoice_content], [invoice_date], [C_depid], [C_depname], [C_empid], [C_empname], [create_id], [create_name], [create_date], [order_id], [isDelete], [Delete_time]) VALUES (1, 1, N'test', N'1', 21, N'国税发票', 200, N'a', CAST(0x0000A31700000000 AS DateTime), 1, N'小黄豆软件', 2, N'奇迹', 1, N'管理员', CAST(0x0000A3170150BEA4 AS DateTime), 4, 2, CAST(0x0000A317016873C8 AS DateTime))
INSERT [dbo].[CRM_invoice] ([id], [Customer_id], [Customer_name], [invoice_num], [invoice_type_id], [invoice_type], [invoice_amount], [invoice_content], [invoice_date], [C_depid], [C_depname], [C_empid], [C_empname], [create_id], [create_name], [create_date], [order_id], [isDelete], [Delete_time]) VALUES (2, 1, N'test', N'a', 21, N'国税发票', 102, N'a', CAST(0x0000A31800000000 AS DateTime), 1, N'小黄豆软件', 2, N'奇迹', 1, N'管理员', CAST(0x0000A31801127ACC AS DateTime), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[CRM_invoice] OFF
/****** Object:  Table [dbo].[CRM_Follow]    Script Date: 05/28/2014 10:08:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CRM_Follow](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Customer_id] [int] NULL,
	[Customer_name] [varchar](250) NULL,
	[Follow] [varchar](4000) NULL,
	[Follow_date] [datetime] NULL,
	[Follow_Type_id] [int] NULL,
	[Follow_Type] [varchar](250) NULL,
	[department_id] [int] NULL,
	[department_name] [varchar](250) NULL,
	[employee_id] [int] NULL,
	[employee_name] [varchar](250) NULL,
	[isDelete] [int] NULL,
	[Delete_time] [datetime] NULL,
 CONSTRAINT [PK_CRM_Follow] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[CRM_Follow] ON
INSERT [dbo].[CRM_Follow] ([id], [Customer_id], [Customer_name], [Follow], [Follow_date], [Follow_Type_id], [Follow_Type], [department_id], [department_name], [employee_id], [employee_name], [isDelete], [Delete_time]) VALUES (2, 1, N'test', N'test1', CAST(0x0000A317010175C4 AS DateTime), 12, N'短信跟进', 0, N'', 1, N'管理员', 0, CAST(0x0000A31801118CE8 AS DateTime))
INSERT [dbo].[CRM_Follow] ([id], [Customer_id], [Customer_name], [Follow], [Follow_date], [Follow_Type_id], [Follow_Type], [department_id], [department_name], [employee_id], [employee_name], [isDelete], [Delete_time]) VALUES (3, 1, N'test', N'test', CAST(0x0000A3170101E342 AS DateTime), 11, N'电话跟进', 0, N'', 1, N'管理员', NULL, NULL)
SET IDENTITY_INSERT [dbo].[CRM_Follow] OFF
/****** Object:  Table [dbo].[CRM_Customer]    Script Date: 05/28/2014 10:08:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CRM_Customer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Serialnumber] [varchar](250) NULL,
	[Customer] [varchar](250) NULL,
	[address] [varchar](250) NULL,
	[tel] [varchar](250) NULL,
	[fax] [varchar](250) NULL,
	[site] [varchar](250) NULL,
	[industry] [varchar](250) NULL,
	[Provinces_id] [int] NULL,
	[Provinces] [varchar](250) NULL,
	[City_id] [int] NULL,
	[City] [varchar](250) NULL,
	[CustomerType_id] [int] NULL,
	[CustomerType] [varchar](250) NULL,
	[CustomerLevel_id] [int] NULL,
	[CustomerLevel] [varchar](250) NULL,
	[CustomerSource_id] [int] NULL,
	[CustomerSource] [varchar](250) NULL,
	[DesCripe] [varchar](4000) NULL,
	[Remarks] [varchar](4000) NULL,
	[Department_id] [int] NULL,
	[Department] [varchar](250) NULL,
	[Employee_id] [int] NULL,
	[Employee] [varchar](250) NULL,
	[privatecustomer] [varchar](50) NULL,
	[lastfollow] [datetime] NULL,
	[Create_id] [int] NULL,
	[Create_name] [varchar](250) NULL,
	[Create_date] [datetime] NULL,
	[isDelete] [int] NULL,
	[Delete_time] [datetime] NULL,
 CONSTRAINT [PK_CRM_Customer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[CRM_Customer] ON
INSERT [dbo].[CRM_Customer] ([id], [Serialnumber], [Customer], [address], [tel], [fax], [site], [industry], [Provinces_id], [Provinces], [City_id], [City], [CustomerType_id], [CustomerType], [CustomerLevel_id], [CustomerLevel], [CustomerSource_id], [CustomerSource], [DesCripe], [Remarks], [Department_id], [Department], [Employee_id], [Employee], [privatecustomer], [lastfollow], [Create_id], [Create_name], [Create_date], [isDelete], [Delete_time]) VALUES (1, N'20140424150224832', N'test', N'', N'0731-88888888', N'', N'', N'', 0, N'', 0, N'', 0, N'', 0, N'', 0, N'', N'', N'', 1, N'小黄豆软件', 2, N'奇迹', N'私客', CAST(0x0000A3170101E342 AS DateTime), 1, NULL, CAST(0x0000A31700F7DAF9 AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[CRM_Customer] OFF
/****** Object:  Table [dbo].[CRM_contract]    Script Date: 05/28/2014 10:08:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CRM_contract](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Contract_name] [varchar](250) NULL,
	[Serialnumber] [varchar](250) NULL,
	[Customer_id] [int] NULL,
	[Customer_name] [varchar](250) NULL,
	[C_depid] [int] NULL,
	[C_depname] [varchar](250) NULL,
	[C_empid] [int] NULL,
	[C_empname] [varchar](250) NULL,
	[Contract_amount] [float] NULL,
	[Pay_cycle] [int] NULL,
	[Start_date] [varchar](250) NULL,
	[End_date] [varchar](250) NULL,
	[Sign_date] [varchar](250) NULL,
	[Customer_Contractor] [varchar](250) NULL,
	[Our_Contractor_depid] [int] NULL,
	[Our_Contractor_depname] [varchar](250) NULL,
	[Our_Contractor_id] [int] NULL,
	[Our_Contractor_name] [varchar](250) NULL,
	[Creater_id] [int] NULL,
	[Creater_name] [varchar](250) NULL,
	[Create_time] [datetime] NULL,
	[Main_Content] [varchar](max) NULL,
	[Remarks] [varchar](max) NULL,
	[File_serialnumber] [varchar](250) NULL,
	[isDelete] [int] NULL,
	[Delete_time] [datetime] NULL,
 CONSTRAINT [PK_CRM_contract] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[CRM_contract] ON
INSERT [dbo].[CRM_contract] ([id], [Contract_name], [Serialnumber], [Customer_id], [Customer_name], [C_depid], [C_depname], [C_empid], [C_empname], [Contract_amount], [Pay_cycle], [Start_date], [End_date], [Sign_date], [Customer_Contractor], [Our_Contractor_depid], [Our_Contractor_depname], [Our_Contractor_id], [Our_Contractor_name], [Creater_id], [Creater_name], [Create_time], [Main_Content], [Remarks], [File_serialnumber], [isDelete], [Delete_time]) VALUES (2, N't', N'a', 1, N'test', 1, N'小黄豆软件', 2, N'奇迹', 100, 0, N'2014-04-25', N'2015-05-01', N'2014-04-25', N'a', 1, N'小黄豆软件', 2, N'奇迹', 1, N'管理员', CAST(0x0000A31801120E44 AS DateTime), N'1、条款1
2、条款2', N'', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[CRM_contract] OFF
/****** Object:  Table [dbo].[CRM_Contact]    Script Date: 05/28/2014 10:08:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CRM_Contact](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[C_name] [varchar](250) NULL,
	[C_sex] [varchar](250) NULL,
	[C_department] [varchar](250) NULL,
	[C_position] [varchar](250) NULL,
	[C_birthday] [varchar](250) NULL,
	[C_tel] [varchar](250) NULL,
	[C_fax] [varchar](250) NULL,
	[C_email] [varchar](250) NULL,
	[C_mob] [varchar](250) NULL,
	[C_QQ] [varchar](250) NULL,
	[C_add] [varchar](250) NULL,
	[C_hobby] [varchar](250) NULL,
	[C_remarks] [varchar](max) NULL,
	[C_customerid] [int] NULL,
	[C_customername] [varchar](250) NULL,
	[C_createId] [int] NULL,
	[C_createDate] [datetime] NULL,
	[isDelete] [int] NULL,
	[Delete_time] [datetime] NULL,
 CONSTRAINT [PK_CRM_Contact] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[CRM_Contact] ON
INSERT [dbo].[CRM_Contact] ([id], [C_name], [C_sex], [C_department], [C_position], [C_birthday], [C_tel], [C_fax], [C_email], [C_mob], [C_QQ], [C_add], [C_hobby], [C_remarks], [C_customerid], [C_customername], [C_createId], [C_createDate], [isDelete], [Delete_time]) VALUES (2, N't', N'先生', N'', N'', N'', N'', N'', N'', N'13412345678', N'', N'', N'', N'', 1, N'test', 1, CAST(0x0000A31801107D78 AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[CRM_Contact] OFF
